package com.bjsxt.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.dao.impl.BookDaoImpl;
import com.bjsxt.entity.BookBaseInfo;
import com.bjsxt.entity.Borrow;
import com.bjsxt.entity.Manager;
import com.bjsxt.entity.Reader;
import com.bjsxt.service.impl.ReaderServiseImpl;
import com.bjsxt.util.BjsxtUtil;
import com.google.gson.Gson;

public class ReaderServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//判断业务类型
		String method = req.getMethod().toLowerCase();
		String operation = req.getParameter("operation");
		
		if(method.equals("post")&&operation.equals("findreader")){
			//读者信息校验
			findReader(req,resp);
		}else if(method.equals("post")&&operation.equals("readerborrowinfo")){
			//读者借书信息查询
			readerBorrowInfo(req,resp);
		}else if(method.equals("post")&&operation.equals("addbooktoreader")){
			//读者借书添加
			addBookToReader(req,resp);			
		}else if(method.equals("get")&&operation.equals("findreaderinfo")){
			//获取读者信息和借书信息
			findReaderInfo(req,resp);			
		}else if(method.equals("post")&&operation.equals("bookrenew")){
			//读者续借
			readerBookRenew(req,resp);			
		}else if(method.equals("post")&&operation.equals("bookback")){
			//读者还书
			readerBookBack(req,resp);			
		}else{
			System.out.println("ReaderServlet.service(找不到对应的业务类型)："+method+"---"+operation);
			
		}
	}
	
	//读者还书
	private void readerBookBack(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//获取参数借书id
		String borrowIdStr = req.getParameter("borrowid");
		//获取管理员id
		Object objmgr = req.getSession().getAttribute("manager");
		
		//获取是否检查逾期金缴纳标价变量
		String flag = req.getParameter("check");
		
		//获取manager id
		if(objmgr!=null){
			Manager manager=(Manager)objmgr;
			int sid= manager.getSid();
			if(borrowIdStr!=null&&!"".equals(borrowIdStr)){
				int borrowid=Integer.parseInt(borrowIdStr);
				//判断是否超期
				Borrow borrow = new ReaderServiseImpl().getSigleBorrowInfoSer(borrowid);
			    Date backTime = borrow.getBackTime();
			    System.out.println("ReaderServlet.readerBookRenew()"+backTime);
			    if(backTime.getTime()>BjsxtUtil.nowdate().getTime()||"no".equals(flag)){
			    	System.out.println("ReaderServlet.readerBookRenew(没有超期)");
				    	//进行下一步操作
				    	boolean n = new ReaderServiseImpl().bookBackSer(borrowid, sid);
			    	    if(n){
			    	    	System.out.println("ReaderServlet.readerBookRenew(归还成功)");
			    	    	resp.getWriter().print("true");
					    	return;
			    	    }else{
			    	    	System.out.println("ReaderServlet.readerBookRenew(归还失败)");
			    	    	resp.getWriter().print("false");
					    	return;
					    }
			    }else{
			    	System.out.println("ReaderServlet.readerBookRenew(超期)");
			    	//计算超期天数
			    	 long days=(BjsxtUtil.nowdate().getTime()-backTime.getTime())/(1000*60*60*24);
			    	 resp.getWriter().print(days);
			    	 return;
			    }
			}
		}else{
			System.out.println("ReaderServlet.readerBookBack(获取不到session作用域manager信息)");
		}	
	}
		

	//读者续借
	private void readerBookRenew(HttpServletRequest req,HttpServletResponse resp) throws IOException {
		//获取参数借书id
		String borrowIdStr = req.getParameter("borrowid");
		//获取管理员id
		Object objmgr = req.getSession().getAttribute("manager");
		if(objmgr!=null){
			Manager manager=(Manager)objmgr;
			int sid= manager.getSid();
			if(borrowIdStr!=null&&!"".equals(borrowIdStr)){
				int borrowid=Integer.parseInt(borrowIdStr);
				//判断是否超期
				Borrow borrow = new ReaderServiseImpl().getSigleBorrowInfoSer(borrowid);
			    Date backTime = borrow.getBackTime();
			    System.out.println("ReaderServlet.readerBookRenew()"+backTime);
			    if(backTime.getTime()>BjsxtUtil.nowdate().getTime()){
			    	System.out.println("ReaderServlet.readerBookRenew(没有超期)");
			    	//查看是否有续借记录
			    	int ifback = borrow.getIfback();
			    	System.out.println("ReaderServlet.readerBookRenew()"+ifback);
			    	if(ifback==0){
				    	//进行下一步操作
				    	int n = new ReaderServiseImpl().bookRenewSer(borrowid, sid);
			    	    if(n>0){
			    	    	System.out.println("ReaderServlet.readerBookRenew(续借成功)");
			    	    	resp.getWriter().print("true");
					    	return;
			    	    }else{
			    	    	System.out.println("ReaderServlet.readerBookRenew(续借失败)");
			    	    	resp.getWriter().print("false");
					    	return;
			    	    }
			    	}else{
			    		System.out.println("ReaderServlet.readerBookRenew(已经续借一次，不能再次续借)");	
			    		resp.getWriter().print("alreadyrenew");
				    	return;
			    	}
			    }else{
			    	System.out.println("ReaderServlet.readerBookRenew(超期)");
			    	//计算超期天数
			    	 long days=(BjsxtUtil.nowdate().getTime()-backTime.getTime())/(1000*60*60*24);
			    	 resp.getWriter().print(days);
			    	 return;
			    }
			
			}else{
				System.out.println("ReaderServlet.readerBookRenew(获取不到参数)");
			}
		}else{
			System.out.println("ReaderServlet.readerBookRenew(获取不到session作用域manager信息)");
		}
		
		
	}

	//获取读者信息和借书信息
	private void findReaderInfo(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		//获取读者barcode
		String barcode = req.getParameter("readerbarcode");
		System.out.println("ReaderServlet.findReader()"+"-----"+barcode);
		//进行非空校验
		if(barcode!=null&&!"".equals(barcode)){
			System.out.println("ReaderServlet.findReader(成功获取参数)");
			
			//调用方法进行校验
		    Reader reader = new ReaderServiseImpl().findReaderSer(barcode);
		    
		    //对reader进行判断
		    if(reader!=null){
		    	System.out.println("ReaderServlet.findReader(reader校验成功)");
		    	//reader设置request作用域
		    	req.setAttribute("reader", reader);
		    	//获取读者借书信息
		    	 //获取读者id
		    	int rid = reader.getRid();
		    	//调用业务层方法实现查询
				List readerBorrowList = new ReaderServiseImpl().readerBorrowInfoSer(rid);
				//判断readerBorrowList
				if(readerBorrowList!=null&&readerBorrowList.size()>0){
					//readerBorrowList设置request作用域
					System.out.println("ReaderServlet.readerBorrowInfo()"+readerBorrowList.toString());
					req.setAttribute("readerBorrowList", readerBorrowList);
				}else{
					//没有信息
					System.out.println("ReaderServlet.readerBorrowInfo(没有获取到该读者借书信息)");
					//将查询结果用ajax发送到前端页面
					req.setAttribute("readerBorrowList", readerBorrowList);
				}
				//判断请求转发的界面
				  //获取转发界面
				String pagename = req.getParameter("pagename");
				if("bookrenew".equals(pagename)){
					req.getRequestDispatcher("/bookRenew.jsp").forward(req, resp);
				}else if("bookback".equals(pagename)){
					req.getRequestDispatcher("/bookBack.jsp").forward(req, resp);
				}
				return;
		    }else{
		    	//没有信息
				System.out.println("ReaderServlet.findReaderInfo(没有获取到该读者信息)");
				//将查询结果用ajax发送到前端页面
				resp.getWriter().print("没有获取到该读者信息");
				return;
		    }
		}else{
			System.out.println("ReaderServlet.findReaderInfo(获取参数readerbarcode失败)");
			resp.getWriter().print("获取参数readerbarcode失败");
			return;
		}
		
		
	}

	private void addBookToReader(HttpServletRequest req,HttpServletResponse resp) throws IOException {
		//获取操作类型
		String addType = req.getParameter("addtype");
		//获取关键字
		String addKey=req.getParameter("addkey");
		System.out.println("ReaderServlet.addBookToReader()"+addType+"----"+addKey);
		//获取读者id
		String rid=req.getParameter("readerid");
		//通过session作用域获取管理员id
		Object objmgr = req.getSession().getAttribute("manager");
		int sid=1;
		if(objmgr!=null){
			Manager manager=(Manager)objmgr;
			sid= manager.getSid();
		}

		//非空检查
		if((addType!=null&&!"".equals(addType))&&(addKey!=null&&!"".equals(addKey))&&(rid!=null&&!"".equals(rid))){
			//通过addType获取bookid
			BookBaseInfo bookBaseInfo =null;
			if("barcode".equals(addType)){
				bookBaseInfo = new BookDaoImpl().findBookByBarcodeDao(addKey);
			}else if("bookname".equals(addType)){
				bookBaseInfo = new BookDaoImpl().findBookByNameDao(addKey);	
			}
			if(bookBaseInfo!=null){	
				if(bookBaseInfo.getCount()==0){
					System.out.println("ReaderServlet.addBookToReader(已无在架可借图书)");
					resp.getWriter().print("nobook");
					return;
				}else{
					int bid = bookBaseInfo.getBid();
					System.out.println("ReaderServlet.addBookToReader(获取到前端传递的addType  addKey参数)");
					
					//借书时间
					String borrowTime=BjsxtUtil.nowdatestr();
					System.out.println("ReaderServlet.addBookToReader()"+"----"+borrowTime);
					
					//还书时间
					Calendar cal = Calendar.getInstance();
					cal.setTime(BjsxtUtil.nowdate());
					cal.add(Calendar.DATE, 90);
					String backTime = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
					
					//调用服务层方法进行添加
					boolean bool = new ReaderServiseImpl().addBookToReaderSer(new Borrow(bid, Integer.parseInt(rid), sid, java.sql.Date.valueOf(borrowTime), java.sql.Date.valueOf(backTime) , 0));
				    if(bool){
						//将结果发送到ajax
						System.out.println("ReaderServlet.addBookToReader(添加成功)");
						//重新查询借书信息
						//readerBorrowInfo(req,resp);
						resp.getWriter().print("true");
						return;
					}else{
						System.out.println("ReaderServlet.addBookToReader(添加失败)");
						resp.getWriter().print("false");
						return;
					}
				}
				
			}else{
				System.out.println("ReaderServlet.addBookToReader(该书信息不存在)");
				resp.getWriter().print("booknotfind");
				return;
			}
			
			
		}else{
			System.out.println("ReaderServlet.addBookToReader(没有获取到前端传递的addType  addKey参数)");
		}
	}

	//读者借书信息查询
	private void readerBorrowInfo(HttpServletRequest req,
			HttpServletResponse resp) throws IOException {
		//获取读者id
		String readerid = req.getParameter("readerid");
		System.out.println("ReaderServlet.readerBorrowInfo(readerid)"+"----"+readerid);
		//进行非空判断
		if(readerid!=null&&!"".equals(readerid)){
			//调用业务层方法实现查询
			List readerBorrowList = new ReaderServiseImpl().readerBorrowInfoSer(Integer.parseInt(readerid));
			//判断readerBorrowList
			if(readerBorrowList!=null&&readerBorrowList.size()>0){
				//将查询结果用ajax发送到前端页面
				System.out.println(readerBorrowList.toString());
				System.out.println("---------------------------------------------------------");
				System.out.println(new Gson().toJson(readerBorrowList));
				resp.getWriter().print(new Gson().toJson(readerBorrowList));
				return;
			}else{
				//没有信息
				System.out.println("ReaderServlet.readerBorrowInfo(没有获取到该读者借书信息)");
				//将查询结果用ajax发送到前端页面
				resp.getWriter().print("false");
				return;
			}
		}else{
			System.out.println("ReaderServlet.readerBorrowInfo(获取readerid失败)");
		}
	}

	//读者信息校验
	private void findReader(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//获取读者barcode
		String barcode = req.getParameter("readerbarcode");
		System.out.println("ReaderServlet.findReader()"+"-----"+barcode);
		//进行非空校验
		if(barcode!=null&&!"".equals(barcode)){
			System.out.println("ReaderServlet.findReader(成功参数)");
			//调用方法进行校验
		    Reader reader = new ReaderServiseImpl().findReaderSer(barcode);
		    //对reader进行判断
		    if(reader!=null){
		    	System.out.println("ReaderServlet.findReader(reader校验成功)");
		    	//将reader通过ajax传递到前端页面
		    	resp.getWriter().print(new Gson().toJson(reader));
		    	return;
		    }else{
		    	System.out.println("ReaderServlet.findReader(reader校验失败)");
		    	resp.getWriter().print("false");
		    	return;
		    }
		}else{
			System.out.println("ReaderServlet.findReader(获取参数readerbarcode失败)");
		}
	}
	
}
