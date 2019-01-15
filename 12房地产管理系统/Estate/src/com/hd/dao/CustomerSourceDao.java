package com.hd.dao;

import java.util.List;

import com.hd.entity.CustomerSource;

/**
 * 客户来源Dao
 * 
 * @author wmy
 * @day 2017年8月11日
 * @time 下午4:52:06
 * 
 */
public interface CustomerSourceDao {
	/**
	 * 添加客户来源到数据库
	 * 
	 * @param cusSou
	 * @return
	 */
	int save(CustomerSource cusSou);

	/**
	 * 待条件的分页查询所有
	 * @param sourceName
	 * @param index
	 * @param size
	 * @return
	 */
	List<CustomerSource> findByName(String sourceName,int index, int size);

	/**
	 * 带条件查询数量
	 * @param sourceName
	 * @return
	 */
	int findCount(String sourceName);

	/**
	 * 根据客户来源id删除客户来源
	 * 
	 * @param source_id
	 * @return
	 */
	int delete(int source_id);

	/**
	 * 查询所有来源信息
	 * @return
	 */
	List<CustomerSource> findAll();
}
