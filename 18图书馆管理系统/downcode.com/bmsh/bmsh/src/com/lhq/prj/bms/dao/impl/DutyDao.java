package com.lhq.prj.bms.dao.impl;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.lhq.prj.bms.dao.IDutyDao;
import com.lhq.prj.bms.po.Duty;

/**
 * DutyDao.java Create on 2008-9-18 下午08:20:57
 * 
 * 职务管理持久层
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
public class DutyDao extends SqlMapClientDaoSupport implements IDutyDao {

	public Integer deleteById(Integer dutyId) {
		return getSqlMapClientTemplate().delete("Duty.deleteById", dutyId);
	}

	public List findAll() {
		return getSqlMapClientTemplate().queryForList("Duty.findAll");
	}

	public Object saveDuty(Duty duty) {
		return getSqlMapClientTemplate().insert("Duty.save", duty);
	}

	public Integer update(Duty duty) throws Exception {
		return getSqlMapClientTemplate().update("Duty.update", duty);
	}

}
