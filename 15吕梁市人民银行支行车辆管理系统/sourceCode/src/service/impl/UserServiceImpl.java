package service.impl;

import java.util.List;

import common.exception.UserException;
import common.transaction.HibernateTransaction;
import common.util.BeanFactory;
import common.util.MD5;

import dao.InsertUserDao;
import dao.bean.Driver;
import dao.bean.User;
import service.IUserService;

public class UserServiceImpl implements IUserService {
	private InsertUserDao userdao = (InsertUserDao) BeanFactory.getBean("userDao");

	public List findAllUser() throws UserException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			List<User> list = userdao.findAllUser();
			tran.commit();
			return list;
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new UserException("查找所有用户出错");
		}
	}

	public void logout(User user) throws UserException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			user.setIsonline(0);
			userdao.saveOrUpate(user);
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new UserException("注销失败");
		}

	}

	public void modify(User user) throws UserException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			userdao.saveOrUpate(user);
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new UserException("修改用户信息失败");
		}

	}

	public void register(User user) throws UserException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			User u = userdao.findUser(user.getNickname());
			if (u != null) {
				throw new UserException("用户已经被使用");
			}
			userdao.saveOrUpate(user);
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new UserException("注册失败");
		}
	}

	public User findByNickName(String nickname) throws UserException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			User user = userdao.findUser(nickname);
			tran.commit();
			return user;
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new UserException("按用户名查找用户失败");
		}
	}

	public User login(String nickname, String passwd) throws UserException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			User user = userdao.findUser(nickname);
			if (user == null) {
				throw new UserException("您登录的用户名不存在");
			}
			if (!passwd.equals(user.getPassword())) {
				throw new UserException("您输入的密码不正确");
			}
			if (user.getIsonline() == 1) {
				throw new UserException("您登录的用户在线");
			}
			user.setIsonline(1);
			userdao.saveOrUpate(user);
			tran.commit();
			return user;
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new UserException(e.getMessage());
		}
	}

	// 设置所有用户的状态为下线状态
	public void setAllIsonline() throws UserException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			userdao.setIsonline();
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
		}
	}

	public void addDriver(Driver driver) throws UserException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			userdao.addDriver(driver);
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new UserException("增加驾驶人员失败");
		}

	}

	public Driver findDriver(String name) throws UserException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			Driver driver = userdao.findDriver(name);
			tran.commit();
			return driver;
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new UserException("按姓名查找员工信息失败");
		}
	}

	public List<Driver> findAllDrivers() throws UserException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			List list = userdao.findAllDrivers();
			tran.commit();
			return list;
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new UserException("查找所有驾驶人员失败!");
		}
	}

	public Driver findDriverById(long id) throws UserException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			Driver driver = userdao.findDriverById(id);
			tran.commit();
			return driver;
		} catch (Exception e) {
			tran.rollback();
			throw new UserException("按编号查找员工信息失败");
		}
	}

	public String findMissingPassword(String username, String question,
			String answer) throws UserException {

		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			User user = userdao.findUser(username);
			if (!question.equals(user.getPasswdquestion())) {
				System.out.println(user.getPasswdquestion());
				throw new UserException("您输入的密码提示问题不正确!");
			}
			if (!answer.equals(user.getPasswdanswer())) {
				throw new UserException("您输入的密码提示问题答案不正确!");
			}
			String password = (int) (Math.random() * 1000000) + "";
			while (password.length() < 6) {
				password = (int) (Math.random() * 1000000) + "";
			}
			MD5 md5=MD5.getInstance();
			user.setPassword(md5.getMD5Str(password));
			userdao.saveOrUpate(user);
			tran.commit();
			return password;
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new UserException(e.getMessage());
		}

	}

	public List<Driver> findDriverByCondition(String gender, String age,
			String cartype) throws UserException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			long minage = 0;
			long maxage = 0;
			tran.beginTransaction();
			if ("unlimited".equals(age)) {
				minage = maxage = 0;
			}
			if("1".equals(age)){
				minage=20;
				maxage=29;
			}
			if("2".equals(age)){
				minage=30;
				maxage=39;
			}
			if("3".equals(age)){
				minage=40;
				maxage=49;
			}
			List list=userdao.findDriverByCondition(gender, maxage, minage, cartype);
			tran.commit();
			return list;
		} catch (Exception e) {
			tran.rollback();
			throw new UserException(e.getMessage());
		}
	}

}
