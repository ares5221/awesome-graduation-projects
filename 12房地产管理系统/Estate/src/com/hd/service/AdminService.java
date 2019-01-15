package com.hd.service;

import java.util.List;

import com.hd.entity.Department;
import com.hd.entity.UserInfo;
import com.hd.entity.UserRole;

public interface AdminService {
	//增加部门的方法
	public int addDept(Department dept);
	//增加角色的方法
	public int addRole(UserRole userRole);
	//增加员工的方法
	public int addUser(UserInfo userInfo);
	//获取所有角色的方法
	public List<UserRole> findAllRole();
	//删除角色的方法
	public int deleteRole(int role_id);
	//员工邮箱激活方法
	public int active(String email);
	//获取数据库中所有部门信息
	public List<Department> findAllDept();
}
