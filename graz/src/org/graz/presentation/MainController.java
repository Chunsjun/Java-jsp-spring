package org.graz.presentation;

import org.graz.domain.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/graz")
public class MainController {
	// ���� ȭ�� 
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() throws Exception{
		return "/main/main";
	}
	// �α��� ��
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() throws Exception{
		return "/user/login";
	}
	// ȸ������ ��
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() throws Exception{
		return "/user/join";
	}
	// ȸ������ ��
	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String userInfo() throws Exception{
		return "/user/userInfo";
	}
	// ȸ������ ���� ��
	@RequestMapping(value = "/userInfoUpdate", method = RequestMethod.GET)
	public String userInfoUpdate() throws Exception{
		return "/user/userInfoUpdate";
	}
	// �����Խ��� �۾��� ��
	@RequestMapping(value = "/board/free/write", method = RequestMethod.GET)
	public String boardWriteForm(){
		return "/board/free/write";
	}
	// ���� ��
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info(){
		return "/info/info";
	}
	// ���̵� ��й�ȣ ã�� ��
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String findIdPw(){
		return "/user/find";
	}
	// �޴��Ұ� ��(�̿ϼ�)
	@RequestMapping(value ="/menu", method = RequestMethod.GET)
	public String menu(){
		return "/menu/menu";
	}
}
