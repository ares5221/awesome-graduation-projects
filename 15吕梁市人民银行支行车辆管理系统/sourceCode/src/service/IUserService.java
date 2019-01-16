package service;

import java.util.List;

import common.exception.UserException;

import dao.bean.BackRecord;
import dao.bean.Driver;
import dao.bean.User;

public interface IUserService {
	//用户注册
	public abstract void register(User user)throws UserException;
	//用户注销
	public abstract void logout(User user) throws UserException;
	//修改用户信息
	public abstract void modify(User user) throws UserException;
	//查找所有用户
	public abstract List findAllUser()throws UserException;
	//按用户名查找用户
	public abstract User findByNickName(String nickname) throws UserException;
	//用户登录
	public abstract User login(String nickname,String passwd) throws UserException;
	//设置所有用户在线状态为0
	public abstract void setAllIsonline() throws UserException;
	//增加驾驶人员
	public abstract void addDriver(Driver driver) throws UserException;
	//根据员工编号查找员工
	public abstract Driver findDriverById(long id) throws UserException;
	//根据员工姓名查找员工
	public abstract Driver findDriver(String name) throws UserException;
	//查找所有的员工信息
	public abstract List<Driver> findAllDrivers() throws UserException;
	//找回密码
	public abstract String findMissingPassword(String username,String question,String answer) throws UserException;
	//按条件查询车队人员信息
	public abstract List<Driver> findDriverByCondition(String gender,String age,String cartype) throws UserException;
}
