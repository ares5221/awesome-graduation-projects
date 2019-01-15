package com.kb.eis.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.kb.eis.pojo.User;
import com.kb.eis.service.UserService;
import com.kb.eis.service.impl.UserServiceImpl;

public class UserServlet extends BaseServlet {
/**
 * @param request
 * @param response
 * @throws ServletException
 * @throws IOException
 */
	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		UserService userService=new UserServiceImpl();
		User user=userService.queryUser(name,pass);
		
		if(user!=null&&user.getStatus()==0){
			request.getSession().setAttribute("user", user);
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}else if (user!=null&&user.getStatus()==1) {
			request.setAttribute("error", "该管理员已被停用！");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}else {
			request.setAttribute("error", "用户名或密码错误！");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		
	}
	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	       request.getSession().invalidate();
	       response.sendRedirect(request.getContextPath()+"/login.jsp");
	}
/***
 * 显示所有操作员信息
 * @param request
 * @param response
 * @throws ServletException
 * @throws IOException
 */
	public void userShow(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       //1.
		
	   //2.调用业务层获取所有用户数据
		UserService userService=new UserServiceImpl();
		List<User> list = userService.queryAll();
		
		int size = list.size();
		//3.转发显示页面
		request.setAttribute("size", size);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/admin-list.jsp").forward(request, response);

	}
	/**
	 * 添加操作员
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void addUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.从表单获取添加数据
		String name = request.getParameter("name");
		String userName = request.getParameter("userName");
		String pass = request.getParameter("pass");
		String phone = request.getParameter("phone");
		int  quan =Integer.parseInt(request.getParameter("quan")) ;
		int  status = Integer.parseInt(request.getParameter("status"));
		
		User user=new User(name, userName, pass, phone, quan, status);
		//2.
		UserService userService=new UserServiceImpl();
		int n = userService.add(user);
		//3.
		
		if(n>0){
			request.getRequestDispatcher("/files/replacePage.html").forward(request, response);
		}else{
			request.setAttribute("error", "添加失败！");
			request.getRequestDispatcher("/admin/adminAdd.jsp").forward(request, response);
		}
		
	}
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.
		int id = Integer.parseInt(request.getParameter("id"));
		//2.
		UserService userService=new UserServiceImpl();
		userService.delete(id);
		
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print("1");
		//3.
		//response.sendRedirect("../UserServlet?method=userShow");
		//request.getRequestDispatcher("/servlet/UserServlet?method=userShow").forward(request, response);
	}
	
	public void deleteMore(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	    String[] check = request.getParameterValues("checkbox");
		if(check!=null){
	    UserService userService=new UserServiceImpl();
		userService.deleteMore(check);
		response.sendRedirect(request.getContextPath()+"/servlet/UserServlet?method=userShow");
		}
		response.sendRedirect(request.getContextPath()+"/servlet/UserServlet?method=userShow");
	}
	

	public void queryByName(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.
		
		String uName = request.getParameter("uName");
		String name=new String(uName.getBytes("iso-8859-1"),"utf-8");
		//2.
		UserService userService=new UserServiceImpl();
		List<User> list=userService.queryByName(name);
		
		int size = list.size();
		request.setAttribute("size", size);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/admin-list.jsp").forward(request, response);
		
	}
	public void UpdateStatus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.
		int id=Integer.parseInt(request.getParameter("id"));
		int status=Integer.parseInt(request.getParameter("status"));
		//2.
		UserService userService=new UserServiceImpl();
		userService.updateStatus(id,status);
		List<User> list = userService.queryAll();
		int size = list.size();
		// 3.转发显示页面
		request.setAttribute("size", size);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/admin-list.jsp").forward(request,response);
	}
	public void ShowById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		        //1.
				int id = Integer.parseInt(request.getParameter("id"));
				//2.
				UserService userService = new UserServiceImpl();
				User user = userService.findById(id);
				//3.直接返回学生数据
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out=response.getWriter();
				//将对象转换成json字符串
				Gson gson=new Gson();
				String jsonStr=gson.toJson(user);
				
				 out.println(jsonStr);
				 out.flush();
				 out.close();
				
	}
	public void toUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.
		int id = Integer.parseInt(request.getParameter("id"));
		//2.
		UserService userService = new UserServiceImpl();
		User user=userService.toUpdate(id);
		
		
		request.setAttribute("user", user);
		if(user.getQuan()==0){
			request.getRequestDispatcher("/admin/admin-update.jsp").forward(request,response);
		}else if(user.getQuan()==1){
			request.getRequestDispatcher("/admin/admin-update2.jsp").forward(request,response);
			
		}
		
	}
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String userName = request.getParameter("userName");
		String pass = request.getParameter("pass");
		String phone = request.getParameter("phone");
		int quan = Integer.parseInt(request.getParameter("quan"));
		int status = Integer.parseInt(request.getParameter("status"));
		User user=new User(id, name, userName, pass, phone, quan, status);
		//2.
		UserService userService = new UserServiceImpl();
		int n = userService.update(user);
		
		
		if(n>0){
			
			request.getRequestDispatcher("/files/replacePage.html").forward(request, response);
		}else{
			request.setAttribute("error", "修改失败！");
			request.getRequestDispatcher("/admin/admin-toUpdate.jsp").forward(request, response);
		}
		
	}
}
