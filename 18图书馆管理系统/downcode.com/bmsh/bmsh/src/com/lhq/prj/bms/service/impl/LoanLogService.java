/*
 * @(#)LoanLogService.java 2008-10-11
 *
 * Copyright LHQ. All rights reserved.
 */

package com.lhq.prj.bms.service.impl;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.dao.IBookDao;
import com.lhq.prj.bms.dao.ILoanLogDao;
import com.lhq.prj.bms.po.Book;
import com.lhq.prj.bms.po.LoanLog;
import com.lhq.prj.bms.service.ILoanLogService;

/**    
 * Create on 2008-10-11 下午07:11:35
 *
 * 图书借还记录业务层实现类
 *
 * @author 廖瀚卿
 * @version  1.0
 */
public class LoanLogService implements ILoanLogService {
	
	private ILoanLogDao loanLogDao;
	
	private IBookDao bookDao;

	public void setBookDao(IBookDao bookDao) {
		this.bookDao = bookDao;
	}

	public void setLoanLogDao(ILoanLogDao loanLogDao) {
		this.loanLogDao = loanLogDao;
	}

	public boolean deleteLoanLog(Integer logId) {
		Integer flag = loanLogDao.deleteById(logId);
		if (flag != null) {
			return true;
		}
		return false;
	}

	public Page findByPage(Page page) {
		page.setRoot(loanLogDao.findByPage(page));
		page.setTotalProperty(loanLogDao.findByCount(page));
		return page;
	}

	public Object saveLoanLog(LoanLog loanlog) throws Exception {
		Object flag = loanLogDao.saveLoanLog(loanlog);
		if(flag != null){
			Book book = new Book(loanlog.getBookId());
			book.setLogId((Integer)flag);
			book.setCurrentReaderId(loanlog.getReaderId());
			book.setCurrentReader(loanlog.getReader());
			book.setState(0);
			bookDao.update(book);
		}
		return flag;
	}

	public boolean updateLoanLog(LoanLog loanlog) throws Exception {
		Integer flag = loanLogDao.update(loanlog);
		if (null != flag) {
			return true;
		}
		return false;
	}

}
 