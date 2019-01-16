package com.lhq.prj.bms.service;

import java.util.List;
// Download by http://www.codefans.net
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.User;

/**    
 * IUserService.java Create on 2008-9-19 上午01:39:40   
 *
 * 用户管理业务层接口
 *
 * Copyright (c) 2008 by MTA.
 *
 * @author 廖瀚卿
 * @version 1.0  
 */
public interface IUserService {
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	Object saveUser(User user);


	/**
	 * 分页查找
	 * @param page 分页对象
	 * @return
	 */
	Page findByPage(Page page);

	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 * @throws Exception 
	 */
	boolean updateUser(User user) throws Exception;

	/**
	 * 删除用户
	 * 
	 * @param deptId
	 * @return
	 */
	boolean deleteUser(Integer deptId);


	/**
	 * 登陆系统
	 * 
	 * @param user
	 * @return user
	 */
	User login(User user);


	/**
	 * 根据用户实例查找用户
	 *
	 * @param user
	 * @return
	 */
	List findByExample(User user);
}
 