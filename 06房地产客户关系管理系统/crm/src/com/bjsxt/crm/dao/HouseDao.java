package com.bjsxt.crm.dao;

import java.util.List;

import com.bjsxt.crm.entity.House;
import com.bjsxt.crm.entity.House_Type;

public interface HouseDao {

	int findCount(int queryType, String houseInput);

	List<House> findStu(int startRow, int endRow, int queryType,
			String houseInput);

	void delete(int house_ID);

	House findHouse(int house_ID);

	List<House_Type> findAllType();

	void modify(House house);

	void add(House house);

	int findTypeCount(String houseInput);

	List<House_Type> findType(int startRow, int endRow, String houseInput);

	void addType(String type_name);

	void deleteType(int type_ID);

	int findCount1(int queryType, String houseInput, int user_ID);

	List<House> findStu1(int startRow, int endRow, int queryType,
			String houseInput, int user_ID);

	int findCount20(int i, String houseInput, int user_ID);

	List<House> findStu20(int startRow, int endRow, int i, String houseInput,
			int user_ID);

	int findCount21(int i, String houseInput, int user_ID);

	List<House> findStu21(int startRow, int endRow, int i, String houseInput,
			int user_ID);

	int findCount22(int i, String houseInput, int user_ID);

	List<House> findStu22(int startRow, int endRow, int i, String houseInput,
			int user_ID);

}
