package com.hd.service.impl;

import java.util.List;

import com.hd.dao.CustomerConditionDao;
import com.hd.dao.impl.CustomerConditionDaoImpl;
import com.hd.entity.CustomerCondition;
import com.hd.service.CustomerConditionService;
import com.hd.util.PageBean;

/**
 * 客户状态业务层实现类
 * 
 * @author wmy
 * @day 2017年8月10日
 * @time 下午7:58:24
 * 
 */
public class CustomerConditionServiceImpl implements CustomerConditionService {
	/**
	 * 客户状态数据库操作对象
	 */
	private CustomerConditionDao cusConDao = new CustomerConditionDaoImpl();

	@Override
	public boolean add(CustomerCondition cusCon) {

		return cusConDao.save(cusCon) > 0;
	}

	@Override
	public boolean deleteById(int condition_id) {
		return cusConDao.delete(condition_id) > 0;
	}

	@Override
	public void showByName(String conditionName,
			PageBean<CustomerCondition> pageBean) {
		// 获取总记录数
		int totalCount = cusConDao.findCount(conditionName);
		// 设置总记录数,从而计算出其他值
		pageBean.setTotalCount(totalCount);
		// 调用数据库获取数据集合
		List<CustomerCondition> cusConList = cusConDao.findByName(
				conditionName, pageBean.getIndex(), pageBean.getSize());
		// 把数据设置到pageBean中
		pageBean.setList(cusConList);
	}

	@Override
	public List<CustomerCondition> showAll() {
		return cusConDao.findAll();
	}
}
