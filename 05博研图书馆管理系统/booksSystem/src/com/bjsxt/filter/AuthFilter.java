package com.bjsxt.filter;

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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request1, ServletResponse response1,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest)request1;
		HttpServletResponse  response = (HttpServletResponse)response1;
		//获取访问路径
		String url = request.getRequestURL().toString();
		int n1 = url.indexOf("login.jsp");
		System.out.println(url);
		if(n1>=0 ){
			//放行
			chain.doFilter(request, response);
		}else{
			//没有登录就不能访问，重定向到登录页面		
			Object user = request.getSession().getAttribute("manager");
			if(user ==null){
				response.sendRedirect(request.getContextPath()+"/login.jsp");
				}else{
					//放行
					chain.doFilter(request, response);
				}
			}	
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
