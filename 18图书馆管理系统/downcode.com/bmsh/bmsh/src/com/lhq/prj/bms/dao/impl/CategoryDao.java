package com.lhq.prj.bms.dao.impl;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.dao.ICategoryDao;
import com.lhq.prj.bms.po.Category;
import com.lhq.prj.bms.po.Subject;

/**    
 * CategoryDao.java Create on 2008-9-21 下午04:26:45   
 *
 * 分类管理持久层实现
 * Download by http://www.codefans.net
 * Copyright (c) 2008 by MTA.
 *
 * @author 廖瀚卿
 * @version 1.0  
 */
public class CategoryDao extends SqlMapClientDaoSupport implements ICategoryDao {

	public Integer deleteById(Integer categoryId) {
		return getSqlMapClientTemplate().delete("Category.deleteById", categoryId);
	}

	public List findAll() {
		return getSqlMapClientTemplate().queryForList("Category.findAll");
	}

	public int findByCount(Page page) {
		return (Integer) getSqlMapClientTemplate().queryForObject("Category.findByCount", page);
	}

	public List findByPage(Page page) {
		return getSqlMapClientTemplate().queryForList("Category.findByPage", page);
	}

	public Object saveCategory(Category category) {
		return getSqlMapClientTemplate().insert("Category.save", category);
	}

	public Integer update(Category category) throws Exception {
		return getSqlMapClientTemplate().update("Category.update", category);
	}

	public List findCategoryBySubject(Subject subject) {
		return getSqlMapClientTemplate().queryForList("Category.findCategoryBySubject",subject);
	}


}
 