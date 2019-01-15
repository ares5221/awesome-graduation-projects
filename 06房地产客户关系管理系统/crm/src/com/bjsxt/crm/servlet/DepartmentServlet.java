package com.bjsxt.crm.servlet;

import java.io.IOException;



import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import com.bjsxt.crm.entity.Department;
import com.bjsxt.crm.entity.Notice;
import com.bjsxt.crm.entity.User;
import com.bjsxt.crm.service.DepartmentService;
import com.bjsxt.crm.service.impl.DepartmentServiceImpl;
import com.bjsxt.crm.util.PageBean;



public class DepartmentServlet extends BaseServlet {
	

	// 添加部门 addDepartmen 
	public void addDepartment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取数据
		String department_name = request.getParameter("department_name");
		String department_desc = request.getParameter("department_desc");
		String is_used = request.getParameter("is_used");
		//调用方法添加数据
		Department departenmt=new Department( department_name, department_desc, is_used);
		DepartmentService de=new DepartmentServiceImpl();
		int n = de.add(departenmt);
		//根据结果进行跳转
		if(n>0){
			response.sendRedirect(request.getContextPath()+"/servlet/DepartmentServlet?method=showDept");
		}else{
			request.setAttribute("mess", "添加失败!");
	    	request.getRequestDispatcher("/view/admin/dept_add.jsp").forward(request, response);
		}
	}
	
	//查询所有部门 showAllDepartment
	public void showAllDepartment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取数据   查询所有不需要
		
		//调用方法获取数据
		DepartmentService de=new DepartmentServiceImpl();
		List<Department> deptList = de.findAll();
		//获取到数据后存储跳转
		request.setAttribute("deptList", deptList);
		request.getRequestDispatcher("/view/department/dept_showall.jsp").forward(request, response);	
	
		
	
	}

//	//条件查询符合条件的部门
//	public void showDept1(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		//接受表单数据
//		String sdepartment_ID = request.getParameter("sdepartment_ID");//null  ""  "abc"
//		int department_ID = 0;
//		try{
//			department_ID = Integer.parseInt(sdepartment_ID);
//		}catch(NumberFormatException e){
//			System.out.println("没有部门编号 默认为0");
//		}
//		String department_name = request.getParameter("sdepartment_name");
//		if(department_name == null){
//			department_name = "";
//			System.out.println("没有部门名称默认为空");
//		}
//		
//		//调用业务层进行查询
//		DepartmentService de=new DepartmentServiceImpl();
//		List <Department> deptList=de.showdept(department_ID,department_name);
//		//根据查询的的结果跳转不同的页面
//		request.setAttribute("deptList", deptList);
//		request.getRequestDispatcher("/view/department/dept_showall.jsp").forward(request, response);
//	}
	
	//带分页的条件查询
	public void showDept(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//接受表单数据
		// 1.1获取当前页码和每页记录数
		//获取j 用于最后判断跳转页面
		String jj= request.getParameter("j"); 
		int j = 1;
		try {
			j = Integer.parseInt(jj);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		String sindex = request.getParameter("index"); // 页码"2" "4" null ""
		int index = 1;
		try {
			index = Integer.parseInt(sindex);
		} catch (NumberFormatException e) {
			// index = 1;
			e.printStackTrace();
		}
		String ssize = request.getParameter("size"); // 每页记录数"2" "4" null ""
		int size = 2;
		try {
			size = Integer.parseInt(ssize);
		} catch (NumberFormatException e) {
			// index = 1;
			e.printStackTrace();
		}

		PageBean pageBean = new PageBean<Department>();
		pageBean.setIndex(index);
		pageBean.setSize(size);
		
		//1.2获取部门id 部门名称
		String sdepartment_ID = request.getParameter("sdepartment_ID");//null  ""  "abc"
		int department_ID = 0;
		try{
			department_ID = Integer.parseInt(sdepartment_ID);
		}catch(NumberFormatException e){
			System.out.println("没有部门编号 默认为0");
		}
		String department_name = request.getParameter("sdepartment_name");
		if(department_name == null){
			department_name = "";
			System.out.println("没有部门名称默认为空");
		}

		//调用业务层进行查询
		DepartmentService de=new DepartmentServiceImpl();
		de.showdept(pageBean,department_ID,department_name);
		//List <Department> deptList=de.showdept(department_ID,department_name);
		//根据查询的的结果跳转不同的页面
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("department_name", department_name);
		request.setAttribute("department_ID", department_ID);
		if(j==3){
			request.getRequestDispatcher("/view/employee/dept_list.jsp").forward(request, response);
		}else{
		//request.setAttribute("deptList", deptList);
		request.getRequestDispatcher("/view/department/dept_showall.jsp").forward(request, response);
		}
	}
	//删除部门 deleteDepartment
	public void deleteDepartment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//接收要删除的部门的编号
		int department_ID = Integer.parseInt(request.getParameter("department_ID"));
		
		//调用业务层完成删除操作
		DepartmentService de=new DepartmentServiceImpl();
		de.delete(department_ID);
		
		//跳转到指定页面
		request.getRequestDispatcher("/servlet/DepartmentServlet?method=showDept").forward(request, response);
	}
	
	//准备修改部门
	public void toUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//接收要修改的部门的编号
		int department_ID = Integer.parseInt(request.getParameter("department_ID"));
		
		//调用业务层完成修改操作
		DepartmentService de=new DepartmentServiceImpl();
		Department department = de.toUpdate(department_ID);
		
		//跳转到指定页面
		request.setAttribute("department", department);
		request.getRequestDispatcher("/view/department/dept_update.jsp").forward(request, response);
	}

	//修改部门
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.获取要更新的部门数据
		
		int department_ID = Integer.parseInt(request.getParameter("department_ID"));
		String department_name = request.getParameter("department_name");
		String department_desc = request.getParameter("department_desc");
		String is_used = request.getParameter("is_used");
		Department department=new Department(department_ID, department_name, department_desc, is_used);
		//调用业务层完成修改数据
		DepartmentService de = new DepartmentServiceImpl();
		int n = de.update(department);
		
		//根据结果跳转
		if(n>0){			
			response.sendRedirect("DepartmentServlet?method=showDept");
		}else{
			request.setAttribute("mess", "修改失败!");
			//!!!
			request.getRequestDispatcher("DepartmentServlet?method=toUpdate&department_ID="+department_ID).forward(request,response);
		}
	}



	/**
	
	//修改公告
	
	
	 * 公告方法
	 */
	//条件公告查询
	public void findNotice1(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//接受表单数据(公告编号。公告主题 。公告内容)
		int i=0;
		String parameter = request.getParameter("a");
		try{
			i = Integer.parseInt(parameter);
		}catch(NumberFormatException e){
			System.out.println("没有选择条件");
		}
		String snotice_ID=null;
		String notice_item =null;
		String notice_content=null;
		if(i==1){//判断获取值是不是公告编号
			snotice_ID = request.getParameter("b");
		}else{
			snotice_ID = request.getParameter("notice_ID");
		}	
		int notice_ID = 0;//公告编号处理
		try{
			notice_ID = Integer.parseInt(snotice_ID);
		}catch(NumberFormatException e){
			System.out.println("公告编号 默认为0");
		}
		if(i==2){//判断获取值是不是公告主题
			notice_item = request.getParameter("b");
		}else{	
			notice_item = request.getParameter("notice_item");
		}
		if(notice_item == null){//公告主题处理
			notice_item = "";
		}
		if(i==3){//判断获取的值是不是公告内容并赋值
			notice_content = request.getParameter("b");
		}else{
			notice_content = request.getParameter("notice_content");
		}
		if(notice_content == null){//公告内容处理
			notice_content = "";
		}
		//调用业务层进行查询
		DepartmentService de=new DepartmentServiceImpl();
		List <Notice> noList=de.shownotice(notice_ID,notice_item,notice_content);
		//根据查询的的结果跳转不同的页面
		request.setAttribute("noList", noList);
		request.getRequestDispatcher("/view/department/notice_list.jsp").forward(request, response);
	}

//带分页的条件公告查询
	public void findNotice(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//接受表单数据(公告编号。公告主题 。公告内容)
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
						

		int i=0;
		String parameter = request.getParameter("a");
		try{
			i = Integer.parseInt(parameter);
		}catch(NumberFormatException e){
			System.out.println("没有选择条件");
		}
		String snotice_ID=null;
		String notice_item =null;
		String notice_content=null;
		if(i==1){//判断获取值是不是公告编号
			snotice_ID = request.getParameter("b");
		}else{
			snotice_ID = request.getParameter("notice_ID");
		}	
		int notice_ID = 0;//公告编号处理
		try{
			notice_ID = Integer.parseInt(snotice_ID);
		}catch(NumberFormatException e){
			System.out.println("公告编号 默认为0");
		}
		if(i==2){//判断获取值是不是公告主题
			notice_item = request.getParameter("b");
		}else{	
			notice_item = request.getParameter("notice_item");
		}
		if(notice_item == null){//公告主题处理
			notice_item = "";
		}
		if(i==3){//判断获取的值是不是公告内容并赋值
			notice_content = request.getParameter("b");
		}else{
			notice_content = request.getParameter("notice_content");
		}
		if(notice_content == null){//公告内容处理
			notice_content = "";
		}
		//调用业务层进行查询
		DepartmentService de=new DepartmentServiceImpl();
		de.shownotice(pageBean,notice_ID,notice_item,notice_content);
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("notice_item", notice_item);
		request.setAttribute("notice_ID", notice_ID);
		request.setAttribute("notice_content", notice_content);
		//根据查询的的结果跳转不同的页面
		
		request.getRequestDispatcher("/view/department/notice_list.jsp").forward(request, response);
	}
	
	//准备添加公告方法
	public void toAddNotice(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1获取数据
		//2.进行查询
		DepartmentService de=new DepartmentServiceImpl();
		List<Department> deptList = de.findAll();
		//获取数据 并存储 进行跳转
		request.setAttribute("deptList", deptList);
		request.getRequestDispatcher("/view/department/notice_add.jsp").forward(request, response);	
	}
	
	//添加公告
	public void addNotice(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		//获取数据
		String suser_ID = request.getParameter("suser_ID");
		int user_ID = 0;
		try{
			user_ID = Integer.parseInt(suser_ID);
		}catch(NumberFormatException e){
			System.out.println("用户编号 默认为0");
		}
		String notice_item = request.getParameter("notice_item");
		String notice_content = request.getParameter("notice_content");
		Date notice_time = Date.valueOf(request.getParameter("notice_time"));
		Date notice_endtime = Date.valueOf(request.getParameter("notice_endtime"));
		String is_used = request.getParameter("is_used");
		//调用方法添加数据
			//g
		
		Notice no = new Notice(user_ID, notice_item, notice_content, notice_time, notice_endtime, is_used);
		DepartmentService de=new DepartmentServiceImpl();

		int n = de.addNotice(no);
		//根据结果进行跳转
		if(n>0){
			response.sendRedirect(request.getContextPath()+"/servlet/DepartmentServlet?method=findNotice");
		}else{
			request.setAttribute("mess", "添加失败!");
	    	request.getRequestDispatcher("/view/department/notice_add.jsp").forward(request, response);
		}
	}

	//删除公告
	public void deleteNotice(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//接收要删除的部门的编号
		int notice_ID = Integer.parseInt(request.getParameter("notice_ID"));
		
		//调用业务层完成删除操作
		DepartmentService de=new DepartmentServiceImpl();
		de.deleteNotice(notice_ID);
		
		//跳转到指定页面
		response.sendRedirect(request.getContextPath()+"/servlet/DepartmentServlet?method=findNotice");
	}


}