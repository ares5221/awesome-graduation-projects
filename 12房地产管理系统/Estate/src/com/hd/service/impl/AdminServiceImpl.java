package com.hd.service.impl;

import java.util.List;

import com.hd.dao.AdminDao;
import com.hd.dao.impl.AdminDaoImpl;
import com.hd.entity.Department;
import com.hd.entity.UserInfo;
import com.hd.entity.UserRole;
import com.hd.service.AdminService;

public class AdminServiceImpl implements AdminService{
	AdminDao adminDao = new AdminDaoImpl();
	@Override
	public int addDept(Department dept) {
		
		return adminDao.save(dept);
	}
	@Override
	public int addRole(UserRole userRole) {
		return adminDao.saveRole(userRole);
	}
	@Override
	public int addUser(UserInfo userInfo) {
		return adminDao.saveUser(userInfo);
	}
	@Override
	public List<UserRole> findAllRole() {
		
		return adminDao.findAllRole();
	}
	@Override
	public int deleteRole(int role_id) {
		
		return adminDao.deleteRole(role_id);
	}
	
	@Override
	public int active(String email) {
		
		return adminDao.active(email);
	}
	//获取数据库所有部门信息
	@Override
	public List<Department> findAllDept() {
		
		return adminDao.findAllDept();
	}
}	
