package com.pkasso.web.util;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SecurityInterceptor extends HandlerInterceptorAdapter {
	
		public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
		    throws Exception {
	 
			long startTime = System.currentTimeMillis();
			System.out.println("*************Here***********");
			request.setAttribute("startTime", startTime);
			return false;
		}

}
