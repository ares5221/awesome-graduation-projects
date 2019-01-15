package com.bjsxt.school.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.school.entity.Book;
import com.bjsxt.school.entity.Student;
import com.bjsxt.school.entity.StudentBook;
import com.bjsxt.school.entity.User;
import com.bjsxt.school.service.LibraryService;
import com.bjsxt.school.service.impl.LibraryServiceImpl;
import com.bjsxt.school.util.PageBean;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class LibraryServlet extends BaseServlet {
	
	
	public void bookRegister(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String bookId = request.getParameter("bookId");
		String bookName = request.getParameter("bookName");
		String writer = request.getParameter("writer");
		String bookType = request.getParameter("bookType");
		String press = request.getParameter("press");
		Date pressDate = Date.valueOf(request.getParameter("pressDate"));
		String operator = request.getParameter("operator");
		double price = Double.parseDouble(request.getParameter("price"));
		int count = Integer.parseInt(request.getParameter("count"));
		Date regDate = Date.valueOf(request.getParameter("regDate"));
		String remark = request.getParameter("remark");
		Book book = new Book(bookId, bookName, bookType, writer, press,
				pressDate, price, regDate, count, operator, remark);

		LibraryService libraryService = new LibraryServiceImpl();
		int n = libraryService.bookRegister(book);
		if (n > 0) {

			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('图书登记成功');location.href='/school/library/bookRegister.jsp';</script>");
		} else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('图书添加失败请重新添加');location.href='/school/library/bookRegister.jsp';</script>");
			
		}
		
	}

	public void bookShowBy(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String sindex = request.getParameter("index");
		int index = 1;
		if (sindex != null || !"".equals(sindex)) {
			try {
				index = Integer.parseInt(sindex);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		String ssize = request.getParameter("size");
		int size = 5;
		if (sindex != null || !"".equals(sindex)) {
			try {
				size = Integer.parseInt(ssize);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}

		PageBean<Book> pageBean = new PageBean<Book>();
		pageBean.setIndex(index);
		pageBean.setSize(size);

		String bookId = request.getParameter("bookId");
		if (bookId == null) {

			bookId = "";
		}

		String bookName = request.getParameter("bookName");

		if (bookName == null) {

			bookName = "";
		}
		String press = request.getParameter("press");

		if (press == null) {

			press = "";
		}
		LibraryService libraryService=new LibraryServiceImpl();
		
		libraryService.find(pageBean, bookId, bookName,press);
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("bookId", bookId);
		request.setAttribute("bookName", bookName);
		request.setAttribute("press", press);
		
		request.getRequestDispatcher("/library/bookMaintain.jsp").forward(request,
				response);
	}
	public void toUpdateBook(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String bookId=request.getParameter("bookId");
		LibraryService libraryService = new LibraryServiceImpl();
		Book book=libraryService.showBookById(bookId);
		request.setAttribute("book", book);
		request.getRequestDispatcher("/library/bookUpdate.jsp").forward(request, response);
	}
	public void deleteBook(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String bookId=request.getParameter("bookId");
		System.out.println(bookId);
		LibraryService libraryService = new LibraryServiceImpl();
		int n=libraryService.deleteBook(bookId);
		if(n>0){
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('图书删除成功');location.href='LibraryServlet?method=bookShowBy';</script>");
		}else{
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('此图书还有人在借阅，无法删除');location.href='LibraryServlet?method=bookShowBy';</script>");
		}
		
	}
	public void updateBook(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String bookId = request.getParameter("bookId");
		String bookName = request.getParameter("bookName");
		String writer = request.getParameter("writer");
		String bookType = request.getParameter("bookType");
		String press = request.getParameter("press");
		Date pressDate = Date.valueOf(request.getParameter("pressDate"));
		String operator = request.getParameter("operator");
		double price = Double.parseDouble(request.getParameter("price"));
		int count = Integer.parseInt(request.getParameter("count"));
		Date regDate = Date.valueOf(request.getParameter("regDate"));
		String remark = request.getParameter("remark");
		Book book = new Book(bookId, bookName, bookType, writer, press,
				pressDate, price, regDate, count, operator, remark);
		
		LibraryService libraryService = new LibraryServiceImpl();
		int n=libraryService.updateBook(book);
		if(n>0){
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('图书更改成功');location.href='LibraryServlet?method=bookShowBy';</script>");
		}else{
//			request.setAttribute("error", "图书更改失败");
//			request.getRequestDispatcher("/servlet/LibraryServlet?method=toUpdateBook&bookId="+bookId).forward(request, response);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('图书更改失败');location.href='/school/servlet/LibraryServlet?method=toUpdateBook&bookId="+bookId+"';</script>");
		}
		
	}
	public void bookOnblur(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String bookId = request.getParameter("bookId");
		if (bookId == ""||bookId ==null) {
			bookId = "";
		}
		LibraryService libraryService = new LibraryServiceImpl();
		Book book = libraryService.showBookById(bookId);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		//Gson gson=new Gson();
		String jsonBook = gson.toJson(book);
		out.println(jsonBook);
		out.flush();
		out.close();
		
	}
	
	public void stuOnblur(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String stuId = request.getParameter("stuId");
		if (stuId == ""||stuId ==null) {
			stuId = "";
		}
		LibraryService libraryService = new LibraryServiceImpl();
		Student stu = libraryService.showStuById(stuId);
		List<StudentBook> stuBookList=libraryService.showStuBookByStuId(stuId);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String jsonStu = gson.toJson(stu);
		String jsonList = gson.toJson(stuBookList);
		String json=jsonStu+"#"+jsonList;
		out.println(json);
		out.flush();
		out.close();
		
	}
	
	public void borrowBook(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String bookId=request.getParameter("bookId");
		String stuId=request.getParameter("stuId");
		Date borrowDate=Date.valueOf(request.getParameter("borrowDate"));
		
		//借书的操作员通过session得到
		User user=(User)request.getSession().getAttribute("user");
		String operator=user.getUserName();
		System.out.println(operator);
		//1.借书要先从库存中减去
		LibraryService libraryService=new LibraryServiceImpl();
		Book book = libraryService.showBookById(bookId);
		StudentBook stuBook=new StudentBook("", bookId, stuId, book.getBookName(), book.getPrice(), book.getBookType(), borrowDate, borrowDate, operator);
		int n1=libraryService.addBorrowBook(stuBook);
		//2.将借书信息添加到借书信息表中
		if(n1>0){
			int n2=libraryService.bookCountSubtract(book);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('借书成功');location.href='/school/library/bookBorrow.jsp';</script>");
		}else{
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('借书失败');location.href='/school/library/bookBorrow.jsp';</script>");
		}
	}
	
	public void bookReturn(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String stuId = request.getParameter("stuId");
		String bookId=request.getParameter("bookId");
		LibraryService libraryService = new LibraryServiceImpl();
		Book book = libraryService.showBookById(bookId);
//		//首先将图书信息中的库存增加1
		libraryService.bookCountAdd(book);
//		//将借书信息删除
		libraryService.deleteBorrowBook(stuId,bookId);
//		
		Student stu = libraryService.showStuById(stuId);
		List<StudentBook> stuBookList=libraryService.showStuBookByStuId(stuId);
	
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String jsonStu = gson.toJson(stu);
		String jsonList = gson.toJson(stuBookList);
		String json=jsonStu+"#"+jsonList;
		out.println(json);
		out.flush();
		out.close();
		
	}
	public void showBorrowBook(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String select = request.getParameter("select");
		String text=request.getParameter("text");
		if(text==null){
			text="";
		}
		LibraryService libraryService = new LibraryServiceImpl();
		List<StudentBook> stuBookList=libraryService.showBorrowBook(select,text);
	
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String jsonList = gson.toJson(stuBookList);
		out.println(jsonList);
		out.flush();
		out.close();
		
	}
	
}
