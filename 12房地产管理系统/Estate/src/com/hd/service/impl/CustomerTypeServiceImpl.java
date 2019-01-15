/**
 * @author Administrator
 * @date 2017年8月16日
 */
package com.hd.service.impl;

import java.util.List;

import com.hd.dao.CustomerTypeDao;
import com.hd.dao.impl.CustomerTypeDaoImpl;
import com.hd.entity.CustomerType;
import com.hd.service.CustomerTypeService;
import com.hd.util.PageBean;

/**
 * @author Administrator
 *
 */
public class CustomerTypeServiceImpl implements CustomerTypeService {
	CustomerTypeDao ctd = new CustomerTypeDaoImpl();
	/* (non-Javadoc)
	 * @see com.hd.service.CustomerTypeService#find(com.hd.util.PageBean, java.lang.String)
	 */
	@Override
	public void find(PageBean<CustomerType> pageBean, String typeName) {
		int n  = ctd.findAllRequiredCount(typeName);
		pageBean.setTotalCount(n);
		int start = pageBean.getStartRow();
		int size = pageBean.getSize();
		List<CustomerType> list = ctd.findRequired(start,size,typeName);
		pageBean.setList(list);
	}
	/* (non-Javadoc)
	 * @see com.hd.service.CustomerTypeService#add(java.lang.String)
	 */
	@Override
	public int add(String typeName) {
		
		return ctd.add(typeName);
	}
	/* 删除客户类型
	 */
	@Override
	public int delete(int typeId) {
		
		return ctd.delete(typeId);
	}
	@Override
	public List<CustomerType> showAll() {
		return ctd.findAll();
	}

}
