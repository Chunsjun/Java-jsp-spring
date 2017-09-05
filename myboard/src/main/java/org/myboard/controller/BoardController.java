package org.myboard.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.myboard.domain.BoardVO;
import org.myboard.domain.PageInfo;
import org.myboard.domain.ReviewVO;
import org.myboard.domain.UserVO;
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

	@RequestMapping(value = "/list")
	public ModelAndView list(BoardVO vo, HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView("/board/list");
		PageInfo info = new PageInfo(request, service.cnt(vo));
		
		vo.setStartNum(info.getListStartNum());
		vo.setListSize(info.getListsize());
		
		List<BoardVO> list = service.list(vo);
		
		mv.addObject("navigator", info.getNavigator());
		mv.addObject("board", list);
		mv.addObject("search",vo);
		return mv;
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeP(UserVO vo,HttpSession session) {
		vo = (UserVO)session.getAttribute("user");
		if(vo != null){
			return "/board/write";
		}else{
			return "/user/login";
		}
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public ModelAndView writeW(BoardVO vo, HttpSession session) {
		RedirectView redirectView = new RedirectView("/list");
		redirectView.setExposeModelAttributes(false);
		
		UserVO uvo = (UserVO) session.getAttribute("user");
		vo.setWriter(uvo.getName());
		vo.setUno(uvo.getUno());
		
		service.write(vo);

		return new ModelAndView(redirectView);
	}

	@RequestMapping(value = "/view/{boardNo}", method = RequestMethod.GET)
	public ModelAndView view(@PathVariable("boardNo") int bno) {
		ModelAndView mv = new ModelAndView("/board/view");
		
		BoardVO vo = service.view(bno);
		List<ReviewVO> rList = service.rList(bno);
		
		String str = vo.getContent();
		str = str.replace("\r\n", "<br>");
		vo.setContent(str);

		mv.addObject("view", vo);
		mv.addObject("rList",rList);
		return mv;
	}

	@RequestMapping(value = "/delete/{boardNo}")
	public ModelAndView deleteW(@PathVariable("boardNo")int bno, HttpSession session) {
		RedirectView redirectView = new RedirectView("/list");
		redirectView.setExposeModelAttributes(false);
		
		UserVO uvo = (UserVO)session.getAttribute("user");
		BoardVO bvo = service.view(bno);
		
		if(uvo != null && uvo.getUno() == bvo.getUno()){
			service.delete(bvo);
			return new ModelAndView(redirectView);
		}else{
			ModelAndView mv = new ModelAndView("/index");
			StringBuffer sb = new StringBuffer();
			sb.append("alert('잘못된 접근입니다.')");
			mv.addObject("alert", sb);
			return mv;
		}
	}
	
	@RequestMapping(value = "/update/{boardNo}", method = RequestMethod.GET)
	public ModelAndView updateP(@PathVariable("boardNo")int bno, HttpSession session, UserVO uvo){
		uvo = (UserVO) session.getAttribute("user");
		BoardVO bvo = service.view(bno);
		
		if(uvo.getUno() != bvo.getUno() || bvo == null){
			ModelAndView mv = new ModelAndView("/index");
			StringBuffer sb = new StringBuffer();
			sb.append("alert('잘못된 접근입니다.')");
			mv.addObject("alert", sb);
			return mv;
		}else{
			ModelAndView mv = new ModelAndView("/board/update");
			mv.addObject("view",bvo);
			return mv;
		}
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updateW(BoardVO vo, HttpSession session){
		RedirectView redirectView = new RedirectView("/view/"+vo.getBno());
		redirectView.setExposeModelAttributes(false);
		
		service.update(vo);
		
		return new ModelAndView(redirectView);
	}
	
	@RequestMapping(value = "/reviewW")
	public ModelAndView reviewW(ReviewVO rvo, UserVO uvo, HttpSession session){
		RedirectView redirectView = new RedirectView("/view/"+rvo.getBno());
		redirectView.setExposeModelAttributes(false);
		
		uvo = (UserVO) session.getAttribute("user");
		
		if(uvo != null){
			rvo.setUno(uvo.getUno());
			service.rWrite(rvo);
			return new ModelAndView(redirectView);
		}else{
			ModelAndView mv = new ModelAndView("/index");
			StringBuffer sb = new StringBuffer();
			sb.append("alert('잘못된 접근입니다.')");
			mv.addObject("alert", sb);
			return mv;
		}
	}
	
}
