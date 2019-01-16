package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Company;
import com.lhq.prj.bms.po.Dept;

/**
 * IDeptDao.java Create on 2008-9-16 下午10:41:23
 * 
 * 部门管理持久层接口
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
public interface IDeptDao {
	/**
	 * 保存一个部门实体到数据库
	 * 
	 * @param dept
	 *            部门实体
	 * @return 主键id
	 */
	public Object saveDept(Dept dept);

	/**
	 * 查找所有部门
	 * 
	 * @return
	 */
	public List findAll();

	/**
	 * 分页查找
	 * 
	 * @param page
	 *            条件
	 * @return
	 */
	public List findByPage(Page page);

	/**
	 * 分页查找的总记录
	 * 
	 * @param page
	 *            条件
	 * @return
	 */
	public int findByCount(Page page);

	/**
	 * 修改部门信息
	 * 
	 * @param dept
	 * @return
	 * @throws Exception
	 */
	public Integer update(Dept dept) throws Exception;

	/**
	 * 根据id删除部门
	 * 
	 * @param deptId
	 * @return
	 */
	public Integer deleteById(Integer deptId);

	/**
	 * 根据分公司找部门
	 *
	 * @param company
	 * @return
	 */
	public List findDeptByCompany(Company company);
}
