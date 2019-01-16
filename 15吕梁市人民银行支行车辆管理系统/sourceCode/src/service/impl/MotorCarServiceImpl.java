package service.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import service.IMotorCarService;

import common.exception.MotorbikeCarException;
import common.transaction.HibernateTransaction;
import common.util.BeanFactory;
import common.util.HibernateSessionFactory;

import dao.InsertMotorCarDao;
import dao.bean.ApplicationRecord;
import dao.bean.BackRecord;
import dao.bean.MotorCar;
import dao.bean.OutRecord;

public class MotorCarServiceImpl implements IMotorCarService {
	private InsertMotorCarDao cardao = (InsertMotorCarDao) BeanFactory
			.getBean("motorcarDao");

	public void addBackRecord(BackRecord record) throws MotorbikeCarException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			cardao.addBackRecord(record);
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new MotorbikeCarException("添加返车信息失败");
		}

	}

	public void addMotorCar(MotorCar car) throws MotorbikeCarException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			cardao.saveOrUpdate(car);
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new MotorbikeCarException("增加或修改车辆信息出错");
		}

	}

	public void addOutRecord(OutRecord record) throws MotorbikeCarException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			cardao.addOutRecord(record);
			MotorCar car=record.getMotorcar();
			car.setStatus("出车");
			cardao.saveOrUpdate(car);
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new MotorbikeCarException("添加出车信息失败");
		}
	}

	public void addAppRecord(ApplicationRecord record) throws MotorbikeCarException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			cardao.saveAppRecord(record);
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new MotorbikeCarException("添加申请单失败");
		}
	}

	public void endorsement(ApplicationRecord record) throws MotorbikeCarException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			cardao.updateAppRecord(record);
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new MotorbikeCarException("调度失败");
		}
	}

	public List findAllCar() throws MotorbikeCarException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			List<MotorCar> list = cardao.findAllCar();
			tran.commit();
			return list;
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new MotorbikeCarException("查找所有车辆信息失败");
		}
	}

	public List listBackRecord() throws MotorbikeCarException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			List<BackRecord> list = cardao.findAllBackRecord();
			tran.commit();
			return list;
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new MotorbikeCarException("查找所有返车明细出错");
		}
	}

	public List listOutRecord() throws MotorbikeCarException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			List<OutRecord> list = cardao.findAllOutRecord();
			tran.commit();
			return list;
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new MotorbikeCarException("查找所有出车明细出错");
		}
	}

	public List listMotorCar() throws MotorbikeCarException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			List<MotorCar> list = cardao.findAllCar();
			tran.commit();
			return list;
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new MotorbikeCarException("查找所有车辆列表失败");
		}
	}

	public MotorCar findOneCar(long id) throws MotorbikeCarException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			MotorCar car = cardao.findOneCar(id);
			tran.commit();
			return car;
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new MotorbikeCarException("查找指定车辆信息出错");
		}
	}

	public List<MotorCar> findCarByCondition(String cartype, String status)
			throws MotorbikeCarException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			List list = cardao.findCarsByCondition(cartype, status);
			tran.commit();
			return list;
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new MotorbikeCarException("按条件查询失败");
		}
	}

	public List<ApplicationRecord> findAppRecord(long status) throws MotorbikeCarException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			List<ApplicationRecord> list = cardao.findAppRecord(status);
			tran.commit();
			return list;
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new MotorbikeCarException(
					"根据状态信息查找申请记录失败");
		}
	}

	public ApplicationRecord findAppById(long id) throws MotorbikeCarException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			ApplicationRecord record = cardao.findAppById(id);
			tran.commit();
			return record;
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new MotorbikeCarException(
					"通过id查找申请记录信息失败");
		}
	}

	public void updateAppRecord(ApplicationRecord record) throws MotorbikeCarException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			cardao.updateAppRecord(record);
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new MotorbikeCarException("更新申请记录信息失败");
		}

	}

	public MotorCar findCarByNumber(String carnumber) throws MotorbikeCarException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			MotorCar car = cardao.findCarByNumber(carnumber);
			tran.commit();
			return car;
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new MotorbikeCarException("通过车牌号查找车辆失败");
		}
	}

	public List<OutRecord> findOutRecordByStatus(long status)
			throws MotorbikeCarException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			List list = cardao.findyOutRecordByStatus(status);
			tran.commit();
			return list;
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new MotorbikeCarException(
					"通过状态信息查找出车记录失败");
		}
	}

	public OutRecord findOutRecordById(long id) throws MotorbikeCarException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			OutRecord record = cardao.findyOutRecordById(id);
			tran.commit();
			return record;
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new MotorbikeCarException("根据id查找出车信息失败");
		}
	}

	public void addBackRecord(long outid, String backdate, long day, long cost)
			throws MotorbikeCarException {
		HibernateTransaction tran = new HibernateTransaction();
		try {
			tran.beginTransaction();
			BackRecord record = new BackRecord();
			record.setBackdate(backdate);
			record.setCost(cost);
			record.setDay(day);
			record.setOutid(outid);
			OutRecord outrecord = cardao.findyOutRecordById(outid);
			record.setOutrecord(outrecord);
			cardao.addBackRecord(record);
			outrecord.setStatus(1);
			cardao.updateOutRecord(outrecord);
			MotorCar car=outrecord.getMotorcar();
			car.setStatus("待命");
			cardao.saveOrUpdate(car);
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			throw new MotorbikeCarException("保存回车记录失败");
		}

	}

	public BackRecord findBackRecordById(long id) throws MotorbikeCarException {
		HibernateTransaction tran=new HibernateTransaction();
		try{
			tran.beginTransaction();
			BackRecord record=cardao.findyBackRecordById(id);
			tran.commit();
			return record;
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw new MotorbikeCarException("根据id查找返车记录失败");
		}
	}

	public MotorCar findBestCar(long capacity) throws MotorbikeCarException {
		HibernateTransaction tran=new HibernateTransaction();
		try{
			tran.beginTransaction();
			MotorCar car=cardao.findBestCar(capacity);
			tran.commit();
			return car;
		}catch(Exception e){
			e.printStackTrace();
			throw new MotorbikeCarException("查找出车车辆失败");
		}
	}
}
