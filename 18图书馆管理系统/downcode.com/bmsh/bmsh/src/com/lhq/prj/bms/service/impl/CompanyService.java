package com.lhq.prj.bms.service.impl;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.dao.ICompanyDao;
import com.lhq.prj.bms.po.Company;
import com.lhq.prj.bms.service.ICompanyService;

public class CompanyService implements ICompanyService {

	private ICompanyDao companyDao;

	public void setCompanyDao(ICompanyDao companyDao) {
		this.companyDao = companyDao;
	}

	public Object saveCompany(Company company) {
		return companyDao.saveCompany(company);
	}

	public List findAll() {
		return companyDao.findAll();
	}

	public Page findByPage(Page page) {
		page.setRoot(companyDao.findByPage(page));
		page.setTotalProperty(companyDao.findByCount(page));
		return page;
	}

	public boolean updateCompany(Company c) throws Exception {
		Integer flag = companyDao.update(c);
		if(flag != null){
			return true;
		}
		return false;
	}

	public boolean deleteCompany(Integer companyId) {
		Integer flag = companyDao.deleteById(companyId);
		if(flag != null){
			return true;
		}
		return false;
	}

}
