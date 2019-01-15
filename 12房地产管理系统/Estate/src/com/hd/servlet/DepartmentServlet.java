package com.hd.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hd.entity.Department;
import com.hd.entity.NoticeInfo;
import com.hd.service.DepartmentService;
import com.hd.service.NoticeService;
import com.hd.service.impl.DepartmentServiceImpl;
import com.hd.service.impl.NoticeServiceImpl;
import com.hd.util.PageBean;

public class DepartmentServlet extends BaseServlet {

	DepartmentService depService = new DepartmentServiceImpl();
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//接收要删除部门的编号
		int department_id = Integer.parseInt(request.getParameter("department_id"));
		//调用业务层完成删除操作
		DepartmentService depService = new DepartmentServiceImpl();
			
		depService.delete(department_id);
		//页面跳转		
		request.getRequestDispatcher("/servlet/DepartmentServlet?method=find").forward(request, response);
		
	}
	public void showAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//调用业务层完成查询操作并得到结果
		
		
		List<Department> depList = depService.findAll();
		//页面跳转
		request.setAttribute("depList", depList);
		request.getRequestDispatcher("/view/employee/dept_list.jsp").forward(request, response);
	
	}
	
	public void find(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		
		int index = 1;
		//默认每页显示五条记录
		int size = 5;
		//获得查询条件，如果没有则设置为默认
		try{
			index = Integer.parseInt(request.getParameter("index"));
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
		
		String deptName = request.getParameter("deptName");
		if(deptName==null){
			deptName = "";
		}
		
		PageBean<Department> pageBean = new PageBean<Department>();
		
		pageBean.setIndex(index);
		pageBean.setSize(size);
		
		depService.find(pageBean,deptName);
		
		request.setAttribute("pageBean", pageBean);
		//记住查询条件
		request.setAttribute("deptName", deptName);
		
		request.getRequestDispatcher("/view/employee/dept_list.jsp").forward(request, response);
		
	}
	
	
}
