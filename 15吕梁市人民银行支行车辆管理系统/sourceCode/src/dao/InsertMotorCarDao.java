package dao;

import java.util.List;

import common.exception.MotorbikeCarException;

import dao.bean.ApplicationRecord;
import dao.bean.BackRecord;
import dao.bean.MotorCar;
import dao.bean.OutRecord;

public interface InsertMotorCarDao{
	//增加或修改车辆
	public abstract void saveOrUpdate(MotorCar car) throws MotorbikeCarException;
	//查找所有车辆信息
	public abstract List<MotorCar> findAllCar() throws MotorbikeCarException;
	//添加出车信息
	public abstract void addOutRecord(OutRecord record) throws MotorbikeCarException;
	//添加返车信息
	public abstract void addBackRecord(BackRecord record) throws MotorbikeCarException;
	//打印出车明细
	public abstract List<OutRecord> findAllOutRecord() throws MotorbikeCarException;
	//打印返车明细
	public abstract List<BackRecord> findAllBackRecord() throws MotorbikeCarException;
	//添加用车申请记录
	public abstract void saveAppRecord(ApplicationRecord record) throws MotorbikeCarException;
	//更新用车记录
	public abstract void updateAppRecord(ApplicationRecord record) throws MotorbikeCarException;
	//通过车辆编号查找车辆信息
	public abstract MotorCar findOneCar(long id) throws MotorbikeCarException;
	//通过条件查询车辆信息
	public abstract List<MotorCar> findCarsByCondition(String cartype,String status) throws MotorbikeCarException;
	//记录处理状态查找所有申请记录
	public abstract List<ApplicationRecord> findAppRecord(long status) throws MotorbikeCarException;
	//通过编号查申请记录信息
	public abstract ApplicationRecord findAppById(long id) throws MotorbikeCarException;
	//通过车牌号查找车辆信息
	public abstract MotorCar findCarByNumber(String carnumber)throws MotorbikeCarException;
	//通过状态查询出车记录
	public abstract List<OutRecord> findyOutRecordByStatus(long status) throws MotorbikeCarException;
	//通过id查找出车记录
	public abstract OutRecord findyOutRecordById(long id) throws MotorbikeCarException;
	//更新出车记录的状态
	public abstract void updateOutRecord(OutRecord record) throws MotorbikeCarException;
	//根据id查找返车记录
	public abstract BackRecord findyBackRecordById(long id) throws MotorbikeCarException;
	//查找最适合的出车车辆
	public abstract MotorCar findBestCar(long capacity) throws MotorbikeCarException;
}
