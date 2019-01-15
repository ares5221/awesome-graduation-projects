package com.bjsxt.service.impl;

import java.util.List;

import com.bjsxt.dao.ReaderDao;
import com.bjsxt.dao.impl.ReaderDaoImpl;
import com.bjsxt.entity.Borrow;
import com.bjsxt.entity.Reader;
import com.bjsxt.service.ReaderService;

public class ReaderServiseImpl implements ReaderService{
    //声明ReaderDao对象
	ReaderDao readerDao =new ReaderDaoImpl();
	
	/**
	 * 读者信息校验查询
	 */
	@Override
	public Reader findReaderSer(String barcode) {
		
		return readerDao.findReaderDao(barcode);
	}
	
	/**
	 * 获取读者借书信息
	 */
	@Override
	public List readerBorrowInfoSer(int readerid) {
		
		return readerDao.readerBorrowInfoDao(readerid);
	}

	/**
	 * 给学生添加借阅书籍
	 */
	@Override
	public boolean addBookToReaderSer(Borrow borrow) {
		
		return readerDao.addBookToReaderDao(borrow);
	}

	/**
	 * 图书续借
	 */
	@Override
	public int bookRenewSer(int borrowid,int sid) {
		
		return readerDao.bookRenewDao(borrowid,sid);
	}

	/**
	 * 图书归还
	 */
	@Override
	public boolean bookBackSer(int borrowid,int sid) {
		
		return readerDao.bookBackDao(borrowid,sid);
	}

	/**
	 * 通过rid  和    bid  获取单个的借书信息
	 */
	@Override
	public Borrow getSigleBorrowInfoSer(int borrowid) {

		return readerDao.getSigleBorrowInfoDao(borrowid);
	}

	/**
	 * 通过读者类型名查询所有读者类型
	 */
	@Override
	public int queryReaderTypeByNameSer(String name) {
		return readerDao.queryReaderTypeByNameDao(name);
	}

}
