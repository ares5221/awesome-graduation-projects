package com.bjsxt.school.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.school.entity.Clazz;
import com.bjsxt.school.entity.Score;
import com.bjsxt.school.service.ClazzService;
import com.bjsxt.school.service.CourseService;
import com.bjsxt.school.service.impl.ClazzServiceImpl;
import com.bjsxt.school.service.impl.CourseServiceImpl;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class ClazzServlet extends BaseServlet {

	/**
	 * 查询所有班级
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void findAllClazz(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ClazzService clazzService = new ClazzServiceImpl();
		List<Clazz> claList = clazzService.findAll();
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String jsonStr = gson.toJson(claList);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println(jsonStr);
		out.flush();
		out.close();
	}
	
	/**
	 * 根据班级id查询专业名称
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void findMajorByClazzId(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String classId = request.getParameter("classId");
		ClazzService clazzService = new ClazzServiceImpl();
		String majorName  = clazzService.findMajorByClazzId(classId);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String jsonStr = gson.toJson(majorName);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println(jsonStr);
		out.flush();
		out.close();
	}
	
	
}
