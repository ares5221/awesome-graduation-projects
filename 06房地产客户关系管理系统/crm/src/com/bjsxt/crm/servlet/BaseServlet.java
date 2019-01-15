package com.bjsxt.crm.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 1.该Servlet不需要在web.xml中进行配置，因为该Servlet不会直接在请求中被访问，而是用来做父类的
 * 2.该类完全可以定义成抽象类，不能直接new，但是可以在创建子类对象时对其进行实例化
 * 3.获取方法名后使用反射调用当前servlet的同名方法（servlet被调用的方法有固定的参数类型）
 * @author Administrator
 *
 */
public abstract class BaseServlet extends HttpServlet {

	
	
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.解决POST表单中文乱码问题
		request.setCharacterEncoding("utf-8");
		//2.获取method属性值
		String methodName = request.getParameter("method");//update add showAll login.....
				
		//3.根据methodName调用对应的方法			
		try {
			//3.1获取当前对象的Class信息
			Class clazz = this.getClass();//this代表当前的servlet
			//3.2获取对象
			//Object obj = clazz.newInstance();//违背了Servlet单实例多线程的
			Object obj = this;
			//3.3获取同名的方法
			Method method = clazz.getMethod(methodName,HttpServletRequest.class,HttpServletResponse.class);
			//3.4使用反射调用和methodName同名的方法
			method.invoke(obj,request,response);
		} catch (Exception e) {
			e.printStackTrace();
		} 

	}

}
