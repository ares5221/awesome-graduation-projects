package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.User;

/**    
 * IUserDao.java Create on 2008-9-19 上午01:42:11   
 *
 * 用户管理持久层接口
 *
 * Copyright (c) 2008 by MTA.
 *
 * @author 廖瀚卿
 * @version 1.0  
 */
public interface IUserDao {
	/**
	 * 保存一个用户实体到数据库
	 * 
	 * @param user
	 *            用户实体
	 * @return 主键id
	 */
	public Object saveUser(User user);


	/**
	 * 分页查找
	 * 
	 * @param page
	 *            条件
	 * @return
	 */
	public List findByPage(Page page);

	/**
	 * 页查找的总记录
	 * 
	 * @param page
	 *            条件
	 * @return
	 */
	public int findByCount(Page page);

	/**
	 * 修改用户信息
	 * 
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public Integer update(User user) throws Exception;

	/**
	 * 根据id删除用户
	 * 
	 * @param userId
	 * @return
	 */
	public Integer deleteById(Integer userId);


	/**
	 * 用户登录方法
	 * 
	 * @param user
	 * @return
	 */
	public User login(User user);


	/**
	 * 根据用户示例查找用户
	 *
	 * @param user
	 * @return
	 */
	public List findByExample(User user);

}
 