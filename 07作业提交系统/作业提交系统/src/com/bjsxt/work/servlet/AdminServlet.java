package com.bjsxt.work.servlet;

import java.awt.Desktop;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.work.entity.Admin;
import com.bjsxt.work.entity.Clazz;
import com.bjsxt.work.entity.Group;
import com.bjsxt.work.entity.Record;
import com.bjsxt.work.entity.Student;
import com.bjsxt.work.entity.Work;
import com.bjsxt.work.service.AdminService;
import com.bjsxt.work.service.StudentService;
import com.bjsxt.work.service.impl.AdminServiceImpl;
import com.bjsxt.work.service.impl.StudentServiceImpl;
import com.bjsxt.work.util.MDUtil;
import com.google.gson.GsonBuilder;

public class AdminServlet extends BaseServlet {

	private static final long serialVersionUID = -4729992306251262292L;

	// 注入AdminService
	private AdminService adminService = new AdminServiceImpl();
	private StudentService studentSerice = new StudentServiceImpl();

	// 登录
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1 接收参数
		String aname = request.getParameter("user");
		String apassword = request.getParameter("password");
		// 2封装实体 参数2是获得md5值
		Admin admin = new Admin(aname, MDUtil.getMD("md5", apassword));
		// 3判断是否存在用户并进行操作
		boolean login = adminService.login(admin);

		if (login) {
			// 存入session
			request.getSession().setAttribute("user", admin);
			response.sendRedirect(request.getContextPath() + "/admin/main.jsp");
		} else {
			request.setAttribute("error", "<font color='red'>用户名或密码错误！</font>");
			request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
		}
	}

	// 退出登录
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 销毁session
		request.getSession().invalidate();
		response.sendRedirect(request.getContextPath() + "/admin/index.jsp");
	}

	// 到修改页面
	public void toRepasswordPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/admin/repass.jsp").forward(request, response);
	}

	// 修改密码
	public void rePasssword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1 接收参数
		String mpass = request.getParameter("mpass"); // 原始密码
		String newpass = request.getParameter("newpass"); // 新密码1
		String renewpass = request.getParameter("renewpass"); // 新密码2

		// 2从session中获取当前用户 并判断用户输入的原始密码和数据中是否一致
		Admin admin = (Admin) request.getSession().getAttribute("user");
		if (admin.getPassword().equals(MDUtil.getMD("md5", mpass))) {
			// 如果新密码不为空
			if (newpass != null && renewpass != null) {
				// 如果两个新密码一致
				if (newpass.equals(renewpass)) {
					// 更新密码
					admin.setPassword(MDUtil.getMD("md5", newpass));
					// 是否更新成功
					boolean flag = adminService.update(admin);
					// 更新成功重定向到登录页面
					if (flag) {
						// 销毁session
						request.getSession().invalidate();
						// 打开新标签页
						URI uri = null;
						try {
							uri = new URI("http://localhost:8080" + request.getContextPath() + "/admin/index.jsp");
						} catch (URISyntaxException e) {
							e.printStackTrace();
						}
						Desktop.getDesktop().browse(uri);
					} else {
						request.setAttribute("error", "<font color='red'>更新失败！</font>");
						request.getRequestDispatcher("/servlet/AdminServlet?method=toRepasswordPage").forward(request, response);
					}
				} else {
					request.setAttribute("error", "<font color='red'>两次输入新密码不一致！</font>");
					request.getRequestDispatcher("/servlet/AdminServlet?method=toRepasswordPage").forward(request, response);
				}
			} else {
				request.setAttribute("error", "<font color='red'>密码不能为空！</font>");
				request.getRequestDispatcher("/servlet/AdminServlet?method=toRepasswordPage").forward(request, response);
			}
		} else {
			request.setAttribute("error", "<font color='red'>原始密码输入错误！</font>");
			request.getRequestDispatcher("/servlet/AdminServlet?method=toRepasswordPage").forward(request, response);
		}
	}

	// 到达已提交作业列表 可以进行下载
	public void toCommitedWorkPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 查询已发布的作业
		List<Work> lwork = adminService.findAllWorkType();
		// 通过作业类型的id 和 班级的cid 进行查询
		List<Record> lrecord = adminService.findAllRecords();

		// 查询所有已提交作业学生
		List<Student> lstu = adminService.findAllCWStudent();

		request.setAttribute("lwork", lwork);
		request.setAttribute("lrecord", lrecord);
		request.setAttribute("lstu", lstu);

		request.getRequestDispatcher("/admin/commitedWork.jsp").forward(request, response);
	}

	// 到达学生信息列表页面
	public void toStudentInfoListPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 查询所有学生和班级还有小组
		List<Student> sList = studentSerice.findAllStudent();
		List<Clazz> cList = studentSerice.findAllClazz();
		List<Group> gList = studentSerice.findALLGroup();
		request.setAttribute("sList", sList);
		request.setAttribute("cList", cList);
		request.setAttribute("gList", gList);
		request.getRequestDispatcher("/admin/studentInfoList.jsp").forward(request, response);
	}

	// 发布作业
	public void publishWork(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1.接受表单信息
		String hname = request.getParameter("hname");
		String cont = request.getParameter("cont");
		Work work = new Work(hname, cont);

		int n = adminService.publish(work);
		// 3.根据结果跳到不同的页面
		if (n > 0) {
			response.sendRedirect(request.getContextPath() + "/admin/workList.jsp");
		} else {
			request.setAttribute("error", "发布作业失败");
			request.getRequestDispatcher("/admin/work.jsp").forward(request, response);
		}

	}

	
	// 查看作业列表 ajax 请求
	public void findAllWork(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 调用业务层获取所有已经发布的作业
		List<Work> lwork = adminService.showAllWork();
		response.getWriter().print(new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(lwork));
	}
	
	// 根据作业的hid删除已发布的作业
	public void deleteWorkByHid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int hid = Integer.parseInt(request.getParameter("hid"));
		int flag = adminService.deleteWorkByHid(hid);
		if (flag > 0) {
			response.sendRedirect(request.getContextPath() + "/admin/workList.jsp");
		} else {
			return;
			//request.getRequestDispatcher("/admin/workList.jsp").forward(request, response);
		}
	}
	

}
