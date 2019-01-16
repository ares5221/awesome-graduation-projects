package com.lhq.prj.bms.dao.impl;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.lhq.prj.bms.dao.ISubjectDao;
import com.lhq.prj.bms.po.Subject;

/**
 * SubjectDao.java Create on 2008-9-18 下午08:20:57
 * 
 * 科目管理持久层
 * Download by http://www.codefans.net
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
public class SubjectDao extends SqlMapClientDaoSupport implements ISubjectDao {

	public Integer deleteById(Integer subjectId) {
		return getSqlMapClientTemplate().delete("Subject.deleteById", subjectId);
	}

	public List findAll() {
		return getSqlMapClientTemplate().queryForList("Subject.findAll");
	}

	public Object saveSubject(Subject subject) {
		return getSqlMapClientTemplate().insert("Subject.save", subject);
	}

	public Integer update(Subject subject) throws Exception {
		return getSqlMapClientTemplate().update("Subject.update", subject);
	}

}
