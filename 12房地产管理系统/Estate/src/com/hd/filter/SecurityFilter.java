package com.hd.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 验证是否登录的过滤器
 * @author wmy
 * @day 2017年8月17日
 * @time 下午5:59:49
 *
 */
public class SecurityFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		// 获取请求路径
		String url = request.getRequestURL().toString();
		String qs = request.getQueryString();
		if (qs != null) {
			url = (url + "?" + qs).toLowerCase();
		}

		if (url.contains("login")||url.contains("email")||url.contains("active")) {
			// 放行
			chain.doFilter(request, response);
		} else {
			// 登录鉴权
			HttpSession session = request.getSession();
			Object user = session.getAttribute("user");
			if (user == null) {
				// 还未登录,重定向到登录界面
				response.sendRedirect(request.getServletContext()
						.getContextPath() + "/login.jsp");
			} else {
				// 放行
				chain.doFilter(request, response);
			}
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
