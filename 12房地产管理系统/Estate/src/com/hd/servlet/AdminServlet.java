package com.hd.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hd.entity.Department;
import com.hd.entity.UserInfo;
import com.hd.entity.UserRole;
import com.hd.service.AdminService;
import com.hd.service.EmployeeService;
import com.hd.service.impl.AdminServiceImpl;
import com.hd.service.impl.EmployeeServiceImpl;
import com.hd.util.MailUtils;

public class AdminServlet extends BaseServlet {
	AdminService adminService = new AdminServiceImpl();
	/**
	 * 增加公司部门的方法
	 * 
	 */
	public void addDepartment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String deptName = request.getParameter("departmentName");
			String deptDesc = request.getParameter("departmentDesc");
			Department dept = new Department(deptName, deptDesc, null);
			int n = adminService.addDept(dept);
			if(n>0){
				//添加成功
				request.setAttribute("success", "添加成功");
				request.getRequestDispatcher("/view/admin/dept_add.jsp").forward(request, response);
			}else{
				//添加失败
				request.setAttribute("failed", "添加失败");
				request.getRequestDispatcher("/view/admin/dept_add.jsp").forward(request, response);
			}
	}
	
	//添加角色
	public void addRole(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String roleName = request.getParameter("roleName");
		int rolePower = Integer.parseInt(request.getParameter("rolePower"));
		UserRole userRole = new UserRole(roleName,rolePower,null);
		int n = adminService.addRole(userRole);
		if(n>0){
			//添加成功
			request.setAttribute("success", "添加成功");
			request.getRequestDispatcher("/view/admin/role_add.jsp").forward(request, response);
		}else{
			//添加失败
			request.setAttribute("failed", "添加失败");
			request.getRequestDispatcher("/view/admin/role_add.jsp").forward(request, response);
		}
	}
	
	//获取目前所有角色
	public void findAllRole(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<UserRole> roleList = adminService.findAllRole();
		request.setAttribute("roleList", roleList);
		//返回到下一个页面
		request.getRequestDispatcher("/view/admin/role_add.jsp").forward(request, response);
	}
	
	public void deleteRole(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int role_id = Integer.parseInt(request.getParameter("id"));
		int n = adminService.deleteRole(role_id);
		if(n>0){
			//删除成功
			request.setAttribute("deletesuccess", "删除成功");
			findAllRole(request,response);
		}else{
			//删除失败
			request.setAttribute("deletefailed", "删除失败");
			findAllRole(request,response);
		}
	}
	//发送激活邮件的方法
	public void sendEmail(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
		String url = request.getScheme() + "://"+ request.getServerName() + ":"+ request.getServerPort() + request.getContextPath()+ "/";	// 相当于 :http://127.0.0.1:8181/Estate/
		String email = request.getParameter("email");
		
	
		String emailMsg = "您已加入恒大集团，点击链接激活<a href='" +url+ "servlet/AdminServlet?method=active&email="+email+"'>先赚他一个亿</a>";
		request.setAttribute("sendEmail", "激活邮件已发送");
		
		request.getRequestDispatcher("/login.jsp").forward(request, response);
		
		try {
			
			MailUtils.sendMail(email, emailMsg);
		
		} catch (AddressException e) {
			
			e.printStackTrace();
		} catch (MessagingException e) {
			
			e.printStackTrace();
		}
	
	}
	
	//给同事发送邮件
	public void sendMessage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String receiver = request.getParameter("receiver");
		String mess = request.getParameter("message");
		try {
			MailUtils.sendMail(receiver, mess);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		request.setAttribute("success", "发送成功");
		request.getRequestDispatcher("/view/admin/send_mail.jsp").forward(request, response);
	}
	
	
	//所加员工邮箱激活
	public void active(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//获取所要激活的邮箱地址
		String email = request.getParameter("email");
		int n = adminService.active(email);
		if(n>0){
			//激活成功
			request.getRequestDispatcher("/active.jsp").forward(request, response);
		}else{
			//激活失败
			request.getRequestDispatcher("/active.jsp").forward(request, response);
			
		}
	}

	//增加员工的方法，
	public void addUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		//获取员工属性，
		int department_id = Integer.parseInt(request.getParameter("department_id"));
		int role_id = Integer.parseInt(request.getParameter("role_id"));
		String user_name = request.getParameter("user_name");
		String user_sex = request.getParameter("user_sex");
		String user_mobile = request.getParameter("user_mobile");
		int user_age = Integer.parseInt(request.getParameter("user_age"));
		String user_address = request.getParameter("user_address");
		String user_num = request.getParameter("user_num");
		String user_pw = request.getParameter("user_pw");
		String user_tel = request.getParameter("user_tel");
		String user_idnum = request.getParameter("user_idnum");
		String user_email = request.getParameter("user_email");
		//Date user_addtime = 需调用系统时间,所以在写入数据库时调用数据库时间
		String user_addman = request.getParameter("user_addman");
		//Date user_changetime = request.getParameter("user_changetime")
		//user_changeman
		String user_intest = request.getParameter("user_intest");
		String user_diploma = request.getParameter("user_diploma");
		String user_bankcard = request.getParameter("user_bankcard");
		String user_nation = request.getParameter("user_nation");
		String is_married = request.getParameter("is_married");
		String is_used = request.getParameter("is_used");
		UserInfo userInfo = new UserInfo(department_id, role_id, user_name, 
				user_sex, user_mobile, user_age, user_address, user_num, 
				user_pw, user_tel, user_idnum, user_email, null, user_addman,
				null, null, user_intest, user_diploma,
				user_bankcard, user_nation, is_married, is_used);
		
		// 获取项目地址
		String url = request.getScheme() + "://"+ request.getServerName() + ":"+ request.getServerPort() + request.getContextPath()+ "/";	// 相当于 :http://127.0.0.1:8181/Estate/
		//调用业务层增加员工
		int n = adminService.addUser(userInfo);
		if(n>0){
			//添加成功给相应的邮箱发送信息确认激活
			String emailMsg = "您已加入恒大集团，点击链接激活<a href='" +url+ "servlet/AdminServlet?method=active&email="+user_email+"'>先赚他一个亿</a>";
			try {
				MailUtils.sendMail(user_email, emailMsg);
			} catch (AddressException e) {
				
				e.printStackTrace();
			} catch (MessagingException e) {
				
				e.printStackTrace();
			}
			request.setAttribute("userinfosuccess", "添加成功");
			request.getRequestDispatcher("/view/admin/emp_add.jsp").forward(request, response);
			
		}else{
			request.setAttribute("userinfofailed", "添加失败");
			request.getRequestDispatcher("/view/admin/emp_add.jsp").forward(request, response);
		}
	}
	
	//读取数据库部门和角色的数据，动态的加载到添加员工的界面
	
	public void to_getAllDept(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//获取所有的部门,用于添加员工时下拉选择
		List<Department> deptList = adminService.findAllDept();
		
		response.setContentType("text/html;charset=utf-8");
		Gson gson = new Gson();
		String jsonStr = gson.toJson(deptList);
		PrintWriter out = response.getWriter();
		out.println(jsonStr);
	}
	
	public void to_getAllRole(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		//获取所有的角色信息，用于下拉选择时使用
		List<UserRole> roleList = adminService.findAllRole();
		response.setContentType("text/html;charset=utf-8");
		Gson gson = new Gson();
		String jsonStr = gson.toJson(roleList);
		PrintWriter out = response.getWriter();
		out.println(jsonStr);
	}
	
	//用户自己更新信息
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
			//更新成功后跳转到首页
			out.println("<script type='text/javascript'>alert('更新成功！');"
					+ "location.href='/Estate/view/frame/center.jsp';</script>");
		} else {
			request.setAttribute("error", "学生更新失败");

			request.getRequestDispatcher(
					"/Estate/view/employee/emp_info_edit.jsp").forward(request,
					response);
		}
	}
	
	
	
	
	
}
