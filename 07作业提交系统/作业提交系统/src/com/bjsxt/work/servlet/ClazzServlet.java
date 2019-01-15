package com.bjsxt.work.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.work.entity.Clazz;
import com.bjsxt.work.entity.Teacher;
import com.bjsxt.work.service.ClazzService;
import com.bjsxt.work.service.impl.ClazzServiceImpl;

public class ClazzServlet extends BaseServlet {
	private static final long serialVersionUID = 7118882206149203508L;

	private ClazzService clazzService = new ClazzServiceImpl();
	/**
	 * 展示所有已创建的班级
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showClazz(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//1.查询所有已创建的班级，不用获取数据
		//2.调用业务层
		// 查询所有班级
		List<Clazz> cList = clazzService.showClazz();
		// 查询所有的老师
		List<Teacher> teaList = clazzService.findAllTeacher();
		
		//3.携带数据跳转到ClazzList界面，是界面数据变成动态的
		request.setAttribute("cList", cList);
		request.setAttribute("teaList", teaList);
		request.getRequestDispatcher("/admin/clazzList.jsp").forward(request, response);
		
	}
	
	// 到创建班级页面  准备好数据
	public void toAddPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		/**
		 * 得到老师，将老师放入 添加学生 的老师下拉栏选项中
		 * 
		 */
		//1.查询所有老师不用获取数据
		//2.调用业务层，得到老师
		 List<Teacher> teacherList = clazzService.findAllTeacher();
		//3.将老师放入
		 request.setAttribute("teacherList", teacherList);
		 request.getRequestDispatcher("/admin/clazz.jsp").forward(request, response);
	}
	
	// 创建班级
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		/**
		 * 添加班级功能
		 */
		//1.获取来自表单的数据数据
		 String cname = request.getParameter("cname");//得到来自表单的班级名字
		 int tid1 = Integer.parseInt(request.getParameter("tid1"));//得到来自表单的授课老师编号
		 int tid2 = Integer.parseInt(request.getParameter("tid2"));//得到来自表单的班主任老师编号
		 int tid3 = Integer.parseInt(request.getParameter("tid3"));//得到来自表单的就业老师编号
		 
		
		 Clazz clazz = new Clazz(cname);//将表单数据放入一个学生中
		 Teacher teacher1 = new Teacher(tid1);
		 Teacher teacher2 = new Teacher(tid2);
		 Teacher teacher3 = new Teacher(tid3);
		
		//2.调用业务层
		 int n = clazzService.add(clazz,teacher1,teacher2,teacher3);
		 
		 if(n > 0 ) {//3.添加学生提交成功后，跳转到学生排名页面？
				response.setContentType("text/html;charset=utf-8");//乱码
				PrintWriter out = response.getWriter();
				out.println("window.top.location.href='/work/servlet/ClazzServlet?method=showClazz';</script>");
				out.flush();
				out.close();
			} else {//失败留在当前页面
				request.setAttribute("error", "<font color='red'>添加课程失败!</font>");
				request.getRequestDispatcher("/admin/clazz.jsp").forward(request, response);
			}
	}

}
