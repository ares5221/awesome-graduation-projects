package com.bjsxt.work.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author 李军伟
 * @function: 权限过滤器
 * @date: 2017年9月5日
 */
public class AuthFilter implements Filter {

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		
		// 例外情况  不过滤的页面和servlet方法
		String url = request.getRequestURL().append("?" + request.getQueryString()).toString().toLowerCase();
//		System.out.println(request.getQueryString());  // method=login
		
		// 判断是否访问的是servlet中的  index登录方法  注册 register   验证码random  此三者不拦截
		int index = url.indexOf("index");
		int login = url.indexOf("login");
		int info = url.indexOf("info");
		int main = url.indexOf("main");
		if (index > -1 || login > -1 || main > -1 || info > -1) {
			filterChain.doFilter(request, response);
		} else {
			// 判断用户是否登录，并跳转到指定页面
			Object user = request.getSession().getAttribute("user");
			if (user != null) {
				// 登录
				filterChain.doFilter(request, response);
			} else {
				// 未登录
				response.sendRedirect(request.getContextPath() + "/index.jsp");
				return;
			}
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
