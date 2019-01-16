package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Book;

/**
 * IBookDao.java Create on 2008-9-24 下午09:07:34
 * 
 * 图书处理
 * 
 * Copyright (c) 2008 by MTA.
 * Download by http://www.codefans.net
 * @author 廖瀚卿
 * @version 1.0
 */
public interface IBookDao {
	/**
	 * 保存一个图书实体到数据库
	 * 
	 * @param book
	 *          图书实体
	 * @return 主键id
	 */
	public Object saveBook(Book book);


	/**
	 * 分页查找
	 * 
	 * @param page
	 *          条件
	 * @return
	 */
	public List findByPage(Page page);

	/**
	 * 分页查找的总记录
	 * 
	 * @param page
	 *          条件
	 * @return
	 */
	public int findByCount(Page page);

	/**
	 * 修改图书信息
	 * 
	 * @param book
	 * @return
	 * @throws Exception
	 */
	public Integer update(Book book) throws Exception;

	/**
	 * 根据id删除图书
	 * 
	 * @param bookId
	 * @return
	 */
	public Integer deleteById(Integer bookId);


	/***
	 * 根据id获得记录
	 *
	 * @param bookId
	 * @return
	 */
	public Book findById(Integer bookId);

}
