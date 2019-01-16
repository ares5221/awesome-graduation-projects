package com.lhq.prj.bms.service.impl;

import java.util.List;

import com.lhq.prj.bms.dao.IDutyDao;
import com.lhq.prj.bms.po.Duty;
import com.lhq.prj.bms.service.IDutyService;

/**
 * DutyService.java Create on 2008-9-18 下午08:15:34
 * 
 * 职务业务层实现类
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
public class DutyService implements IDutyService {

	private IDutyDao dutyDao;

	public void setDutyDao(IDutyDao dutyDao) {
		this.dutyDao = dutyDao;
	}

	public boolean deleteDuty(Integer dutyId) {
		Integer flag = dutyDao.deleteById(dutyId);
		if (flag != null) {
			return true;
		}
		return false;
	}

	public List findAll() {
		return dutyDao.findAll();
	}

	public Object saveDuty(Duty duty) {
		return dutyDao.saveDuty(duty);
	}

	public boolean updateDuty(Duty duty) throws Exception {
		Integer flag = dutyDao.update(duty);
		if (flag != null) {
			return true;
		}
		return false;
	}

}
