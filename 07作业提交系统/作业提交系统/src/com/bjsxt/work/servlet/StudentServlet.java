package com.bjsxt.work.servlet;

import java.awt.Desktop;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.bjsxt.work.entity.Clazz;
import com.bjsxt.work.entity.Group;
import com.bjsxt.work.entity.Record;
import com.bjsxt.work.entity.Student;
import com.bjsxt.work.entity.Work;
import com.bjsxt.work.service.StudentService;
import com.bjsxt.work.service.impl.StudentServiceImpl;
import com.bjsxt.work.util.UploadUtil;

public class StudentServlet extends BaseServlet {
	
	private static final long serialVersionUID = -867868576197518022L;
	
	private StudentService studentService = new StudentServiceImpl();
	
	// 到达登录页面
	public void toLoginPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Clazz> lclazz = studentService.findAllClazz();
		List<Group> lgroup = studentService.findALLGroup();
		
		request.setAttribute("lclazz", lclazz);
		request.setAttribute("lgroup", lgroup);
		
		request.getRequestDispatcher("/student/index.jsp").forward(request, response);
	}
	
	// 登录
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int clazz = Integer.parseInt(request.getParameter("selClazz"));
		int group = Integer.parseInt(request.getParameter("selGroup"));
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		Student user = new Student(userName, password);
		user.setClazz(new Clazz(clazz));
		user.setGroup(new Group(group));
		// 通过班级小组和学生信息进行查询  返回值是student为了得到sid值
		Student student = studentService.findStuByCGAccount(user);
		
		if (student != null) {
			// 如果存在此学生就存在session中
			request.getSession().setAttribute("user", student);
			response.sendRedirect(request.getContextPath() + "/student/main.jsp");
		} else {
			// 否则转发至登录页面
			request.setAttribute("user", user);
			request.setAttribute("error", "<font color='red'>用户名或密码错误！</font>");
			request.getRequestDispatcher("/servlet/StudentServlet?method=toLoginPage").forward(request, response);
		}
	}
	
	// 退出登录
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 销毁session
		request.getSession().invalidate();
		response.sendRedirect(request.getContextPath() /*+ "/index.jsp"*/);
	}
	
	// 到修改页面
	public void toRepasswordPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/student/repass.jsp").forward(request, response);
	}
	
	// 到修改页面
	public void rePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1 接收参数
		String mpass = request.getParameter("mpass");			// 原始密码
		String newpass = request.getParameter("newpass");		// 新密码1
		String renewpass = request.getParameter("renewpass");	// 新密码2
		// 2从session中获取当前用户 并判断用户输入的原始密码和数据中是否一致
		Student student = (Student) request.getSession().getAttribute("user");
		
		if (student.getPassword().equals(mpass)) {
			if (newpass != null && renewpass!= null && newpass.equals(renewpass)) {
				student.setPassword(newpass);
				boolean update = studentService.update(student);
				if (update) {
					// 销毁session
					request.getSession().invalidate();
					// 打开新标签页
					URI uri = null;
					try {
						uri = new URI("http://localhost:8080" + request.getContextPath() + "/index.jsp");
					} catch (URISyntaxException e) {
						e.printStackTrace();
					}
					Desktop.getDesktop().browse(uri);
				} else {
					request.setAttribute("error", "<font color='red'>更新失败！</font>");
					request.getRequestDispatcher("/servlet/StudentServlet?method=toRepasswordPage").forward(request, response);
				}
			} else {
				request.setAttribute("error", "<font color='red'>两次输入新密码不一致！</font>");
				request.getRequestDispatcher("/servlet/StudentServlet?method=toRepasswordPage").forward(request, response);
			}
		} else {
			request.setAttribute("error", "<font color='red'>原始密码输入错误！</font>");
			request.getRequestDispatcher("/servlet/StudentServlet?method=toRepasswordPage").forward(request, response);
		}
	}
	
	// 到上传作业页面
	public void toUploadPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获得所有已发布作业
		List<Work> lwork = studentService.findAllWorkType();
		// 获得当前学生所有已提交作业
		Student user = (Student) request.getSession().getAttribute("user");
		List<Record> lrecord = studentService.findRecordsBySid(user.getSid());
		
		List<Clazz> lclazz = studentService.findAllClazz();
		request.setAttribute("lwork", lwork);
		request.setAttribute("lrecord", lrecord);
		request.setAttribute("lclazz", lclazz);
		
		request.getRequestDispatcher("/student/uploadWork.jsp").forward(request, response);
	}

	// 上传文件
	public void uploadFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//上传情况
		String flag = writeFile(request, response);
		
		// 如果上传成功
		if (flag.equals("success")) {
			request.setAttribute("flag", "<font color='red'>上传成功!</font>");
			request.getRequestDispatcher("/servlet/StudentServlet?method=toUploadPage").forward(request, response);
		} else if (flag.equals("FileSuffix")) {
			request.setAttribute("flag", "<font color='red'>上传文件格式只能是：" + UploadUtil.getSuffixs() + "</font>");
			request.getRequestDispatcher("/servlet/StudentServlet?method=toUploadPage").forward(request, response);
		} else {
			request.setAttribute("flag", "<font color='red'>上传失败!</font>");
	    	request.getRequestDispatcher("/servlet/StudentServlet?method=toUploadPage").forward(request, response);
		}
	}
	
	// 上传文件辅助方法
	@SuppressWarnings("all")
	private String writeFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 得到文件上传对象
		ServletFileUpload upload = UploadUtil.getUpload();
		// 得到FileItem   设置单个文件大小为10M 
		List<FileItem> itemList = UploadUtil.getFileItemList(upload, request, null, null, null);
		boolean flag = false;
		// 默认作业编号
		int hid = -1;
		// 提交作业的名字
		String fileName = null;
		
		//4.程序员不使用之前的获取表单数据的方式处理，而是从FileItem中获取表单数据
		for(int i=0;i<itemList.size();i++){
			//得到第i个FileItem，其中存放的是对应表单项的内容
			FileItem item = itemList.get(i);
			String fieldName = item.getFieldName();
			//取出表单项的内容
			if(item.isFormField()){
				if ("hid".equalsIgnoreCase(fieldName)) {
					hid = Integer.parseInt(item.getString());
				}
			}else{
				if("work".equals(fieldName)){
					// 得到文件名
					fileName = item.getName();
					// 如果不存在此压缩文件的后缀
					if(UploadUtil.getFileSuffix(item) == null){
						return "FileSuffix";
					}
					
					String realPath = this.getServletContext().getRealPath("/upload");
					// 上传文件
					flag = UploadUtil.uploadFile(request, response, item, realPath);
				}
			}
		}

		// 获得当前登录的学生
		Student student = (Student) request.getSession().getAttribute("user");
		// 执行向数据中添加记录的操作
		boolean addRecord =  studentService.update(student.getSid(), hid, new Date(), fileName);
		// 如果上传文件和添加记录都成功则成功
		return (flag == true  && addRecord == true) ? "success" : "fail" ;
	}
	
	// 下载作业
	public void download(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int rid = Integer.parseInt(request.getParameter("rid"));
		int hid = Integer.parseInt(request.getParameter("hid"));
		String realPath = this.getServletContext().getRealPath("/upload");
		// 通过记录的id和作业的id查询作业提交记录
		String filename = studentService.findRecordByRIDWID(rid, hid);
		
		UploadUtil.download(request, response, realPath, filename, null);
	}
	
	/*// ajax请求所有班级
	public void findAllClazz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().print(new Gson().toJson(lclazz));
	}*/

}
