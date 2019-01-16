/*
 * @(#)LoanLog.java 2008-8-26 
 *
 * Copyright 2008 MTA, Inc. All rights reserved.
 */

package com.lhq.prj.bms.po;

import java.io.Serializable;
import java.util.Date;

/**
 * 借出记录
 * 
 * @author lhq
 * @version 1.0 下午03:25:39
 */
@SuppressWarnings("serial")
public class LoanLog implements Serializable {
	public LoanLog(Integer logId) {
		super();
		this.logId = logId;
	}

	public LoanLog() {
		super();
	}

	/** 记录id */
	private Integer logId;
	
	/** 书本id */
	private Integer bookId;

	/** 书名 50 */
	private String bookName;

	/** 借出时间 */
	private Date loanTime;

	/** 借出天数 */
	private Integer loanDays;

	/** 预计还书时间 */
	private Date preReturnTime;

	/** 实际还书时间 */
	private Date returnTime;

	/** 借阅人id */
	private Integer readerId;

	/** 借阅人 50 */
	private String reader;

	/** 管理员id */
	private Integer loannerId;

	/** 管理员名称 50 */
	private String loanner;

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public Integer getLoanDays() {
		return loanDays;
	}

	public void setLoanDays(Integer loanDaies) {
		this.loanDays = loanDaies;
	}

	public String getLoanner() {
		return loanner;
	}

	public void setLoanner(String loanner) {
		this.loanner = loanner;
	}

	public Integer getLoannerId() {
		return loannerId;
	}

	public void setLoannerId(Integer loannerId) {
		this.loannerId = loannerId;
	}

	public Date getLoanTime() {
		return loanTime;
	}

	public void setLoanTime(Date loanTime) {
		this.loanTime = loanTime;
	}

	public Integer getLogId() {
		return logId;
	}

	public void setLogId(Integer logId) {
		this.logId = logId;
	}

	public Date getPreReturnTime() {
		return preReturnTime;
	}

	public void setPreReturnTime(Date preReturnTime) {
		this.preReturnTime = preReturnTime;
	}

	public String getReader() {
		return reader;
	}

	public void setReader(String reader) {
		this.reader = reader;
	}

	public Integer getReaderId() {
		return readerId;
	}

	public void setReaderId(Integer readerId) {
		this.readerId = readerId;
	}

	public Date getReturnTime() {
		return returnTime;
	}

	public void setReturnTime(Date returnTime) {
		this.returnTime = returnTime;
	}

	public Integer getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

}
