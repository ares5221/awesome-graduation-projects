package com.lhq.prj.bms.service;

import java.util.List;
// Download by http://www.codefans.net
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Company;

public interface ICompanyService {
	
	/**
	 * 添加分公司
	 * @param company
	 * @return
	 */
	Object saveCompany(Company company);

	/**
	 * 查找所有分公司
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
	 * 修改公司信息
	 * @param c
	 * @return
	 * @throws Exception 
	 */
	boolean updateCompany(Company c) throws Exception;

	/**
	 * 删除分公司
	 * 
	 * @param companyId
	 * @return
	 */
	boolean deleteCompany(Integer companyId);
	

}
