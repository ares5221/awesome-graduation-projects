package com.bjsxt.school.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.school.entity.Clazz;
import com.bjsxt.school.entity.Student;
import com.bjsxt.school.service.ClazzService;
import com.bjsxt.school.service.StudentService;
import com.bjsxt.school.service.impl.ClazzServiceImpl;
import com.bjsxt.school.service.impl.StudentServiceImpl;
import com.bjsxt.school.util.PageBean;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class StudentServlet extends BaseServlet {
	/**
	 * 根据学生ID删除已进行入学登记的信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void deleteCheckedIn(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sid = request.getParameter("sid");
		StudentService stuService = new StudentServiceImpl();
		boolean flag = stuService.deleteCheckedIn(sid);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		if (flag) {
			out.println("alert('删除成功！');");
		} else {
			out.println("alert('删除失败！');");
		}
		out.println("location.href = 'StudentServlet?method=showCheckedIn';");
		out.println("</script>");
	}
	/**
	 * 根据学生ID查询学生是否已进行入学登记
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void findCheckedById(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String sid = request.getParameter("sid");
		StudentService stuService = new StudentServiceImpl();
		Student student = stuService.findCheckedById(sid);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String jsonStr = gson.toJson(student);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println(jsonStr);
		out.flush();
		out.close();
	}
	/**
	 * 查询学生入学信息，包含条件查询
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showCheckedIn(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接受分页需要的数据
		String sindex = request.getParameter("index");
		int index = 1;
		if (sindex != null && !"".equals(sindex)) {
			index = Integer.parseInt(sindex);
		}
		String ssize = request.getParameter("size");
		int size = 5;
		if (ssize != null && !"".equals(ssize)) {
			size = Integer.parseInt(ssize);
		}

		// 获取查询条件
		//接受姓名
		String sname = request.getParameter("sname");
		if (sname == null) {
			sname = "";
		}
		
		//接受运算符
		String soper = request.getParameter("oper");
		int oper = 0;
		if (soper != null && !"".equals(soper)) {
			oper = Integer.parseInt(soper);
		}
		//接受分数 
		String senterScore = request.getParameter("enterScore");
		double enterScore = 0;
		if(senterScore != null && !"".equals(senterScore)){
			enterScore = Double.parseDouble(senterScore);
		}
		
		// 将分页的数据封装到PageBean中，查询出来的数据也封装到PageBean中
		PageBean<Student> pageBean = new PageBean<Student>();
		pageBean.setIndex(index);
		pageBean.setSize(size);

		StudentService stuService = new StudentServiceImpl();
		stuService.showCheckedIn(pageBean, sname, oper, enterScore);

		ClazzService clazzService = new ClazzServiceImpl();
		List<Clazz> claList = clazzService.findAll();
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("sname", sname);
		request.setAttribute("oper", oper);
		request.setAttribute("enterScore", senterScore);
		request.setAttribute("claList", claList);

		request.getRequestDispatcher("/file/checkedStudentList.jsp").forward(request,
				response);
	}
	/**
	 * 添加学生
	 * 
	 * @param stu
	 * @return
	 */
	public void checkIn(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String sid = request.getParameter("sid");
		String sname = request.getParameter("sname");
		String classId = request.getParameter("classId");
		String majorName = request.getParameter("majorName");
		Double enterScore = Double.parseDouble(request
				.getParameter("enterScore"));
		String operator = request.getParameter("operator");
		Date checkDate = Date.valueOf(request.getParameter("checkDate"));

		Student student = new Student(sid, sname, classId, checkDate,
				enterScore, majorName, operator);
		StudentService stuService = new StudentServiceImpl();
		boolean flag = stuService.saveCheckIn(student);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		if (flag) {
			out.println("alert('添加成功！');");
			out.println("location.href = 'StudentServlet?method=showCheckedIn';");
		} else {
			out.println("alert('添加失败！');");
			out.println("location.href = school/file/studentRegister.jsp';");
		}
		out.println("</script>");
	}

	/**
	 * 根据id的查询学生
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void findById(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String sid = request.getParameter("sid");
		StudentService stuService = new StudentServiceImpl();
		Student student = stuService.findById(sid);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String jsonStr = gson.toJson(student);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println(jsonStr);
		out.flush();
		out.close();
	}

	/**
	 * 更新学生前根据id的查询操作
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void toUpdate(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String sid = request.getParameter("sid");
		StudentService stuService = new StudentServiceImpl();
		Student student = stuService.findById(sid);

		request.setAttribute("student", student);
		request.getRequestDispatcher("/file/studentUpdate.jsp").forward(
				request, response);
	}

	/**
	 * 更新操作
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sid = request.getParameter("sid");
		String sname = request.getParameter("sname");
		String sex = request.getParameter("sex");
		String idCard = request.getParameter("idCard");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String politics = request.getParameter("politics");
		String health = request.getParameter("health");
		int age = Integer.parseInt(request.getParameter("age"));
		Date birth = Date.valueOf(request.getParameter("birth"));

		Student student = new Student(sid, sname, sex, age, idCard, birth,
				address, phone, politics, health);
		StudentService stuService = new StudentServiceImpl();
		boolean flag = stuService.update(student);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		if (flag) {
			out.println("alert('更新成功！');");
			out.println("location.href = 'StudentServlet?method=show';");
		} else {
			out.println("alert('更新失败！');");
			out.println("location.href = 'StudentServlet?method=toUpdate&sid='"
					+ sid + ";");
		}
		out.println("</script>");
	}

	/**
	 * 根据id删除学生信息
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sid = request.getParameter("sid");
		StudentService stuService = new StudentServiceImpl();
		boolean flag = stuService.delete(sid);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		if (flag) {
			out.println("alert('删除成功！');");
		} else {
			out.println("alert('删除失败,需先删除该生的入学登记信息！');");
		}
		out.println("location.href = 'StudentServlet?method=show';");
		out.println("</script>");
	}

	/**
	 * 查询学生基本信息，包含条件查询
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接受分页需要的数据
		String sindex = request.getParameter("index");
		int index = 1;
		if (sindex != null && !"".equals(sindex)) {
			index = Integer.parseInt(sindex);
		}
		String ssize = request.getParameter("size");
		int size = 5;
		if (ssize != null && !"".equals(ssize)) {
			size = Integer.parseInt(ssize);
		}

		// 获取查询条件
		String sname = request.getParameter("sname");
		if (sname == null) {
			sname = "";
		}
		String sid = request.getParameter("sid");
		if (sid == null) {
			sid = "";
		}

		// 将分页的数据封装到PageBean中，查询出来的数据也封装到PageBean中
		PageBean<Student> pageBean = new PageBean<Student>();
		pageBean.setIndex(index);
		pageBean.setSize(size);

		StudentService stuService = new StudentServiceImpl();
		stuService.show(pageBean, sname, sid);

		request.setAttribute("pageBean", pageBean);
		request.setAttribute("sname", sname);
		request.setAttribute("sid", sid);

		request.getRequestDispatcher("/file/studentList.jsp").forward(request,
				response);
	}

	/**
	 * 添加学生
	 * 
	 * @param stu
	 * @return
	 */
	public void register(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String sid = request.getParameter("sid");
		String sname = request.getParameter("sname");
		String sex = request.getParameter("sex");
		String idCard = request.getParameter("idCard");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String politics = request.getParameter("politics");
		String health = request.getParameter("health");
		int age = Integer.parseInt(request.getParameter("age"));
		Date birth = Date.valueOf(request.getParameter("birth"));

		StudentService stuService = new StudentServiceImpl();
		Student stu = stuService.findById(sid);
		if (stu != null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('已有该id的学生存在！');");
			out.println("location.href = '/file/studentInfo.jsp';");
			return;
		}

		Student student = new Student(sid, sname, sex, age, idCard, birth,
				address, phone, politics, health);

		boolean flag = stuService.save(student);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		if (flag) {
			out.println("alert('添加成功！');");
			out.println("location.href = 'StudentServlet?method=show';");
		} else {
			out.println("alert('添加失败！');");
			out.println("location.href = '/school/file/studentInfo.jsp';");
		}
		out.println("</script>");
	}

}
