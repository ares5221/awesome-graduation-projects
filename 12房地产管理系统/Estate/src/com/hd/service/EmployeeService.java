package com.hd.service;

import java.util.List;

import com.hd.entity.UserInfo;
import com.hd.util.PageBean;

public interface EmployeeService {
	int upDate(UserInfo ui);

	UserInfo login(String userNum, String userPw);

	int delete(int user_id);

	List<UserInfo> findAll();

	UserInfo findById(int user_id);

	/**
	 * @param pageBean
	 * @param selectType
	 * @param selectContent
	 */
	void find(PageBean<UserInfo> pageBean, String selectType,
			String selectContent);
}
