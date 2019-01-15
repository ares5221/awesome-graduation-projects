package com.bjsxt.school.service;

import java.util.List;

import com.bjsxt.school.entity.User;



public interface UserService {

	public int addUser(User user);

	public void deleteUser(String userId);

	public int update(User user);

	public List<User> findAll(String userId, String userName);

	public User findById(String userId);

	public User login(String userId, String password);

	public List<User> find(String userId, String userName);

	

	


	
}
