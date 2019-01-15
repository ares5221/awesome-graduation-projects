package com.bjsxt.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.entity.Library;
import com.bjsxt.service.LibraryService;
import com.bjsxt.service.impl.LibraryServiceImpl;

public class LibraryServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//判断业务类型
		String method = req.getMethod().toLowerCase();
		String operation = req.getParameter("operation");
		if(method.equals("get")&&operation.equals("findLibrary")){
			findLibrary(req,resp);
		}else if(method.equals("post")&&operation.equals("modifyLibrary")){
			
			modifyLibrary(req,resp);
		}		
		
	}

	private void modifyLibrary(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int lid=Integer.parseInt(req.getParameter("lid"));
		String name=req.getParameter("libraryname");
		String liber=req.getParameter("curator");
		String tel=req.getParameter("tel");
		String addr=req.getParameter("address");
		String email=req.getParameter("email");
		String url=req.getParameter("url");
		String date=req.getParameter("createDate");
		String intro=req.getParameter("introduce");
		Library library=new Library(lid,name, liber, tel, addr, email, url,java.sql.Date.valueOf(date),intro);
		LibraryService liberSer=new LibraryServiceImpl();
		int n1= liberSer.modifyLibrary(library);
		if(n1>0){
			findLibrary(req,resp);
		}else{
			System.out.println("LibraryServlet.modifyLibrary(更新失败)");
		}
	}

	private void findLibrary(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LibraryService liber=new LibraryServiceImpl();
		Library library = liber.findLibrary();
		if(library!=null){
			req.setAttribute("library", library);
			req.getRequestDispatcher("/ManagerPurview/library_modify.jsp").forward(req, resp);
		}else{
			System.out.println("没有查询到数据");	
				resp.getWriter().print("没有查询到数据");
		}
	}
}
