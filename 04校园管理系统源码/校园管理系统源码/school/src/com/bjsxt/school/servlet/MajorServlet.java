package com.bjsxt.school.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.school.entity.Clazz;
import com.bjsxt.school.entity.Course;
import com.bjsxt.school.entity.Grade;
import com.bjsxt.school.entity.Major;
import com.bjsxt.school.service.ClazzService;
import com.bjsxt.school.service.CourseService;
import com.bjsxt.school.service.GradeService;
import com.bjsxt.school.service.MajorService;
import com.bjsxt.school.service.impl.ClazzServiceImpl;
import com.bjsxt.school.service.impl.CourseServiceImpl;
import com.bjsxt.school.service.impl.GradeServiceImpl;
import com.bjsxt.school.service.impl.MajorServiceImpl;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class MajorServlet extends BaseServlet {

	public void getMajor(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1获取表单信息
		String mNo = request.getParameter("mNo");
		String mName = request.getParameter("mName");
		// 2调用业务层
		Major major = new Major(mNo, mName);
		MajorService majorService = new MajorServiceImpl();
		int n = majorService.addMajor(major);
		// 返回相应的界面
		if (n > 0) {
			request.getRequestDispatcher(
					"/servlet/MajorServlet?method=showMajor").forward(request,
					response);
		} else {
			request.setAttribute("error", "添加失败");
			request.getRequestDispatcher("/jsp/major.jsp").forward(request,
					response);
		}
	}
	
	public void findMajor(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1接受页面数据 查看所有专业信息
		String mNo = request.getParameter("mNo");
		// 2调用业务层完成查询操作 并得到结果
		MajorService majorService = new MajorServiceImpl();
		Major major = majorService.findMajor(mNo);
		// 3跳转相应的页面
		Gson gson = new Gson();
		String jsonStr = gson.toJson(major);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println(jsonStr);
		out.flush();
		out.close();
	}

	public void showMajor(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1接受页面数据 查看所有专业信息
		// 2调用业务层完成查询操作 并得到结果
		MajorService majorService = new MajorServiceImpl();
		List<Major> majorList = majorService.findAll();
		// 3跳转相应的页面
		request.setAttribute("majorList", majorList);
		request.getRequestDispatcher("/jsp/major.jsp").forward(request,
				response);
	}

	// 删除专业
	public void delectMajor(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 接受要删除的专业编号
		String mno = request.getParameter("mNo");
		// 调用业务层完成删除操作
		MajorService majorService = new MajorServiceImpl();
		majorService.delete(mno);
		// 页面跳转
		request.getRequestDispatcher("/servlet/MajorServlet?method=showMajor")
				.forward(request, response);
	}

	// 修改专业信息
	public void updateMajor(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1接受页面数据
		String mNo = request.getParameter("mNo");
		String mName = request.getParameter("mName");
		Major major = new Major(mNo, mName);
		// 2调用业务层完成更新修改操作
		MajorService majorService = new MajorServiceImpl();
		int n = majorService.updateMno(major);
		// 3接续跳到查看所有的页面上
		if (n > 0) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>window.close();"
					+ "window.opener.location.reload();</script>");
		} else {
			request.getRequestDispatcher(
					"/servlet/MajorServlet?method=showMajor").forward(request,
					response);
		}

	}

	// 查看所有课程学科
			public void findGrade(HttpServletRequest request,
					HttpServletResponse response) throws ServletException, IOException {
				// 1接受页面数据 查看所有专业信息
				String gradeNo = request.getParameter("gradeNo");
				// 2调用业务层完成查询操作 并得到结果
				GradeService gradeService = new GradeServiceImpl();
				Grade grade = gradeService.findGrade(gradeNo);
				// 3跳转相应的页面
				Gson gson = new Gson();
				String jsonStr = gson.toJson(grade);
				response.setCharacterEncoding("utf-8");
				PrintWriter out = response.getWriter();
				out.println(jsonStr);
				out.flush();
				out.close();
			}
	
	// 添加年级
	public void getGrade(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1获取表单信息
		String gradeNo = request.getParameter("gradeNo");
		String gradeName = request.getParameter("gradeName");
		// 2调用业务层
		Grade grade = new Grade(gradeNo, gradeName);
		GradeService gradeService = new GradeServiceImpl();
		int n = gradeService.addGrade(grade);
		// 返回相应的界面
		if (n > 0) {
			request.getRequestDispatcher(
					"/servlet/MajorServlet?method=showGrade").forward(request,
					response);
		} else {
			request.setAttribute("error", "添加失败");
			request.getRequestDispatcher("/jsp/major.jsp").forward(request,
					response);
		}
	}

	// 查看所有年级信息
	public void showGrade(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1接受页面数据 查看所有专业信息
		// 2调用业务层完成查询操作 并得到结果
		GradeService gradeService = new GradeServiceImpl();
		List<Grade> gradeList = gradeService.findAll();
		// 3跳转相应的页面
		request.setAttribute("gradeList", gradeList);
		request.getRequestDispatcher("/jsp/grade.jsp").forward(request,
				response);
	}

	// 删除年级
	public void delectGrade(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 接受要删除的专业编号
		String gradeNo = request.getParameter("gradeNo");
		// 调用业务层完成删除操作
		GradeService gradeService = new GradeServiceImpl();
		gradeService.delete(gradeNo);
		// 页面跳转
		request.getRequestDispatcher("/servlet/MajorServlet?method=showGrade")
				.forward(request, response);
	}

	// 修改年级信息
	public void updateGrade(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1接受页面数据
		String gradeNo = request.getParameter("gradeNo");
		String gradeName = request.getParameter("gradeName");
		Grade grade = new Grade(gradeNo, gradeName);
		// 2调用业务层完成更新修改操作
		GradeService gradeService = new GradeServiceImpl();
		int n = gradeService.updateMno(grade);
		// 3接续跳到查看所有的页面上
		if (n > 0) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>window.close();"
					+ "window.opener.location.reload();</script>");
		} else {
			request.getRequestDispatcher(
					"/servlet/MajorServlet?method=showGrade").forward(request,
					response);
		}

	}

	// 添加学科 课程
	public void getCouse(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1获取表单信息
		String courseNo = request.getParameter("courseNo");
		String courseName = request.getParameter("courseName");
		// 2调用业务层
		Course course = new Course(courseNo, courseName);
		CourseService courseService = new CourseServiceImpl();
		int n = courseService.addCourse(course);
		// 返回相应的界面
		if (n > 0) {
			request.getRequestDispatcher(
					"/servlet/MajorServlet?method=showCourse").forward(request,
					response);
		} else {
			request.setAttribute("error", "添加失败");
			request.getRequestDispatcher("/jsp/major.jsp").forward(request,
					response);
		}
	}

	// 查看所有课程学科
	public void showCourse(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1接受页面数据 查看所有专业信息
		// 2调用业务层完成查询操作 并得到结果
		CourseService courseService = new CourseServiceImpl();
		List<Course> courseList = courseService.findAll();
		// 3跳转相应的页面
		request.setAttribute("courseList", courseList);
		request.getRequestDispatcher("/jsp/course.jsp").forward(request,
				response);
	}
	
	// 查看所有课程学科
		public void findCourse(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// 1接受页面数据 查看所有专业信息
			String courseNo = request.getParameter("courseNo");
			// 2调用业务层完成查询操作 并得到结果
			CourseService courseService = new CourseServiceImpl();
			Course course = courseService.findCourse(courseNo);
			// 3跳转相应的页面
			Gson gson = new Gson();
			String jsonStr = gson.toJson(course);
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.println(jsonStr);
			out.flush();
			out.close();
		}

	// 删除学科 课程
	public void delectCourse(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 接受要删除的专业编号
		String courseNo = request.getParameter("courseNo");
		// 调用业务层完成删除操作
		CourseService courseService = new CourseServiceImpl();
		courseService.delete(courseNo);
		// 页面跳转
		request.getRequestDispatcher("/servlet/MajorServlet?method=showCourse")
				.forward(request, response);
	}

	// 更新指定学科编号的信息
	public void updateCourse(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1接受页面数据
		String courseNo = request.getParameter("courseNo");
		String courseName = request.getParameter("courseName");
		Course course = new Course(courseNo, courseName);
		// 2调用业务层完成更新修改操作
		CourseService courseService = new CourseServiceImpl();
		int n = courseService.update(course);
		// 3接续跳到查看所有的页面上
		if (n > 0) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>window.close();"
					+ "window.opener.location.reload();</script>");
//			request.getRequestDispatcher(
//					"/servlet/MajorServlet?method=showCourse").forward(request,
//					response);
		} else {
			request.getRequestDispatcher(
					"/servlet/MajorServlet?method=showGrade").forward(request,
					response);
		}

	}

	// 添加班级信息
	public void getclass(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1获取表单信息
		String classId = request.getParameter("classId");
		String className = request.getParameter("className");
		String gradeNo = request.getParameter("gradeNo");
		String mno = request.getParameter("mNo");
		Clazz clazz = new Clazz(classId, gradeNo, mno, className);
		// 2调用业务层
		ClazzService classService = new ClazzServiceImpl();
		int n = classService.addClass(clazz);
		// 返回相应的界面
		if (n > 0) {
			request.getRequestDispatcher(
					"/servlet/MajorServlet?method=showClass").forward(request,
					response);
		} else {
			request.setAttribute("error", "添加失败");
			request.getRequestDispatcher("/jsp/major.jsp").forward(request,
					response);
		}
	}

	// 展示班级信息
	public void showClass(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1接受页面数据
		MajorService majorService = new MajorServiceImpl();
		List<Major> majorList = majorService.findAll();
		// 3跳转相应的页面
		request.setAttribute("majorList", majorList);

		GradeService gradeService = new GradeServiceImpl();
		List<Grade> gradeList = gradeService.findAll();
		// 3跳转相应的页面
		ClazzService classService = new ClazzServiceImpl();
		List<Clazz> classList = classService.showAll();
		request.setAttribute("classList", classList);

		request.setAttribute("gradeList", gradeList);

		// 3接续跳到查看所有的页面上
		request.getRequestDispatcher("/jsp/class.jsp").forward(request,
				response);

	}

	// 删除班级信息
	public void delectClass(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 接受要删除的专业编号
		String classId = request.getParameter("classId");
		// 调用业务层完成删除操作
		ClazzService classService = new ClazzServiceImpl();
		classService.delete(classId);
		// 页面跳转
		request.getRequestDispatcher("/servlet/MajorServlet?method=showClass1")
				.forward(request, response);
	}

	// 展示班级信息
	public void showClass1(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ClazzService classService = new ClazzServiceImpl();
		List<Clazz> classList = classService.showAll();
		request.setAttribute("classList", classList);

		// 3接续跳到查看所有的页面上
		request.getRequestDispatcher("/jsp/class.jsp").forward(request,
				response);

	}

}
