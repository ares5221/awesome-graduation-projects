package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Company;

public interface ICompanyDao {

	/**
	 * 保存一个公司实体到数据库
	 * 
	 * @param company
	 * @Download by http://www.codefans.net
	 * @return 主键id
	 */
	public Object saveCompany(Company company);

	/**
	 * 查找所有分公司
	 * @return
	 */
	public List findAll();

	/**
	 * 分页查找
	 * @param page 条件
	 * @return
	 */
	public List findByPage(Page page);

	/**
	 * 分页查找的总记录
	 * @param page 条件
	 * @return
	 */
	public int findByCount(Page page);

	/**
	 * 修改公司信息
	 * @param c
	 * @return
	 * @throws Exception 
	 */
	public Integer update(Company c) throws Exception;

	/**
	 * 根据id删除分公司
	 * 
	 * @param companyId
	 * @return
	 */
	public Integer deleteById(Integer companyId);
}
