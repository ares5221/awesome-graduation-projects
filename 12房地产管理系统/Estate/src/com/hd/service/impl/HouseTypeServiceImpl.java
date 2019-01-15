package com.hd.service.impl;

import java.util.List;

import com.hd.dao.HouseTypeDao;
import com.hd.dao.impl.HouseTypeDaoImpl;
import com.hd.entity.HouseType;
import com.hd.service.HouseTypeService;
import com.hd.util.PageBean;


public class HouseTypeServiceImpl implements HouseTypeService {

	private HouseTypeDao houseTypeDao = new HouseTypeDaoImpl();


	@Override
	public List<HouseType> findAll() {
		return this.houseTypeDao.findAll();
	}

	@Override
	public void delete(int type_id) {
		this.houseTypeDao.delete(type_id);
		
	}

	@Override
	public HouseType findById(int type_id) {
		
		return this.houseTypeDao.findById(type_id);
	}

	@Override
	public List<HouseType> find(String select) {
		return this.houseTypeDao.find(select);
	}

	@Override
	public int add(String typeName) {
		return this.houseTypeDao.add(typeName);
	}

	/* 
	 * 按条件查询房屋类型信息
	 */
	@Override
	public void find(PageBean<HouseType> pageBean, String houseType) {
		int count = houseTypeDao.findRequiredCount(houseType);
		pageBean.setTotalCount(count);
		int start = pageBean.getStartRow();
		int size = pageBean.getSize();
		List<HouseType> list = houseTypeDao.findRequiredItems(start,size,houseType);
		pageBean.setList(list);
	}

}
