package com.lhq.prj.bms.dao.impl;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.dao.ICompanyDao;
import com.lhq.prj.bms.po.Company;

/**
 * DeptDao.java Create on 2008-9-16 下午10:43:05
 * 
 * 分公司持久层实现
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
public class CompanyDao extends SqlMapClientDaoSupport implements ICompanyDao {

	public Object saveCompany(Company company) {
		return getSqlMapClientTemplate().insert("Company.save", company);
	}

	public List findAll() {
		return getSqlMapClientTemplate().queryForList("Company.findAll");
	}

	public int findByCount(Page page) {
		return (Integer) getSqlMapClientTemplate().queryForObject("Company.findByCount", page);
	}

	public List findByPage(Page page) {
		return getSqlMapClientTemplate().queryForList("Company.findByPage", page);
	}

	public Integer update(Company company) throws Exception {
		return getSqlMapClientTemplate().update("Company.update", company);
	}

	public Integer deleteById(Integer companyId) {
		return getSqlMapClientTemplate().delete("Company.deleteById", companyId);
	}

}
