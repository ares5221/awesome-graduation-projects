package com.bjsxt.work.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.work.entity.Group;
import com.bjsxt.work.entity.Student;
import com.bjsxt.work.service.GroupService;
import com.bjsxt.work.service.impl.GroupServiceImpl;

public class GroupServlet extends BaseServlet {
	private static final long serialVersionUID = 4284542533698007886L;

	/**
	 * 添加小组
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void addGroup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获取参数
		// int gid=Integer.parseInt(request.getParameter("gid"));
		String gname = request.getParameter("gname");
		Group group = new Group(gname);
		int sid1 = Integer.parseInt(request.getParameter("sid1"));
		int sid2 = Integer.parseInt(request.getParameter("sid2"));
		Student stu1 = new Student(sid1);
		Student stu2 = new Student(sid2);
		// 调用业务层
		GroupService groupService = new GroupServiceImpl();
		int n = groupService.addGroup(group, stu1, stu2);

		if (n > 0) {
			response.sendRedirect(request.getContextPath() + "/servlet/GroupServlet?method=showAllGroup");
		} else {// 失败留在当前页面
			request.setAttribute("error", "<font color='red'>添加小组失败</font>");
			request.getRequestDispatcher("/servlet/GroupServlet?method=toAddPage").forward(request, response);
		}
	}

	/**
	 * 获取到所有老师的值。并在前台界面中获取
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void toAddPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 调用业务层
		GroupService groupService = new GroupServiceImpl();
		List<Student> studentList = groupService.ShowStudent();
		// 将老师放入
		request.setAttribute("studentList", studentList);
		request.getRequestDispatcher("/admin/group.jsp").forward(request, response);
	}

	public void showAllGroup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 调用业务层
		GroupService groupService = new GroupServiceImpl();
		List<Group> groupList = groupService.ShowAllGroup();
		List<Student> stuList = groupService.ShowStudent();
		// 将小组放入
		request.setAttribute("groupList", groupList);
		request.setAttribute("stuList", stuList);
		request.getRequestDispatcher("/admin/groupList.jsp").forward(request, response);
	}
	
	/**
	 * 删除小组信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void deleteGroup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取学生的编号
		int gid = Integer.parseInt(request.getParameter("gid"));
	    //调用业务层完成删除的操作
		GroupService groupService = new GroupServiceImpl();
	    int n = groupService.deleteG(gid);
	    //页面跳转
	    if(n>0){
	    	request.setAttribute("gid",gid);
	  	    response.sendRedirect(request.getContextPath()+"/servlet/GroupServlet?method=showAllGroup");
	    }
	  
	}
	
	/**
	 * 修改小组信息控制层
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void updateGroup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    //获取小组的信息
		int gid = Integer.parseInt(request.getParameter("gid"));
		String gname=request.getParameter("gname");
		Group group = new Group(gid,gname);
		int sid1=Integer.parseInt(request.getParameter("sid1"));
		int sid2=Integer.parseInt(request.getParameter("sid2"));
		Student stu1 = new Student(sid1);
        Student stu2 = new Student(sid2);
        //调用业务层
        GroupService groupService = new GroupServiceImpl();
        int n = groupService.updateGroup(group, stu1, stu2);
        //页面跳转
        if(n>0){
        	response.sendRedirect(request.getContextPath()+"/servlet/GroupServlet?method=showAllGroup");
		} else {//失败留在当前页面
			request.setAttribute("error", "修改小组失败");
			request.getRequestDispatcher("/admin/UpdateGroup.jsp").forward(request, response);
		}
    }
        
	/**
	 * 获取需要修改的小组信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取小组的编号
		int gid = Integer.parseInt(request.getParameter("gid"));
	    //调用业务层
		GroupService groupService =new GroupServiceImpl();
		
		List<Group> groupList = groupService.findByid(gid);
		List<Student> stuList = groupService.ShowStudent();
		//跳转到小组界面
		request.setAttribute("groupList", groupList);
		request.setAttribute("stuList", stuList);
		request.getRequestDispatcher("/admin/UpdateGroup.jsp").forward(request, response);
		
		
	}
}
