package com.umt.lab.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class dofilter implements Filter{


	// 初始化过滤器
	public void init(FilterConfig filterConfig) throws ServletException {
	
	}

	// 执行过滤器功能
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		request.setCharacterEncoding("utf-8");
		
		response.setCharacterEncoding("utf-8");
		
	
	    chain.doFilter(request, response);       //把处理发送到下一个过滤器			
	
	}

	// 销毁过滤器
	public void destroy() {
	
	}

}
