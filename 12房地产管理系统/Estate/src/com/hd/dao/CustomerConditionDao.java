package com.hd.dao;

import java.util.List;

import com.hd.entity.CustomerCondition;

/**
 * 客户状态数据库操作接口
 * 
 * @author wmy
 * @day 2017年8月10日
 * @time 下午5:31:56
 * 
 */
public interface CustomerConditionDao {
	/**
	 * 添加客户状态到数据库
	 * 
	 * @param cc
	 * @return
	 */
	int save(CustomerCondition cusCon);

	/**
	 * 根据客户状态id删除客户状态
	 * 
	 * @param condition_id
	 * @return
	 */
	int delete(int condition_id);

	/**
	 * 带条件的分页查询所有
	 * @param conditionName
	 * @param index
	 * @return
	 */
	List<CustomerCondition> findByName(String conditionName, int index, int size);

	/**
	 * 带条件查询数量
	 * @param conditionName
	 * @return
	 */
	int findCount(String conditionName);
	
	/**
	 * 查询所有客户状态信息
	 * @return
	 */
	List<CustomerCondition> findAll();

}
