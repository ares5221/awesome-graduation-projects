package com.hd.dao;

import java.util.List;

import com.hd.entity.HouseInfo;
import com.hd.entity.HouseType;

public interface HouseInfoDao {

	int save(HouseInfo hou);

	List<HouseInfo> findAll();

	void delete(int house_id);

	HouseInfo findById(int house_id);

	int update(HouseInfo hou);

	
	List<HouseType> findHouseNum();

	int add(HouseInfo hou);

	/**
	 * @param selectType
	 * @param selectContent
	 * @return
	 */
	int findRequiredCount(String selectType, String selectContent);

	/**
	 * @param start
	 * @param size
	 * @param selectType
	 * @param selectContent
	 * @return
	 */
	List<HouseInfo> findRequiredItems(int start, int size, String selectType,
			String selectContent);



}
