package org.graz.presentation;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.graz.domain.User;
import org.graz.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;


@Controller
@RequestMapping(value = "/graz")
public class UserController {
	@Resource
	private UserService userService;
	
	// �α��� ó�� ����
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(User user, HttpSession session) throws Exception{
		
		RedirectView redirectView = new RedirectView("/graz/main");
		redirectView.setExposeModelAttributes(false);
		
		User loginUser = userService.view(user);
		// �α��� �� ������ ��ȿ���� ������ ���� ���
		if(loginUser != null && loginUser.getStatus() != 0){
			session.setAttribute("user", loginUser);
			return new ModelAndView(redirectView);
		}else{
			StringBuffer stb = new StringBuffer();
			stb.append("<script language='javascript'>")
			   .append("alert('Ż���߰ų� ���� ȸ���Դϴ�.')")
			   .append("</script>");
			ModelAndView modelAndView = new ModelAndView("/user/login");
			modelAndView.addObject("alert",stb.toString());
			return modelAndView;
		}
	}
	
	// �α׾ƿ� ó�� ����
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session){

		RedirectView redirectView = new RedirectView("/graz/main");
		redirectView.setExposeModelAttributes(false);
		
		session.removeAttribute("user");
		
		return new ModelAndView(redirectView);
	}
	
	// ȸ������ ó�� ����
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView join(User user){
		
		RedirectView redirectView = new RedirectView("/graz/login");
		redirectView.setExposeModelAttributes(false);
		
		userService.join(user);
		
		return new ModelAndView(redirectView);
	}

	// ȸ������ ���̵� �ߺ�üũ ����
	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public ModelAndView checkId(User user){
		
		ModelAndView modelAndView = new ModelAndView("/user/join");
		StringBuffer stringBuffer = new StringBuffer();
		
		User result = userService.view(user);
		if(result == null){
			stringBuffer.append("alert('"+user.getId()+"��(��) ��밡�� �մϴ�.'"+");")
						.append("window.close();").append("window.opener.joinBtnUnDisabled();");
			modelAndView.addObject("resultCheckId", stringBuffer.toString());
		}else{
			stringBuffer.append("alert('"+user.getId()+"��(��) ������Դϴ�.'"+");")
						.append("window.close();").append("window.opener.joinBtnDisabled();");
			modelAndView.addObject("resultCheckId", stringBuffer.toString());
		}
		return modelAndView;
	}
	
	// ȸ�� ���� ���� ó�� ����
	@RequestMapping(value = "/userInfoUpdate", method = RequestMethod.POST)
	public ModelAndView userInfoUpdate(User user, HttpSession session){
		
		RedirectView redirectView = new RedirectView("/graz/userInfo");
		redirectView.setExposeModelAttributes(false);
		
		User sessionUser = (User) session.getAttribute("user");
		user.setUserNo(sessionUser.getUserNo());
		
		userService.update(user);
		user = userService.view(user);
		
		session.setAttribute("user", user);
		
		return new ModelAndView(redirectView);
	}
	
	// ȸ�� Ż�� ó�� ���� - ������ �����ʹ� �������� �ʰ� status ���� 1 -> 0 ���� �ٲ��.
	@RequestMapping(value = "/userExit")
	public ModelAndView userExit(User user, HttpSession session){
		
		RedirectView redirectView = new RedirectView("/graz/main");
		redirectView.setExposeModelAttributes(false);
		
		user = (User)session.getAttribute("user");
		
		userService.exit(user);
		
		session.removeAttribute("user");
		
		return new ModelAndView(redirectView);
	}
	
	// ���̵� & ��й�ȣ ã�� ����
	@RequestMapping(value = "/find", method = RequestMethod.POST)
	public ModelAndView findId(User user){
		
		ModelAndView modelAndView = new ModelAndView("/user/find");
		StringBuffer stringBuffer = new StringBuffer();
		
		if(user.getId() == null){
			user = userService.find(user);
			if(user == null){
				stringBuffer.append("alert('���̵� ���������ʽ��ϴ�');");
				modelAndView.addObject("find", stringBuffer.toString());
			}else{
				stringBuffer.append("alert('ã���� ���̵�� "+user.getId()+" �Դϴ�.');");
				modelAndView.addObject("find", stringBuffer.toString());
			}
		}else{
			user = userService.find(user);
			if(user == null){
				stringBuffer.append("alert('��ġ�ϴ� ������ �����ϴ�');");
				modelAndView.addObject("find", stringBuffer.toString());
			}else{
				stringBuffer.append("alert('ã���� ��й�ȣ�� "+user.getPassword()+" �Դϴ�.');");
				modelAndView.addObject("find", stringBuffer.toString());
			}
		}
		
		return modelAndView;
	}
	
	// ������ ���� ȸ������ ����Ʈ ��� ����
	@RequestMapping(value = "/viewUsers", method = RequestMethod.GET)
	public ModelAndView usersView(){
		
		ModelAndView modelAndView = new ModelAndView("/admin/viewUsers");
		modelAndView.addObject("viewUsers", userService.viewUsers());
		
		return modelAndView;
	}
	
	// ������ ���� ȸ��Ż�� ó�� ����
	@RequestMapping(value = "/usersOut/{userNo}", method = RequestMethod.GET)
	public ModelAndView usersOut(@PathVariable(value = "userNo")int userNo, User user){
		RedirectView redirectView = new RedirectView("/graz/viewUsers");
		redirectView.setExposeModelAttributes(false);
		
		user.setUserNo(userNo);
		userService.exit(user);
		
		return new ModelAndView(redirectView);
	}
	
	// ������ ���� ȸ������ ó�� ����
	@RequestMapping(value = "/usersIn/{userNo}", method = RequestMethod.GET)
	public ModelAndView usersIn(@PathVariable(value = "userNo")int userNo){
		RedirectView redirectView = new RedirectView("/graz/viewUsers");
		redirectView.setExposeModelAttributes(false);
		
		userService.reJoin(userNo);
		
		return new ModelAndView(redirectView);
	}
	
	// ������ ���� ȸ�� �������� ó������
	@RequestMapping(value = "/deleteUser/{userNo}", method = RequestMethod.GET)
	public ModelAndView deleteUser(@PathVariable(value = "userNo")int userNo){
		RedirectView redirectView = new RedirectView("/graz/viewUsers");
		redirectView.setExposeModelAttributes(false);
		
		userService.delete(userNo);
		
		return new ModelAndView(redirectView);
	}
}
