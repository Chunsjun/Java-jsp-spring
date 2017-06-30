package org.graz.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.graz.domain.User;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MainInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		 HttpSession session = request.getSession(false);
		if(session != null){
			User user = (User)session.getAttribute("user");
			if(user != null){
				return true;
			}
		}
		response.sendRedirect(request.getContextPath()+"/graz/main");
		return false;
	}

}
