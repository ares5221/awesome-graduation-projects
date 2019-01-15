package com.bjsxt.school.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.school.entity.User;
import com.bjsxt.school.service.UserService;
import com.bjsxt.school.service.impl.UserServiceImpl;

public class UserServlet extends BaseServlet {

	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 接收视图层的表单数据
		// 解决POST中文乱码问题
		request.setCharacterEncoding("utf-8");
		// //接收用户名和密码
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		

		// //接收用户输入验证码
		String verifyCode = request.getParameter("verifyCode");
		// //获取正确的验证码
		String randStr = (String) request.getSession().getAttribute("randStr");
		// //判断验证码是否正确
		if (randStr == null || "".equals(randStr)
				|| !randStr.equals(verifyCode)) {
			request.setAttribute("error", "验证码错误，请重新输入");
			request.getRequestDispatcher("/login.jsp").forward(request,
					response);
			return;
		}
		// 调用业务层完成登录操作并得到结果
		UserService userService = new UserServiceImpl();
		User user = userService.login(userId, password);

		// 根据结果跳转到不同的视图页面
		if (user != null) {
			//创建cookie;
			String userId2=URLEncoder.encode(userId,"utf-8");
			Cookie cookie1=new Cookie("userId",userId2);
			Cookie cookie2=new Cookie("password",password);
			//制定cookie时间
			if("yes".equals(remember)){
				cookie1.setMaxAge(60*60*24*10);
				cookie2.setMaxAge(60*60*24*10);
			}else{
				cookie1.setMaxAge(0);
				cookie2.setMaxAge(0);
			}
			//制定cookie范围
			cookie1.setPath("/school/");
			cookie2.setPath("/school/");
			//把cookie给用户
			response.addCookie(cookie1);
			response.addCookie(cookie2);
			
			request.getSession().setAttribute("user", user);
			// 跳转到主页面(重定向)
			response.sendRedirect(request.getContextPath() + "/main.jsp");
		} else {
			request.setAttribute("error", "用户名或者密码错误");
			// 跳转回登录页面（转发）
			request.getRequestDispatcher("/login.jsp").forward(request,
					response);
		}
	}
	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().invalidate();
		response.sendRedirect("/school/login.jsp");

	}
	public void addUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接收页面数据
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");

		User user = new User(userId, userName, password);
		// 调用业务层完成注册操作

		UserService userService = new UserServiceImpl();
		int n = userService.addUser(user);

		// 页面跳转
		if (n > 0) {
			// request.getRequestDispatcher("/User/success.html").forward(request,
			// response);
//			request.getRequestDispatcher("/servlet/UserServlet?method=findAll")
//					.forward(request, response);
			response.sendRedirect("/school/servlet/UserServlet?method=findAll");

		} else {
			request.setAttribute("error", "学生添加失败");
			request.getRequestDispatcher("/User/UserList.jsp").forward(request,
					response);
		}
	}

	public void deleteUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 接收页面数据
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userId");
		// 调用业务层完成注册操作

		UserService userService = new UserServiceImpl();
		userService.deleteUser(userId);

		// 页面跳转
		response.sendRedirect(request.getContextPath()
				+ "/servlet/UserServlet?method=findAll");
		// request.getRequestDispatcher("/files/success.html").forward(request,
		// response);
		// request.getRequestDispatcher("/servlet/StudentServlet?method=show").forward(request,
		// response);
		// response.sendRedirect(request.getContextPath()+"/servlet/UserServlet?method=update");

	}

	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接收页面数据
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");

		User user = new User(userId, userName, password);
		// 调用业务层完成注册操作

		UserService userService = new UserServiceImpl();
		userService.update(user);

		// 页面跳转

		// request.getRequestDispatcher("/files/success.html").forward(request,
		// response);
		// request.getRequestDispatcher("/servlet/StudentServlet?method=show").forward(request,
		// response);
		response.sendRedirect(request.getContextPath()
				+ "/servlet/UserServlet?method=findAll");

	}

	public void findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 调用业务层完成注册操作
		String userId = request.getParameter("userId");
		if (userId == null) {
			userId = "";
		}
		String userName = request.getParameter("userName");
		if (userName == null) {
			userName = "";
		}
		UserService userService = new UserServiceImpl();
		List<User> userList = userService.findAll(userId, userName);

		// 页面跳转
		request.setAttribute("userId1", userId);
		request.setAttribute("userName1", userName);
		request.setAttribute("userList", userList);
		request.getRequestDispatcher("/User/UserList.jsp").forward(request,
				response);
		// request.getRequestDispatcher("/servlet/StudentServlet?method=show").forward(request,
		// response);

	}

	public void findById(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// 调用业务层完成注册操作
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userId");

		UserService userService = new UserServiceImpl();
		User user = userService.findById(userId);

		// 页面跳转

		// request.getRequestDispatcher("/files/success.html").forward(request,
		// response);
		// request.getRequestDispatcher("/servlet/StudentServlet?method=show").forward(request,
		// response);
		response.sendRedirect(request.getContextPath()
				+ "/servlet/UserServlet?method=findAll");

	}

	public void find(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取用户的请求数据
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		// 调用业务层完成注册操作

		UserService userService = new UserServiceImpl();
		List<User> userList = userService.find(userId, userName);

		// 页面跳转
		request.setAttribute("userList", userList);
		request.setAttribute("userId1", userId);
		request.setAttribute("userName1", userName);
		request.getRequestDispatcher("/User/UserList.jsp").forward(request,
				response);
		// request.getRequestDispatcher("/servlet/StudentServlet?method=show").forward(request,
		// response);

	}

}
