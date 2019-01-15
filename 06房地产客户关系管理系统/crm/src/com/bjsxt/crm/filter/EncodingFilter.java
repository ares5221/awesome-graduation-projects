package com.bjsxt.crm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter{
	String encoding;
	
	/**
	 * 销毁操作，只执行一次
	 */
	@Override
	public void destroy() {
		
	}
	/**
	 * 过滤器范围的内的每次请求和响应都执行
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		//读取配置文件的编码类型（放到此处不合适，每次请求都读取，效率低下）
		
		//1.请求到达目标资源之前的预处理操作：解决中文乱码
		//request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding(encoding);
		
		//2.将请求传递个下一个过滤器或者目标资源（已经是最后一个过滤器了）
		chain.doFilter(request, response);
		
		//3.响应离开目标资源之后的后处理操作		
		
	}
	/**
	 * 初始化操作，只执行一次	
	 */
	@Override
	public void init(FilterConfig config) throws ServletException {
		//读取配置文件的编码类型（放到此处合适，只读取一次，效率高）
		encoding = config.getInitParameter("encoding");
		if(encoding == null){
			encoding = "utf-8";
		}
		
	}

}
