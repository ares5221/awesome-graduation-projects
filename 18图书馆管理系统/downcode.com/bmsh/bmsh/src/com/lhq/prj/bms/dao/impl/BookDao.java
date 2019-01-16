package com.lhq.prj.bms.dao.impl;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.dao.IBookDao;
import com.lhq.prj.bms.po.Book;

/**
 * BookDao.java Create on 2008-9-24 下午09:10:20
 * 
 * 图书管理持久层实现
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
public class BookDao extends SqlMapClientDaoSupport implements IBookDao {
	public Integer deleteById(Integer bookId) {
		return getSqlMapClientTemplate().delete("Book.deleteById", bookId);
	}

	public int findByCount(Page page) {
		return (Integer) getSqlMapClientTemplate().queryForObject("Book.findByCount", page);
	}

	public List findByPage(Page page) {
		return getSqlMapClientTemplate().queryForList("Book.findByPage", page);
	}

	public Object saveBook(Book book) {
		return getSqlMapClientTemplate().insert("Book.save", book);
	}

	public Integer update(Book book) throws Exception {
		return getSqlMapClientTemplate().update("Book.update", book);
	}

	public Book findById(Integer bookId) {
		return (Book) getSqlMapClientTemplate().queryForObject("Book.findById",bookId);
	}

}
