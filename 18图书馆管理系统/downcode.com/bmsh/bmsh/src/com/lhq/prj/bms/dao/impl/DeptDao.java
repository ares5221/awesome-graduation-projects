package com.lhq.prj.bms.dao.impl;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.dao.IDeptDao;
import com.lhq.prj.bms.po.Company;
import com.lhq.prj.bms.po.Dept;

/**
 * DeptDao.java Create on 2008-9-16 下午10:43:05
 * 
 * 部门持久层实现
 * Download by http://www.codefans.net
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
public class DeptDao extends SqlMapClientDaoSupport implements IDeptDao {

	public Integer deleteById(Integer deptId) {
		return getSqlMapClientTemplate().delete("Dept.deleteById", deptId);
	}

	public List findAll() {
		return getSqlMapClientTemplate().queryForList("Dept.findAll");
	}

	public int findByCount(Page page) {
		return (Integer) getSqlMapClientTemplate().queryForObject("Dept.findByCount", page);
	}

	public List findByPage(Page page) {
		return getSqlMapClientTemplate().queryForList("Dept.findByPage", page);
	}

	public Object saveDept(Dept dept) {
		return getSqlMapClientTemplate().insert("Dept.save", dept);
	}

	public Integer update(Dept dept) throws Exception {
		return getSqlMapClientTemplate().update("Dept.update", dept);
	}

	public List findDeptByCompany(Company company) {
		return getSqlMapClientTemplate().queryForList("Dept.findDeptByCompany",company);
	}

}
