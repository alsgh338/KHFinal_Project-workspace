package com.mata.persfume.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

		// 1. preHandle 메소드 (선처리)
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			
			HttpSession session = request.getSession();
			
			if(session.getAttribute("loginMember") != null){
				
				return true;
				
			}else {
				session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
				
				response.sendRedirect(request.getContextPath());
				
				return false;
			}
		}
}
