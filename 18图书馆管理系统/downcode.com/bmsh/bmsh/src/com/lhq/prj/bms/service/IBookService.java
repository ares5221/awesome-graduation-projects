package com.lhq.prj.bms.service;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Book;

/**    
 * IDeptService.java Create on 2008-9-16 下午10:38:57   
 *
 * 图书业务层接口
 * Download by http://www.codefans.net
 * Copyright (c) 2008 by MTA.
 *
 * @author 廖瀚卿
 * @version 1.0  
 */
public interface IBookService {
	/**
	 * 添加图书
	 * @param book
	 * @return
	 */
	Object saveBook(Book book);

	/**
	 * 分页查找
	 * @param page 分页对象
	 * @return
	 */
	Page findByPage(Page page);

	/**
	 * 修改图书信息
	 * @param book
	 * @return
	 * @throws Exception 
	 */
	boolean updateBook(Book book) throws Exception;

	/**
	 * 删除图书
	 * 
	 * @param rootPath 上下文路径
	 * @param bookId
	 * @return
	 */
	boolean deleteBook(String rootPath,Integer bookId);

	/**
	 * 还书
	 *
	 * @param book
	 * @return
	 * @throws Exception 
	 */
	boolean returnBook(Book book) throws Exception;

}
 