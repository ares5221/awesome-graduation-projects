package com.bjsxt.shopping.util.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class IPFilter implements Filter {
	
	FilterConfig fc = null;
	
	public void destroy() {
		System.out.println("IPFilter destroy");
	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		//System.out.println("IPFilter dofilter");
		String ip = req.getRemoteAddr();
		String strIPBlackList = fc.getInitParameter("IPBlackList");
		if(strIPBlackList.indexOf(ip) != -1) {
			PrintWriter out = resp.getWriter();
			out.println("Your IP is not welcome!");
			return;
		}
		chain.doFilter(req, resp);
	}

	public void init(FilterConfig fc) throws ServletException {
		System.out.println("IPFilter init");
		this.fc = fc;
	}

}
