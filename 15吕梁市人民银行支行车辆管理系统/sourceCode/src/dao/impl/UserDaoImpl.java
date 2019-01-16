package dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import common.exception.UserException;
import common.transaction.HibernateTransaction;
import common.util.HibernateSessionFactory;

import dao.InsertUserDao;
import dao.bean.Driver;
import dao.bean.User;

public class UserDaoImpl implements InsertUserDao {

	public void addDriver(Driver driver) throws UserException {
		Session session = HibernateSessionFactory.getSession();
		session.save(driver);
	}

	public User findUser(String nickname) throws UserException {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from User where nickname=?";
		Query query = session.createQuery(hql);
		query.setString(0, nickname);
		return (User) query.uniqueResult();
	}

	public void saveOrUpate(User user) throws UserException {
		Session session = HibernateSessionFactory.getSession();
		session.saveOrUpdate(user);		
	}

	public void setIsonline() throws UserException {
		Session session = HibernateSessionFactory.getSession();
		String hql = "update User set isonline=0";
		Query query = session.createQuery(hql);
		query.executeUpdate();

	}

	public List<User> findAllUser() throws UserException {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from User";
		Query query = session.createQuery(hql);
		return query.list();
	}

	public Driver findDriver(String name) throws UserException {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Driver where name=?";
		Query query = session.createQuery(hql);
		query.setString(0, name);
		return (Driver) query.uniqueResult();
	}

	public List<Driver> findAllDrivers() throws UserException {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Driver";
		Query query = session.createQuery(hql);
		return query.list();
	}

	public Driver findDriverById(long id) throws UserException {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Driver where id=?";
		Query query = session.createQuery(hql);
		query.setLong(0, id);
		return (Driver) query.uniqueResult();
	}

	public List<Driver> findDriverByCondition(String gender, long maxage,
			long minage, String cartype) throws UserException {
		Session session = HibernateSessionFactory.getSession();
		StringBuffer hql = new StringBuffer("from Driver where (1=1)");
		if (!"unlimited".equals(gender)) {
			hql.append(" and gender='" + gender + "'");
		}
		if (!"unlimited".equals(cartype)) {
			hql.append(" and cartype='" + cartype + "'");
		}
		if (minage != 0 && maxage != 0) {
			hql.append(" and (age between " + minage + " and " + maxage + ")");
		}
		System.out.println("hql="+hql.toString());
		Query query=session.createQuery(hql.toString());
		
		return query.list();
	}
}
