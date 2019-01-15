package com.hd.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hd.entity.HouseType;
import com.hd.service.HouseTypeService;
import com.hd.service.impl.HouseTypeServiceImpl;
import com.hd.util.PageBean;

public class HouseTypeServlet extends BaseServlet {
	
	HouseTypeService hts = new HouseTypeServiceImpl();

	public void showById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//接收要更新的的编号
		int type_id = Integer.parseInt(request.getParameter("type_id"));
		//调用业务层完成查询操作		
		HouseTypeService houService = new HouseTypeServiceImpl();
		HouseType hou = houService.findById(type_id);
		
		//页面跳转
		request.setAttribute("hou", hou);
		request.getRequestDispatcher("").forward(request, response);
		
	}
	
	public void showAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//调用业务层完成查询操作并得到结果
		HouseTypeService  houService = new HouseTypeServiceImpl();
		List<HouseType> houList = houService.findAll();
		
		//页面跳转
		request.setAttribute("houList", houList);
		request.getRequestDispatcher("/view/house/house_type_list.jsp").forward(request, response);
		
	
	}
	
	public void findAllHouseType(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("utf-8");
		//获取所有房屋类型
		List<HouseType> list = hts.findAll();
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);
		PrintWriter out = response.getWriter();
		out.println(jsonStr);
		out.flush();
		out.close();
	}
	

	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//接收要删除的编号
		int type_id = Integer.parseInt(request.getParameter("typeId"));
		//调用业务层完成删除操作
	
		HouseTypeService houService = new HouseTypeServiceImpl();
		houService.delete(type_id);
		//页面跳转
		request.getRequestDispatcher("/servlet/HouseTypeServlet?method=find").forward(request, response);		
	}
	
	public void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//接收页面的数据
		String select = request.getParameter("select");
		if(select == null){
			select = "";
		}
		//调用业务层完成客户查询操作并得到结果
		HouseTypeService  houseTypeService = new HouseTypeServiceImpl();
		List<HouseType> houseTypeList = houseTypeService.find(select);
		
		//页面跳转
		request.setAttribute("houseTypeList", houseTypeList);
		request.getRequestDispatcher("/view/house/house_type_list.jsp").forward(request, response);
	
	}
	
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String houseName = request.getParameter("houseName");
		int n = hts.add(houseName);
		if(n>0){
			//添加成功
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('添加成功');window.location.href='/Estate/servlet/HouseTypeServlet?method=find';</script>");
		}else{
			//添加失败
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('添加失败');window.location.href='/Estate/servlet/HouseTypeServlet?method=find';</script>");
		}
	}
	
	
	//分页及查询
	public void find(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		int index = 1;
		//默认每页显示五条记录
		int size = 5;
		//获得查询条件，如果没有则设置为默认
		try{
			index = Integer.parseInt(request.getParameter("index"));
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
		
		String houseType = request.getParameter("houseType");
	
		if(houseType==null){
			houseType = "";
		}
		
		PageBean<HouseType> pageBean = new PageBean<HouseType>();
		
		pageBean.setIndex(index);
		pageBean.setSize(size);
		
		hts.find(pageBean,houseType);
		
		request.setAttribute("pageBean", pageBean);
		//记住查询条件
		request.setAttribute("houseType", houseType);
		
		request.getRequestDispatcher("/view/house/house_type_list.jsp").forward(request, response);
		
	}
	
	
	
	
	
}
