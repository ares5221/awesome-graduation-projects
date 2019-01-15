package com.hd.service.impl;

import java.util.List;

import com.hd.dao.EmployeeDao;
import com.hd.dao.impl.EmployeeDaoImpl;
import com.hd.entity.UserInfo;
import com.hd.service.EmployeeService;
import com.hd.util.PageBean;

	
public class EmployeeServiceImpl implements EmployeeService {
	private EmployeeDao employeeDao = new EmployeeDaoImpl() ;
	@Override
	public int upDate(UserInfo ui) {
		
		return this.employeeDao.upDate(ui);
	}
	@Override
	public UserInfo login(String userNum, String userPw) {
		
		return this.employeeDao.login(userNum,userPw);
	}
	@Override
	public int delete(int user_id) {
		return this.employeeDao.delete(user_id);
		
	}
	@Override
	public List<UserInfo> findAll() {
		return this.employeeDao.findAll();
	}
	@Override
	public UserInfo findById(int user_id) {
		
		return this.employeeDao.findById(user_id);
	}
	/* 
	 * 
	 * 分页查询
	 */
	@Override
	public void find(PageBean<UserInfo> pageBean, String selectType,
			String selectContent) {
		int count = employeeDao.findRequiredCount(selectType,selectContent);
		pageBean.setTotalCount(count);
		int start = pageBean.getStartRow();
		int size = pageBean.getSize();
		List<UserInfo> list = employeeDao.findRequiredItems(start,size,selectType,selectContent);
		pageBean.setList(list);
		
		
	}

}
