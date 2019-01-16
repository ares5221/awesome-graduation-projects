package com.lhq.prj.bms.service.impl;

import java.util.List;

import com.lhq.prj.bms.dao.ISubjectDao;
import com.lhq.prj.bms.po.Subject;
import com.lhq.prj.bms.service.ISubjectService;

/**
 * SubjectService.java Create on 2008-9-21 下午03:59:22
 * 
 * 科目管理业务实现
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
public class SubjectService implements ISubjectService {

	private ISubjectDao subjectDao;

	public void setSubjectDao(ISubjectDao subjectDao) {
		this.subjectDao = subjectDao;
	}

	public boolean deleteSubject(Integer subjectId) {
		Integer flag = subjectDao.deleteById(subjectId);
		if (null != flag) {
			return true;
		}
		return false;
	}

	public List findAll() {
		return subjectDao.findAll();
	}

	public Object saveSubject(Subject subject) {
		return subjectDao.saveSubject(subject);
	}

	public boolean updateSubject(Subject subject) throws Exception {
		Integer flag = subjectDao.update(subject);
		if (null != flag) {
			return true;
		}
		return false;
	}

}
