package com.hd.service;

import java.util.List;

import com.hd.entity.Customer;
import com.hd.entity.CustomerCare;
import com.hd.util.PageBean;

public interface CustomerService {

	List<Customer> findAll();

	/**
	 * 根据客户id删除客户
	 * 
	 * @param customer_id
	 */
	boolean delete(int customer_id);

	/**
	 * @param pageBean
	 * @param queryType
	 * @param customerInput
	 * @return
	 */
	void find(PageBean<Customer> pageBean, String queryType,
			String customerInput);

	/**
	 * 添加客户
	 * 
	 * @param customer
	 * @return
	 */
	boolean add(Customer customer);

	/**
	 * 根据指定id获取客户信息
	 * 
	 * @param customer_id
	 * @return
	 */
	Customer showById(int customer_id);

	/**
	 * 展示所有需要分配的客户
	 * @return
	 */
	List<Customer> showDistributeList();

	/**
	 * 更新客户信息
	 * @param customer
	 * @return
	 */
	boolean update(Customer customer);

	/**
	 * @param days
	 * @return
	 */
	List<Customer> findDateCustomer(int days);

	
}
