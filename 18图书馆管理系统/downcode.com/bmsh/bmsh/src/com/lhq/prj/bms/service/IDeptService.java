package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Dept;

/**    
 * IDeptService.java Create on 2008-9-16 下午10:38:57   
 *
 * 
 *
 * Copyright (c) 2008 by MTA.
 *
 * @author 廖瀚卿
 * @version 1.0  
 */
public interface IDeptService {
	/**
	 * 添加部门
	 * @param dept
	 * @return
	 */
	Object saveDept(Dept dept);

	/**
	 * 查找所有部门
	 * @return
	 */
	List findAll();

	/**
	 * 分页查找
	 * @param page 分页对象
	 * @return
	 */
	Page findByPage(Page page);

	/**
	 * 修改部门信息
	 * @param dept
	 * @return
	 * @throws Exception 
	 */
	boolean updateDept(Dept dept) throws Exception;

	/**
	 * 删除部门
	 * 
	 * @param deptId
	 * @return
	 */
	boolean deleteDept(Integer deptId);

	/**
	 * 根据公司查找所有部门
	 *
	 * @param page
	 * @return
	 */
	Page findDeptByCompany(Page page);
}
 