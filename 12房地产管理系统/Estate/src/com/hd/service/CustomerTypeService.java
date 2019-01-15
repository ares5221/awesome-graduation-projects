/**
 * @author Administrator
 * @date 2017年8月16日
 */
package com.hd.service;

import java.util.List;

import com.hd.entity.CustomerType;
import com.hd.util.PageBean;

/**
 * @author Administrator
 *
 */
public interface CustomerTypeService {

	/**
	 * @param pageBean
	 * @param typeName
	 */
	void find(PageBean<CustomerType> pageBean, String typeName);

	/**
	 * @param typeName
	 * @return
	 */
	int add(String typeName);

	/**
	 * @param typeId
	 * @return
	 */
	int delete(int typeId);
	
	/**
	 * 查询所有客户类型信息
	 * @return
	 */
	List<CustomerType> showAll();
	
}
