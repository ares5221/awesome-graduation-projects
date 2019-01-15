package com.bjsxt.work.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.work.entity.Inform;
import com.bjsxt.work.service.impl.InformServiceImpl;

public class InformServlet extends BaseServlet {

	private static final long serialVersionUID = -7697651624922644964L;

	// 添加公告
	public void addInform(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//1.获取公告信息
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Inform inform = new Inform(title, content);
		
		//2.调用业务层完成发布
		InformServiceImpl informService = new InformServiceImpl();
		int n = informService.add(inform);
		//3.根据结果跳转不同页面
		if(n>0){
			response.sendRedirect("InformServlet?method=findInform");
		}else {
			request.setAttribute("error", "发布公告失败");
			request.getRequestDispatcher("/admin/error.html").forward(request, response);
		}
		
	}
	
	// 公告列表
	public void findInform(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//1.调用业务层
		InformServiceImpl informService = new InformServiceImpl();
		List<Inform> list = informService.findAll();
		request.setAttribute("list", list); 
		
		request.getRequestDispatcher("/admin/informList.jsp").forward(request, response);

   }
	
	// 查看公告
	public void findById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1获取公告编码
		int iid = Integer.parseInt(request.getParameter("iid"));
		String title = request.getParameter("title");
		//2.调用业务层完成操作
		InformServiceImpl informService = new InformServiceImpl();
		Inform inform = informService.findById(iid, title);
		//3.跳转页面
		request.setAttribute("inform", inform);
		request.getRequestDispatcher("/admin/checkInform.jsp").forward(request, response);
	}
	
	// 删除公告
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int iid = Integer.parseInt(request.getParameter("iid"));
		InformServiceImpl informService = new InformServiceImpl();
		informService.delete(iid);
		response.sendRedirect(request.getContextPath() + "servlet/InformServlet?method=findInform");
	}
	
} 