package com.hd.dao;

import java.util.List;

import com.hd.entity.HouseType;

public interface HouseTypeDao {

	int save(HouseType hou);

	List<HouseType> findAll();

	void delete(int type_id);

	HouseType findById(int type_id);

	List<HouseType> find(String select);

	int add(String typeName);

	/**
	 * @param houseType
	 * @return
	 */
	int findRequiredCount(String houseType);

	/**
	 * @param start
	 * @param size
	 * @param houseType
	 * @return
	 */
	List<HouseType> findRequiredItems(int start, int size, String houseType);

}
