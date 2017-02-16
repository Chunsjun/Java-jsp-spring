package org.graz.presentation;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.graz.domain.Board;
import org.graz.domain.PageInformation;
import org.graz.domain.Review;
import org.graz.domain.User;
import org.graz.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping(value = "/graz/board")
public class BoardController {

	@Resource
	private BoardService boardService;

	@RequestMapping(value = "/free")
	public ModelAndView boardList(Board board, HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView("/board/free/list");
		PageInformation pageInfo = new PageInformation(request, this.boardService.count());

		modelAndView.addObject("pageNo", pageInfo.getPageNo());
		modelAndView.addObject("pageItemCount", pageInfo.getPageItemCount());
		modelAndView.addObject("navigator", pageInfo.getNavigator());

		board.setItemStartNo(pageInfo.getItemStartNo());
		board.setItemEndNo(pageInfo.getItemEndNo());
		
		List<Board> listBoard = this.boardService.list(board);

		modelAndView.addObject("listBoard", listBoard);
		modelAndView.addObject("isMobile", isMobile(request));

		return modelAndView;
	}

	@RequestMapping(value = "/free/write", method = RequestMethod.POST)
	public ModelAndView boardWrite(Board board, User user, HttpSession session, HttpServletRequest request) {

		RedirectView redirectView = new RedirectView("/graz/board/free");
		redirectView.setExposeModelAttributes(false);

		user = (User) session.getAttribute("user");
		board.setWriter(user.getName());

		this.boardService.write(board);
		return new ModelAndView(redirectView);
	}

	@RequestMapping(value = "/free/view/{boardNo}", method = RequestMethod.GET)
	public ModelAndView viewFreeBoard(@PathVariable int boardNo, Board board) throws Exception {

		ModelAndView modelAndView = new ModelAndView("/board/free/view");

		// 조회수 올리기-----------------------
		this.boardService.viewUp(boardNo);
		// --------------------------------

		board = this.boardService.view(boardNo);
		List<Review> review = this.boardService.viewReview(boardNo);

		// 엔터값 \r\n을 <br> 으로 치환후 내용셋팅----
		String str = board.getContent();
		str = str.replace("\r\n", "<br>");
		board.setContent(str);
		// -------------------------------

		modelAndView.addObject("board", board);
		modelAndView.addObject("viewReview", review);
		modelAndView.addObject("reviewCount", this.boardService.reviewCount(boardNo));

		return modelAndView;
	}

	@RequestMapping(value = "/free/update/{boardNo}", method = RequestMethod.GET)
	public ModelAndView updateFreeBoardForm(@PathVariable int boardNo, Board board) throws Exception {

		ModelAndView modelAndView = new ModelAndView("/board/free/update");

		board = this.boardService.view(boardNo);

		// 엔터값 <br>을 \r\n 으로 치환후 내용셋팅-----
		String str = board.getContent();
		str = str.replace("<br>", "\r\n");
		board.setContent(str);
		// --------------------------------

		modelAndView.addObject("board", board);
		return modelAndView;
	}

	@RequestMapping(value = "/free/update/{boardNo}", method = RequestMethod.POST)
	public ModelAndView updateFreeBoard(@PathVariable int boardNo, Board board) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/board/free/view");

		board.setBoardNo(boardNo);
		this.boardService.update(board);

		board = this.boardService.view(boardNo);
		List<Review> review = this.boardService.viewReview(boardNo);

		// 엔터값 \r\n을 <br> 으로 치환후 내용셋팅----
		String str = board.getContent();
		str = str.replace("\r\n", "<br>");
		board.setContent(str);
		// -------------------------------
		
		modelAndView.addObject("board", board);
		modelAndView.addObject("viewReview", review);
		return modelAndView;
	}

	@RequestMapping(value = "/free/delete/{boardNo}", method = RequestMethod.GET)
	public ModelAndView deleteFreeBoard(@PathVariable int boardNo, Board board) throws Exception {

		RedirectView redirectView = new RedirectView("/graz/board/free");
		redirectView.setExposeModelAttributes(false);

		board.setBoardNo(boardNo);
		this.boardService.delete(board);

		return new ModelAndView(redirectView);
	}

	@RequestMapping(value = "/free/review/{boardNo}", method = RequestMethod.POST)
	public ModelAndView reviewWriter(@PathVariable int boardNo, Review review, HttpSession session) throws Exception {

		RedirectView redirectView = new RedirectView("/graz/board/free/view/" + boardNo);
		redirectView.setExposeModelAttributes(false);

		User user = (User) session.getAttribute("user");
		if (review.getReviewContent().equals("") || review.getReviewContent().equals("")) {
			return new ModelAndView(redirectView);
		} else {
			review.setBoardNo(boardNo);
			review.setReviewWriter(user.getName());
			this.boardService.review(review);
			return new ModelAndView(redirectView);
		}
	}

	@RequestMapping(value = "/free/review/delete/{boardNo}/{reviewNo}")
	public ModelAndView reviewDelete(@PathVariable int boardNo, @PathVariable int reviewNo) {

		RedirectView redirectView = new RedirectView("/graz/board/free/view/" + boardNo);
		redirectView.setExposeModelAttributes(false);

		this.boardService.deleteReview(reviewNo);

		return new ModelAndView(redirectView);
	}

	// 모바일 접속 확인 메소드
	private boolean isMobile(HttpServletRequest request) {
		String userAgent = request.getHeader("user-agent");
		boolean mobile1 = userAgent.matches(
				".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
		boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*");
		if (mobile1 || mobile2) {
			return true;
		}
		return false;
	}
}
