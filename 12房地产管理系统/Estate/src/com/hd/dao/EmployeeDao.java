package com.hd.dao;

import java.util.List;

import com.hd.entity.UserInfo;

public interface EmployeeDao {
	int upDate(UserInfo ui);

	UserInfo login(String userNum, String userPw);

	int delete(int user_id);

	List<UserInfo> findAll();

	UserInfo findById(int user_id);

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
	List<UserInfo> findRequiredItems(int start, int size, String selectType,
			String selectContent);
}
