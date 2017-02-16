package org.graz.presentation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/graz")
public class MainController {
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() throws Exception{
		return "/main/main";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() throws Exception{
		return "/user/login";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() throws Exception{
		return "/user/join";
	}
	
	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String userInfo() throws Exception{
		return "/user/userInfo";
	}
	
	@RequestMapping(value = "/userInfoUpdate", method = RequestMethod.GET)
	public String userInfoUpdate() throws Exception{
		return "/user/userInfoUpdate";
	}
	
	@RequestMapping(value = "/board/free/write", method = RequestMethod.GET)
	public String boardWriteForm(){
		return "/board/free/write";
	}
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info(){
		return "/info/info";
	}
	
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String findIdPw(){
		return "/user/find";
	}
	
	@RequestMapping(value ="/menu", method = RequestMethod.GET)
	public String menu(){
		return "/menu/menu";
	}
}
