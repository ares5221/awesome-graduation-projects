package com.kb.eis.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthFilter implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain chain) throws IOException, ServletException {
		//强制类型转换
		HttpServletRequest request = (HttpServletRequest)servletRequest;
		HttpServletResponse response = (HttpServletResponse)servletResponse;
		//判断是否是登录页面
		String url = request.getRequestURL().toString().toLowerCase();
		String qs = request.getQueryString();
		if(qs!=null){
			url = url+"?"+qs.toLowerCase();
		}		
		int n1 = url.indexOf("login");
		if(n1>=0){
			chain.doFilter(request, response);
		}else{
			Object user = request.getSession().getAttribute("user");		
			boolean flag = true;
			if(user == null){
				flag = false;
			}
			if(flag){
				chain.doFilter(request, response);
			}else{
				response.sendRedirect(request.getContextPath()+"/login.jsp");
				return;
			}
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		
	}

}
