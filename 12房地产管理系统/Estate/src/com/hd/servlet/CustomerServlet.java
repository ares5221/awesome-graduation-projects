package com.hd.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hd.entity.Customer;
import com.hd.entity.CustomerCondition;
import com.hd.entity.CustomerSource;
import com.hd.entity.CustomerType;
import com.hd.entity.UserInfo;
import com.hd.service.CustomerService;
import com.hd.service.impl.CustomerConditionServiceImpl;
import com.hd.service.impl.CustomerServiceImpl;
import com.hd.service.impl.CustomerSourceServiceImpl;
import com.hd.service.impl.CustomerTypeServiceImpl;
import com.hd.service.impl.EmployeeServiceImpl;
import com.hd.util.PageBean;

public class CustomerServlet extends BaseServlet {
	/**
	 * 创建客户业务层操作对象
	 */
	CustomerService customerService = new CustomerServiceImpl();

	/**
	 * 显示所有客户信息
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	

	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取页面传递的客户id
		String customerId = request.getParameter("customer_id");
		// 解析为int格式
		int customer_id = 0;
		try {
			customer_id = Integer.parseInt(customerId);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		// 调用业务层完成删除操作
		if (customerService.delete(customer_id)) {
			// 删除成功
			response.sendRedirect("CustomerServlet?method=show");
		} else {
			// 删除失败,显示弹窗
			// 解决中文乱码
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('删除客户失败!!!')");
			out.println("location.href='CustomerServlet?method=show'");
			out.println("</script>");
		}
	}

	public void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int index = 1;
		// 默认每页显示五条数据
		int size = 5;

		try {
			index = Integer.parseInt(request.getParameter("index"));
		} catch (NumberFormatException e) {

			e.printStackTrace();
		}

		// 获取查询条件类型
		String queryType = request.getParameter("queryType");

		// 获取查询内容
		String customerInput = request.getParameter("customerInput");
		if (customerInput == null) {
			customerInput = "";
		}

		// 创建PageBean
		PageBean<Customer> pageBean = new PageBean<Customer>();
		pageBean.setIndex(index);
		pageBean.setSize(size);

		customerService.find(pageBean, queryType, customerInput);

		request.setAttribute("customerInput", customerInput);
		request.setAttribute("queryType", queryType);
		request.removeAttribute("pageBean");
		request.setAttribute("pageBean", pageBean);
		request.getRequestDispatcher("/view/customer/customer_list.jsp")
				.forward(request, response);

	}

	/*
	 * public void showById(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * 
	 * //接收要更新的顾客的编号 int customer_id =
	 * Integer.parseInt(request.getParameter("customer_id")); //调用业务层完成查询操作
	 * StudentService stuService = new StudentServiceImpl(); Student stu =
	 * stuService.findById(sno); //调用业务层获取所有的班级 ClazzService clazzService = new
	 * ClazzServiceImpl(); List<Clazz> clazzList = clazzService.findAll();
	 * 
	 * //页面跳转 request.setAttribute("clazzList", clazzList);
	 * 
	 * request.setAttribute("stu", stu);
	 * request.getRequestDispatcher("/student/studentUpdate.jsp"
	 * ).forward(request, response);
	 * 
	 * }
	 */
	/*
	 * public void update(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { //接收页面数据
	 * //request.setCharacterEncoding("utf-8"); int sno =
	 * Integer.parseInt(request.getParameter("sno")); String pwd =
	 * request.getParameter("pwd"); String sname =
	 * request.getParameter("sname"); String gender =
	 * request.getParameter("gender"); String phone =
	 * request.getParameter("phone"); Date birth =
	 * Date.valueOf(request.getParameter("birth")); int classNo =
	 * Integer.parseInt(request.getParameter("classNo"));//"1"--1 ""----??
	 * String remark = request.getParameter("remark");
	 * 
	 * //调用业务层完成注册操作 Student stu = new Student(sno, pwd, sname, gender, phone,
	 * birth, classNo, remark);
	 * 
	 * StudentService stuService = new StudentServiceImpl(); int n =
	 * stuService.update(stu); //页面跳转 if(n>0){
	 * //request.getRequestDispatcher("/files/success.html").forward(request,
	 * response); //!!! 弹出提示框并自动跳转
	 * response.setContentType("text/html;charset=utf-8"); PrintWriter out =
	 * response.getWriter();
	 * out.println("<script type='text/javascript'>alert('更新成功！');" +
	 * "location.href='StudentServlet?method=showAll';</script>"); }else{
	 * request.setAttribute("error", "学生更新失败");
	 * //request.getRequestDispatcher("/student/studentUpdate.jsp"
	 * ).forward(request, response); //!!!!注意跳转的位置：还要再按照sno查一次
	 * request.getRequestDispatcher
	 * ("/servlet/StudentServlet?method=showById&sno="+sno).forward(request,
	 * response); }
	 * 
	 * }
	 */

	/**
	 * 添加客户之前获取一些列表信息
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void toAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 获取客户来源列表
		List<CustomerSource> cusSouList = new CustomerSourceServiceImpl()
				.showAll();
		// 获取客户状态列表
		List<CustomerCondition> cusConList = new CustomerConditionServiceImpl()
				.showAll();
		// 获取客户类型列表
		List<CustomerType> cusTypeList = new CustomerTypeServiceImpl()
				.showAll();

		// 将各种列表信息传递到页面
		request.setAttribute("cusSouList", cusSouList);
		request.setAttribute("cusConList", cusConList);
		request.setAttribute("cusTypeList", cusTypeList);
		// 跳转到页面
		request.getRequestDispatcher("/view/customer/customer_add.jsp")
				.forward(request, response);

	}

	/**
	 * 添加客户到数据库
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取页面传递过来的数据
		int customerSource = Integer.parseInt(request
				.getParameter("customerSource"));
		int customerType = Integer.parseInt(request
				.getParameter("customerType"));
		int customerCondition = Integer.parseInt(request
				.getParameter("customerCondition"));
		String customerName = request.getParameter("customerName");
		String customerJob = request.getParameter("customerJob");
		String customerSex = request.getParameter("customerSex");
		String customerEmail = request.getParameter("customerEmail");
		Date customerBirthday = java.sql.Date.valueOf(request
				.getParameter("customerBirthday"));
		String customerMobile = request.getParameter("customerMobile");
		String customerQq = request.getParameter("customerQq");
		String customerAddress = request.getParameter("customerAddress");
		String customerChangeMan = request.getParameter("customerChangeMan");
		String customerAddMan = request.getParameter("customerAddMan");
		String customerBlog = request.getParameter("customerBlog");
		String customerTel = request.getParameter("customerTel");
		String customerMsn = request.getParameter("customerMsn");
		String customerCompany = request.getParameter("customerCompany");
		String customerRemark = request.getParameter("customerRemark");

		// 获取登录时存储的User对象
		// UserInfo user = (UserInfo) request.getSession().getAttribute("user");

		// 获取添加时间
		Date addTime = new Timestamp(System.currentTimeMillis());

		// 使用获取到的所有数据创建客户对象
		Customer customer = new Customer(customerCondition, customerSource,
				customerType, customerName, customerSex, customerMobile,
				customerQq, customerAddress, customerEmail, customerRemark,
				customerJob, customerBlog, customerTel, customerMsn,
				customerBirthday, addTime, customerAddMan, addTime,
				customerChangeMan, customerCompany);
		// 设置is_used属性
		customer.setIs_used("1");
		System.out.println(customer);
		// 解决中文乱码
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		if (customerService.add(customer)) {
			// 添加成功,跳转到查询所有的页面
			out.println("alert('添加客户信息成功!!!')");
			out.println("location.href='CustomerServlet?method=show'");
		} else {
			// 添加失败,
			// 解决中文乱码
			out.println("alert('添加客户信息失败!!!')");
			out.println("location.href='/view/customer/customer_add.jsp'");
		}
		out.println("</script>");

	}

	/**
	 * 根据页面传递的客户id展示指定客户的详情列表
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showDetails(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 获取页面传递的客户id
		String customerId = request.getParameter("customer_id");
		// 解析为int格式
		int customer_id = 0;
		try {
			customer_id = Integer.parseInt(customerId);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		// 调用业务层获取指定id的客户信息
		Customer customer = customerService.showById(customer_id);

		// 跳转到详情页面
		request.setAttribute("customer", customer);
		// 跳转到页面
		request.getRequestDispatcher("/view/customer/customer_detail.jsp")
				.forward(request, response);

	}

	/**
	 * 获取客户所有信息及相关列表以编辑客户
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showEditInfo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 获取页面传递的客户id
		String customerId = request.getParameter("customer_id");
		// 解析为int格式
		int customer_id = 0;
		try {
			customer_id = Integer.parseInt(customerId);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		// 调用业务层获取指定id的客户信息
		Customer customer = customerService.showById(customer_id);

		// 获取员工列表
		List<UserInfo> userList = new EmployeeServiceImpl().findAll();
		// 获取客户来源列表
		List<CustomerSource> cusSouList = new CustomerSourceServiceImpl()
				.showAll();
		// 获取客户状态列表
		List<CustomerCondition> cusConList = new CustomerConditionServiceImpl()
				.showAll();
		// 获取客户类型列表
		List<CustomerType> cusTypeList = new CustomerTypeServiceImpl()
				.showAll();

		// 将各种列表信息传递到页面
		request.setAttribute("userList", userList);
		request.setAttribute("cusSouList", cusSouList);
		request.setAttribute("cusConList", cusConList);
		request.setAttribute("cusTypeList", cusTypeList);

		// 设置客户数据
		request.setAttribute("customer", customer);
		// 跳转到页面
		request.getRequestDispatcher("/view/customer/customer_edit.jsp")
				.forward(request, response);

	}

	/**
	 * 展示所有需要分配的客户列表
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showDistributeList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 调用业务层获取还未分配员工的客户信息
		List<Customer> customerList = customerService.showDistributeList();
		if (customerList != null) {
			// 将客户信息传递到页面
			request.setAttribute("customerList", customerList);
			// 跳转到页面
			request.getRequestDispatcher(
					"/view/customer/customer_distribute_list.jsp").forward(
					request, response);
		} else {
			// 查询失败
		}
	}

	/**
	 * 更新客户信息
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @throws ParseException
	 */
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		// 获取页面传递的客户id
		String customerId = request.getParameter("customer_id");
		// 解析为int格式
		int customer_id = 0;
		try {
			customer_id = Integer.parseInt(customerId);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		int condition_id = Integer.parseInt(request
				.getParameter("condition_id"));
		int source_id = Integer.parseInt(request.getParameter("source_id"));
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int type_id = Integer.parseInt(request.getParameter("type_id"));
		String customer_sex = request.getParameter("customer_sex");
		String customer_mobile = request.getParameter("customer_mobile");
		String customer_qq = request.getParameter("customer_qq");
		String customer_email = request.getParameter("customer_email");
		String customer_job = request.getParameter("customer_job");
		String customer_company = request.getParameter("customer_company");
		String customer_remark = request.getParameter("customer_remark");
		Date customer_changetime = new Timestamp(System.currentTimeMillis());
		String customer_address = request.getParameter("customer_address");
		String customer_blog = request.getParameter("customer_blog");
		String customer_tel = request.getParameter("customer_tel");
		String customer_msn = request.getParameter("customer_msn");
		String change_man = request.getParameter("change_man");

		// 调用业务层完成注册操作
		Customer customer = new Customer(condition_id, source_id, user_id,
				type_id, customer_sex, customer_mobile, customer_qq,
				customer_address, customer_email, customer_remark,
				customer_job, customer_blog, customer_tel, customer_msn,
				customer_changetime, change_man, customer_company, customer_id);

		CustomerService customerService = new CustomerServiceImpl();

		// 解决中文乱码
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		if (customerService.update(customer)) {
			// 更新成功,跳转到查询所有的页面
			out.println("alert('编辑客户信息成功!!!')");
			out.println("location.href='CustomerServlet?method=show'");
		} else {
			// 更新失败,
			// 解决中文乱码
			out.println("alert('编辑客户信息失败!!!')");
			out.println("location.href='javascript:history.back(-1)'");
		}
		out.println("</script>");

	}
}