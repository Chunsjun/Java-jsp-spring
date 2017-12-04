package org.myboard.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.myboard.domain.UserVO;
import org.myboard.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class UserController {
	
	@Resource
	private UserService service;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinP(){
		return "/user/join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView joinW(UserVO vo){
		
		if(service.checkUser(vo) == null){
			ModelAndView mv = new ModelAndView("/user/login");
			service.join(vo);
			StringBuffer sb = new StringBuffer();
			sb.append("alert('가입완료');");
			mv.addObject("joinCplt", sb.toString());
			return mv;
		}else{
			ModelAndView mv = new ModelAndView("/user/join");
			StringBuffer sb = new StringBuffer();
			sb.append("alert('이미 있는 아이디 입니다.');");
			mv.addObject("alert", sb.toString());
			return mv;
		}
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginP(){
		return "/user/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginW(UserVO vo, HttpSession session){
		UserVO user = service.login(vo);
		if(user!=null && user.getStatus() != 1){
			RedirectView rv = new RedirectView("/list");
			rv.setExposeModelAttributes(false);
			session.setAttribute("user", user);
			return new ModelAndView(rv);
		}else{
			ModelAndView mv = new ModelAndView("/user/login");
			StringBuffer sb = new StringBuffer();
			sb.append("alert('잘못된 정보입니다. 다시 시도해주세요.')");
			mv.addObject("alert", sb);
			return mv;
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logoutW(HttpSession session){
		RedirectView rv = new RedirectView("/list");
		rv.setExposeModelAttributes(false);
		
		session.removeAttribute("user");
		
		return new ModelAndView(rv);
	}
	
	@RequestMapping(value = "/info/{userNo}", method = RequestMethod.GET)
	public ModelAndView userInfoP(@PathVariable("userNo") int uno , HttpSession session, UserVO vo){
		vo = (UserVO) session.getAttribute("user");
		if(vo == null || vo.getUno() != uno){
			ModelAndView mv = new ModelAndView("/index");
			StringBuffer sb = new StringBuffer();
			sb.append("alert('잘못된 접근입니다.')");
			mv.addObject("alert", sb);
			return mv;
		}else{
			ModelAndView mv = new ModelAndView("/user/info");
			vo = service.viewUser(uno);
			mv.addObject("user",vo);
			return mv;
		}
	}
	
	public ModelAndView userInfoW(){
		return null;
	}
	
	@RequestMapping(value = "/userout/{userNo}", method = RequestMethod.GET)
	public ModelAndView userOut(@PathVariable("userNo")int uno, HttpSession session, UserVO vo){
		vo = (UserVO) session.getAttribute("user");
		if(vo == null || vo.getUno() != uno){
			ModelAndView mv = new ModelAndView("/index");
			StringBuffer sb = new StringBuffer();
			sb.append("alert('잘못된 접근입니다.')");
			mv.addObject("alert", sb);
			return mv;
		}else{
			RedirectView rv = new RedirectView("/list");
			rv.setExposeModelAttributes(false);
			service.outUser(uno);
			session.removeAttribute("user");
			return new ModelAndView(rv);
		}
	}
	
}
