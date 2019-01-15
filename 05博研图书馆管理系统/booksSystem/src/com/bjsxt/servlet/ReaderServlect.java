package com.bjsxt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.entity.BookCase;
import com.bjsxt.entity.Reader;
import com.bjsxt.entity.ReaderType;
import com.bjsxt.service.ReaderService;
import com.bjsxt.service.ReaderServiceDao;
import com.bjsxt.service.impl.ReaderServiceDaoImpl;
import com.bjsxt.service.impl.ReaderServiseImpl;
import com.bjsxt.util.SxtPageUtil;

public class ReaderServlect extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getMethod().toLowerCase();
		String operation = req.getParameter("operation");
		if(method.equals("get")&&operation.equals("findAllReader")){
			findAllReader(req,resp);
		}else if(method.equals("get")&&operation.equals("deltAllReader")){
			deltAllReader(req,resp);
		}else if(method.equals("get")&&operation.equals("selectoneReaderType")){
			updectAllReader1(req,resp);
		}else if(method.equals("post")&&operation.equals("updectReaderType")){
			updectAllReader2(req,resp);
		}else if(method.equals("post")&&operation.equals("insertReaderType")){
			insertReaderType(req,resp);
		}else if(method.equals("get")&&operation.equals("finsAllReader")){
			finsAllReader(req,resp);
		}else if(method.equals("get")&&operation.equals("addReader")){
			addReader(req,resp);
		}else if(method.equals("get")&&operation.equals("updectRead")){
			updectRead1(req,resp);
		}
	}

	private void updectRead1(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("rid"));
		ReaderServiceDao rsDao=new ReaderServiceDaoImpl();
	
		Reader findReder = rsDao.findReder(id);
		req.setAttribute("reader", findReder);
		req.getRequestDispatcher("/reader/readerModify.jsp").forward(
				req, resp);
	}

	private void addReader(HttpServletRequest req, HttpServletResponse resp) {
		
		
	}

	private void finsAllReader(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReaderServiceDao rsDao=new ReaderServiceDaoImpl();
		//1:当前页码数num
		String numString = req.getParameter("num");
				//2:每页显示的数量size
		String sizeString = req.getParameter("size");
				//3:共有多少条记录total
		int total = rsDao.count();
		SxtPageUtil<Reader> sxtPageUtil = new SxtPageUtil<>(numString, sizeString, total);
		rsDao.findAllManager(sxtPageUtil);
		System.out.println("ReaderServlect.finsAllReader()"+sxtPageUtil);
		if(sxtPageUtil.getList()!=null&&sxtPageUtil.getList().size()>0){
			req.setAttribute("sxtPageUtil", sxtPageUtil);
			req.getRequestDispatcher("/reader/reader.jsp").forward(req, resp);
			return;
		}
	}

	private void insertReaderType(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		int number=Integer.parseInt(req.getParameter("number"));
		int n = new ReaderServiseImpl().queryReaderTypeByNameSer(name);
		if(n<0){
			ReaderType ni=new ReaderType( name, number);
			ReaderServiceDao rsDao=new ReaderServiceDaoImpl();
			
			int n1= rsDao.addRederType(ni);
			if(n1>0){
				findAllReader(req,resp);
			}
		}else{
			req.setAttribute("msg", "该读者类型已经存在");
		
			System.out.println("ReaderServlect.insertReaderType(该读者类型已经存在)");
			req.getRequestDispatcher("/error.jsp").forward(req, resp);
		}
	}

	private void updectAllReader2(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		ReaderServiceDao rsDao=new ReaderServiceDaoImpl();
		int id=Integer.parseInt(req.getParameter("id"));
		
		String name=req.getParameter("name");
		int number=Integer.parseInt(req.getParameter("number"));
		ReaderType ni=new ReaderType(id, name, number);
		int n1 = rsDao.modifyRederType(ni);
		if(n1>0){
			findAllReader(req,resp);
		}
		
	}

	private void updectAllReader1(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		ReaderServiceDao rsDao=new ReaderServiceDaoImpl();
		int id=Integer.parseInt(req.getParameter("id"));
		ReaderType n1 = rsDao.findRederTypeone(id);
		if(n1!=null){
			req.setAttribute("readerType", n1);
			req.getRequestDispatcher("/reader/updectreaderType.jsp").forward(req, resp);

		}
		
	}

	private void deltAllReader(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReaderServiceDao rsDao=new ReaderServiceDaoImpl();
		int id=Integer.parseInt(req.getParameter("id"));
		int n1 = rsDao.deleteRederType(id);
		if(n1>0){
			findAllReader(req,resp);
		}
	}

	private void findAllReader(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReaderServiceDao rsDao=new ReaderServiceDaoImpl();
		List<ReaderType> pe = rsDao.findAllRederType();
		if(pe.size()>0){
			req.setAttribute("readerType", pe);
			req.getRequestDispatcher("/reader/readerType.jsp").forward(req, resp);
		}
		
	}
}
