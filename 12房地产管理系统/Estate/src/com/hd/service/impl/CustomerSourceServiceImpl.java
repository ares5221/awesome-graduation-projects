package com.hd.service.impl;

import java.util.List;

import com.hd.dao.CustomerSourceDao;
import com.hd.dao.impl.CustomerSourceDaoImpl;
import com.hd.entity.CustomerSource;
import com.hd.service.CustomerSourceService;
import com.hd.util.PageBean;

/**
 * 客户来源业务层实现类
 * 
 * @author wmy
 * @day 2017年8月11日
 * @time 下午4:56:44
 * 
 */
public class CustomerSourceServiceImpl implements CustomerSourceService {
	/**
	 * 客户来源数据库操作对象
	 */
	private CustomerSourceDao cusSouDao = new CustomerSourceDaoImpl();

	@Override
	public boolean add(CustomerSource cusSou) {
		return cusSouDao.save(cusSou) > 0;
	}

	@Override
	public boolean deleteById(int source_id) {
		return cusSouDao.delete(source_id) > 0;
	}

	@Override
	public void showByName(String sourceName, PageBean<CustomerSource> pageBean) {
		// 获取总记录数
		int totalCount = cusSouDao.findCount(sourceName);
		// 设置总记录数,从而计算出其他值
		pageBean.setTotalCount(totalCount);
		// 调用数据库获取数据集合
		List<CustomerSource> cusSouList = cusSouDao.findByName(sourceName,
				pageBean.getIndex(), pageBean.getSize());
		// 把数据设置到pageBean中
		pageBean.setList(cusSouList);
	}

	@Override
	public List<CustomerSource> showAll() {
		return cusSouDao.findAll();
	}

}
