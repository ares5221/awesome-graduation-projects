package com.hd.dao;

import java.util.List;

import com.hd.entity.Department;

public interface DepartmentDao {

	void delete(int department_id);

	List<Department> findAll();

	/**
	 * @param deptName
	 * @return
	 */
	int findRequiredCount(String deptName);

	/**
	 * @param start
	 * @param size
	 * @param deptName
	 * @return
	 */
	List<Department> findRequiredItems(int start, int size, String deptName);

}
