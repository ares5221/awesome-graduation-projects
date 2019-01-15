package com.bjsxt.crm.dao;

import java.util.List;

import com.bjsxt.crm.entity.Role;
import com.bjsxt.crm.entity.User;

public interface UserDao {


	public int add(User user);

	//public List<User> findAll();

	public int delete(int userId);

	//public User findById(int userId);

	
	
	/**
	 * 角色增删改查
	 * @param role
	 * @return
	 */
	//添加角色方法
	public int addRole(Role role);
	
	//条件查询角色方法
	public List<Role> showRole(String role_name, int role_power);

	//删除指定ID的角色
	public void deleteRole(int role_ID);

	//准备修改角色
	public Role toUpdateRole(int role_ID);

	//修改角色
	public int update(Role role);

	public int upDate(User user);

	public List<User> find(String queryType,String condition);

	User findById(int userId);

	//角色分页方法1
	public int findCount(String role_name, int role_power);


	//	角色分页方法2
	public List<Role> findRole(int start, int end, String role_name,
			int role_power);
}
