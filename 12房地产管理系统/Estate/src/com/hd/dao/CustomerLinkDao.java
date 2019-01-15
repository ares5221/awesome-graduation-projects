package com.hd.dao;

import java.util.List;

import com.hd.entity.CustomerLinkReord;

/**
 * 客户联系Dao接口
 * 
 * @author wmy
 * @day 2017年8月17日
 * @time 下午6:13:12
 * 
 */
public interface CustomerLinkDao {
	/**
	 * 查询所有联系
	 * 
	 * @return
	 */
	List<CustomerLinkReord> findAll();
	
	/**
	 * 查询指定天数以内的联系
	 * @param days
	 * @return
	 */
	List<CustomerLinkReord> findBeforeTime(int days);
}
