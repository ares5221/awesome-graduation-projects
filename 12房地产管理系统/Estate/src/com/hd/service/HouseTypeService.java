package com.hd.service;

import java.util.List;

import com.hd.entity.HouseType;
import com.hd.util.PageBean;

public interface HouseTypeService {

	List<HouseType> findAll();

	void delete(int type_id);

	HouseType findById(int type_id);

	List<HouseType> find(String select);

	int add(String typeName);

	/**
	 * @param pageBean
	 * @param houseType
	 */
	void find(PageBean<HouseType> pageBean, String houseType);



}
