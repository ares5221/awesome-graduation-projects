package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.po.Duty;

/**
 * IDutyDao.java Create on 2008-9-18 下午08:16:37
 * 
 * 职务持久层接口
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
public interface IDutyDao {

	/**
	 * 保存一个职务到数据库
	 * 
	 * @param duty
	 * @return
	 */
	public Object saveDuty(Duty duty);

	/**
	 * 查找所有职务
	 * 
	 * @return
	 */
	public List findAll();

	/**
	 * 修改职务信息
	 * 
	 * @param duty
	 * @return
	 * @throws Exception
	 */
	public Integer update(Duty duty) throws Exception;

	/**
	 * 根据id删除职务
	 * 
	 * @param dutyId
	 * @return
	 */
	public Integer deleteById(Integer dutyId);
}
