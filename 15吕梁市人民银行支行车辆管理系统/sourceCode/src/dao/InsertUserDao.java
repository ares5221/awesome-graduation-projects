package dao;

import java.util.List;

import common.exception.UserException;

import dao.bean.Driver;
import dao.bean.User;

public interface InsertUserDao {
	// 保存或修改用户信息
	public abstract void saveOrUpate(User user) throws UserException;

	// 增加驾驶人员
	public abstract void addDriver(Driver driver) throws UserException;

	// 按用户名查找用户信息
	public abstract User findUser(String nickname) throws UserException;

	// 设置所有用户的在线状态为0
	public abstract void setIsonline() throws UserException;

	// 查找所有用户
	public abstract List<User> findAllUser() throws UserException;

	// 按id查找员工信息
	public abstract Driver findDriverById(long id) throws UserException;

	// 按姓名查找Driver
	public abstract Driver findDriver(String name) throws UserException;

	// 查找所有驾驶人员
	public abstract List<Driver> findAllDrivers() throws UserException;

	// 按条件查找车队人员信息
	public abstract List<Driver> findDriverByCondition(String gender,
			long maxage, long minage, String cartype) throws UserException;

}
