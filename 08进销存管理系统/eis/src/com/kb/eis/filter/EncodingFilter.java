package com.kb.eis.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter{
	String encoding;
	@Override
	public void destroy() {
		
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		//1.请求到达目标资源之前的预处理操作：解决乱码问题
		request.setCharacterEncoding(encoding);
		//2.调用下一个过滤器
		chain.doFilter(request, response);
	}
	
	@Override
	public void init(FilterConfig config) throws ServletException {
		//读取配置文件的编码类型（只读取一次）
		encoding = config.getInitParameter("encoding");
		if(encoding == null){
			encoding = "utf-8";
		}
	}
}
