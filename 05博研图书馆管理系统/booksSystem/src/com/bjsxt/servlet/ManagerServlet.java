package com.bjsxt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.entity.BookCase;
import com.bjsxt.entity.Card;
import com.bjsxt.entity.Manager;
import com.bjsxt.entity.Purview;
import com.bjsxt.service.ManagerService;
import com.bjsxt.service.impl.ManagerServiceImpl;
import com.bjsxt.util.SxtPageUtil;

public class ManagerServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getMethod().toLowerCase();
		String operation = req.getParameter("operation");
		if(method.equals("get")&&operation.equals("findAllManager")){
			findAllManager(req,resp);
		}else if(method.equals("get")&&operation.equals("deleteManagePurview")){
			deleteManagePurview(req,resp);
		}else if(method.equals("get")&&operation.equals("deleteManagePurview")){
			deleteManagePurview(req,resp);
		}else if(method.equals("get")&&operation.equals("selectOneManagePurview")){
			findOneManagePurview(req,resp);
		}else if(method.equals("post")&&operation.equals("updectManagerpurview")){
			ModifyManagePurview(req,resp);
		}else if(method.equals("post")&&operation.equals("addManagerpurview")){
			addManagerpurview(req,resp);
		}else if(method.equals("get")&&operation.equals("selectCard")){
			findCard(req,resp);
		}else if(method.equals("post")&&operation.equals("updectCard")){
			ModifyCard(req,resp);
		}else if(method.equals("get")&&operation.equals("findbookCard")){
			FindbookCard(req,resp);
		}else if(method.equals("get")&&operation.equals("SelectoneBookc")){
			SelectoneBookCard(req,resp);
		}else if(method.equals("post")&&operation.equals("updectbookCase")){
			updectbookCase(req,resp);
		}else if(method.equals("get")&&operation.equals("deleoneBookc")){
			deleoneBookc(req,resp);
		}else if(method.equals("post")&&operation.equals("addbookCase")){
			addoneBookc(req,resp);
		}
	}

	private void addoneBookc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		ManagerService mangerSer=new ManagerServiceImpl();
		int n1=mangerSer.addoneBookc(name);
		if(n1>0){
			FindbookCard(req,resp);
		}
	}

	private void deleoneBookc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bcid=Integer.parseInt(req.getParameter("bcid"));
		ManagerService mangerSer=new ManagerServiceImpl();
		int n1=mangerSer.deleoneBookc(bcid);
		if(n1>0){
			FindbookCard(req,resp);
		}
	}

	private void updectbookCase(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bcid=Integer.parseInt(req.getParameter("bcid"));
		
		String bcname=req.getParameter("name");
		BookCase book=new BookCase(bcid, bcname);
		ManagerService mangerSer=new ManagerServiceImpl();
		int n1=mangerSer.updectbookCase(book);
		if(n1>0){
			FindbookCard(req,resp);
		}
	}

	private void SelectoneBookCard(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		int bcid=Integer.parseInt(req.getParameter("bcid"));
		ManagerService mangerSer=new ManagerServiceImpl();
		BookCase book=	mangerSer.FindbookCardone(bcid);
		req.setAttribute("book", book);
		req.getRequestDispatcher("/ManagerPurview/updectBookcase.jsp").forward(req, resp);
		
	}

	private void FindbookCard(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ManagerService mangerSer=new ManagerServiceImpl();
		//1:当前页码数num
		String numString = req.getParameter("num");
		//2:每页显示的数量size
		String sizeString = req.getParameter("size");
		//3:共有多少条记录total
		int total = mangerSer.couttBookCase();
		SxtPageUtil<BookCase> sxtPageUtil = new SxtPageUtil<>(numString, sizeString, total);
		//调用业务层
		mangerSer.findallBookcase(sxtPageUtil);
		if(sxtPageUtil.getList()!=null&&sxtPageUtil.getList().size()>0){
			req.setAttribute("sxtPageUtil", sxtPageUtil);
			req.getRequestDispatcher("/ManagerPurview/bookcase.jsp").forward(req, resp);
			return;
		}
	}

	private void ModifyCard(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		int validity=Integer.parseInt(req.getParameter("validity"));
		double fees=Double.parseDouble(req.getParameter("cost"));
		Card card=new Card(id, validity, fees);
		ManagerService mangerSer=new ManagerServiceImpl();
		int n1=mangerSer.modifyCard(card);
		if(n1>0){
			findCard(req,resp);
		}
	}

	private void findCard(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ManagerService mangerSer=new ManagerServiceImpl();
		Card findCard = mangerSer.findCard();
		req.setAttribute("card", findCard);
		req.getRequestDispatcher("/ManagerPurview/parameter_modify.jsp").forward(req, resp);
		
	}

	private void addManagerpurview(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String pwd = req.getParameter("pwd");
		ManagerService mangerSer=new ManagerServiceImpl();
		 Manager m=new Manager(name, pwd);
		int n = mangerSer.addManage(m);
		if(n>0){
			findAllManager(req,resp);
		}
		
		
	}

	private void ModifyManagePurview(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		int pid=Integer.parseInt(req.getParameter("pid"));
		ManagerService mangerSer=new ManagerServiceImpl();
		int sysset=Integer.parseInt(req.getParameter("sysset"));
		int readerset=Integer.parseInt(req.getParameter("readerset"));
		int bookset=Integer.parseInt(req.getParameter("bookset"));
		int borrowback=Integer.parseInt(req.getParameter("borrowback"));
		System.out.println("ManagerServlet.ModifyManagePurview(-------------------)"+borrowback);
		int sysquery=Integer.parseInt(req.getParameter("sysquery"));
		Purview pur=new Purview(pid, sysset, readerset, bookset, borrowback, sysquery);
		int n1=mangerSer.ModifyManagePurview(pur);
		if(n1>0){
			findAllManager(req,resp);
		}
	}

	private void findOneManagePurview(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		int pid=Integer.parseInt(req.getParameter("pid"));
		ManagerService mangerSer=new ManagerServiceImpl();
		Manager m=mangerSer.findOneManagePurview(pid);
		if(m!=null){
			req.setAttribute("m", m);
			req.getRequestDispatcher("/ManagerPurview/ManagerPurview.jsp").forward(req, resp);
			return;
		}
	}

	private void deleteManagePurview(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		int pid=Integer.parseInt(req.getParameter("sid"));
		ManagerService mangerSer=new ManagerServiceImpl();
		int n1=mangerSer.deleteManagePurview(pid);
		if(n1>0){
			findAllManager(req,resp);
		}
		
	}

	private void findAllManager(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ManagerService mangerSer=new ManagerServiceImpl();
		//1:当前页码数num
		String numString = req.getParameter("num");
		//2:每页显示的数量size
		String sizeString = req.getParameter("size");
		//3:共有多少条记录total
		int total = mangerSer.count();
		SxtPageUtil<Manager> sxtPageUtil = new SxtPageUtil<>(numString, sizeString, total);
		//调用业务层
		mangerSer.findAllManager(sxtPageUtil);
		if(sxtPageUtil.getList()!=null&&sxtPageUtil.getList().size()>0){
			req.setAttribute("sxtPageUtil", sxtPageUtil);
			req.getRequestDispatcher("/ManagerPurview/manager.jsp").forward(req, resp);
			return;
		}
	}
}
