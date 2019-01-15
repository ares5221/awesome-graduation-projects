/**
 * @author Administrator
 * @date 2017年8月15日
 */
package com.hd.service.impl;

import java.util.List;

import com.hd.dao.CustomerCareDao;
import com.hd.dao.impl.CustomerCareDaoImpl;
import com.hd.entity.CustomerCare;
import com.hd.service.CustomerCareService;
import com.hd.util.PageBean;

/**
 * @author Administrator
 *
 */
public class CustomerCareServiceImpl  implements CustomerCareService{

	CustomerCareDao ccd = new CustomerCareDaoImpl();
	@Override
	public void find(PageBean pageBean, String customerName,
			String careTheme, String careWay) {
		//获取所有符合条件的数目
		int count = ccd.findRequiredCount(customerName,careTheme,careWay);
		pageBean.setTotalCount(count);
		//利用pageBean获取分页的开始行数以及每页显示条目数量
		ccd.find(pageBean, customerName, careTheme, careWay);;
	}
	/* (non-Javadoc)
	 * @see com.hd.service.CustomerCareService#add(com.hd.entity.CustomerCare)
	 */
	@Override
	public int add(CustomerCare cc) {
		
		return ccd.save(cc);
	}
	/* (non-Javadoc)
	 * @see com.hd.service.CustomerCareService#findById(int)
	 */
	@Override
	public CustomerCare findById(int care_id) {
		
		return ccd.findById(care_id);
	}
	/* (non-Javadoc)
	 * @see com.hd.service.CustomerCareService#update(com.hd.entity.CustomerCare)
	 */
	@Override
	public int update(CustomerCare cc) {
		
		return ccd.update(cc);
	}
	/* 
	 * @see com.hd.service.CustomerCareService#delete(int)
	 */
	@Override
	public int delete(int careId) {
		
		return ccd.delete(careId);
	}
	/* 获取所有关怀信息
	 */
	@Override
	public List<CustomerCare> findDateCare(int days) {
		
		return ccd.findDateCare(days);
	}

}
