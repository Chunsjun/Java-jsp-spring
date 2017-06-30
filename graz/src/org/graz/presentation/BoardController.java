package org.graz.presentation;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.graz.domain.Board;
import org.graz.domain.File;
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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
@RequestMapping(value = "/graz/board")
public class BoardController {

	@Resource
	private BoardService boardService;

	// �����Խ��� ��� ȣ��
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

	// �����Խ��� �۾���&���Ͼ��ε� ����
	@RequestMapping(value = "/free/write", method = RequestMethod.POST)
	public ModelAndView boardWrite(Board board, User user, File file, HttpSession session, HttpServletRequest request) throws IOException {

		RedirectView redirectView = new RedirectView("/graz/board/free");
		redirectView.setExposeModelAttributes(false);
		
		//--------------------- ���� ���ε� ���� �ڵ� �κ� -------------------------//
		int sizeLimit = 1024*1024*15; // ����ũ�� 15MB�� ����
		// String savePath = request.getServletContext().getRealPath("files"); // ��� C:\WorkSpace\graz\WebContent\files �� ���Ѵ�
		// String savePath = "C:\\WorkSpace\\graz\\WebContent\\files";
		String savePath = "C:\\WorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\graz\\files";
		
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		//--------------------- ���� ���ε� ���� �ڵ� �κ� -------------------------//
		
		user = (User) session.getAttribute("user");
		board.setWriter(user.getName());
		board.setBoardWriterNo(user.getUserNo());
		
		//--------------------- ���� ���ε� ���� �ڵ� �κ� -------------------------//
		board.setTitle(multi.getParameter("title"));
		board.setContent(multi.getParameter("content"));
		
		String fileName = multi.getFilesystemName("file");
		file.setFileTitle(fileName);
		file.setFilePath(savePath+"/"+fileName);
		//--------------------- ���� ���ε� ���� �ڵ� �κ� -------------------------//
		
		this.boardService.write(board);
		// ���� ������ ���ٸ� ���ε� ���� �ʴ´�
		if(fileName != null){
			this.boardService.fileWrite(file);
		}
		
		return new ModelAndView(redirectView);
	}

	// �����Խ��� �Խñ� �����Ϻ�
	@RequestMapping(value = "/free/view/{boardNo}", method = RequestMethod.GET)
	public ModelAndView viewFreeBoard(@PathVariable int boardNo, Board board, File file) throws Exception {

		ModelAndView modelAndView = new ModelAndView("/board/free/view");

		// ��ȸ�� �ø���-----------------------
		this.boardService.viewUp(boardNo);
		// --------------------------------

		board = this.boardService.view(boardNo);
		file = this.boardService.fileLoad(boardNo);
		List<Review> review = this.boardService.viewReview(boardNo);
		List<Review> comment = this.boardService.viewComment(boardNo);
		
		for(int i = 0; i < review.size(); i ++){
			List<Review> temp = new ArrayList<>();
			for(int j = 0; j < comment.size(); j++){
				if(review.get(i).getReviewNo() == comment.get(j).getParent()){
					temp.add(comment.get(j));
				}
			}
			review.get(i).setComment(temp);
		}
		
		// ���Ͱ� \r\n�� <br> ���� ġȯ�� �������----
		String str = board.getContent();
		str = str.replace("\r\n", "<br>");
		board.setContent(str);
		// -------------------------------
		// �̹����� �ҷ��������� ��� ����
		if(file != null){
			String str2 = file.getFilePath();
			//str2 = str2.replace("C:\\WorkSpace\\graz\\WebContent\\", "/");
			str2 = str2.replace("C:\\WorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\graz\\", "/");
			file.setFilePath(str2);
		}
		//---------------------------------
		
		modelAndView.addObject("viewReview", review);
		modelAndView.addObject("board", board);
		modelAndView.addObject("file",file);
		modelAndView.addObject("reviewCount", this.boardService.reviewCount(boardNo));

		return modelAndView;
	}

	// �����Խ��� �Խñ� ������Ʈ ��
	@RequestMapping(value = "/free/update/{boardNo}", method = RequestMethod.GET)
	public ModelAndView updateFreeBoardForm(@PathVariable int boardNo, Board board, File file) throws Exception {

		ModelAndView modelAndView = new ModelAndView("/board/free/update");

		board = this.boardService.view(boardNo);
		file = this.boardService.fileLoad(boardNo);

		// ���Ͱ� <br>�� \r\n ���� ġȯ�� �������-----
		String str = board.getContent();
		str = str.replace("<br>", "\r\n");
		board.setContent(str);
		// --------------------------------
		
		// �̹����� �ҷ��������� ��� ����
		if(file != null){
			String str2 = file.getFilePath();
			//str2 = str2.replace("C:\\WorkSpace\\graz\\WebContent\\", "/");
			str2 = str2.replace("C:\\WorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\graz\\", "/");
			file.setFilePath(str2);
		}
		//---------------------------------
		
		modelAndView.addObject("board", board);
		modelAndView.addObject("file", file);
		return modelAndView;
	}

	// �����Խ��� �Խñ� ������Ʈ ó������
	@RequestMapping(value = "/free/update/{boardNo}", method = RequestMethod.POST)
	public ModelAndView updateFreeBoard(@PathVariable int boardNo, Board board) throws Exception {
		RedirectView redirectView = new RedirectView("/graz/board/free/view/"+boardNo);
		redirectView.setExposeModelAttributes(false);

		board.setBoardNo(boardNo);
		this.boardService.update(board);
		return new ModelAndView(redirectView);
	}

	// �����Խ��� �Խñ� ���� ����
	@RequestMapping(value = "/free/delete/{boardNo}", method = RequestMethod.GET)
	public ModelAndView deleteFreeBoard(@PathVariable int boardNo, HttpSession session) throws Exception {
		
		RedirectView redirectView = new RedirectView("/graz/board/free");
		redirectView.setExposeModelAttributes(false);
		
		User user = (User) session.getAttribute("user");
		Board board = this.boardService.view(boardNo);
		
		if(user != null && user.getName().equals(board.getWriter())){ // �α��εǾ��ְ� �Խñ� �ۼ��ڰ� �´��� Ȯ��
			this.boardService.delete(boardNo);
		}else if(user != null && user.getUserNo() == 0){ // �α��εǾ��ְ� ������ ���� Ȯ��
			this.boardService.delete(boardNo);
		}
		
		return new ModelAndView(redirectView);
	}
	
	// �����Խ��� �Խñۿ� ���� ��� ��� ����
	@RequestMapping(value = "/free/review/{boardNo}", method = RequestMethod.POST)
	public ModelAndView reviewWriter(@PathVariable int boardNo, Review review, HttpSession session) throws Exception {

		RedirectView redirectView = new RedirectView("/graz/board/free/view/" + boardNo);
		redirectView.setExposeModelAttributes(false);

		User user = (User) session.getAttribute("user");
		
		// ���â�� ��������� �����͸� ��� ó������ �ʴ´�
		if (review.getReviewContent().equals("") || review.getReviewContent().equals("")) {
			return new ModelAndView(redirectView);
		} else {
			review.setBoardNo(boardNo);
			review.setReviewWriter(user.getName());
			review.setReviewWriterNo(user.getUserNo());
			this.boardService.review(review);
			return new ModelAndView(redirectView);
		}
	}

	// �����Խ��� �Խñ� ��� ���� ����
	@RequestMapping(value = "/free/review/delete/{boardNo}/{reviewNo}")
	public ModelAndView reviewDelete(@PathVariable int boardNo, @PathVariable int reviewNo, HttpSession session) {

		RedirectView redirectView = new RedirectView("/graz/board/free/view/" + boardNo);
		redirectView.setExposeModelAttributes(false);
		
		this.boardService.deleteReview(reviewNo);
		return new ModelAndView(redirectView);
	}

	// ��� ���� ����
	@RequestMapping(value = "/free/reviewComment/{boardNo}/{reviewNo}", method = RequestMethod.POST)
	public ModelAndView reviewComment(@PathVariable int boardNo, @PathVariable int reviewNo, Review review, HttpSession session){
		
		RedirectView redirectView = new RedirectView("/graz/board/free/view/"+boardNo);
		redirectView.setExposeContextBeansAsAttributes(false);
		
		User user = (User) session.getAttribute("user");
		review.setReviewWriter(user.getName());
		review.setBoardNo(boardNo);
		review.setParent(reviewNo);
		review.setReviewWriterNo(user.getUserNo());
		this.boardService.writeComment(review);

		return new ModelAndView(redirectView);
	}
	
	
	// ����� ���� Ȯ�� �޼ҵ� return boolean
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
