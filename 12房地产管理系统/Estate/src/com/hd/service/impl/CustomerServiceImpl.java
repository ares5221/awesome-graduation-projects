package com.hd.service.impl;

import java.util.List;

import com.hd.dao.CustomerDao;
import com.hd.dao.impl.CustomerDaoImpl;
import com.hd.entity.Customer;
import com.hd.entity.CustomerCare;
import com.hd.service.CustomerService;
import com.hd.util.PageBean;

public class CustomerServiceImpl implements CustomerService {
	private CustomerDao customerDao = new CustomerDaoImpl();

	@Override
	public List<Customer> findAll() {
		return this.customerDao.showAll();
	}

	@Override
	public boolean delete(int customer_id) {
		return customerDao.delete(customer_id) > 0;
	}

	/*
	 * 获取每页数据
	 */
	@Override
	public void find(PageBean<Customer> pageBean, String queryType,
			String customerInput) {
		// 获取符合条件的所有数据条目
		int n = customerDao.findRequiredCount(queryType, customerInput);
		pageBean.setTotalCount(n);
		int start = pageBean.getStartRow();
		int size = pageBean.getSize();

		List<Customer> list = customerDao.findRequiredCustomer(start, size,
				queryType, customerInput);

		pageBean.setList(list);

	}

	@Override
	public boolean add(Customer customer) {
		return customerDao.save(customer) > 0;
	}

	@Override
	public Customer showById(int customer_id) {
		return customerDao.findById(customer_id);
	}

	@Override
	public List<Customer> showDistributeList() {
		return customerDao.findDistributeList();
	}

	@Override
	public boolean update(Customer customer) {
		return customerDao.update(customer) > 0;
	}

	/* 
	 * 获取符合日期数据
	 */
	@Override
	public List<Customer> findDateCustomer(int days) {
		
		return customerDao.findDateCustomer(days);
	}

	

}
