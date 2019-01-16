package common.util;

import service.IMotorCarService;
import service.IUserService;
import service.impl.MotorCarServiceImpl;
import service.impl.UserServiceImpl;
import dao.InsertMotorCarDao;
import dao.InsertUserDao;
import dao.impl.MotorCarDaoImpl;
import dao.impl.UserDaoImpl;

public class BeanFactory {
	private static InsertUserDao userDao;

	private static IUserService userService;

	private static InsertMotorCarDao motorcarDao;

	private static IMotorCarService motorcarService;

	public static Object getBean(String beanName) {
		if (beanName.equals("userDao")) {
			userDao = getUserDao();
			return userDao;
		}
		if (beanName.equals("userService")) {
			userService = getUserService();
			return userService;
		}
		if (beanName.equals("motorcarDao")) {
			motorcarDao = getMotorCarDao();
			return motorcarDao;
		}
		if (beanName.equals("motorcarService")) {
			motorcarService = getMotorCarService();
			return motorcarService;
		}
		return null;
	}

	synchronized private static InsertUserDao getUserDao() {
		if (userDao == null)
			userDao = new UserDaoImpl();
		return userDao;
	}

	synchronized private static IUserService getUserService() {
		if (userService == null)
			userService = new UserServiceImpl();
		return userService;
	}

	synchronized private static InsertMotorCarDao getMotorCarDao() {
		if (motorcarDao == null)
			motorcarDao = new MotorCarDaoImpl();
		return motorcarDao;
	}

	synchronized private static IMotorCarService getMotorCarService() {
		if (motorcarService == null)
			motorcarService = new MotorCarServiceImpl();
		return motorcarService;
	}
}
