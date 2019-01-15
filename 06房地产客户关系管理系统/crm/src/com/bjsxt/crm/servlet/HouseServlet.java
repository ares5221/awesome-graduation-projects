package com.bjsxt.crm.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

import org.apache.commons.io.IOUtils;

import com.bjsxt.crm.entity.Customer;
import com.bjsxt.crm.entity.House;
import com.bjsxt.crm.entity.House_Type;
import com.bjsxt.crm.entity.User;
import com.bjsxt.crm.service.CustomerService;
import com.bjsxt.crm.service.HouseService;
import com.bjsxt.crm.service.UserService;
import com.bjsxt.crm.service.impl.CustomerServiceImpl;
import com.bjsxt.crm.service.impl.HouseServiceImpl;
import com.bjsxt.crm.service.impl.UserServiceImpl;
import com.bjsxt.crm.util.PageBean;



public class HouseServlet extends BaseServlet {
	
	
	public void export(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, WriteException {
		File file=new File("houseList.xls");
		//创建要放入数据的Excel文件
		 WritableWorkbook wwb=Workbook.createWorkbook(file);
		 // 创建Excel工作表 指定名称和位置
		WritableSheet ws = wwb.createSheet("Test Sheet 1", 0);
		 // 设置表格的列宽度
		ws.setColumnView(0, 5);
		ws.setColumnView(1, 14);
		ws.setColumnView(2, 14);
		ws.setColumnView(3, 50);
		ws.setColumnView(4, 14);
		ws.setColumnView(5, 50);
		// **************往工作表中添加数据*****************
		//定义字体格式：字体为：微软雅黑，24号子，加粗
		 WritableFont titleFont = new WritableFont(WritableFont.createFont("微软雅黑"), 24, WritableFont.NO_BOLD);
		 WritableFont contentFont = new WritableFont(WritableFont.createFont("楷体 _GB2312"), 12, WritableFont.NO_BOLD);
		 
		 WritableCellFormat titleFormat = new WritableCellFormat(titleFont);
		 WritableCellFormat contentFormat = new WritableCellFormat(contentFont);
		 WritableCellFormat contentFormat2 = new WritableCellFormat(contentFont);
		 
		 contentFormat.setBorder(Border.ALL, BorderLineStyle.THIN,Colour.BLACK);
		 
		 //设置格式居中对齐
		 titleFormat.setAlignment(jxl.format.Alignment.CENTRE);
		 contentFormat2.setAlignment(jxl.format.Alignment.CENTRE);
		 
		 // ***************将定义好的单元格添加到工作表中*****************
		 
		 ws.mergeCells(0, 0, 5, 0);// 合并单元格A-f共6列
		 ws.addCell(new Label(0, 0, "房屋列表", titleFormat));
		 ws.addCell(new Label(0, 1, "序号", contentFormat));
		 ws.addCell(new Label(1, 1, "户型", contentFormat));
		 ws.addCell(new Label(2, 1, "管理员工", contentFormat));
		 ws.addCell(new Label(3, 1, "房屋地址", contentFormat));
		 ws.addCell(new Label(4, 1, "房屋价格(每平米)", contentFormat));
		 ws.addCell(new Label(5, 1, "房屋环境", contentFormat));
		//查找所有房屋列表插入
						//cc 獲得想要指引的頁面index
							String sindex = request.getParameter("index");
							int index =1;
							//
							try {
								index = Integer.parseInt(sindex);
							} catch (Exception e) {
								
							}
							//cc 获取每页想要展示的个数size
							String ssize = request.getParameter("size");
							int size =5;
							
							try {
								size = Integer.parseInt(ssize);
							} catch (Exception e) {
								
							}
							//cc 获取查询条件
							int queryType=1;
							String queryType0=request.getParameter("queryType");
							if(queryType0!=null){
								
								queryType=Integer.parseInt(queryType0);
							}
							
							//cc 获取查询信息
							String houseInput="";
							try {
								
								houseInput = java.net.URLDecoder.decode(request.getParameter("houseInput"),"UTF-8");
							} catch (Exception e) {
								// TODO: handle exception
							}
							
							System.out.println("HouseServlet.export():houseinput:"+houseInput);
							
							//cc 修改pageBean参数
							PageBean<House> pageBean=new PageBean<House>();
						
							
							pageBean.setIndex(index);
							pageBean.setSize(size);
							
							
							 HouseService houseService = new HouseServiceImpl();
							 
							 //cc 调用服务层获取符合条件的house list
							 int user_ID=9999;

								
							 String user_IDx = request.getParameter("user_ID");
							 if(user_IDx!=null){
								 
								 user_ID=Integer.parseInt(request.getParameter("user_ID"));
							 }
								houseService.find1(pageBean,queryType,houseInput,user_ID);
							 
							 
							 
							 List<House> houseList = pageBean.getList();
							 System.out.println("HouseServlet.export()houselist:"+houseList);
							 int r=2;
								 for (House house : houseList) {
									 System.out.println("HouseServlet.export()house:"+house );
									 ws.addCell(new Label(0, r, house.getHouse_ID()+"", contentFormat2));
									 ws.addCell(new Label(1, r, house.getHouse_type().getType_name(), contentFormat2));
									 ws.addCell(new Label(2, r, house.getUser().getUser_name(), contentFormat2));
									 ws.addCell(new Label(3, r, house.getHouse_address(), contentFormat2));
									 ws.addCell(new Label(4, r, house.getHouse_price()+"", contentFormat2));
									 ws.addCell(new Label(5, r, house.getHouse_ambient(), contentFormat2));
									 r++;
								}
									 
							
							 // 写入工作表完毕，关闭流
							 wwb.write();
							 wwb.close();
		//解决中文文件下载的乱码问题
			String browserType = request.getHeader("User-Agent").toLowerCase();
			String realName="房屋列表";
			if(browserType.indexOf("msie")>=0||browserType.indexOf("edge")>=0){
				realName = URLEncoder.encode(realName,"utf-8");
			}else{
				//System.out.println(realName);//霓凰郡主
				realName = new String(realName.getBytes("utf-8"),"iso-8859-1");
				
			}		
			
			
			
			//response.setHeader("Content-Disposition", "inline");
			response.setHeader("Content-Disposition", "attachment;filename="+realName+".xls");
			response.setContentType("application/vnd.ms-excel");
			response.setContentLength((int)file.length());
			InputStream is = new FileInputStream(file);//!!!!
			OutputStream os = response.getOutputStream();//!!!
			//3.2使用输入流和输出流
			IOUtils.copy(is, os);
			//3.3关闭输入流和输出流
			is.close();
			os.close();
			
	}
	
	public void addType(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type_name = request.getParameter("type_name");
		
		 HouseService houseService = new HouseServiceImpl();
		 
		 houseService.addType(type_name);
		 
		 
		 request.getRequestDispatcher("/servlet/HouseServlet?method=findType").forward(request, response); 
	}
	public void deleteType(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int type_ID = Integer.parseInt(request.getParameter("type_ID"));
		
		 HouseService houseService = new HouseServiceImpl();
		 
		 houseService.deleteType(type_ID);
		 
		 
		 request.getRequestDispatcher("/servlet/HouseServlet?method=findType").forward(request, response); 
	}
	
	
	
	public void findType(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//cc 獲得想要指引的頁面index
				String sindex = request.getParameter("index");
				int index =1;
				//
				try {
					index = Integer.parseInt(sindex);
				} catch (Exception e) {
					
				}
				//cc 获取每页想要展示的个数size
				String ssize = request.getParameter("size");
				int size =2;
				
				try {
					size = Integer.parseInt(ssize);
				} catch (Exception e) {
					
				}
				
				//cc 获取查询信息
				String houseInput="";
				try {
					
					houseInput = java.net.URLDecoder.decode(request.getParameter("houseInput"),"UTF-8");
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				
				//cc 修改pageBean参数
				PageBean<House_Type> pageBean=new PageBean<House_Type>();
				 
				
				pageBean.setIndex(index);
				pageBean.setSize(size);
				
				
				 HouseService houseService = new HouseServiceImpl();
				 
				 //cc 调用服务层获取符合条件的house list
				 houseService.findType(pageBean,houseInput);
				 request.setAttribute("pageBean",pageBean);//!!!!!!!
				 request.setAttribute("houseInput", houseInput);
				 
				//cc 请求转发
				  
				request.getRequestDispatcher("/view/house/house_type_list.jsp").forward(request, response); 
	}

	public void toAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		 HouseService houseService = new HouseServiceImpl();
		 UserService userService=new UserServiceImpl();
		 CustomerService customerService = new CustomerServiceImpl();
		 List<User> userList = userService.showUser(null,null);
		 List<Customer> cusList = customerService.findAll(1, "");
		 
		 List<House_Type> hTypeList=houseService.findAllType();
		 
		 
		 request.setAttribute("userList", userList);
		 request.setAttribute("hTypeList", hTypeList);
		 request.setAttribute("cusList", cusList);
		request.getRequestDispatcher("/view/house/house_add.jsp").forward(request, response); 
	}
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("HouseServlet.add()");
		int type_ID=Integer.parseInt(request.getParameter("type_ID"));
		System.out.println(type_ID);
		int user_ID=Integer.parseInt(request.getParameter("user_ID"));
		int customer_ID=1;
		 customer_ID=Integer.parseInt(request.getParameter("customer_ID"));
		String house_address = request.getParameter("house_address");
		double house_price = Double.parseDouble(request.getParameter("house_price"));
		String house_ambient = request.getParameter("house_ambient");
		
		String is_used = request.getParameter("is_used");
		
//	  House house = new House( null,type_ID, user_ID, customer_ID, house_address, house_price, house_ambient, is_used);
	 House house= new House(1, type_ID, user_ID, customer_ID, house_address, house_price, house_ambient, is_used);
	  HouseService houseService = new HouseServiceImpl();
	  
	  houseService.add(house);
	  
	  
	  
	  request.getRequestDispatcher("/servlet/HouseServlet?method=find").forward(request, response);
	}
	public void find(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("HouseServlet.find()");
		//cc 獲得想要指引的頁面index
		String sindex = request.getParameter("index");
		int index =1;
		//
		try {
			index = Integer.parseInt(sindex);
		} catch (Exception e) {
			
		}
		//cc 获取每页想要展示的个数size
		String ssize = request.getParameter("size");
		int size =5;
		
		try {
			size = Integer.parseInt(ssize);
		} catch (Exception e) {
			
		}
		//cc 获取查询条件
		int queryType=1;
		String queryType0=request.getParameter("queryType");
		if(queryType0!=null){
			
			queryType=Integer.parseInt(queryType0);
		}
		
		//cc 获取查询信息
		String houseInput="";
		try {
			
			houseInput = java.net.URLDecoder.decode(request.getParameter("houseInput"),"UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
				
		
		
		
		//cc 修改pageBean参数
		PageBean<House> pageBean=new PageBean<House>();
		 int totalPageCount=pageBean.getTotalPageCount();
		
		pageBean.setIndex(index);
		pageBean.setSize(size);
		
		
		 HouseService houseService = new HouseServiceImpl();
		 
		 //cc 调用服务层获取符合条件的house list
//		 houseService.find(pageBean,queryType,houseInput);
		int user_ID=9999;

		
		 String user_IDx = request.getParameter("user_ID");
		 if(user_IDx!=null){
			 
			 user_ID=Integer.parseInt(request.getParameter("user_ID"));
		 }
			houseService.find1(pageBean,queryType,houseInput,user_ID);
			
		
			
			request.setAttribute("pageBean",pageBean);//!!!!!!!
			request.setAttribute("queryType", queryType);
			request.setAttribute("houseInput", houseInput);
			
			//cc 请求转发
			
			request.getRequestDispatcher("/view/house/house_list.jsp").forward(request, response); 
	
		 
	}
	
	
	
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String sindex = request.getParameter("index");
		int index =1;
		//
		try {
			index = Integer.parseInt(sindex);
		} catch (Exception e) {
			
		}
		//cc 获取每页想要展示的个数size
		String ssize = request.getParameter("size");
		int size =5;
		
		try {
			size = Integer.parseInt(ssize);
		} catch (Exception e) {
			
		}
		//cc 获取查询条件
		int queryType=0;
		String queryType0=request.getParameter("queryType");
		if(queryType0!=null){
			
			queryType=Integer.parseInt(queryType0);
		}
		
		//cc 获取查询信息
		String houseInput = request.getParameter("houseInput");
		
		
		
		int house_ID=Integer.parseInt(request.getParameter("house_ID"));
		
		 HouseService houseService = new HouseServiceImpl();
		 houseService.delete(house_ID);
		request.getRequestDispatcher("/servlet/HouseServlet?method=find&index="+index+"&size="+size+"&houseInput="
		 +houseInput+"&queryType="+queryType).forward(request, response); 
		
	}
	
	public void toModify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("HouseServlet.toTodify()");
		String house_ID1=request.getParameter("house_ID");
		System.out.println(house_ID1);
		int house_ID=Integer.parseInt(house_ID1);
		
		 HouseService houseService = new HouseServiceImpl();
		 UserService userService=new UserServiceImpl();
		 List<User> userList = userService.showUser(null,null);
		 CustomerService customerService = new CustomerServiceImpl();
		 List<Customer> cusList = customerService.findAll(1, "");
		 House house=houseService.findHouse(house_ID);
		 List<House_Type> hTypeList=houseService.findAllType();
		 
		 
		 request.setAttribute("userList", userList);
		 request.setAttribute("hTypeList", hTypeList);
		 request.setAttribute("house", house);
		 request.setAttribute("cusList", cusList);
		request.getRequestDispatcher("/view/house/house_modify.jsp").forward(request, response); 
		
	}
	public void modify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("HouseServlet.modify()");
		int house_ID=Integer.parseInt(request.getParameter("house_ID"));
		int type_ID=Integer.parseInt(request.getParameter("type_ID"));
		int user_ID=Integer.parseInt(request.getParameter("user_ID"));
//		int customer_ID=Integer.parseInt(request.getParameter("customer_ID"));
		int customer_ID=1;
		String house_address = request.getParameter("house_address");
		double house_price = Double.parseDouble(request.getParameter("house_price"));
		String house_ambient = request.getParameter("house_ambient");
		System.out.println(house_ambient);
		String is_used = request.getParameter("is_used");
		
	  House house = new House(house_ID, type_ID, user_ID, customer_ID, house_address, house_price, house_ambient, is_used);
	  HouseService houseService = new HouseServiceImpl();
	  
	  houseService.modify(house);
	  
	  
	  
	  request.getRequestDispatcher("/servlet/HouseServlet?method=find").forward(request, response);
	}
	
}
