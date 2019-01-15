package com.bjsxt.school.dao;

import java.util.List;

import com.bjsxt.school.entity.User;




public interface UserDao {
	/**
	 * 按照用户名查询用户用户
	 * @param userId
	 * 
	 * @return
	 */
	public User findById(String userId);
	
	public List<User> findAll(String userId, String userName);

	/**
	 * 添加用户信息
	 * @param admin
	 * @return
	 */
	public int save(User user);
	/**
	 * 更新用户信息
	 * @param admin
	 * @return
	 */
	public int update(User user);
	/**
	 * 删除用户信息
	 * @param admin
	 * @return
	 */
	
	public  void deleteUser(String userId);
	
	/**
	 * 按照用户名和密码查询用户信息
	 * @param userId
	 * @param password
	 * @return
	 */
	public User find(String userId,String password);

	
	
	

}
