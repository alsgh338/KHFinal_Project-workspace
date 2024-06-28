package com.mata.persfumeAdmin.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mata.persfumeAdmin.member.model.vo.Member;

public class LoginInterceptor extends HandlerInterceptorAdapter{

		// 1. preHandle 메소드 (선처리)
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			
			HttpSession session = request.getSession();
			
			if(((Member)session.getAttribute("loginMember")).getMemNo() != 0){
				
				return true;
				
			}else {
				session.setAttribute("alertMsg", "나가");
				
				response.sendRedirect(request.getContextPath());
				
				return false;
			}
		}
}
