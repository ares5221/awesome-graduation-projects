package com.hd.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hd.entity.HouseInfo;
import com.hd.entity.HouseType;
import com.hd.service.HouseInfoService;
import com.hd.service.HouseTypeService;
import com.hd.service.impl.HouseInfoServiceImpl;
import com.hd.service.impl.HouseTypeServiceImpl;
import com.hd.util.PageBean;


public class HouseInfoServlet extends BaseServlet {
	HouseInfoService houService = new HouseInfoServiceImpl();
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//接收页面数据
		int house_id = Integer.parseInt(request.getParameter("house_id"));
		int type_id = Integer.parseInt(request.getParameter("type_id"));
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		String house_address = request.getParameter("house_address");
		double house_price = Double.parseDouble(request.getParameter("house_price"));
		String house_ambient = request.getParameter("house_ambient");

		
		//调用业务层完成注册操作
		HouseInfo hou = new HouseInfo(house_id,type_id,user_id,house_address,house_price,house_ambient);

		
		int n = houService.update(hou);
		//页面跳转
		if(n>0){
			//弹出提示框并自动跳转
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('更新成功！');"
					+ "location.href='HouseInfoServlet?method=find';</script>");
		}else{
			request.setAttribute("error", "更新失败");
			request.getRequestDispatcher("/view/house/houseinfo_edit.jsp?houseid="+house_id).forward(request, response);
		}
	
	}
	
	public void showById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		//接收要更新的的编号
		int house_id = Integer.parseInt(request.getParameter("house_id"));
		//调用业务层完成查询操作		
		HouseInfoService houService = new HouseInfoServiceImpl();
		HouseInfo hou = houService.findById(house_id);
		
		//页面跳转
		Gson gson = new Gson();
		String jsonStr = gson.toJson(hou);
		PrintWriter out = response.getWriter();
		out.println(jsonStr);
		out.flush();
		out.close();
	}
	
	public void showAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//调用业务层完成查询操作并得到结果
		HouseInfoService  houService = new HouseInfoServiceImpl();
		List<HouseInfo> houList = houService.findAll();
		//页面跳转
		request.setAttribute("houList", houList);
		request.getRequestDispatcher("/view/house/house_list.jsp").forward(request, response);
	
	}


	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//接收要删除的编号
		int house_id = Integer.parseInt(request.getParameter("house_id"));
		//调用业务层完成删除操作
		HouseInfoService houService = new HouseInfoServiceImpl();
		houService.delete(house_id);
		//页面跳转
		request.getRequestDispatcher("/servlet/HouseInfoServlet?method=find").forward(request, response);		
	}
	
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//接收页面数据
		
		int type_id = Integer.parseInt(request.getParameter("type_id"));
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		String house_address = request.getParameter("house_address");
		double house_price = Double.parseDouble(request.getParameter("house_price"));
		String house_ambient = request.getParameter("house_ambient");

		
		//调用业务层完成注册操作
		HouseInfo hou = new HouseInfo(type_id,user_id,house_address,house_price,house_ambient);

		HouseInfoService houService = new HouseInfoServiceImpl();
		int n = houService.add(hou);
		//页面跳转
		if(n>0){
			//弹出提示框并自动跳转
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('添加成功！');"
					+ "location.href='HouseInfoServlet?method=find';</script>");
		}else{
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('添加失败！');"
					+ "location.href='HouseInfoServlet?method=find';</script>");
		}
	
	}
	
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
		
		//获取查询类型
		String selectType = request.getParameter("selectType");
	
		if(selectType==null){
			selectType = "";
		}
		//获取查询内容
		String selectContent = request.getParameter("selectContent");
		if(selectContent==null){
			selectContent="";
		}
		
		PageBean<HouseInfo> pageBean = new PageBean<HouseInfo>();
		
		pageBean.setIndex(index);
		pageBean.setSize(size);
		
		houService.find(pageBean,selectType,selectContent);
		
		request.setAttribute("pageBean", pageBean);
		//记住查询条件
		request.setAttribute("selectType", selectType);
		request.setAttribute("selectContent", selectContent);
		
		
		request.getRequestDispatcher("/view/house/house_list.jsp").forward(request, response);
		
		
	}

}
