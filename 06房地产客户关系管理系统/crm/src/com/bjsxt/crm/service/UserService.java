package com.bjsxt.crm.service;

import java.util.List;

import com.bjsxt.crm.entity.Department;
import com.bjsxt.crm.entity.Role;
import com.bjsxt.crm.entity.User;
import com.bjsxt.crm.util.PageBean;

public interface UserService {



	public int addUser(User user);


	 public List<User> showUser( String queryType, String content);

	public int delUser(int userId);

	/**
	 * 角色增删改查
	 * @param role
	 * @return
	 */
	
	//	添加角色方法
	public int addRole(Role role);
	
	//条件查询角色
	public List<Role> showRole(String role_name, int role_power);
	
	//	删除指定ID的角色
	public void deleteRole(int role_ID);
	
	//准备修改角色
	public Role toUpdateRole(int role_ID);
	
	//修改角色
	public int update(Role role);

	public User findById(int userId);


	public int upDateById(User user);

	//	条件查询角色办法 带分页
	public void showRole(PageBean pageBean, String role_name,
			int role_power);


	//public List<User> showUserByCdt(int userId,String queryType,String condition);


	





}
