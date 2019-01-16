/*
 * @(#)ILoanLogService.java 2008-10-11
 *
 * Copyright LHQ. All rights reserved.
 */

package com.lhq.prj.bms.service;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.LoanLog;

/**    
 * Create on 2008-10-11 下午07:08:18
 * Download by http://www.codefans.net
 * 图书借出还书记录业务层接口
 *
 * @author 廖瀚卿
 * @version  
 */
public interface ILoanLogService {
	/**
	 * 添加记录
	 * 
	 * @param loanlog
	 * @return
	 * @throws Exception 
	 */
	Object saveLoanLog(LoanLog loanlog) throws Exception;
	
	/**
	 * 分页查找
	 * @param page 分页对象
	 * @return
	 */
	Page findByPage(Page page);

	/**
	 * 修改记录信息
	 * 
	 * @param loanlog
	 * @return
	 * @throws Exception
	 */
	boolean updateLoanLog(LoanLog loanlog) throws Exception;

	/**
	 * 删除记录
	 * 
	 * @param logId
	 * @return
	 */
	boolean deleteLoanLog(Integer logId);

}
 