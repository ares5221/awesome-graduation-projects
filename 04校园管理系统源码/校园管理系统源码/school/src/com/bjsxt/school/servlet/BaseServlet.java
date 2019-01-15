package com.bjsxt.school.servlet;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class BaseServlet extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	//	request.setCharacterEncoding("utf-8");
		String methodName = request.getParameter("method");

		Class clazz = this.getClass();
		Object obj = this;
		try {
			Method method = clazz.getMethod(methodName,
					HttpServletRequest.class, HttpServletResponse.class);
			method.invoke(obj, request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
