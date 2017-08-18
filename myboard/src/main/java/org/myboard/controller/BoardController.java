package org.myboard.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.myboard.domain.BoardVO;
import org.myboard.domain.PageInfo;
import org.myboard.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class BoardController {

	@Resource
	private BoardService service;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(BoardVO vo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/board/list");
		PageInfo info = new PageInfo(request, service.cnt());
		
		vo.setStartNum(info.getListStartNum());
		vo.setListCount(info.getListsize());
		
		List<BoardVO> list = service.list(vo);
		
		mv.addObject("navigator", info.getNavigator());
		mv.addObject("board", list);
		return mv;
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeP() {
		return "/board/write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public ModelAndView writeW(BoardVO vo) {
		RedirectView redirectView = new RedirectView("/list");
		redirectView.setExposeModelAttributes(false);

		service.write(vo);

		return new ModelAndView(redirectView);
	}

	@RequestMapping(value = "/view/{boardNo}", method = RequestMethod.GET)
	public ModelAndView view(@PathVariable("boardNo") int bno) {
		ModelAndView mv = new ModelAndView("/board/view");

		mv.addObject("view", service.view(bno));

		return mv;
	}

	@RequestMapping(value = "/delete/{boardNo}", method = RequestMethod.GET)
	public ModelAndView deleteP(@PathVariable("boardNo") int bno) {
		ModelAndView mv = new ModelAndView("/board/delete");

		mv.addObject("bno", bno);

		return mv;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView deleteW(BoardVO voB) {
		RedirectView redirectView = new RedirectView("/list");
		redirectView.setExposeModelAttributes(false);

		BoardVO voA = service.view(voB.getBno());
		String pwA = voA.getBpw();
		String pwB = voB.getBpw();

		if (pwA.equals(pwB)) {
			service.delete(voB);
			return new ModelAndView(redirectView);
		} else {
			return new ModelAndView(redirectView);
		}
	}
}
