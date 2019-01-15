package com.bjsxt.crm.servlet;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.crm.entity.Department;
import com.bjsxt.crm.entity.Role;
import com.bjsxt.crm.entity.User;
import com.bjsxt.crm.service.DepartmentService;
import com.bjsxt.crm.service.UserService;
import com.bjsxt.crm.service.impl.DepartmentServiceImpl;
import com.bjsxt.crm.service.impl.UserServiceImpl;
import com.bjsxt.crm.util.PageBean;

public class UserServlet extends BaseServlet {
	
	/**
	 * 按条件查询
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showUser (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		response.setCharacterEncoding("utf-8");
//		response.setContentType("text/html;charset=utf-8");
		
		//接收前端数据
		//int userId = Integer.parseInt(request.getParameter("user_ID"));
		
		String operation = request.getParameter("operation");
		String queryType = request.getParameter("queryType");
		String content1 = request.getParameter("content");
		UserService userService = new UserServiceImpl();
		String content=null;
		 try {
			 //解决中文乱码
			  content = java.net.URLDecoder.decode(content1,"UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		List<User> userList = userService.showUser(queryType, content);
		if("edit".equals(operation)){
			if(userList!=null){
				request.setAttribute("userList", userList);
				request.getRequestDispatcher("/view/employee/emp_edit.jsp").forward(request, response);
				return;
			}
		}else if("detail".equals(operation)){
			if(userList!=null){
				request.setAttribute("userList", userList);
				request.getRequestDispatcher("/view/employee/emp_detail.jsp").forward(request, response);
				return;
			}
		}else {
			if(userList!=null){
				request.setAttribute("userList", userList);
				request.setAttribute("content", content);
				request.setAttribute("queryType", queryType);
				request.getRequestDispatcher("/view/employee/emp_list.jsp").forward(request, response);
		}
			
		return;
		}
	}
	
	public void showUser1 (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		response.setCharacterEncoding("utf-8");
//		response.setContentType("text/html;charset=utf-8");
		
		//接收前端数据
		//int userId = Integer.parseInt(request.getParameter("user_ID"));
		
		String operation = request.getParameter("operation");
		String queryType = request.getParameter("queryType");
		String content1 = request.getParameter("content");
		UserService userService = new UserServiceImpl();
		String content=null;
		 try {
			 //解决中文乱码
			  content = java.net.URLDecoder.decode(content1,"UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		List<User> userList = userService.showUser( queryType, content);
		if("edit".equals(operation)){
			if(userList!=null){
				request.setAttribute("userList", userList);
				request.getRequestDispatcher("/view/employee/emp_edit.jsp").forward(request, response);
				return;
			}
		}else if("detail".equals(operation)){
			if(userList!=null){
				request.setAttribute("userList", userList);
				request.getRequestDispatcher("/view/employee/emp_detail.jsp").forward(request, response);
				return;
			}
		}else {
			if(userList!=null){
				request.setAttribute("userList", userList);
				request.setAttribute("content", content);
				request.setAttribute("queryType", queryType);
				request.getRequestDispatcher("/view/employee/success.html").forward(request, response);
		}
			
		return;
		}
	}
	
	
	
	
	
	
	public void upDate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取前端数据
		int userId = Integer.parseInt(request.getParameter("userId"));
		String userName = request.getParameter("userName");
		//String userNum = request.getParameter("userNum");
		int userAge = Integer.parseInt(request.getParameter("userAge"));
		//String  userPw = request.getParameter("userPw");
		String userSex = request.getParameter("userSex");
		String userNation = request.getParameter("userNation");
		String userDiploma = request.getParameter("userDiploma");
		String isMarried =request.getParameter("isMarried");
		int departmentId = Integer.parseInt(request.getParameter("departmentId"));
		int roleId = Integer.parseInt(request.getParameter("roleId"));
		String userTel = request.getParameter("userTel");
		String userIntest = request.getParameter("userIntest");
		String userBankcard = request.getParameter("userBankcard");
		String  userMobile = request.getParameter("userMobile");
		String userIdnum = request.getParameter("userIdnum");
		Date userChangeTime = new Date(System.currentTimeMillis());
		String userAddress = request.getParameter("userAddress");
		String userChangeman = request.getParameter("userChangeman");
		String userEmail = request.getParameter("userEmail");
		
		
		User user = new User(userId, departmentId, roleId, userName, userSex, userMobile, userAge, userAddress, userTel, userIdnum, userEmail, userChangeTime, userChangeman, userIntest, userDiploma, userBankcard, userNation, isMarried);
		
		//调用业务层
				UserService userService = new UserServiceImpl();
				int n = userService.upDateById(user);
				
				if(n>0){
					response.sendRedirect("UserServlet?method=showUser");
				}else {
					request.setAttribute("error", "更改失败");
					request.getRequestDispatcher("/view/admin/emp_edit.jsp").forward(request, response);
				}
				
	}
	public void showById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取前端数据
		int userId = Integer.parseInt(request.getParameter("user_ID"));
		String operation = request.getParameter("operation");
		//String userName = request.getParameter("userName");
//		
		//调用业务层
		UserService userService = new UserServiceImpl();
		User user = userService.findById(userId);
		DepartmentService departmentService = new DepartmentServiceImpl();
		List<Department> depts = departmentService.findAll();
		
		List <Role> roleList=userService.showRole("",0);//查所有定义role_name为"",role_power为0

		//根据返回结果跳转
		if(user!=null && depts!=null){
			request.setAttribute("roleList", roleList);
			request.setAttribute("user", user);
			request.setAttribute("depts", depts);
			if("edit".equals(operation)){
				request.getRequestDispatcher("/view/employee/emp_edit.jsp").forward(request, response);
			}else if("detail".equals(operation)){
				request.getRequestDispatcher("/view/employee/emp_detail.jsp").forward(request, response);
			}
		}
	}
	public void delUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取前端数据
		int userId = Integer.parseInt(request.getParameter("user_ID"));
		//调用业务层完成删除操作
		UserService userService = new UserServiceImpl();
		int n = userService.delUser(userId);
		//根据返回结果做相应反馈
		if (n>0){
			response.sendRedirect("UserServlet?method=showUser");
		}else {
			request.setAttribute("error", "删除失败");
			request.getRequestDispatcher("/view/admin/emp_list.jsp").forward(request, response);
		}
		
	}
	/**
	 * 预添加，调部门方法加载所有部门
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void toAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int i=0;
		try{
			i =Integer.parseInt(request.getParameter("i"));
			System.out.println("添加管理员办法");
		}catch(NumberFormatException e){
			System.out.println("普通的添加员工办法");
		}
		DepartmentService departmentService = new DepartmentServiceImpl();
		List<Department> deptList = departmentService.findAll();

		
		UserService user = new UserServiceImpl();
		List <Role> roleList=user.showRole("",0);//查所有定义role_name为"",role_power为0

		if(deptList!=null){
			request.setAttribute("roleList", roleList);
			request.setAttribute("deptList", deptList);
			if(i==2){
				request.getRequestDispatcher("/view/admin/admin_add.jsp").forward(request, response);	
			}else{
			request.getRequestDispatcher("/view/admin/emp_add.jsp").forward(request, response);
			}
		}
		
	}
	/**
	 * 添加新员工功能
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void UserAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取前端数据
		String userName = request.getParameter("userName");
		String userNum = request.getParameter("userNum");
		int userAge = Integer.parseInt(request.getParameter("userAge"));
		String  userPw = request.getParameter("userPw");
		String userSex = request.getParameter("userSex");
		String userNation = request.getParameter("userNation");
		String userDiploma = request.getParameter("userDiploma");
		String isMarried =request.getParameter("isMarried");
		int departmentId = Integer.parseInt(request.getParameter("departmentId"));
		int roleId = Integer.parseInt(request.getParameter("roleId"));
		String userTel = request.getParameter("userTel");
		String userIntest = request.getParameter("userIntest");
		String userBankcard = request.getParameter("userBankcard");
		String  userMobile = request.getParameter("userMobile");
		String userIdnum = request.getParameter("userIdnum");
		Date userAddtime = new Date(System.currentTimeMillis());
		String userAddress = request.getParameter("userAddress");
		String userAddman = request.getParameter("userAddman");
		String userEmail = request.getParameter("userEmail");
		//获取i 的数值定义i=2时跳转查询管理员列表
		//也就是user所有人中 角色人为管理员的 人员列表
		int i=0;
		try{
			i =Integer.parseInt(request.getParameter("i"));
			System.out.println("添加管理员办法");
		}catch(NumberFormatException e){
			System.out.println("普通的添加员工办法");
		}
		
		//封装成对象
		User user = new User(departmentId, roleId, userName, userSex, userMobile, userAge, userAddress, userNum, userPw, userTel, userIdnum, userEmail, userAddtime, userAddman, userIntest, userDiploma, userBankcard, userNation, isMarried);
		//调用业务层做添加操作
		UserService userService = new UserServiceImpl();
		int n = userService.addUser(user);
		
		//接收返回值，跳到相应的页面
		if(n>0){
			if(i==2){
				request.getRequestDispatcher("/view/employee/success.html").forward(request, response);
			}else{
			response.sendRedirect("UserServlet?method=showUser");
			}
		}else{
			request.setAttribute("error", "添加失败");
			request.getRequestDispatcher("/view/admin/emp_add.jsp").forward(request, response);
		}

	}
	/**
	 * 展示所有学生功能
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
//	public void showUser(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		int userId=-1;
//		UserService userService = new UserServiceImpl();
//		List<User> userList = userService.showUser(userId);
//		
//		if(userList!=null){
//			
//			request.setAttribute("userList", userList);
//			request.getRequestDispatcher("/view/employee/emp_list.jsp").forward(request, response);
//			
//		
//		}
//	}

	

	/**
	 * role  角色添加方法
	 */
	public void addRole(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取前端数据
		String role_name = request.getParameter("role_name");
		int role_power = Integer.parseInt(request.getParameter("role_power"));
		String is_used = request.getParameter("is_used");
		
		//封装成对象
		Role role = new Role(role_name, role_power, is_used);
		//调用业务层进行添加操作
		UserService userService = new UserServiceImpl();
		int n = userService.addRole(role);
		if(n>0){
			response.sendRedirect("UserServlet?method=showRole");
		}else{
			request.setAttribute("error", "添加失败");
			request.getRequestDispatcher("/view/admin/role_add.jsp").forward(request, response);
		}
	}


	/**
	 * role  角色条件查询方法
	 */
	 public void showRole1(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		//接受表单数据
			String srole_power = request.getParameter("srole_power");//null  ""  "abc"
			int role_power = 0;
			try{
				role_power = Integer.parseInt(srole_power);
			}catch(NumberFormatException e){
				System.out.println("没有角色权限编号 默认为0");
			}
			String role_name = request.getParameter("srole_name");
			if(role_name == null){
				role_name = "";
				System.out.println("没有角色名称默认为空");
			}
			
			//调用业务层进行查询
			UserService user = new UserServiceImpl();
			List <Role> roleList=user.showRole(role_name,role_power);
			
			//根据查询的的结果跳转不同的页面
			request.setAttribute("roleList", roleList);
			request.getRequestDispatcher("/view/admin/role_show.jsp").forward(request, response);
		}
		
	 //角色查询条件方法 带分页
	 public void showRole(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		//接受表单数据
		// 1.1获取当前页码和每页记录数
			String sindex = request.getParameter("index"); // 页码"2" "4" null ""
			int index = 1;
			try {
				index = Integer.parseInt(sindex);
			} catch (NumberFormatException e) {
				// index = 1;
				//e.printStackTrace();
				System.out.print("没有接受到页码，还好默认是1；");
			}
			
			String ssize = request.getParameter("size"); // 每页记录数"2" "4" null ""
			int size = 4;
			try {
				size = Integer.parseInt(ssize);
			} catch (NumberFormatException e) {
				// index = 1;
				//e.printStackTrace();
				System.out.print("没有接受到每页记录数，还好默认是4；");
			}
			PageBean pageBean = new PageBean<Department>();
			pageBean.setIndex(index);
			pageBean.setSize(size);
			String srole_power = request.getParameter("srole_power");//null  ""  "abc"
			int role_power = 0;
			try{
				role_power = Integer.parseInt(srole_power);
			}catch(NumberFormatException e){
				System.out.println("没有部门编号 默认为0");
			}
			String role_name = request.getParameter("srole_name");
			if(role_name == null){
				role_name = "";
				System.out.println("没有部门名称默认为空");
			}
			
			//调用业务层进行查询
			UserService user = new UserServiceImpl();
			user.showRole(pageBean,role_name,role_power);
			
			//根据查询的的结果跳转不同的页面
			request.setAttribute("pageBean", pageBean);
			request.setAttribute("role_name", role_name);
			request.setAttribute("role_power", role_power);
			//request.setAttribute("roleList", roleList);
			request.getRequestDispatcher("/view/admin/role_show.jsp").forward(request, response);
		}
	 
	 
	//删除角色
		public void deleteRole(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			//接收要删除的部门的编号
			int role_ID = Integer.parseInt(request.getParameter("role_ID"));
			
			//调用业务层完成删除操作
			UserService user = new UserServiceImpl();
			user.deleteRole(role_ID);
			
			//跳转到指定页面
			request.getRequestDispatcher("/servlet/UserServlet?method=showRole").forward(request, response);
		}
		
		//准备修改角色
		public void toUpdateRole(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			//接收要修改的部门的编号
			int role_ID = Integer.parseInt(request.getParameter("role_ID"));
			
			//调用业务层完成修改操作
			UserService user = new UserServiceImpl();
			Role role = user.toUpdateRole(role_ID);
			
			//跳转到指定页面
			request.setAttribute("role", role);
			request.getRequestDispatcher("/view/admin/role_add2.jsp").forward(request, response);
		}

		//修改角色方法 updateRole
		 public void updateRole(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException { 
			//1.获取要更新的部门数据
			
			int role_ID = Integer.parseInt(request.getParameter("role_ID"));
			String role_name = request.getParameter("role_name");
			int role_power = Integer.parseInt(request.getParameter("role_power"));
			String is_used = request.getParameter("is_used");
			Role role=new Role(role_ID, role_name, role_power, is_used);
			//调用业务层完成修改数据
			UserService user = new UserServiceImpl();
			int n = user.update(role);
			
			//根据结果跳转
			if(n>0){			
				response.sendRedirect("UserServlet?method=showRole");
			}else{
				request.setAttribute("mess", "修改失败!");
				//!!!
				request.getRequestDispatcher("/servlet/UserServlet?method=toUpdate&role_ID="+role_ID).forward(request,response);
			}
		}

}
