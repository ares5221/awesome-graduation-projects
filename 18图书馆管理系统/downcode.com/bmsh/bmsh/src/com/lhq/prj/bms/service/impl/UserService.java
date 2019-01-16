package com.lhq.prj.bms.service.impl;

import java.util.List;
// Download by http://www.codefans.net
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.dao.IUserDao;
import com.lhq.prj.bms.po.User;
import com.lhq.prj.bms.service.IUserService;

/**
 * UserService.java Create on 2008-9-19 上午01:41:43
 * 
 * 用户管理业务层实现类
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
public class UserService implements IUserService {

	private IUserDao userDao;

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}

	public boolean deleteUser(Integer userId) {
		Integer flag = userDao.deleteById(userId);
		if (flag != null) {
			return true;
		}
		return false;
	}

	public Page findByPage(Page page) {
		page.setRoot(userDao.findByPage(page));
		page.setTotalProperty(userDao.findByCount(page));
		return page;
	}

	public Object saveUser(User user) {
		return userDao.saveUser(user);
	}

	public boolean updateUser(User user) throws Exception {
		Integer flag = userDao.update(user);
		if (flag != null) {
			return true;
		}
		return false;
	}

	public User login(User user) {
		return userDao.login(user);
	}

	public List findByExample(User user) {
		return userDao.findByExample(user);
	}
}
