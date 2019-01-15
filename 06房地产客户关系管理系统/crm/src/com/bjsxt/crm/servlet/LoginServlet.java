package com.bjsxt.crm.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.crm.service.LoginService;
import com.bjsxt.crm.service.impl.LoginServiceImpl;
import com.bjsxt.crm.entity.User;



public class LoginServlet extends BaseServlet {

	
	private Object role_id;

	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			//1.��ȡ������ͼ����ݣ���¼��ݣ�
				request.setCharacterEncoding("utf-8");//���post�?������������
				String user_num = request.getParameter("user_num");
				String user_pw = request.getParameter("user_pw");
				
			//	String role_id = request.getParameter("role_id");
			//	request.getSession().setAttribute("role_id", role_id);
				
				//2.����ҵ����жϵ�¼�Ƿ�ɹ�
				LoginService loginService = new LoginServiceImpl();
				User user = loginService.login(user_num,user_pw);
				
				//3.�ж��Ƿ�ɹ���½����ת
				if (user!=null) {
					request.getSession().setAttribute("user", user);
					response.sendRedirect(request.getContextPath()+"/main.jsp");
				}else {
					request.setAttribute("error", "�û�������������");	
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}
		
	}
	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//����ǰsession		
		//HttpSession session = request.getSession();
		//session.removeAttribute("user");//û�н���session
		//session.invalidate();
		request.getSession().invalidate();
		//��ص�login.jsp
		response.sendRedirect(request.getContextPath()+"/login.jsp");
	}
}
