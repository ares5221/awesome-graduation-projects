/**
 * @author Administrator
 * @date 2017年8月15日
 */
package com.hd.service;

import java.util.List;

import com.hd.entity.CustomerCare;
import com.hd.util.PageBean;

/**
 * @author Administrator
 *
 */
public interface CustomerCareService {
	void find(PageBean pageBean,String customerName,String careTheme,String careWay);

	/**
	 * @param cc
	 * @return
	 */
	int add(CustomerCare cc);

	/**
	 * @param care_id
	 * @return
	 */
	CustomerCare findById(int care_id);

	/**
	 * @param cc
	 * @return
	 */
	int update(CustomerCare cc);

	/**
	 * @param careId
	 * @return
	 */
	int delete(int careId);

	/**
	 * @param days
	 * @return
	 */
	List<CustomerCare> findDateCare(int days);
}
