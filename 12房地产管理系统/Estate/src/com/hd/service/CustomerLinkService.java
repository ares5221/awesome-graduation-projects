package com.hd.service;

import java.util.List;

import com.hd.entity.CustomerLinkReord;

/**
 * 客户联系业务层接口
 * 
 * @author wmy
 * @day 2017年8月17日
 * @time 下午6:27:15
 * 
 */
public interface CustomerLinkService {
	/**
	 * 查询指定天数以内的联系
	 * 
	 * @param days
	 * @return
	 */
	List<CustomerLinkReord> showBeforeTime(int days);
}
