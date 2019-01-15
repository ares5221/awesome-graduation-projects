package com.bjsxt.crm.service;

import java.util.List;

import com.bjsxt.crm.entity.House;
import com.bjsxt.crm.entity.House_Type;
import com.bjsxt.crm.util.PageBean;

public interface HouseService {

	void find(PageBean<House> pageBean, int queryType, String houseInput);

	void delete(int house_ID);

	void update(int house_ID);

	House findHouse(int house_ID);

	List<House_Type> findAllType();

	void modify(House house);

	void add(House house);

	void findType(PageBean<House_Type> pageBean, String houseInput);

	void addType(String type_name);

	void deleteType(int type_ID);

	void find1(PageBean<House> pageBean, int queryType, String houseInput,
			int user_ID);

}
