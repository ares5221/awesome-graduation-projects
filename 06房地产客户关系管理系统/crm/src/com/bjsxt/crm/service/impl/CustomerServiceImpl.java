package com.bjsxt.crm.service.impl;

import java.sql.Date;
import java.util.List;

import com.bjsxt.crm.dao.CustomerDao;
import com.bjsxt.crm.dao.impl.CustomerDaoImpl;
import com.bjsxt.crm.entity.Customer;
import com.bjsxt.crm.service.CustomerService;
import com.bjsxt.crm.util.PageBean;



public class CustomerServiceImpl implements CustomerService {
	private CustomerDao customerDao = new CustomerDaoImpl();
	/**
	 * 查询客户来源
	 */
	@Override
	public List<Customer> findSource(String source_Name) {
		return this.customerDao.findSource(source_Name);
	}
	/**
	 * 添加客户功能
	 */
	@Override
	public int addSource(String source_Name) {
		
		return this.customerDao.addSource(source_Name);
	}
	/**
	 * 删除客户来源
	 */
	@Override
	public void updateSource(int source_id) {
		this.customerDao.updateSource(source_id);
		
	}
	/**
	 * 客户状态查询
	 */
	@Override
	public List<Customer> findCondition(String condition_name) {
		
		return this.customerDao.findCondition(condition_name);
	}
	/**
	 * 添加客户状态
	 */
	@Override
	public int addCondition(String condition_Name, String condition_Explain) {
		
		return this.customerDao.addCondition(condition_Name,condition_Explain);
	}
	/**
	 * 删除客户状态
	 */
	@Override
	public void updateCondition(int condition_id) {
		this.customerDao.updateCondition(condition_id);
		
	}
	/**
	 * 查询客户类型
	 */
	@Override
	public List<Customer> findcustType(String type_Name) {
		
		return this.customerDao.findcustType(type_Name);
	}
	/**
	 * 增加客户类型
	 */
	@Override
	public int addCuType(String type_Name) {
		return this.customerDao.addCuType(type_Name);
	}
	/**
	 * 删除客户类型
	 */
	@Override
	public void updateCuType(int type_id) {
		this.customerDao.updateCuType(type_id);
	}
	/**
	 * 查询客户关怀
	 
	@Override
	public List<Customer> findCare(int careQuery_Type, String customerInput) {
		// TODO Auto-generated method stub
		 return this.customerDao.findCare(careQuery_Type,customerInput);
	}
	*/
	/**
	 * 删除客户关怀
	 * @return 
	 */
	@Override
	public int updateCare(int care_id) {
		return this.customerDao.updateCare(care_id);
		
	}
	/**
	 * 预添加客户关怀，提前查询客户列表，获取客户信息
	 */
	@Override
	public List<Customer> findCustomer() {
		return this.customerDao.findCustomer();
	}
	/**
	 * 添加客户关怀
	 */
	@Override
	public int addCare(int customer_Id, String care_theme,
			String care_way, String care_remark, Date care_nexttime,
			String care_people) {
		// TODO Auto-generated method stub
		return this.customerDao.addCare(customer_Id,care_theme,care_way,care_remark,care_nexttime,care_people);
	}
	@Override
	public void findCare(PageBean<Customer> pageBean,
			int careQuery_Type, String customerInput) {
		int totalCount = this.customerDao.findCare(careQuery_Type, customerInput);
		pageBean.setTotalCount(totalCount);
		
		int startRow = pageBean.getStartRow();
		int endRow = pageBean.getEndRow();
		
		List<Customer> careList = this.customerDao.findCare2(startRow,endRow,careQuery_Type, customerInput);
		pageBean.setList(careList);
	}
	
	/**
	 * 查询所有员工
	 */
	@Override
	public List<Customer> findAll(int queryType,String customerInput) {
		return this.customerDao.findAll(queryType,customerInput);
	}
	/**
	 * 添加员工
	 */
	@Override
	public int addCus(Customer cus) {
		return this.customerDao.addCus(cus);
	}
	
	
	/**
	 * 根据员工编号查询员工信息
	 */
	@Override
	public Customer findById(int customer_ID) {
		return this.customerDao.findById(customer_ID);
	}
	
	/**
	 * 更新客户
	 */
	@Override
	public int updateCus(Customer cus) {
		return this.customerDao.updateCus(cus);
	}
	
	/**
	 * 删除客户
	 */
	@Override
	public int delCus(int customer_ID) {
		return this.customerDao.delCus(customer_ID);
	}
	
}
