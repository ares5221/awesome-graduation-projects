package com.bjsxt.school.service.impl;

import java.util.List;

import com.bjsxt.school.dao.UserDao;
import com.bjsxt.school.dao.impl.UserDaoImpl;
import com.bjsxt.school.entity.User;
import com.bjsxt.school.service.UserService;




public class UserServiceImpl implements UserService{
	UserDao userDao= new UserDaoImpl();
	@Override
	public int addUser(User user) {
		
		return userDao.save(user);
	}
	@Override
	public void deleteUser(String userId) {
		
		userDao.deleteUser(userId);
	}
	@Override
	public int update(User user) {
		
		return this.userDao.update(user);
	}
	@Override
	public List<User> findAll(String userId, String userName) {
		
		return userDao.findAll(userId,userName);
	}
	@Override
	public User findById(String userId) {
		
		return userDao.findById(userId);
	}
	//@Override
	//public User login(String userId, String password) {
		private UserDao userDao1 = new UserDaoImpl();
		@Override
		public User login(String userId, String password) {		
			return this.userDao.find(userId, password);
		}
	
		//return userDao.find(userId, password);
	
	@Override
	public List<User> find(String userId, String userName) {
		
		return (List<User>) userDao.find(userId, userName);
	}
	
}
