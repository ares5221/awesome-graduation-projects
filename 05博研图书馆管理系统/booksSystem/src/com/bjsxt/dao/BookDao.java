package com.bjsxt.dao;

import java.util.List;

import com.bjsxt.entity.BookBaseInfo;
import com.bjsxt.util.SxtPageUtil;

public interface BookDao {
    /**
     * 通过barcode查询book信息
     * @param barcode
     * @return
     */
	 BookBaseInfo findBookByBarcodeDao(String barcode);
	 
	 /**
	  * 通过书名查询book信息
	  * @param bname
	  * @return
	  */
	 BookBaseInfo findBookByNameDao(String bname);
	 
	 /**
	  * 通过书id查询book信息
	  * @param bname
	  * @return
	  */
	 BookBaseInfo findBookByIdDao(int bid);
	 
	 /**
	 * 获取过期图书
	 */
	 List getOverdueBookInfoDao();
	 
	 /**
	  * 获取图书借阅信息
	  * @return
	  */
	 List getBorrowInfoDao();
	 
	 /**
	  * 通过条形码或者书名查找图书借阅信息
	  * @return
	  */
	 List findBorrowByFacDao(String type,String key);
	 
	 /**
	  * 获取借书排行榜信息
	  * @return
	  */
	 List getRankListDao(SxtPageUtil<List> page);
	 
	 /**
	  * 获取书单总数
	  */
	 int getBookNumDao();
}

