package web.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import service.IUserService;

import common.util.BeanFactory;

import dao.bean.User;

public class SessionListener implements HttpSessionListener {

	public void sessionCreated(HttpSessionEvent arg0) {
		System.out.println("into sessionCreated()...");
	}

	public void sessionDestroyed(HttpSessionEvent arg0) {
		System.out.println("into sessionDestroyed()....");
		IUserService service = (IUserService) BeanFactory
				.getBean("userService");
		HttpSession session = arg0.getSession();
		User user =(User) session.getAttribute("user");
		if (user != null) {
			try {
				service.logout(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		session.removeAttribute("user");
		session.removeAttribute("ip");
	}

}
