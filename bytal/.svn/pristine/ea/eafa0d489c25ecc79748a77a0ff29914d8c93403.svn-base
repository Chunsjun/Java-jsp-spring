package org.bytal.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler)throws Exception{
		HttpSession session = request.getSession(false);
		
		if(session != null){
			Object memberNo = session.getAttribute("memberNo");
			if(memberNo != null && memberNo.equals("admin")){
				return true;
			}
		}
		response.sendRedirect(request.getContextPath()+"/bytal/error");
		return false;
	}
}
