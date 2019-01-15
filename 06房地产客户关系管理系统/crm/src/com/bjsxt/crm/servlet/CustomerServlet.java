package com.bjsxt.crm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.crm.entity.Customer;
import com.bjsxt.crm.entity.User;
import com.bjsxt.crm.service.CustomerService;
import com.bjsxt.crm.service.UserService;
import com.bjsxt.crm.service.impl.CustomerServiceImpl;
import com.bjsxt.crm.service.impl.UserServiceImpl;
import com.bjsxt.crm.util.PageBean;



public class CustomerServlet extends BaseServlet {
	/**
	 * 客户来源
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	
	public void source(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//1.获取表单数据
		request.setCharacterEncoding("utf-8");//解决post表单中文乱码问题
		String Source_Name =request.getParameter("Source_Name");
		
		//2.调用业务层
		CustomerService customerService = new CustomerServiceImpl();
		List<Customer> sourceList = customerService.findSource(Source_Name);
		
		
		//3.跳转页面
		request.setAttribute("sourceList", sourceList);
		request.getRequestDispatcher("/view/customer/customer_source_list.jsp").forward(request, response);
	}

	/**
	 * 添加客户来源
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void addsource(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//1.获取表单数据
		request.setCharacterEncoding("utf-8");//解决post表单中文乱码问题
		String Source_Name =request.getParameter("Source_Name");
		
		//2.调用业务层
		CustomerService customerService = new CustomerServiceImpl();
		int n = customerService.addSource(Source_Name);
		
		
		//3.跳转页面
		if(n>0){
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('添加成功');"
					+ "window.location.href='CustomerServlet?method=source';</script>");
			out.flush();
			out.close();
		}else {
			request.setAttribute("error", "添加失败");
			request.getRequestDispatcher("/view/customer/customer_source_add.jsp").forward(request, response);
		}
	}
	/**
	 * 删除客户来源
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void updateSource(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//1.获取表单数据
		request.setCharacterEncoding("utf-8");//解决post表单中文乱码问题
		int source_id =Integer.parseInt(request.getParameter("source_id"));
		
		
		//2.调用业务层
		CustomerService customerService = new CustomerServiceImpl();
		customerService.updateSource(source_id);
		
		
		//3.跳转页面
		request.getRequestDispatcher("/servlet/CustomerServlet?method=source").forward(request, response);

	}
	/**
	 * 获取客户状态
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void condition(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//1.获取表单数据
		request.setCharacterEncoding("utf-8");//解决post表单中文乱码问题
		String condition_name =request.getParameter("condition_name");
		
		//2.调用业务层
		CustomerService customerService = new CustomerServiceImpl();
		List<Customer> conditionList = customerService.findCondition(condition_name);
		
		
		//3.跳转页面
		request.setAttribute("conditionList", conditionList);
		request.getRequestDispatcher("/view/customer/customer_state_list.jsp").forward(request, response);
	}
	/**
	 * 增加客户状态
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void addcondition(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//1.获取表单数据
		request.setCharacterEncoding("utf-8");//解决post表单中文乱码问题
		String condition_Name =request.getParameter("condition_Name");
		String condition_Explain =request.getParameter("condition_Explain");

		//2.调用业务层
		CustomerService customerService = new CustomerServiceImpl();
		int n = customerService.addCondition(condition_Name,condition_Explain);
		
		
		//3.跳转页面
		if(n>0){
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('添加成功');"
					+ "window.location.href='CustomerServlet?method=condition';</script>");
			out.flush();
			out.close();
		}else {
			request.setAttribute("error", "添加失败");
			request.getRequestDispatcher("/view/customer/customer_state_add.jsp").forward(request, response);
		}
	}
	
	public void updateCondition(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//1.获取表单数据
		request.setCharacterEncoding("utf-8");//解决post表单中文乱码问题
		int condition_id =Integer.parseInt(request.getParameter("condition_id"));
		
		
		//2.调用业务层
		CustomerService customerService = new CustomerServiceImpl();
		customerService.updateCondition(condition_id);
		
		
		//3.跳转页面
		request.getRequestDispatcher("/servlet/CustomerServlet?method=condition").forward(request, response);

	}
	/**
	 * 客户类型-查
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void customerType(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//1.获取表单数据
		request.setCharacterEncoding("utf-8");//解决post表单中文乱码问题
		String Type_Name =request.getParameter("Type_Name");
		
		//2.调用业务层
		CustomerService customerService = new CustomerServiceImpl();
		List<Customer> cutypeList = customerService.findcustType(Type_Name);
		
		
		//3.跳转页面
		request.setAttribute("cutypeList", cutypeList);
		request.getRequestDispatcher("/view/customer/customer_type_list.jsp").forward(request, response);
	}
	/**
	 * 添加客户类型
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void addCuType(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//1.获取表单数据
		request.setCharacterEncoding("utf-8");//解决post表单中文乱码问题
		String type_Name =request.getParameter("type_Name");

		//2.调用业务层
		CustomerService customerService = new CustomerServiceImpl();
		int n = customerService.addCuType(type_Name);
		
		
		//3.跳转页面
		if(n>0){
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('添加成功');"
					+ "window.location.href='CustomerServlet?method=customerType';</script>");
			out.flush();
			out.close();
		}else {
			request.setAttribute("error", "添加失败");
			request.getRequestDispatcher("/view/customer/customer_type_add.jsp").forward(request, response);
		}
	}
	
	public void updateCuType(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//1.获取表单数据
		request.setCharacterEncoding("utf-8");//解决post表单中文乱码问题
		int type_id =Integer.parseInt(request.getParameter("type_id"));
		
		
		//2.调用业务层
		CustomerService customerService = new CustomerServiceImpl();
		customerService.updateCuType(type_id);
		
		
		//3.跳转页面
		request.getRequestDispatcher("/servlet/CustomerServlet?method=customerType").forward(request, response);

	}
	/**
	 * 客户关怀
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void care(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获得想要指引的頁面index
		String sindex = request.getParameter("index");
		int index =1;
		//
		try {
			index = Integer.parseInt(sindex);
		} catch (Exception e) {
			
		}
		//获取每页想要展示的个数size
		String ssize = request.getParameter("size");
		int size =5;
		
		try {
			size = Integer.parseInt(ssize);
		} catch (Exception e) {
			
		}
		//1.获取表单数据
		request.setCharacterEncoding("utf-8");//解决post表单中文乱码问题
		// 获取查询信息
		int careQuery_Type=0;
		String careQuery_Type1=request.getParameter("careQuery_Type");
		if(careQuery_Type1!=null){
			
			careQuery_Type=Integer.parseInt(careQuery_Type1);
		}
		String customerInput = request.getParameter("customerInput");
		//修改pageBean参数
		PageBean<Customer> pageBean = new PageBean<Customer>();
		int totalPageCount=pageBean.getTotalPageCount();
		pageBean.setIndex(index);
		pageBean.setSize(size);
		
		//2.调用业务层
		CustomerService customerService = new CustomerServiceImpl();
		customerService.findCare(pageBean,careQuery_Type,customerInput);
		
		
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("careQuery_Type", careQuery_Type);
		request.setAttribute("customerInput", customerInput);
		
		//3.跳转页面
		//request.setAttribute("careList", careList);
		request.getRequestDispatcher("/view/customer/customer_care_list.jsp").forward(request, response);
	}
	/**
	 * 删除客户关怀
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void updateCare(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//1.获取表单数据
		request.setCharacterEncoding("utf-8");//解决post表单中文乱码问题
		int care_id =Integer.parseInt(request.getParameter("care_id"));
		//2.调用业务层
		CustomerService customerService = new CustomerServiceImpl();
		int n =customerService.updateCare(care_id);
		
		
		//3.跳转页面
		request.getRequestDispatcher("/servlet/CustomerServlet?method=care").forward(request, response);

	}
	/**
	 * 添加客户关怀的提前准备-查询客户、员工
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void toAddCare(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//1.获取表单数据
		
		//2.调用业务层
		CustomerService customerService = new CustomerServiceImpl();
		List<Customer> careCustList = customerService.findCustomer();
		
		UserService userService = new UserServiceImpl();
		List<User> userList1 = userService.showUser(null,null);
		
		//3.跳转页面
		request.setAttribute("careCustList", careCustList);
		request.setAttribute("userList1", userList1);
		request.getRequestDispatcher("/view/customer/customer_care_add.jsp").forward(request, response);

	}
	/**
	 * 添加客户关怀
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void addCare(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//1.获取表单数据
		request.setCharacterEncoding("utf-8");//解决post表单中文乱码问题customer_Id
		String care_theme =request.getParameter("care_theme");
		int customer_Id =Integer.parseInt(request.getParameter("customer_Id"));
		//java.sql.Date care_nexttime = java.sql.Date.valueOf(request.getParameter("care_nexttime"));
		//Date care_nexttime1 = new java.sql.Date(java.sql.Date.valueOf(care_nexttime);
		java.sql.Date care_nexttime=new java.sql.Date(new Date().getTime());
		String care_way =request.getParameter("care_way");
		
		String care_people =request.getParameter("care_people");
		String care_remark =request.getParameter("care_remark");

		//2.调用业务层
		CustomerService customerService = new CustomerServiceImpl();
		int n = customerService.addCare(customer_Id,care_theme,care_way,care_remark,care_nexttime,care_people);
		
		
		//3.跳转页面
		if(n>0){
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('添加成功');"
					+ "window.location.href='CustomerServlet?method=care';</script>");
			out.flush();
			out.close();
		}else {
			request.setAttribute("error", "添加失败");
			request.getRequestDispatcher("servlet/CustomerServlet?method=toAddCare").forward(request, response);
		}
	}
	
	public void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		//接收表单数据
		int queryType=0;
		String queryType2=request.getParameter("queryType");
		if(queryType2!=null){
			queryType=Integer.parseInt(queryType2);
		}
//		try{
//			queryType=Integer.parseInt(queryType2);
//		}catch(NumberFormatException e){
//			e.printStackTrace();
//		}
		
		String customerInput = request.getParameter("customerInput");
		if(customerInput == null){
			customerInput = "";
		}
		
		//调用业务层获取所有客户
		CustomerService customerService = new CustomerServiceImpl();
		List <Customer> cusList = customerService.findAll(queryType,customerInput);
		//跳转到客户显示页面customer_list1.jsp
		request.setAttribute("cusList", cusList);
		request.setAttribute("queryType", queryType);
		request.setAttribute("customerInput", customerInput);
		request.getRequestDispatcher("/view/customer/customer_list1.jsp").forward(request, response);		
		
	}
	
	/**
	 * 预添加客户
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void toAddCus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		        //调用业务层获取所有的
				CustomerService  customerService = new CustomerServiceImpl();
				List<Customer> customerList1 = customerService.findSource("");
				List<Customer> customerList2 = customerService.findcustType("");
				List<Customer> customerList3 = customerService.findCondition("");
				//页面跳转
				request.setAttribute("customerList1", customerList1);
				request.setAttribute("customerList2", customerList2);
				request.setAttribute("customerList3", customerList3);
				request.getRequestDispatcher("/view/customer/customer_add.jsp").forward(request, response);		
	}
	
	/**
	 * 添加客户
	 */
	public void addCus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//1.获取表单数据
		request.setCharacterEncoding("utf-8");//解决post表单中文乱码问题customer_Id
		/**
		 * public Customer(String customer_name,
						String customer_state2,
						int customer_emp, String customer_gender,
						String customer_tel, int customer_qq,
						String customer_mail, String customer_position,
						String customer_remark, String source_name,
						String type_name,
						String customer_company, Date customer_date,
						String customer_address, String customer_mtel,
						String customer_createPeople,
						String customer_revisePeople, String customer_blog,
						String customer_msn)
		 */
		String customer_name =request.getParameter("customer_name");
		String customer_state2 =request.getParameter("customer_state2");
		int customer_emp = 0;
		String customer_gender =request.getParameter("customer_gender");
		String customer_tel =request.getParameter("customer_tel");
		String customer_mail =request.getParameter("customer_mail");
		String customer_position =request.getParameter("customer_position");
		String customer_remark =request.getParameter("customer_remark");
		String source_name =request.getParameter("source_name");
		String type_name =request.getParameter("type_name");
		String customer_company =request.getParameter("customer_company");
		String customer_address =request.getParameter("customer_address");
		String customer_mtel =request.getParameter("customer_mtel");
		String customer_createPeople =request.getParameter("customer_createPeople");
		String customer_revisePeople =request.getParameter("customer_revisePeople");
		String customer_blog =request.getParameter("customer_blog");
		int customer_qq =Integer.parseInt(request.getParameter("customer_qq"));
		String customer_msn =request.getParameter("customer_msn");
		java.sql.Date customer_date=new java.sql.Date(new Date().getTime());
		Customer cus = new Customer(customer_name, customer_state2, customer_emp, customer_gender, customer_tel, customer_qq, customer_mail, customer_position, customer_remark, source_name, type_name, customer_company, customer_date, customer_address, customer_mtel, customer_createPeople, customer_revisePeople, customer_blog, customer_msn);
		//2.调用业务层
		CustomerService customerService = new CustomerServiceImpl();
		int n = customerService.addCus(cus);
		
		//3.跳转页面
		if(n>0){
			response.sendRedirect("CustomerServlet?method=show");
		}else {
			request.setAttribute("error", "添加失败");
			request.getRequestDispatcher("servlet/CustomerServlet?method=toAddCus").forward(request, response);
		}
	}
	
	/**
	 * 根据编号查询客户信息
	 */
	  public void showById1(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.获取客户编号
		int customer_ID = Integer.parseInt(request.getParameter("customer_ID"));
		//2.调用业务层完成修改操作
		CustomerService customerService = new CustomerServiceImpl();
		Customer cus = customerService.findById(customer_ID);
		List<Customer> customerList1 = customerService.findSource("");
		List<Customer> customerList2 = customerService.findcustType("");
		List<Customer> customerList3 = customerService.findCondition("");
		//3.跳转到修改客户页面
		request.setAttribute("customerList1", customerList1);//来源
		request.setAttribute("customerList2", customerList2);//类型
		request.setAttribute("customerList3", customerList3);//状态
		request.setAttribute("cus", cus);
		request.getRequestDispatcher("/view/customer/customer_edit.jsp").forward(request, response);
		
	}
	  
	  public void showById2(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			//1.获取客户编号
			int customer_ID = Integer.parseInt(request.getParameter("customer_ID"));
			//2.调用业务层完成修改操作
			CustomerService customerService = new CustomerServiceImpl();
			Customer cus = customerService.findById(customer_ID);
			//3.跳转到客户详情页面
			request.setAttribute("cus", cus);
			request.getRequestDispatcher("/view/customer/customer_detail.jsp").forward(request, response);
			
		}
	  
	  public void updateCus(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			//1.获取要更新的客户数据
			request.setCharacterEncoding("utf-8");
			int customer_ID = Integer.parseInt(request.getParameter("customer_ID"));
			String customer_name =request.getParameter("customer_name");
			String customer_state2 =request.getParameter("customer_state2");
			int customer_emp = Integer.parseInt(request.getParameter("customer_emp"));
			String customer_gender =request.getParameter("customer_gender");
			String customer_tel =request.getParameter("customer_tel");
			String customer_mail =request.getParameter("customer_mail");
			String customer_position =request.getParameter("customer_position");
			String customer_remark =request.getParameter("customer_remark");
			String source_name =request.getParameter("source_name");
			String type_name =request.getParameter("type_name");
			String customer_company =request.getParameter("customer_company");
			String customer_address =request.getParameter("customer_address");
			String customer_mtel =request.getParameter("customer_mtel");
			String customer_createPeople =request.getParameter("customer_createPeople");
			String customer_revisePeople =request.getParameter("customer_revisePeople");
			String customer_blog =request.getParameter("customer_blog");
			int customer_qq =Integer.parseInt(request.getParameter("customer_qq"));
			String customer_msn =request.getParameter("customer_msn");
			java.sql.Date customer_date=new java.sql.Date(new Date().getTime());
			Customer cus = new Customer(customer_ID,customer_name, customer_state2, customer_emp, customer_gender, customer_tel, customer_qq, customer_mail, customer_position, customer_remark, source_name, type_name, customer_company, customer_date, customer_address, customer_mtel, customer_createPeople, customer_revisePeople, customer_blog, customer_msn);
			
			//
			CustomerService customerService = new CustomerServiceImpl();
			int n = customerService.updateCus(cus);
			
			//
			if(n>0){			
				response.sendRedirect("CustomerServlet?method=show");
			}else{
				request.setAttribute("error", "更新失败");
				//!!!
				request.getRequestDispatcher("/servlet/CustomerServlet?method=showById1&customer_ID="+customer_ID).forward(request,response);
			}
		}

	  public void delCus(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			//1.获取客户编号
			int customer_ID = Integer.parseInt(request.getParameter("customer_ID"));
			//2.调用业务层完成修改操作
			CustomerService customerService = new CustomerServiceImpl();
			customerService.delCus(customer_ID);
			//3.跳转到客户列表页面
			request.getRequestDispatcher("/servlet/CustomerServlet?method=show").forward(request, response);
			
		}
	  
	  public void showDistribute(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			
			request.setCharacterEncoding("utf-8");
			//接收表单数据
			int queryType=0;
			
			
			String customerInput = "";
			
			
			//调用业务层获取所有客户
			CustomerService customerService = new CustomerServiceImpl();
			List <Customer> cusList = customerService.findAll(queryType,customerInput);
			//跳转到客户显示页面customer_list1.jsp
			request.setAttribute("cusList", cusList);
			request.setAttribute("queryType", queryType);
			request.setAttribute("customerInput", customerInput);
			request.getRequestDispatcher("/view/customer/customer_distribute_list.jsp").forward(request, response);		
			
		}
	
	
	
}

