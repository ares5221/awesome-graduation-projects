package com.hd.dao;

import java.util.List;

import com.hd.entity.Department;
import com.hd.entity.UserInfo;
import com.hd.entity.UserRole;

public interface AdminDao {
	//增加部门
	public int save(Department dept);

	public int saveRole(UserRole userRole);

	public int saveUser(UserInfo userInfo);

	public List<UserRole> findAllRole();

	public int deleteRole(int role_id);

	public int active(String email);

	public List<Department> findAllDept();
}
