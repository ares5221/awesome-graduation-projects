package com.lhq.prj.bms.dao.impl;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.dao.IUserDao;
import com.lhq.prj.bms.po.User;

/**
 * UserDao.java Create on 2008-9-19 上午01:44:58
 * 
 * 用户管理持久层实现
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
public class UserDao extends SqlMapClientDaoSupport implements IUserDao {

	public Integer deleteById(Integer userId) {
		return getSqlMapClientTemplate().delete("User.deleteById", userId);
	}

	public int findByCount(Page page) {
		return (Integer) getSqlMapClientTemplate().queryForObject("User.findByCount", page);
	}

	public List findByPage(Page page) {
		return getSqlMapClientTemplate().queryForList("User.findByPage", page);
	}

	public Object saveUser(User user) {
		return getSqlMapClientTemplate().insert("User.save", user);
	}

	public Integer update(User user) throws Exception {
		return getSqlMapClientTemplate().update("User.update", user);
	}

	public User login(User user) {
		return (User) getSqlMapClientTemplate().queryForObject("User.login",user);
	}

	public List findByExample(User user) {
		return getSqlMapClientTemplate().queryForList("User.findByExample",user);
	}

}
