package com.hd.dao;

import java.util.List;

import com.hd.entity.Customer;

public interface CustomerDao {

	List<Customer> showAll();

	/**
	 * 根据客户id删除指定客户
	 * @param customer_id
	 * @return
	 */
	int delete(int customer_id);

	/**
	 * @param queryType
	 * @param customerInput
	 * @return
	 */
	int findRequiredCount(String queryType, String customerInput);

	/**
	 * @param start
	 * @param size
	 * @param queryType
	 * @param customerInput
	 * @return
	 */
	List<Customer> findRequiredCustomer(int start, int size, String queryType,
			String customerInput);
	
	/**
	 * 添加客户
	 * @param customer
	 * @return
	 */
	int save(Customer customer);

	/**
	 * 根据指定id查找客户
	 * @param customer_id
	 * @return
	 */
	Customer findById(int customer_id);

	/**
	 * 展示所有需要分配的客户列表
	 * @return
	 */
	List<Customer> findDistributeList();

	/**
	 * 更新编辑客户信息
	 * @param customer
	 * @return
	 */
	int update(Customer customer);

	/**
	 * @param days
	 * @return
	 */
	List<Customer> findDateCustomer(int days);
}
