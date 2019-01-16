package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.po.Duty;

/**
 * IDutyService.java Create on 2008-9-18 下午08:11:19
 * 
 * 职务管理业务层接口
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
public interface IDutyService {

	/**
	 * 添加职务
	 * 
	 * @param duty
	 * @return
	 */
	Object saveDuty(Duty duty);

	/**
	 * 查找所有职务
	 * 
	 * @return
	 */
	List findAll();

	/**
	 * 修改职务信息
	 * 
	 * @param duty
	 * @return
	 * @throws Exception
	 */
	boolean updateDuty(Duty duty) throws Exception;

	/**
	 * 删除职务
	 * 
	 * @param dutyId
	 * @return
	 */
	boolean deleteDuty(Integer dutyId);
}
