package service;

import java.util.List;

import common.exception.MotorbikeCarException;

import dao.bean.ApplicationRecord;
import dao.bean.BackRecord;
import dao.bean.MotorCar;
import dao.bean.OutRecord;

public interface IMotorCarService {
	//登记车辆
	public abstract void addMotorCar(MotorCar car)throws MotorbikeCarException;
	//查找所有车辆状态信息
	public abstract List findAllCar() throws MotorbikeCarException;
	//用车申请
	public abstract void addAppRecord(ApplicationRecord record) throws MotorbikeCarException;
	//用车审批
	public abstract void endorsement(ApplicationRecord record) throws MotorbikeCarException;
	//发车记录
	public abstract void addOutRecord(OutRecord record) throws MotorbikeCarException;
	//回车记录
	public abstract void addBackRecord(BackRecord record) throws MotorbikeCarException;
	//打印所有车辆信息
	public abstract List listMotorCar() throws MotorbikeCarException;
	//打印出车明细
	public abstract List listOutRecord()throws MotorbikeCarException;
	//打印回车明细
	public abstract List listBackRecord() throws MotorbikeCarException;
	//通过车辆编号查找车辆信息
	public abstract MotorCar findOneCar(long id) throws MotorbikeCarException;
	//按条件查询车辆信息
	public abstract List<MotorCar> findCarByCondition(String cartype,String status)throws MotorbikeCarException;
	//根据记录状态查找所有申请记录 
	public abstract List<ApplicationRecord> findAppRecord(long status) throws MotorbikeCarException;
	//通过编号查申请记录信息
	public abstract ApplicationRecord findAppById(long id) throws MotorbikeCarException;
	//更新审请记录
	public abstract void updateAppRecord(ApplicationRecord record) throws MotorbikeCarException;
	//通过车牌号查找车辆
	public abstract MotorCar findCarByNumber(String carnumber)throws MotorbikeCarException;
	//查找所有还未归车辆的出车记录
	public abstract List<OutRecord> findOutRecordByStatus(long status) throws MotorbikeCarException;
	//根据出车单号查找出车信息
	public abstract OutRecord findOutRecordById(long id) throws MotorbikeCarException;
	//记录回车记录
	public abstract void  addBackRecord(long outid,String backdate,long day,long cost) throws MotorbikeCarException;
	//通过id查找返车记录
	public abstract BackRecord  findBackRecordById(long id) throws MotorbikeCarException; 
	//查找最佳出车车辆
	public abstract MotorCar findBestCar(long capacity) throws MotorbikeCarException;
}
