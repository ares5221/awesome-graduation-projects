package com.lhq.prj.bms.service.impl;

import java.util.Date;

import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.dao.IBookDao;
import com.lhq.prj.bms.dao.ILoanLogDao;
import com.lhq.prj.bms.po.Book;
import com.lhq.prj.bms.po.LoanLog;
import com.lhq.prj.bms.service.IBookService;

/**
 * BookService.java Create on 2008-9-24 下午09:14:31
 * 
 * 图书管理业务层
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
public class BookService implements IBookService {

	private IBookDao bookDao;

	private ILoanLogDao loanLogDao;

	public void setLoanLogDao(ILoanLogDao loanLogDao) {
		this.loanLogDao = loanLogDao;
	}

	public void setBookDao(IBookDao bookDao) {
		this.bookDao = bookDao;
	}

	public boolean deleteBook(String rootPath, Integer bookId) {
		Book book = bookDao.findById(bookId);
		Integer flag = bookDao.deleteById(bookId);
		if (null != flag) {
			return MyUtils.delFile(rootPath + book.getImageUrl());
		}
		return false;
	}

	public Page findByPage(Page page) {
		page.setRoot(bookDao.findByPage(page));
		page.setTotalProperty(bookDao.findByCount(page));
		return page;
	}

	public Object saveBook(Book book) {
		return bookDao.saveBook(book);
	}

	public boolean updateBook(Book book) throws Exception {
		Integer flag = bookDao.update(book);
		if (null != flag) {
			return true;
		}
		return false;
	}

	public boolean returnBook(Book book) throws Exception {
		book = bookDao.findById(book.getBookId());
		book.setState(1);
		book.setCurrentReader("");// 清空当前借书人信息
		book.setCurrentReaderId(0);
		Integer flag = bookDao.update(book);
		LoanLog loanLog = new LoanLog();
		loanLog.setLogId(book.getLogId());
		loanLog.setReturnTime(new Date());
		flag = loanLogDao.update(loanLog);
		return flag == null ? false:true;
	}

}
