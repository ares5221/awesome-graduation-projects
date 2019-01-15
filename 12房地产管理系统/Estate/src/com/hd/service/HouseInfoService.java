package com.hd.service;

import java.util.List;

import com.hd.entity.HouseInfo;
import com.hd.entity.HouseType;
import com.hd.util.PageBean;

public interface HouseInfoService {

	List<HouseInfo> findAll();

	void delete(int house_id);

	HouseInfo findById(int house_id);

	int update(HouseInfo hou);
	
	List<HouseType> findHouseNum();

	int add(HouseInfo hou);

	/**
	 * @param pageBean
	 * @param selectType
	 * @param selectContent
	 */
	void find(PageBean<HouseInfo> pageBean, String selectType,
			String selectContent);

}
