package com.bjsxt.school.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.school.entity.Course;
import com.bjsxt.school.entity.Score;
import com.bjsxt.school.service.CourseService;
import com.bjsxt.school.service.impl.CourseServiceImpl;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class CourseServlet extends BaseServlet {
	/**
	 * 
	 * 查询所有的课程
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */

	public void selectAllCourse(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		CourseService courseService = new CourseServiceImpl();

		List<Course> course = courseService.selectAll();
		request.setAttribute("course", course);

		request.getRequestDispatcher("/teacher/teacherArrangeCourse.jsp")
				.forward(request, response);
	}

	/**
	 * 成绩录入
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接收数据
		String sno = request.getParameter("sno");
		String sname = request.getParameter("sname");
		String examType = request.getParameter("examType");
		Date examDate = Date.valueOf(request.getParameter("examDate"));
		String operator = request.getParameter("operator");
		String courseno = request.getParameter("courseno");
		int score = Integer.parseInt(request.getParameter("score"));

		// 调用业务层
		Score score2 = new Score(sname, sno, courseno, score, examType,
				examDate, operator);
		CourseService courseService = new CourseServiceImpl();
		int n = courseService.save(score2);
		if (n > 0) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('录入成功！');"
					+ "location.href='/school/score/scoreList.jsp';</script>");
		} else {
			request.setAttribute("error", "成绩录入失败");
			request.getRequestDispatcher("/score/scoreRegister.jsp").forward(
					request, response);
		}
	}

	/**
	 * 显示每科成绩
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String select = request.getParameter("select");
		// String text1 = request.getParameter("text1");
		String text = new String(
				(request.getParameter("text1")).getBytes("iso-8859-1"), "utf-8");
		// 调用业务层
		CourseService courseService = new CourseServiceImpl();
		List<Score> scoreList = courseService.showAll(select, text);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String jsonList = gson.toJson(scoreList);
		out.println(jsonList);
		out.flush();
		out.close();
	}

}
