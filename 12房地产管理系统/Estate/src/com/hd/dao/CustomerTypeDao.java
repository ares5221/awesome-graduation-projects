/**
 * @author Administrator
 * @date 2017年8月16日
 */
package com.hd.dao;

import java.util.List;

import com.hd.entity.CustomerType;

/**
 * @author Administrator
 *
 */
public interface CustomerTypeDao {

	/**
	 * @return
	 */
	
	/**
	 * @param start
	 * @param size
	 * @param typeName
	 * @return
	 */
	List<CustomerType> findRequired(int start, int size, String typeName);

	/**
	 * @param typeName
	 * @return
	 */
	int findAllRequiredCount(String typeName);

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
	List<CustomerType> findAll();
}
