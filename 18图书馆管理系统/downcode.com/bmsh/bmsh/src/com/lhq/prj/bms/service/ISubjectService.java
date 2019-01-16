package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.po.Subject;

/**
 * ISubjectService.java Create on 2008-9-21 下午03:57:53
 * 
 * 科目管理业务层
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
public interface ISubjectService {
	/**
	 * 添加科目
	 * 
	 * @param subject
	 * @return
	 */
	Object saveSubject(Subject subject);

	/**
	 * 查找所有科目
	 * 
	 * @return
	 */
	List findAll();

	/**
	 * 修改科目信息
	 * 
	 * @param subject
	 * @return
	 * @throws Exception
	 */
	boolean updateSubject(Subject subject) throws Exception;

	/**
	 * 删除科目
	 * 
	 * @param subjectId
	 * @return
	 */
	boolean deleteSubject(Integer subjectId);
}
