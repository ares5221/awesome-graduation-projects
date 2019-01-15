package com.hd.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hd.entity.NoticeInfo;
import com.hd.service.NoticeService;
import com.hd.service.impl.NoticeServiceImpl;
import com.hd.util.PageBean;

public class NoticeServlet extends BaseServlet {

	NoticeService noticeService = new NoticeServiceImpl();
	
	
	
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//接收要删除部门的编号
		int notice_id = Integer.parseInt(request.getParameter("noticeid"));
		//调用业务层完成删除操作
		NoticeService noticeService = new NoticeServiceImpl();
					
		noticeService.delete(notice_id);
		//页面跳转		
		request.getRequestDispatcher("/servlet/NoticeServlet?method=show").forward(request, response);
		
	}
	
	public void showAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//调用业务层完成查询操作并得到结果
	
		List<NoticeInfo> noticeList = noticeService.findAll();
		//页面跳转
		request.setAttribute("noticeList", noticeList);
		request.getRequestDispatcher("/view/employee/notice_list.jsp").forward(request, response);
	
	}
			
	public void addNotice(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			//int notice_id = Integer.parseInt(request.getParameter("notice_id"));
			int user_id = Integer.parseInt(request.getParameter("user_id"));
			String notice_item = request.getParameter("notice_item");
			String notice_content = request.getParameter("notice_content");
			Date notice_time  = Date.valueOf(request.getParameter("notice_time"));
			Date notice_endtime  = Date.valueOf(request.getParameter("notice_endtime"));
			String is_used = request.getParameter("is_used");
			NoticeInfo noticeInfo = new NoticeInfo(0,user_id, notice_item, notice_content, notice_time, notice_endtime,null);
			NoticeService noticeService = new NoticeServiceImpl();
			int n = noticeService.add(noticeInfo);
			if(n>0){
				//添加成功
				request.setAttribute("success", "添加成功");
				request.getRequestDispatcher("/servlet/NoticeServlet?method=show").forward(request, response);
			}else{
				//添加失败
				request.setAttribute("failed", "添加失败");
				request.getRequestDispatcher("/view/employee/notice_list_add.jsp").forward(request, response);
			}
	}
	
	
	public void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int index = 1;
		//默认每页显示五条记录
		int size = 5;
		//获得查询条件，如果没有则设置为默认
		try{
			index = Integer.parseInt(request.getParameter("index"));
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
		
		String selectContent = request.getParameter("selectContent");
		if(selectContent==null){
			selectContent = "";
		}
		String selectType = request.getParameter("selectType");
		if(selectType==null){
			selectType="";
		}
		System.out.println(selectContent);
		System.out.println(selectType);
				
		PageBean<NoticeInfo> pageBean = new PageBean<NoticeInfo>();
		
		pageBean.setIndex(index);
		pageBean.setSize(size);
		
		noticeService.show(pageBean,selectContent,selectType);
		
		//将pageBean返回到jsp中
		request.setAttribute("pageBean", pageBean);
		//  记住查询条件
		request.setAttribute("selectType", selectType);
		request.setAttribute("selectContent", selectContent);
		
		System.out.println("----"+pageBean.getList().size());
		
		request.getRequestDispatcher("/view/employee/notice_list.jsp").forward(request, response);
	}
	
}
