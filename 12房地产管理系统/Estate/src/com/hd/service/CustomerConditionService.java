package com.hd.service;

import java.util.List;

import com.hd.entity.CustomerCondition;
import com.hd.util.PageBean;

/**
 * 客户状态业务层接口
 * @author wmy
 * @day 2017年8月10日
 * @time 下午7:56:42
 *
 */
public interface CustomerConditionService {
	/**
	 * 添加一个新的客户状态
	 * @param cusCon
	 * @return
	 */
	boolean add(CustomerCondition cusCon);

	/**
	 * 根据客户状态id删除客户状态
	 * @param condition_id
	 * @return
	 */
	boolean deleteById(int condition_id);

	/**
	 * 带条件的分页查询所有
	 * @param conditionName
	 * @param pageBean
	 * @return
	 */
	void showByName(String conditionName,
			PageBean<CustomerCondition> pageBean);
	
	/**
	 * 查询所有客户状态信息
	 * @return
	 */
	List<CustomerCondition> showAll();
}
