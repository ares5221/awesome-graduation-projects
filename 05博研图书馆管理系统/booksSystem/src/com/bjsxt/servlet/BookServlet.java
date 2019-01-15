package com.bjsxt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.service.BookService;
import com.bjsxt.service.impl.BookServiceImpl;
import com.bjsxt.util.SxtPageUtil;


public class BookServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//获取参数
		String page = req.getParameter("page");  //当前页码
		String size = req.getParameter("size");  //每页显示记录数
		BookService bs = new BookServiceImpl();
		int total = bs.getBookNumSer();
		SxtPageUtil<List> p = new SxtPageUtil<>(page, size, total);
		p.setList(bs.getRankListSer(p));
		
		//设置到作用域 请求转发
		req.setAttribute("p", p);
		//
		req.getRequestDispatcher("/main1.jsp").forward(req, resp);
		
	}
	
	
	
}
