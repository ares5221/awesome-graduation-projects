package com.hd.service;

import java.util.List;

import com.hd.entity.Department;
import com.hd.util.PageBean;

public interface DepartmentService {

	void delete(int department_id);

	List<Department> findAll();

	/**
	 * @param pageBean
	 * @param deptName
	 */
	void find(PageBean<Department> pageBean, String deptName);

}
