package com.bjsxt.work.service.impl;

import java.util.List;

import com.bjsxt.work.dao.AdminDao;
import com.bjsxt.work.dao.StudentDao;
import com.bjsxt.work.dao.impl.AdminDaoImpl;
import com.bjsxt.work.dao.impl.StudentDaoImpl;
import com.bjsxt.work.entity.Admin;
import com.bjsxt.work.entity.Record;
import com.bjsxt.work.entity.Student;
import com.bjsxt.work.entity.Work;
import com.bjsxt.work.service.AdminService;

public class AdminServiceImpl implements AdminService {

	// 注入AdminDao
	private AdminDao adminDao = new AdminDaoImpl();
	
	// 注入学生dao
	StudentDao studentDao = new StudentDaoImpl();
	
	
	
	
	@Override
	public boolean login(Admin admin) {
		return this.adminDao.login(admin);
	}
	
	// 更新管理员信息
	@Override
	public boolean update(Admin admin) {
		
		return this.adminDao.update(admin);
	}

	// 查询所有已发布的作业
	@Override
	public List<Work> findAllWorkType() {
		return this.studentDao.findAllWorkType();
	}

	// 查询所有的提交记录
	@Override
	public List<Record> findAllRecords() {
		return this.adminDao.findAllRecords();
	}

	@Override
	public List<Student> findAllCWStudent() {
		return adminDao.findAllCWStudent();
	}

	@Override
	public int publish(Work work) {
		return adminDao.publish(work);
	}

	@Override
	public List<Work> showAllWork() {
		return adminDao.showAllWork();
	}

	// 删除作业
	@Override
	public int deleteWorkByHid(int hid) {
		
		int n = adminDao.delteRecordsByHid(hid);
		int m = adminDao.deleteWorkByHid(hid);
		return n > 0 && m > 0 ? 1 : 0;
	}

	

}
