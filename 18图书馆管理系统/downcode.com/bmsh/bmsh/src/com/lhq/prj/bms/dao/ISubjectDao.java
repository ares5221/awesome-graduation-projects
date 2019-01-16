package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.po.Subject;

/**
 * ISubjectDao.java Create on 2008-9-18 下午08:16:37
 * 
 * 科目持久层接口
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
public interface ISubjectDao {

	/**
	 * 保存一个科目到数据库
	 * 
	 * @param subject
	 * @return
	 */
	public Object saveSubject(Subject subject);

	/**
	 * 查找所有科目
	 * 
	 * @return
	 */
	public List findAll();

	/**
	 * 修改科目信息
	 * 
	 * @param subject
	 * @return
	 * @throws Exception
	 */
	public Integer update(Subject subject) throws Exception;

	/**
	 * 根据id删除科目
	 * 
	 * @param subjectId
	 * @return
	 */
	public Integer deleteById(Integer subjectId);
}
