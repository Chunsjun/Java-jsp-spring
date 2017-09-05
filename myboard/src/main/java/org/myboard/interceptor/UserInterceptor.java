package org.myboard.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.myboard.domain.UserVO;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter{
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		 HttpSession session = request.getSession(false);
		 
			if(session != null){
				UserVO uvo = (UserVO)session.getAttribute("user");
				if(uvo != null){
					return true;
				}
			}
			response.sendRedirect(request.getContextPath()+"/login");
			return false;
		}
	}
