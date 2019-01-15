package com.hd.service.impl;

import java.util.List;

import com.hd.dao.CustomerLinkDao;
import com.hd.dao.impl.CustomerLinkDaoImpl;
import com.hd.entity.CustomerLinkReord;
import com.hd.service.CustomerLinkService;

/**
 * 客户联系业务层实现类
 * 
 * @author wmy
 * @day 2017年8月17日
 * @time 下午6:28:41
 * 
 */
public class CustomerLinkServiceImpl implements CustomerLinkService {
	/**
	 * 客户联系持久层操作对象
	 */
	private CustomerLinkDao customerLinkDao = new CustomerLinkDaoImpl();

	@Override
	public List<CustomerLinkReord> showBeforeTime(int days) {
		return customerLinkDao.findBeforeTime(days);
	}

}
