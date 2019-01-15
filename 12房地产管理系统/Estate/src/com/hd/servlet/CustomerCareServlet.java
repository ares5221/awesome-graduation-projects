/**
 * @author Administrator
 * @date 2017年8月15日
 */
package com.hd.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.hd.entity.Customer;
import com.hd.entity.CustomerCare;
import com.hd.service.CustomerCareService;
import com.hd.service.CustomerService;
import com.hd.service.impl.CustomerCareServiceImpl;
import com.hd.service.impl.CustomerServiceImpl;
import com.hd.util.PageBean;

/**
 * @author Administrator
 *
 */
public class CustomerCareServlet extends BaseServlet {

	CustomerCareService ccs = new CustomerCareServiceImpl();
	public void find(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		int index = 1;
		int size = 5;//默认每页显示五条数据
		String selectcondition = "";
		String queryType = "";
		
		try{
			index = Integer.parseInt(request.getParameter("index"));
		}catch(NumberFormatException e){
			
			e.printStackTrace();
		}
		
		String customerName = request.getParameter("customerName");
		if(customerName!=null){
			selectcondition = customerName;
			queryType = "customerName";
		}
		
		if(customerName==null){
			customerName = "";
		}
		String careTheme = request.getParameter("careTheme");
		
		if(careTheme!=null){
			selectcondition = careTheme;
			queryType = "careTheme";
		}
		
		if(careTheme ==null){
			careTheme = "";
		}
		String careWay = request.getParameter("careWay");
		
		if(careWay!=null){
			selectcondition = careWay;
			queryType = "careWay";
		}
		
		
		if(careWay==null){
			careWay="";
		}
		
		
		
		PageBean<CustomerCare> pageBean = new PageBean<CustomerCare>();
		pageBean.setIndex(index);
		pageBean.setSize(size);
		
		ccs.find(pageBean,customerName,careTheme,careWay);
		request.setAttribute("pageBean", pageBean);
		//记住查询条件
		request.setAttribute("selectcondition", selectcondition);
		request.setAttribute("queryType", queryType);
		request.getRequestDispatcher("/view/customer/customer_care_list.jsp").forward(request, response);
	}

	public void findAllCustomer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		CustomerService customerService = new CustomerServiceImpl();
		List<Customer> customerList=customerService.findAll();
		response.setContentType("text/html;charset=utf-8");
		//通过gson将数据转换为字符串
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String jsonStr = gson.toJson(customerList);
		try {
			PrintWriter out = response.getWriter();
			out.println(jsonStr);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//添加客户关怀的方法
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		int customerId = Integer.parseInt(request.getParameter("customerId"));
		
		
		
		String careTheme = request.getParameter("careTheme");
		String careWay = request.getParameter("careWay");
		Date careTime =Date.valueOf(request.getParameter("careTime"));
		String careRemark = request.getParameter("careRemark");
		//下次关怀时间由系统自动生成
		Date careNexttime = null;
		String carePeople = request.getParameter("carePeople");
		//使用默认值
		String isUsed = null;
		CustomerCare cc = new CustomerCare(customerId, careTheme, careWay, careTime, 
				careRemark, careNexttime, carePeople, isUsed);
		int n = ccs.add(cc);
		if(n>0){
			//添加成功
		
				request.setAttribute("success", "添加成功");
				request.getRequestDispatcher("/view/customer/customer_care_add.jsp").forward(request, response);
			
		}else{
			//添加失败
			request.setAttribute("error", "添加失败");
			request.getRequestDispatcher("/view/customer/customer_care_add.jsp").forward(request, response);
		}
	}
	
	//按照id查找客户
	public void findById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		int care_id = Integer.parseInt(request.getParameter("care_id"));
		System.out.println(care_id);
		CustomerCare cc =  ccs.findById(care_id);
		
		response.setContentType("text/html;charset=utf-8");
		
		//使用gson
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String jsonStr = gson.toJson(cc);
		PrintWriter out = response.getWriter();
		out.println(jsonStr);
		
		out.close();
		
	}

	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		response.setContentType("text/html;charset=utf-8");
		int careId = Integer.parseInt(request.getParameter("careId"));
		
		int customerId = Integer.parseInt(request.getParameter("customerId"));
		
		String careTheme = request.getParameter("careTheme");
		String careWay = request.getParameter("careWay");
		Date careTime =null;
		String careRemark = request.getParameter("careRemark");
		//下次关怀时间由系统自动生成
		Date careNexttime = null;
		String carePeople = request.getParameter("carePeople");
		//使用默认值
		String isUsed = null;
		CustomerCare cc = new CustomerCare(careId,customerId, careTheme, careWay, careTime, 
				careRemark, careNexttime, carePeople, isUsed);
		int n = ccs.update(cc);
		if(n>0){
			
		
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('更新成功');window.location.href='/Estate/servlet/CustomerCareServlet?method=find';</script>");
			
		}else{
			//更新失败
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('更新失败');window.location.href='/Estate/servlet/CustomerCareServlet?method=find';</script>");
		}
		
	}
	
	//删除客户关怀
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		response.setContentType("text/html;charset=utf-8");
		int careId = Integer.parseInt(request.getParameter("careId"));
		int n = ccs.delete(careId);
		if(n>0){
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('删除成功');window.location.href='/Estate/servlet/CustomerCareServlet?method=find';</script>");
			
		}else{
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('删除失败');window.location.href='/Estate/servlet/CustomerCareServlet?method=find';</script>");
			
		}
	}
	
	
}
