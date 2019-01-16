package dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;

import service.impl.MotorCarServiceImpl;

import common.exception.MotorbikeCarException;
import common.util.HibernateSessionFactory;

import dao.InsertMotorCarDao;
import dao.bean.ApplicationRecord;
import dao.bean.BackRecord;
import dao.bean.MotorCar;
import dao.bean.OutRecord;

public class MotorCarDaoImpl implements InsertMotorCarDao {

	public void saveOrUpdate(MotorCar car) throws MotorbikeCarException {
		Session session=HibernateSessionFactory.getSession();
		session.save(car);
	}

	public List<MotorCar> findAllCar() throws MotorbikeCarException {
		Session session=HibernateSessionFactory.getSession();
		String hql="from MotorCar";
		Query query=session.createQuery(hql);
		return query.list();
	}

	public void addBackRecord(BackRecord record) throws MotorbikeCarException {
		Session session=HibernateSessionFactory.getSession();
		session.save(record);
	}

	public void addOutRecord(OutRecord record) throws MotorbikeCarException {
		Session session=HibernateSessionFactory.getSession();
		session.save(record);
	}

	public List<BackRecord> findAllBackRecord() throws MotorbikeCarException {
		Session session=HibernateSessionFactory.getSession();
		String hql="from BackRecord";
		Query query=session.createQuery(hql);
		return query.list();
	}

	public List<OutRecord> findAllOutRecord() throws MotorbikeCarException {
		Session session=HibernateSessionFactory.getSession();
		String hql="from OutRecord";
		Query query=session.createQuery(hql);
		return query.list();
	}

	public void saveAppRecord(ApplicationRecord record) throws MotorbikeCarException {
		Session session=HibernateSessionFactory.getSession();
		session.save(record);
		
	}

	public MotorCar findOneCar(long id) throws MotorbikeCarException {
		Session session=HibernateSessionFactory.getSession();
		Query query=session.createQuery("from MotorCar where id=?");
		query.setLong(0,id);
		return (MotorCar) query.uniqueResult();
	}

	public List<MotorCar> findCarsByCondition(String cartype, String status) throws MotorbikeCarException {
		Session session=HibernateSessionFactory.getSession();
		StringBuffer hql=new StringBuffer("from MotorCar where 1=1");
		if(!cartype.equals("unlimited")){
			hql.append(" and cartype='"+cartype+"'");
		}
		if(!status.equals("unlimited")){
			hql.append(" and status='"+status+"'");
		}
		Query query=session.createQuery(hql.toString());
		return query.list();
	}

	public void updateAppRecord(ApplicationRecord record) throws MotorbikeCarException {
		Session session=HibernateSessionFactory.getSession();
		session.update(record);
		
	}

	public List<ApplicationRecord> findAppRecord(long status) throws MotorbikeCarException {
		Session session=HibernateSessionFactory.getSession();
		String hql="from AppRecord where status=?";
		Query query=session.createQuery(hql);
		query.setLong(0, status);
		return query.list();
	}

	public ApplicationRecord findAppById(long id) throws MotorbikeCarException {
		Session session=HibernateSessionFactory.getSession();
		String hql="from AppRecord where id=?";
		Query query=session.createQuery(hql);
		query.setLong(0, id);
		return (ApplicationRecord)query.uniqueResult();
	}

	public MotorCar findCarByNumber(String carnumber) throws MotorbikeCarException {
		Session session=HibernateSessionFactory.getSession();
		String hql="from MotorCar where carnumber=?";
		Query query=session.createQuery(hql);
		query.setString(0, carnumber);
		return (MotorCar)query.uniqueResult();
	}

	public List<OutRecord> findyOutRecordByStatus(long status) throws MotorbikeCarException {
		Session session=HibernateSessionFactory.getSession();
		String hql="from OutRecord where status=?";
		Query query=session.createQuery(hql);
		query.setLong(0, status);
		return query.list();
	}

	public OutRecord findyOutRecordById(long id) throws MotorbikeCarException {
		Session session=HibernateSessionFactory.getSession();
		String hql="from OutRecord where id=?";
		Query query=session.createQuery(hql);
		query.setLong(0, id);
		return (OutRecord)query.uniqueResult();
	}

	public void updateOutRecord(OutRecord record) throws MotorbikeCarException {
		Session session=HibernateSessionFactory.getSession();
		session.update(record);
	}

	public BackRecord findyBackRecordById(long id) throws MotorbikeCarException {
		Session session=HibernateSessionFactory.getSession();
		String hql="from BackRecord where outid=?";
		Query query=session.createQuery(hql);
		query.setLong(0, id);
		return (BackRecord) query.uniqueResult();
	}

	public MotorCar findBestCar(long capacity) throws MotorbikeCarException {
		Session session=HibernateSessionFactory.getSession();
		String hql="from MotorCar where (capacity>? or capacity=?) and status='待命' order by capacity";
		Query query=session.createQuery(hql);
		query.setLong(0, capacity);
		query.setLong(1,capacity);
		List<MotorCar> list=new ArrayList<MotorCar>();
		list=query.list();
		return list.get(0);
	}
}
