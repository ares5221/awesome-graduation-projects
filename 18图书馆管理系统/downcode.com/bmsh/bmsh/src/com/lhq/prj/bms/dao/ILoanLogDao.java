package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.LoanLog;

/**
 * IDeptDao.java Create on 2008-9-16 下午10:41:23
 * 
 * 借书还书记录持久化接口
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
public interface ILoanLogDao {
	/**
	 * 保存一个借还书实体到数据库
	 * 
	 * @param loanlog  借还书实体
	 * @return 主键id
	 */
	public Object saveLoanLog(LoanLog loanlog);


	/**
	 * 分页查找
	 * 
	 * @param page 条件
	 * @return
	 */
	public List findByPage(Page page);

	/**
	 * 分页查找的总记录
	 * 
	 * @param page 条件
	 * @return 总记录
	 */
	public int findByCount(Page page);

	/**
	 * 修改借还信息
	 * 
	 * @param loanlog
	 * @return 修改的记录数
	 * @throws Exception
	 */
	public Integer update(LoanLog loanlog) throws Exception;

	/**
	 * 根据id删除记录
	 * 
	 * @param logId
	 * @return 删除的记录数
	 */
	public Integer deleteById(Integer logId);

}
