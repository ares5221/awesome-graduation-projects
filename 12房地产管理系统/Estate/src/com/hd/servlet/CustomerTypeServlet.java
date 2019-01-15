/**
 * @author Administrator
 * @date 2017年8月16日
 */
package com.hd.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hd.entity.CustomerType;
import com.hd.service.CustomerTypeService;
import com.hd.service.impl.CustomerTypeServiceImpl;
import com.hd.util.PageBean;

/**
 * @author Administrator
 *
 */
public class CustomerTypeServlet extends BaseServlet {

	CustomerTypeService cts = new CustomerTypeServiceImpl();
	public void find(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取查询的信息
		
		int index = 1;
		int size = 5;
		try{
			index = Integer.parseInt(request.getParameter("index"));
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
		
		String typeName = request.getParameter("typeName");
		if(typeName==null){
			
			typeName = "";
		}
		
		
		PageBean<CustomerType> pageBean = new PageBean<CustomerType>();
		pageBean.setIndex(index);
		pageBean.setSize(size);
		
		cts.find(pageBean,typeName);
		request.removeAttribute("pageBean");
		request.setAttribute("pageBean", pageBean);
		//记住查询条件
		request.setAttribute("typeName", typeName);
		
		request.getRequestDispatcher("/view/customer/customer_type_list.jsp").forward(request, response);
		
		
	}

	
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String typeName = request.getParameter("typeName");
		int n = cts.add(typeName);
		if(n>0){
			//添加成功
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('添加成功');window.location.href='/Estate/servlet/CustomerTypeServlet?method=find';</script>");
		}else{
			//添加失败
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('添加失败');window.location.href='/Estate/servlet/CustomerTypeServlet?method=find';</script>");
		}
	}
	
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		int typeId = Integer.parseInt(request.getParameter("typeId"));
		int n = cts.delete(typeId);
		if(n>0){
			//添加成功
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('删除成功');window.location.href='/Estate/servlet/CustomerTypeServlet?method=find';</script>");
		}else{
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('删除失败');window.location.href='/Estate/servlet/CustomerTypeServlet?method=find';</script>");
			
		}
	}

}
