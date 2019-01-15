package com.bjsxt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.entity.Manager;
import com.bjsxt.service.impl.AdminServiceImpl;
import com.bjsxt.service.impl.BookServiceImpl;

public class AdminServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//判断业务类型
		String method = req.getMethod().toLowerCase();
		String operation = req.getParameter("operation");
		System.out.println("AdminServlet.service()"+method+"=----"+operation);
		if(method.equals("get")&&operation.equals("bookoverdueremind")){
			//书借阅逾期提醒
			bookOverdueRemind(req,resp);
		}else if(method.equals("get")&&operation.equals("modifypwd")){
			//更改管理员口令
			modifyPwd(req,resp);
		}else if(method.equals("get")&&operation.equals("logout")){
			//退出系统
			mgrLogout(req,resp);
		}else{
			System.out.println("AdminServlet.service(找不到对应的业务类型)："+method+"---"+operation);
			
		}
	}

	//退出系统
	private void mgrLogout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		System.out.println("AdminServlet.mgrLogout()");
		//remove session作用域
		req.getSession().removeAttribute("manager");
		//重定向到login界面
		resp.sendRedirect(req.getContextPath()+"/login.jsp");
		return;
		
	}

	//更改管理员口令
	private void modifyPwd(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//通过session获取管理员id
		Object object = req.getSession().getAttribute("manager");
		
		if(object!=null){
			Manager manager=(Manager)object;
			int sid = manager.getSid();
			//获取新密码
			String newpwd = req.getParameter("newpwd");
			System.out.println("AdminServlet.modifyPwd()"+newpwd+sid);
			if(newpwd!=null&&!"".equals(newpwd)){
				int n = new AdminServiceImpl().modifyPwdSer(sid, newpwd);
				if(n>0){
					System.out.println("AdminServlet.modifyPwd(密码修改成功)");
					resp.getWriter().print("true");
					return;
				}else{
					System.out.println("AdminServlet.modifyPwd(密码修改失败)");
					resp.getWriter().print("false");
					return;
				}
			}else{
				resp.getWriter().print("false");
				return;
			}
		}else{
			
			System.out.println("AdminServlet.modifyPwd(获取不到管理员信息)");
			resp.getWriter().print("other");
			return;
		}
	}

	//书借阅逾期提醒
	private void bookOverdueRemind(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("AdminServlet.bookOverdueRemind()");
		List overdueBookList = new BookServiceImpl().getOverdueBookInfoSer();
		if(overdueBookList!=null&&overdueBookList.size()>0){
			System.out.println("AdminServlet.bookOverdueRemind(获取到逾期的借书信息)");
			//设置到request作用域
			req.setAttribute("overdueBookList", overdueBookList);
			req.getRequestDispatcher("/bremind.jsp").forward(req, resp);
			return;
		}else{
			System.out.println("AdminServlet.bookOverdueRemind(没有逾期的借书信息)");
			req.getRequestDispatcher("/bremind.jsp").forward(req, resp);
			return;
		}
	}
                                                                                                                                                                                                  
}
