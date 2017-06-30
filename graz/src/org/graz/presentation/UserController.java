package org.graz.presentation;

import java.util.Random;
import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.graz.domain.User;
import org.graz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping(value = "/graz")
public class UserController {
	
	@Autowired
	private JavaMailSender mailSender;
	private Random random = new Random();
	
	@Resource
	private UserService userService;

	// 로그인 처리 로직
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(User user, HttpSession session) throws Exception {

		RedirectView redirectView = new RedirectView("/graz/main");
		redirectView.setExposeModelAttributes(false);

		User loginUser = userService.view(user);
		// 로그인 한 정보가 유효한지 검증후 세션 등록
		if (loginUser != null && loginUser.getStatus() != 0) {
			session.setAttribute("user", loginUser);
			return new ModelAndView(redirectView);
		} else {
			StringBuffer stb = new StringBuffer();
			stb.append("<script language='javascript'>").append("alert('탈퇴했거나 없는 회원입니다.')").append("</script>");
			ModelAndView modelAndView = new ModelAndView("/user/login");
			modelAndView.addObject("alert", stb.toString());
			return modelAndView;
		}
	}

	// 로그아웃 처리 로직
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {

		RedirectView redirectView = new RedirectView("/graz/main");
		redirectView.setExposeModelAttributes(false);

		session.removeAttribute("user");

		return new ModelAndView(redirectView);
	}

	// 회원가입 처리 로직
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView join(User user) {

		RedirectView redirectView = new RedirectView("/graz/login");
		redirectView.setExposeModelAttributes(false);

		userService.join(user);

		return new ModelAndView(redirectView);
	}

	// 회원가입 아이디 중복체크 로직
	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public ModelAndView checkId(User user) {

		ModelAndView modelAndView = new ModelAndView("/user/join");
		StringBuffer stringBuffer = new StringBuffer();

		User result = userService.view(user);
		if (result == null) {
			stringBuffer.append("alert('" + user.getId() + "은(는) 사용가능 합니다.'" + ");")
						.append("window.close();")
						.append("window.opener.idTextDisabled();");
			modelAndView.addObject("resultCheckId", stringBuffer.toString());
		} else {
			stringBuffer.append("alert('" + user.getId() + "은(는) 사용중입니다.'" + ");")
						.append("window.close();");
			modelAndView.addObject("resultCheckId", stringBuffer.toString());
		}
		return modelAndView;
	}

	// 회원 정보 수정 처리 로직
	@RequestMapping(value = "/userInfoUpdate", method = RequestMethod.POST)
	public ModelAndView userInfoUpdate(User user, HttpSession session) {

		RedirectView redirectView = new RedirectView("/graz/userInfo");
		redirectView.setExposeModelAttributes(false);

		User sessionUser = (User) session.getAttribute("user");
		user.setUserNo(sessionUser.getUserNo());

		userService.update(user);
		user = userService.view(user);

		session.setAttribute("user", user);

		return new ModelAndView(redirectView);
	}

	// 회원 탈퇴 처리 로직 - 실제로 데이터는 삭제되지 않고 status 값이 1 -> 0 으로 바뀐다.
	@RequestMapping(value = "/userExit")
	public ModelAndView userExit(User user, HttpSession session) {

		RedirectView redirectView = new RedirectView("/graz/main");
		redirectView.setExposeModelAttributes(false);

		user = (User) session.getAttribute("user");

		userService.exit(user);

		session.removeAttribute("user");

		return new ModelAndView(redirectView);
	}

	// 아이디 & 비밀번호 찾기 로직
	@RequestMapping(value = "/find", method = RequestMethod.POST)
	public ModelAndView findId(User user) {

		ModelAndView modelAndView = new ModelAndView("/user/find");
		StringBuffer stringBuffer = new StringBuffer();

		if (user.getId() == null) {
			user = userService.find(user);
			if (user == null) {
				stringBuffer.append("alert('아이디가 존재하지않습니다');");
				modelAndView.addObject("find", stringBuffer.toString());
			} else {
				stringBuffer.append("alert('찾으신 아이디는 " + user.getId() + " 입니다.');");
				modelAndView.addObject("find", stringBuffer.toString());
			}
		} else {
			user = userService.find(user);
			if (user == null) {
				stringBuffer.append("alert('일치하는 정보가 없습니다');");
				modelAndView.addObject("find", stringBuffer.toString());
			} else {
				stringBuffer.append("alert('찾으신 비밀번호는 " + user.getPassword() + " 입니다.');");
				modelAndView.addObject("find", stringBuffer.toString());
			}
		}

		return modelAndView;
	}

	// 관리자 전용 회원정보 리스트 출력 로직
	@RequestMapping(value = "/viewUsers", method = RequestMethod.GET)
	public ModelAndView usersView() {

		ModelAndView modelAndView = new ModelAndView("/admin/viewUsers");
		modelAndView.addObject("viewUsers", userService.viewUsers());

		return modelAndView;
	}

	// 관리자 전용 회원탈퇴 처리 로직
	@RequestMapping(value = "/usersOut/{userNo}", method = RequestMethod.GET)
	public ModelAndView usersOut(@PathVariable(value = "userNo") int userNo, User user) {
		RedirectView redirectView = new RedirectView("/graz/viewUsers");
		redirectView.setExposeModelAttributes(false);

		user.setUserNo(userNo);
		userService.exit(user);

		return new ModelAndView(redirectView);
	}

	// 관리자 전용 회원복귀 처리 로직
	@RequestMapping(value = "/usersIn/{userNo}", method = RequestMethod.GET)
	public ModelAndView usersIn(@PathVariable(value = "userNo") int userNo) {
		RedirectView redirectView = new RedirectView("/graz/viewUsers");
		redirectView.setExposeModelAttributes(false);

		userService.reJoin(userNo);

		return new ModelAndView(redirectView);
	}

	// 관리자 전용 회원 영구삭제 처리로직
	@RequestMapping(value = "/deleteUser/{userNo}", method = RequestMethod.GET)
	public ModelAndView deleteUser(@PathVariable(value = "userNo") int userNo) {
		RedirectView redirectView = new RedirectView("/graz/viewUsers");
		redirectView.setExposeModelAttributes(false);

		userService.delete(userNo);

		return new ModelAndView(redirectView);
	}

	// 이메일 인증페이지
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	public ModelAndView emailCheckPage(User user) {
		ModelAndView modelAndView = new ModelAndView("/user/emailCheck");
		modelAndView.addObject("email", user.getEmail());
		return modelAndView;
	}
	
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public ModelAndView emailCheck(HttpServletRequest request, HttpSession session){
		String userEmail = request.getParameter("email"); //받는사람 이메일
		
		RedirectView redirectView = new RedirectView("/graz/emailCheck?email="+userEmail);
		redirectView.setExposeModelAttributes(false);

		String setfrom = "noreply@chunseongjun.com";
		String title = "graz웹 이메일 인증번호 입니다."; // request.getParameter("title"); // 제목
		
		int randomNum = random.nextInt(10000)+1000;
		if(randomNum > 10000){
			randomNum = randomNum - 1000;
		}
		
		String content = Integer.toString(randomNum);

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			if(session.isNew()){
				session.setAttribute("emailCheckNum", content);
			}else{
				session.removeAttribute("emailCheckNum");
				session.setAttribute("emailCheckNum", content);
			}
			
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(userEmail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content + " 인증번호를 화면에 적어주세요."); // 메일 내용
			
			System.out.println(content);
			
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView(redirectView);
	}

}
