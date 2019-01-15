package com.bjsxt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;













import com.bjsxt.entity.BookBaseInfo;
import com.bjsxt.entity.BookCase;
import com.bjsxt.entity.BookInfo;
import com.bjsxt.entity.BookType;
import com.bjsxt.entity.Manager;
import com.bjsxt.service.AdminService;
import com.bjsxt.service.impl.AdminServiceImpl;
import com.bjsxt.service.impl.BookServiceImpl;
import com.google.gson.Gson;

public class AdminServlet1 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("AdminServlet.service()");
		//获取请求参数
		String operation=request.getParameter("operation");
		String method=request.getMethod().toLowerCase();
		
		if(operation.equals("login")&&method.equals("post")){
			//登录
			Login(request,response);
		}else if(operation.equals("login")&&method.equals("get")){
			Login(request,response);
		}else if(operation.equals("bookType")&&method.equals("get")){
			booktype(request,response);
		}else if(operation.equals("delbooks")&&method.equals("get")){
			delBooks(request,response);	
			
		}else if(operation.equals("bookquery")&&method.equals("get")){
			bookQuery(request,response);
		}else if(operation.equals("pagesList")&&method.equals("post")){
			pageslist(request,response);
		}else if(operation.equals("selectbooks")&&method.equals("post")){
			selectBooks(request,response);
			
		}else if(operation.equals("selectbooks")&&method.equals("get")){
			selectBooks(request,response);
			
		}else if(operation.equals("addbookType")&&method.equals("post")){
			addBookType(request,response);
		}else if(operation.equals("findbook")&&method.equals("post")){
			findBook(request,response);
		}else if(operation.equals("selectBorrowBooks")&&method.equals("get")){
			selectBorrowbooks(request,response);
			//修改
		}else if(operation.equals("updateBookType")&&method.equals("get")){
			updatebookType(request,response);
			
		}else if(operation.equals("updatebook")&&method.equals("post")){
			updateBook(request,response);
		
		}else if(operation.equals("delBookType")&&method.equals("post")){
			delbookType(request,response);
		}else if(operation.equals("getborrowinfo")&&method.equals("get")){
			getBorrowInfo(request,response);
		}else if(operation.equals("findbookborrowinfo")&&method.equals("post")){
			findBookBorrowInfo(request,response);
		}else{
			System.out.println("AdminServlet1.service(获取不到业务类型)"+operation+"--"+method);
		}
	}
	
	//更具条件查询借书信息
	private void findBookBorrowInfo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//获取参数
		String type = request.getParameter("type");
		String key = request.getParameter("key");
		System.out.println("AdminServlet1.findBookBorrowInfo()"+type+"---"+key);
		if((type!=null&&!"".equals(type))&&(key!=null&&!"".equals(key))){
			System.out.println("AdminServlet1.findBookBorrowInfo(获取到le-----前端参数)");
			List borrowList = new BookServiceImpl().findBorrowByFacSer(type, key);
			//设置到request作用于
			request.getSession().setAttribute("borrowList", borrowList);
			//请求转发到jsp页面
			request.getRequestDispatcher("/bookBorrowQuery.jsp").forward(request, response);
			return;
		}else{
			System.out.println("AdminServlet1.findBookBorrowInfo(没有获取到前端参数)");
		}
	}

	/**
	 * 获取借阅信息
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void getBorrowInfo(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminServlet1.getBorrowInfo()");
		
		//调用业务层方法
		List borrowList = new BookServiceImpl().getBorrowInfoSer();
		if(borrowList!=null&&borrowList.size()>0){
			System.out.println("AdminServlet1.getBorrowInfo(获取成功)");
			//设置到request作用于
			request.getSession().setAttribute("borrowList", borrowList);
			//请求转发到jsp页面
			request.getRequestDispatcher("/bookBorrowQuery.jsp").forward(request, response);
			return;
		}else{
			System.out.println("AdminServlet1.getBorrowInfo(无图书信息)");
		}
	}

		//删除图书档案管理
		private void delbookType(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			System.out.println("AdminServlet1.delbookType(删除图书档案管理)");
			//获取编号
			String bid=request.getParameter("bid");
			//调用业务层
			AdminService adminService=new AdminServiceImpl();
			int m1=adminService.delbookTypeDao(Integer.parseInt(bid));
			if(m1>0){
				System.out.println("AdminServlet1.delbookType(删除成功)");
				//响应给Ajax
				response.getWriter().print("true");
				
				
			}else{
				System.out.println("AdminServlet1.delbookType(删除失败)");
				//响应给Ajax
				response.getWriter().print("false");
			}
			
		}
	
	//修改
	private void updateBook(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminServlet1.updateBook(修改页面)");
		
		//获取请求参数
			System.out.println(request.getParameter("tid"));
			String tid=request.getParameter("tid");
			String name=request.getParameter("uname");
			int days=Integer.parseInt(request.getParameter("udate"));
			
			
			
			
			BookType bookType=new BookType(Integer.parseInt(tid), name, days);
			System.out.println("AdminServlet1.updateBook()"+tid+"--"+name+"--"+days);
			
			
			//调用业务层
		AdminService adminService=new AdminServiceImpl();
		
		
		
		int n3=adminService.updateBookTypeSer(bookType);
		System.out.println("AdminServlet1.updateBook()"+n3);
		if(n3>0){
			System.out.println("AdminServlet1.updateBook(修改成功)");
			booktype(request,response);
			return;
		}else{
			System.out.println("AdminServlet1.updateBook(修改失败)");
		}
		
	}
	
	//图书类型
	private void updatebookType(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminServlet1.updatebookType(修改图书类型)");
		//修改之前先查询页面
		//获取请求参数
		//
		String tid=request.getParameter("tid");
		System.out.println("AdminServlet1.updatebookType()"+tid);
		AdminService adminService=new AdminServiceImpl();
		BookType bookType=adminService.selectBookNoSer(Integer.parseInt(tid));
		if(bookType!=null){
			//设置作用域
			request.setAttribute("bookType", bookType);
			//跳转修改页面
			request.getRequestDispatcher("/bookType_update.jsp").forward(request, response);
	        return;
		}
	}
	//图书借阅查询
	private void selectBorrowbooks(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminServlet1.selectBorrowbooks(图书借阅查询)");
		//获取请求参数
		String key =request.getParameter("key");
		String name=request.getParameter("uname");
		String startTime=request.getParameter("startTime");
		String endTime=request.getParameter("endTime");
		
		if(key==null){
			key="0";
		}
		//调用业务层
		AdminService adminService=new AdminServiceImpl();
		List borrowBooksList=adminService.likeBorrowBookSer(Integer.parseInt(key), name, java.sql.Date.valueOf(startTime), java.sql.Date.valueOf(startTime));
	
		if(borrowBooksList!=null&&borrowBooksList.size()>0){
			//设置作用域
			request.setAttribute("borrowBooksList", borrowBooksList);
			System.out.println("AdminServlet1.selectBorrowbooks()"+borrowBooksList);
			//跳转页面
			request.getRequestDispatcher("borrowQuery.jsp").forward(request, response);
		}else{
			System.out.println("AdminServlet1.selectBorrowbooks(获取不到值)");
		}
    }
	
	
	//获取book响应给ajax
	private void findBook(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		System.out.println("AdminServlet1.findBook(获取属性响应给ajax)");
		
		//调用业务层
		AdminService adminService=new AdminServiceImpl();
		List bookquaryList=adminService.selectBookSer();
		if(bookquaryList!=null&&bookquaryList.size()>0){
		
			System.out.println("AdminServlet1.bookQuery()"+bookquaryList);
			//响应给ajax
			response.getWriter().print(new Gson().toJson(bookquaryList));
			
		}else{
			System.out.println("AdminServlet1.bookQuery(获取不到数据)");
		}
	}
	
	
	//添加图书类型
		private void addBookType(HttpServletRequest request,
				HttpServletResponse response) throws IOException, ServletException {
			System.out.println("AdminServlet1.addBookType(添加图书类型)");
			//获取请求参数
			String name=request.getParameter("uname");
			int days=Integer.parseInt(request.getParameter("udate"));
			System.out.println("AdminServlet1.addBookType()"+name+"--"+days);
			
			BookType bookType=new BookType(name, days);
			
			//调用业务层
			AdminService adminService=new AdminServiceImpl();
			int f=adminService.addBookTypeSer(bookType);
			if(f>0){
				System.out.println("AdminServlet1.addBookType(添加成功)");
				booktype(request,response);
				return;
			}else{
				System.out.println("AdminServlet1.addBookType(添加失败)");
				response.getWriter().print("添加失败");
			}	
		}
	
	
	//图书档案查询(模糊查询)
	private void selectBooks(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminServlet1.selectBooks(图书档案查询)");
		
		//调用业务层
		AdminService adminService=new AdminServiceImpl();
		//获取请求参数
		String key=request.getParameter("f");
		String name=request.getParameter("name");
		
		if(key==null){
			key="0";
		}
		
		
		System.out.println("AdminServlet1.selectBooks(key:)"+key+"-----name"+name);
		
		List bookquaryList=adminService.likeBookSer(key, name);
		System.out.println("AdminServlet1.selectBooks()"+bookquaryList);
		if(bookquaryList!=null&&bookquaryList.size()>0){
			//设置作用域
			request.setAttribute("bookquaryList", bookquaryList);
			System.out.println("AdminServlet1.selectBooks()"+bookquaryList);
			//跳转页面
			request.getRequestDispatcher("/bookQuery.jsp").forward(request, response);
			return;
		}else{
			System.out.println("AdminServlet1.selectBooks(获取不到数据)");
		}
		request.getRequestDispatcher("/bookQuery.jsp").forward(request, response);
        return;	
	}
	
	
	//查询书架
	private void pageslist(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		System.out.println("AdminServlet1.pageslist(查询书架)");
		//调用业务层
		AdminService adminService=new AdminServiceImpl();
		List<BookCase> pagesList=adminService.selectpagesSer();
		if(pagesList!=null&&pagesList.size()>0){
			//设置作用域
			request.setAttribute("pagesList", pagesList);
			System.out.println("AdminServlet1.bookQuery()"+pagesList);
			//响应给ajax
			String jsonstr=new Gson().toJson(pagesList);
			response.getWriter().print(jsonstr);
			return;
		}else{
			System.out.println("AdminServlet1.bookQuery(获取不到数据)");
		}	
	}
	
	
	//图书档案管理
	private void bookQuery(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminServlet1.bookQuery(图书档案管理)");
		//调用业务层
		AdminService adminService=new AdminServiceImpl();
		List bookquaryList=adminService.selectBookSer();
		if(bookquaryList!=null&&bookquaryList.size()>0){
		
			//设置作用域
			request.setAttribute("bookquaryList", bookquaryList);
			System.out.println("AdminServlet1.bookQuery()"+bookquaryList);
			//跳转页面
			request.getRequestDispatcher("/book.jsp").forward(request, response);
			return;
		}else{
			System.out.println("AdminServlet1.bookQuery(获取不到数据)");
		}
	}

	
	//删除除图书
	private void delBooks(HttpServletRequest request,HttpServletResponse response) throws IOException {
		System.out.println("AdminServlet1.delBooks(删除图书类型)");
		//获取请求参数
		String tid=request.getParameter("tid");
		//调用业务层
		AdminService adminService=new AdminServiceImpl();
		int n1=adminService.delBookDao(tid);
		if(n1>0){
			System.out.println("AdminServlet1.delBooks(删除成功)");
			//响应给ajax
			response.getWriter().print("true");
			return;
		}else{
			System.out.println("AdminServlet1.delBooks(删除失败)");
			//响应给ajax
			response.getWriter().print("false");
			return;
		}
	}


	//图书类型管理
	private void booktype(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminServlet.booktype(图书类型管理)");
		//调用业务层
		AdminService adminService=new AdminServiceImpl();
		List<BookType> bookTypeList=adminService.selectBookTypeSer();
		
		if(bookTypeList!=null&&bookTypeList.size()>0){
			//设置作用域
			request.setAttribute("bookTypeList", bookTypeList);
			System.out.println("AdminServlet.booktype()"+bookTypeList);
			request.getRequestDispatcher("/bookType.jsp").forward(request, response);
			return;
		}else{
			System.out.println("AdminServlet.booktype(获取不到数据)");
		}	
	}
	//登录
	private void Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminServlet.Login(登录)");
		//获取请求参数
		String name=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		//System.out.println("AdminServlet.Login()"+name+"--"+pwd);
		
		//调用业务层
		AdminService adminService=new AdminServiceImpl();
		Manager manager =adminService.managerloginSer(name, pwd);
		
		if(manager!=null){
			//设置作用域
			request.getSession().setAttribute("manager", manager);
			System.out.println("AdminServlet.Login()"+manager);
			System.out.println("AdminServlet.Login(登录成功)");
			//跳转页面
			request.getRequestDispatcher("BookServlet").forward(request, response);
			return;
		}else{
			request.setAttribute("msg", "用户名/密码不正确，请重新输入 ");
			System.out.println("AdminServlet.Login(登录失败)");
			//跳转页面
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
	

}
