package com.hd.service.impl;

import java.util.List;

import com.hd.dao.DepartmentDao;
import com.hd.dao.impl.DepartmentDaoImpl;
import com.hd.entity.Department;
import com.hd.service.DepartmentService;
import com.hd.util.PageBean;

public class DepartmentServiceImpl implements DepartmentService {
	private DepartmentDao departmentDao = new DepartmentDaoImpl();
	@Override
	public void delete(int department_id) {
		this.departmentDao.delete(department_id);
		
	}
	@Override
	public List<Department> findAll() {
		return this.departmentDao.findAll();
	}
	/* 获取符合查询条件的信息
	 */
	@Override
	public void find(PageBean<Department> pageBean, String deptName) {
		int count = departmentDao.findRequiredCount(deptName);
		pageBean.setTotalCount(count);
		int start = pageBean.getStartRow();
		int size = pageBean.getSize();
		List<Department> list = departmentDao.findRequiredItems(start,size,deptName);
		System.out.println("siez"+list.size());
		pageBean.setList(list);
	}

}
