/**
 * 
 */
package com.bjsxt.work.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * @author 李军伟
 * @function: 字符编码设置
 * @date: 2017年9月5日
 */
public class EncodingFilter implements Filter{
	
	String encoding = null;

	// 3
	@Override
	public void destroy() {
		
	}

	// 2
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	
		
		
		// 1 过滤指定规则的请求
		request.setCharacterEncoding(encoding);
		
		// 2  执行下一个过滤器或访问目标资源
		chain.doFilter(request, response);
		
		// 3 执行过滤器之后的操作
	}

	// 1 初始化操作 只执行一次
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		encoding = filterConfig.getInitParameter("encoding");
		if (encoding == null) {
			encoding = "utf-8";
		}
		
	}

}
