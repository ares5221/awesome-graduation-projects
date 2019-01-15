package com.hd.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 中文乱码过滤器
 * @author wmy
 * @day 2017年8月17日
 * @time 下午6:01:04
 *
 */
public class EncodingFilter implements Filter {

	private String encoding;

	/**
	 * 销毁方法,只执行一次
	 */
	@Override
	public void destroy() {
	}

	/**
	 * 过滤方法,过滤范围内每次请求执行一次
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// 每次请求之前解决中文乱码
		request.setCharacterEncoding(encoding);
		// 将执行权交给下一个内容
		chain.doFilter(request, response);
		// 响应操作,此处没有
	}

	/**
	 * 初始化方法,只执行一次
	 */
	@Override
	public void init(FilterConfig config) throws ServletException {
		// 获取配置文件中配置的初始化参数
		encoding = config.getInitParameter("encoding");
		// 作非空判断,给定默认值
		if (encoding == null) {
			encoding = "utf-8";
		}
	}

}
