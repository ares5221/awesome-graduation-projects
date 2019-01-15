package com.bjsxt.crm.filter;

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
		
		//判断是否是是登录页面|| 处理登录的Servlet|| 是注册页面|| 处理注册的Servlet ||是验证码的Servlt或者JSP
		//http://www.bjsxt.com:8080/sscslogin.jsp
		//http://127.0.0.1:8080/sscs/servlet/AdminSe/rvlet?method=login
		//http://127.0.0.1:8080/sscs/register.jsp
		//http://127.0.0.1:8080/sscs/servlet/AdminServlet?method=register
		//http://127.0.0.1:8080/sscs/servlet/servlet/RandomServlet
		String url = request.getRequestURL().toString().toLowerCase();
		String qs = request.getQueryString();
		if(qs!=null){
			url = url+"?"+qs.toLowerCase();
		}		
		//System.out.println(url);
		int n1 = url.indexOf("login");//是否是是登录页面|| 处理登录的Servlet
		int n2 = url.indexOf("register");// 是注册页面|| 处理注册的Servlet
		int n3 = url.indexOf("randomservlet");
		if(n1>=0  || n2>=0 || n3>=0){
			//不进行权限的验证，直接放行
			chain.doFilter(request, response);
		}else{
			//获取当前用户并判断用户是否登录
			Object user = request.getSession().getAttribute("user");		
			boolean flag = true;
			if(user == null){
				flag = false;
			}
			//如果没有登录，重定向到登录页面
			if(flag){
				//如果登录，就继续访问要访问的内容
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
