package com.bjsxt.service.impl;

import java.util.List;

import com.bjsxt.dao.BookDao;
import com.bjsxt.dao.impl.BookDaoImpl;
import com.bjsxt.entity.BookBaseInfo;
import com.bjsxt.service.BookService;
import com.bjsxt.util.SxtPageUtil;

public class BookServiceImpl implements BookService{
      BookDao bookDao = new BookDaoImpl();
	
	/**
	 * 通过barcode查询book信息
	 */
	@Override
	public BookBaseInfo findBookByBarcodeSer(String barcode) {
		return bookDao.findBookByBarcodeDao(barcode);
	}

	/**
	 * 通过书名查询book信息
	 */
	@Override
	public BookBaseInfo findBookByNameSer(String bname) {
		
		return bookDao.findBookByNameDao(bname);
	}

	/**
	 * 通过书id查询book信息
	 */
	@Override
	public BookBaseInfo findBookByIdSer(int bid) {
		
		return bookDao.findBookByIdDao(bid);
	}

	/**
	 * 获取过期图书
	 */
	@Override
	public List getOverdueBookInfoSer() {
		return bookDao.getOverdueBookInfoDao();
	}

	/**
	 * 获取图书借阅信息
	 */
	@Override
	public List getBorrowInfoSer() {
		
		return bookDao.getBorrowInfoDao();
	}

	/**
	 * 通过条形码或者书名查找图书借阅信息
	 */
	@Override
	public List findBorrowByFacSer(String type,String key) {
		return bookDao.findBorrowByFacDao(type,key);
	}

	/**
	 *  获取借书排行榜信息
	 */
	@Override
	public List getRankListSer(SxtPageUtil<List> page) {
		return bookDao.getRankListDao(page);
	}

	/**
	 * 获取书单总数
	 */
	@Override
	public int getBookNumSer() {
		return bookDao.getBookNumDao();
	}
	
	
}
