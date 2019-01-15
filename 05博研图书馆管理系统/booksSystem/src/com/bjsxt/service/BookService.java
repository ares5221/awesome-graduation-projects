package com.bjsxt.service;

import java.util.List;

import com.bjsxt.entity.BookBaseInfo;
import com.bjsxt.util.SxtPageUtil;

public interface BookService {

	/**
	 * 通过barcode查询book信息
     * @param barcode
     * @return
     */
	BookBaseInfo findBookByBarcodeSer(String barcode);
	
	/**
	  * 通过书名查询book信息
	  * @param bname
	  * @return
	  */
	 BookBaseInfo findBookByNameSer(String bname);
	 
	 /**
	  * 通过书id查询book信息
	  * @param bname
	  * @return
	  */
	 BookBaseInfo findBookByIdSer(int bid);
	 
	 /**
	 * 获取过期图书
	 */
	 List getOverdueBookInfoSer();
	 
	 /**
	  * 获取图书借阅信息
	  * @return
	  */
	 List getBorrowInfoSer();
	 
	 /**
	  * 通过条形码或者书名查找图书借阅信息
	  * @return
	  */
	 List findBorrowByFacSer(String type,String key);
	 
	/**
	 * 获取借书排行榜信息
	 * @return
	 */
	public List getRankListSer(SxtPageUtil<List> page);
	
	/**
	 *  获取书单总数
	 */
	public int getBookNumSer();
}
