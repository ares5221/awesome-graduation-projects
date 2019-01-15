package com.bjsxt.school.filter;

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
	public void init(FilterConfig filterconfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest servletrequest,
			ServletResponse servletresponse, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest) servletrequest;
		HttpServletResponse response=(HttpServletResponse) servletresponse;
		String url=request.getRequestURL().toString();
		String qs=request.getQueryString();
		if(qs!=null){
			url=url+"?"+qs;
		}
		url=url.toLowerCase();
		int n1=url.indexOf("login");
		int n2=url.indexOf("register");
		if(n1>=0 || n2>=0){
//			·ÅÐÐ
			chain.doFilter(request, response);
		}else{
			Object user = request.getSession().getAttribute("user");
			boolean flag=true;
			if(user==null){
				
				flag=false;
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
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
