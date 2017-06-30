package org.graz.presentation;

import org.graz.domain.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/graz")
public class MainController {
	// 메인 화면 
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() throws Exception{
		return "/main/main";
	}
	// 로그인 폼
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() throws Exception{
		return "/user/login";
	}
	// 회원가입 폼
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() throws Exception{
		return "/user/join";
	}
	// 회원정보 폼
	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String userInfo() throws Exception{
		return "/user/userInfo";
	}
	// 회원정보 수정 폼
	@RequestMapping(value = "/userInfoUpdate", method = RequestMethod.GET)
	public String userInfoUpdate() throws Exception{
		return "/user/userInfoUpdate";
	}
	// 자유게시판 글쓰기 폼
	@RequestMapping(value = "/board/free/write", method = RequestMethod.GET)
	public String boardWriteForm(){
		return "/board/free/write";
	}
	// 정보 폼
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info(){
		return "/info/info";
	}
	// 아이디 비밀번호 찾기 폼
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String findIdPw(){
		return "/user/find";
	}
	// 메뉴소개 폼(미완성)
	@RequestMapping(value ="/menu", method = RequestMethod.GET)
	public String menu(){
		return "/menu/menu";
	}
}
