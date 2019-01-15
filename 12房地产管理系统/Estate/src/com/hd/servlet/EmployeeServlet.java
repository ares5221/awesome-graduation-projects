package com.hd.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.hd.entity.Customer;
import com.hd.entity.CustomerCare;
import com.hd.entity.CustomerLinkReord;
import com.hd.entity.NoticeInfo;
import com.hd.entity.UserInfo;
import com.hd.service.CustomerCareService;
import com.hd.service.CustomerLinkService;
import com.hd.service.CustomerService;
import com.hd.service.EmployeeService;
import com.hd.service.NoticeService;
import com.hd.service.impl.CustomerCareServiceImpl;
import com.hd.service.impl.CustomerLinkServiceImpl;
import com.hd.service.impl.CustomerServiceImpl;
import com.hd.service.impl.EmployeeServiceImpl;
import com.hd.service.impl.NoticeServiceImpl;
import com.hd.util.PageBean;

public class EmployeeServlet extends BaseServlet {
	EmployeeService empServicce	= new EmployeeServiceImpl();
	// 更新员工数据
	public void upDate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接收员工数据
		
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		String user_name = request.getParameter("user_name");
		int user_age = Integer.parseInt(request.getParameter("user_age"));
		String user_sex = request.getParameter("user_sex");
		String user_nation = request.getParameter("user_nation");
		String user_diploma = request.getParameter("user_diploma");
		String is_married = request.getParameter("is_married");
		int department_id = Integer.parseInt(request
				.getParameter("department_id"));
		int role_id = Integer.parseInt(request.getParameter("role_id"));		
		String user_tel = request.getParameter("user_tel");
		String user_intest = request.getParameter("user_intest");
		String user_bankcard = request.getParameter("user_bankcard");
		String user_mobile = request.getParameter("user_mobile");
		String user_idnum = request.getParameter("user_idnum");		
		
		//timeStamp会有毫秒值须转换
		String str = request.getParameter("user_addtime");
		Date user_addtime = Timestamp.valueOf(str);
		//Date user_addtime = java.sql.Date.valueOf(request.getParameter("user_addtime"));
		String user_addman = request.getParameter("user_addman");
		String user_changeman = request.getParameter("user_changeman");
		String user_email = request.getParameter("user_email");
		String user_address = request.getParameter("user_address");

		// 调用业务层完成更改

		UserInfo ui = new UserInfo(user_id, user_name, user_age, user_sex, 
				user_nation, user_diploma, is_married, department_id, 
				role_id, user_tel, user_intest, user_bankcard, user_mobile,
				user_idnum, user_addtime, user_addman, 
				user_changeman, user_email, user_address);
		EmployeeService empService = new EmployeeServiceImpl();

		// 页面跳转
		int n = empService.upDate(ui);
		if (n > 0) {
			// !!! 弹出提示框并自动跳转
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('更新成功！');"
					+ "location.href='/Estate/view/employee/emp_list.jsp';</script>");
		} else {
			request.setAttribute("error", "学生更新失败");

			request.getRequestDispatcher(
					"/Estate/view/employee/emp_edit.jsp").forward(request,
					response);
		}
	}
	
	public void showById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				//接收要更新的员工编号
				int user_id = Integer.parseInt(request.getParameter("user_id"));
				//调用业务层完成查询操作	
				EmployeeService empServicce	= new EmployeeServiceImpl();
				UserInfo userInfo = empServicce.findById(user_id);
				//页面跳转
				request.setAttribute("userInfo", userInfo);
				request.getRequestDispatcher("/view/employee/emp_detail.jsp").forward(request, response);
		
		
	}

	public void showAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//调用业务层完成查询操作并得到结果
		
		
		List<UserInfo> empList = empServicce.findAll();
		//页面跳转
		request.setAttribute("empList", empList);
		request.getRequestDispatcher("/view/employee/emp_list.jsp").forward(request, response);
	}
	
	
	public void find(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int index = 1;
		int size = 5;
		try{
			index = Integer.parseInt(request.getParameter("index"));
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
		
		//获取查询条件以及查询内容
		String selectContent = request.getParameter("selectContent");
		if(selectContent==null){
			selectContent = "";
		}
		String selectType = request.getParameter("selectType");
		if(selectType==null){
			selectType = "";
		}
		PageBean<UserInfo> pageBean = new PageBean<UserInfo>();
		pageBean.setIndex(index);
		pageBean.setSize(size);
		
		empServicce.find(pageBean,selectType,selectContent);
		
		request.setAttribute("pageBean", pageBean);
		//记住查询条件
		request.setAttribute("selectType", selectType);
		request.setAttribute("selectContent",selectContent);
		
		request.getRequestDispatcher("/view/employee/emp_list.jsp").forward(request, response);
		
		
	}
	
	//获取所有员工的姓名以及邮箱
	public void findAllEmail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//调用业务层完成查询操作并得到结果
		EmployeeService empServicce	= new EmployeeServiceImpl();
		
		List<UserInfo> empList = empServicce.findAll();
		//ajax返回数据
		//防止中文乱码
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//利用gson将集合转换为json的字符串
		Gson gson = new Gson();
		String str = gson.toJson(empList);
		out.println(str);
		out.flush();
		out.close();
	}
	
	
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//接收要删除员工的编号
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		
		//调用业务层完成删除操作
		EmployeeService empServicce	= new EmployeeServiceImpl();	
		int n = empServicce.delete(user_id);
		//页面跳转	
		response.setContentType("text/html;charset=utf-8");
		if(n>0){
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('删除成功');window.location.href='/Estate/servlet/EmployeeServlet?method=find';</script>");
		}else{
			
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('删除失败');window.location.href='/Estate/servlet/EmployeeServlet?method=find';</script>");
		}
		
		
		
	}

	/**
	 * 用户登录的方法，登录时判断邮箱是否验证，没有验证则不能登录
	 * 同时增加利用cookie记住密码功能
	 * @author wy
	 */
	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取登录帐号以及密码
		String userNum = request.getParameter("userNum");
		String userPw = request.getParameter("userPw");
		String reme = request.getParameter("remember");
		EmployeeService employeeService = new EmployeeServiceImpl();
		UserInfo user = employeeService.login(userNum, userPw);
		// 1 为登录成功，2为未激活，user 为null为登录失败
		// 将登录用户放进session
		if (user == null) {
			// 登录失败
			request.setAttribute("loginerror", "账户或者密码错误");
			request.getRequestDispatcher("/login.jsp").forward(request,
					response);
		} else {
			String is_used = user.getIs_used();
		
			if ("actived".equals(is_used)) {
				// 登录成功
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				//记住密码利用cookie
				Cookie cookie1 = new Cookie("unum", user.getUser_num());
				Cookie cookie2 = new Cookie("upw",user.getUser_pw());
				//设置cookie记住密码时间
				if("remember".equals(reme)){
					cookie1.setMaxAge(60*60*24*10);
					cookie2.setMaxAge(60*60*24*10);
				}else{
					cookie1.setMaxAge(0);
					cookie2.setMaxAge(0);
				}
				
				//设置cookie作用范围为当前项目
				cookie1.setPath("/Estate/");
				cookie2.setPath("/Estate/");
				
				response.addCookie(cookie1);
				response.addCookie(cookie2);
				//登录成功后要加载提醒界面
				loadPage(request,response);
				
				
			} else {
				System.out.println(user.getUser_email());
				// 未激活需要激活
				String url = request.getScheme() + "://"
						+ request.getServerName() + ":"
						+ request.getServerPort() + request.getContextPath()
						+ "/"; // 相当于 :http://127.0.0.1:8181/Estate/
				request.setAttribute(
						"activeerror",
						"您还未激活无法登录,点击<a style='color:#ff0000;' href='http://127.0.0.1:8080/Estate/servlet/AdminServlet?method=sendEmail&email="+user.getUser_email()+"'>发送激活邮件。</a>");
				request.getRequestDispatcher("/login.jsp").forward(request,
						response);
			}
		}
	}
	
	//加载center.jsp页面数据
	public void loadPage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			findAllCTS(request,response);
			findAllNotice(request,response);
			findAllCare(request,response);
			findAllLink(request,response);
			request.getRequestDispatcher("/view/frame/main.jsp").forward(
					request, response);
	}
	
	public void loadPage2(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			findAllCTS(request,response);
			findAllNotice(request,response);
			findAllCare(request,response);
			findAllLink(request,response);
			request.getRequestDispatcher("/view/frame/center.jsp").forward(
					request, response);
	}
	
	public void findAllCTS(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//调用业务层获取客户信息
		int days = 300;
		try{
			days = Integer.parseInt(request.getParameter("CustomerDate"));
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
		CustomerService customerService = new CustomerServiceImpl();
		List<Customer> csAll = customerService.findDateCustomer(days);
		HttpSession session = request.getSession();
		
		session.setAttribute("scAll", csAll);
		//获取所有关怀信息
		session.setAttribute("ctsday", days);
	}
	
	public void findAllNotice(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//获取所有公告信息
		int days = 300;
		try{
			days = Integer.parseInt(request.getParameter("NoticeDate"));
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
		NoticeService ns = new NoticeServiceImpl();
		
		List<NoticeInfo> list = ns.findDateNotice(days);
		
		HttpSession session = request.getSession();
		session.setAttribute("noticeList", list);
		session.setAttribute("noticeday", days);
	}
	
	public void findAllCare(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		CustomerCareService cs = new CustomerCareServiceImpl();
		int days = 300;
		try{
			days = Integer.parseInt(request.getParameter("CareDate"));
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
		List<CustomerCare> list = cs.findDateCare(days);
		HttpSession session = request.getSession();
		session.setAttribute("careList", list);
		session.setAttribute("careday", days);
	}
	
	public void findAllLink(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		int days = 300;
		try{
			days = Integer.parseInt(request.getParameter("LinkDate"));
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
		CustomerLinkService cls = new CustomerLinkServiceImpl();
		List<CustomerLinkReord> list = cls.showBeforeTime(days);
		HttpSession session = request.getSession();
		session.setAttribute("linkList", list);
		session.setAttribute("linkday", days);
	}
	
	
	//用户退出功能实现，清除session
	
	public void logout(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		//重定向到登录界面
		response.sendRedirect("/Estate/login.jsp");
		
	}
	
	
}
