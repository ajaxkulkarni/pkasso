package com.pkasso.web.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

/**
 * Servlet Filter implementation class ResourceFilter
 */
public class ResourceFilter implements Filter {

    /**
     * Default constructor. 
     */
    public ResourceFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		Object loggedIn =  session.getAttribute("loggedIn");
		System.out.println("***********In resource Filter!!*******" + req.getRequestURL() + ":" + loggedIn);
		
		if(StringUtils.contains(req.getRequestURL(), ".jpg") && (loggedIn == null || !(Boolean)loggedIn)) {
			RequestDispatcher dispatch = request.getRequestDispatcher("error.jsp");
			dispatch.forward(request, response);
		}
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
