package com.hd.service;

import java.util.List;

import com.hd.entity.CustomerSource;
import com.hd.util.PageBean;

/**
 * 客户来源业务层接口
 * 
 * @author wmy
 * @day 2017年8月11日
 * @time 下午4:54:49
 * 
 */
public interface CustomerSourceService {
	/**
	 * 添加一个新的客户来源
	 * 
	 * @param cusSou
	 * @return
	 */
	boolean add(CustomerSource cusSou);

	/**
	 * 待条件的分页查询所有
	 * 
	 * @param sourceName
	 * @param pageBean
	 */
	void showByName(String sourceName, PageBean<CustomerSource> pageBean);

	/**
	 * 根据客户来源id删除客户来源
	 * 
	 * @param source_id
	 * @return
	 */
	boolean deleteById(int sourceId);

	/**
	 * 查询所有来源信息
	 * @return
	 */
	List<CustomerSource> showAll();
}
