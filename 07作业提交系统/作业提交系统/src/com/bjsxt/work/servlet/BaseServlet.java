package com.bjsxt.work.servlet;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author 李军伟
 * @function: 父类servlet 不需要路径 只要子类进行继承即可
 * @date: 2017年8月21日
 * @param <T>
 */
public abstract class BaseServlet extends HttpServlet {

	private static final long serialVersionUID = 2564900763828767253L;

	@SuppressWarnings("all")
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		// 1中文乱码
		request.setCharacterEncoding("utf-8");
		// 2获取方法名
		String methodName = request.getParameter("method");

		try {
			// 3.1获取当前运行类class类类型对象
			Class clazz = this.getClass();
			// 3.2根据方法名获取要调用 的方法
			Method method = clazz.getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
			// 3.3执行方法 this:servlet实例 单实例多线程
			method.invoke(this, request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
