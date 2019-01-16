package com.lhq.prj.bms.service.impl;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.dao.IDeptDao;
import com.lhq.prj.bms.po.Company;
import com.lhq.prj.bms.po.Dept;
import com.lhq.prj.bms.service.IDeptService;

/**    
 * DeptService.java Create on 2008-9-16 ÏÂÎç10:40:48   
 *
 *
 *
 * Copyright (c) 2008 by MTA.
 *
 * @author ÁÎå«Çä
 * @version 1.0  
 */
public class DeptService implements IDeptService {
	
	private IDeptDao deptDao;

	public void setDeptDao(IDeptDao deptDao) {
		this.deptDao = deptDao;
	}

	public boolean deleteDept(Integer deptId) {
		Integer flag = deptDao.deleteById(deptId);
		if(flag != null){
			return true;
		}
		return false;
	}

	public List findAll() {
		return deptDao.findAll();
	}

	public Page findByPage(Page page) {
		page.setRoot(deptDao.findByPage(page));
		page.setTotalProperty(deptDao.findByCount(page));
		return page;
	}

	public Object saveDept(Dept dept) {
		return deptDao.saveDept(dept);
	}

	public boolean updateDept(Dept dept) throws Exception {
		Integer flag = deptDao.update(dept);
		if(flag != null){
			return true;
		}
		return false;
	}

	public Page findDeptByCompany(Page page) {
		page.setRoot(deptDao.findDeptByCompany((Company) page.getConditions().get(0)));
		return page;
	}


}
 