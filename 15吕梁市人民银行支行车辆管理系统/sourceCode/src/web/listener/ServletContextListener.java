package web.listener;

import javax.servlet.ServletContextEvent;

import common.exception.UserException;
import common.util.BeanFactory;

import service.IUserService;

public class ServletContextListener implements
		javax.servlet.ServletContextListener {

	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("into contextDestoryed()...");
		IUserService service = (IUserService) BeanFactory
				.getBean("userService");
		try {
			service.setAllIsonline();
		} catch (UserException e) {
			e.printStackTrace();
		}
		
	}

	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("into contxtInitialized()...");

	}

}
