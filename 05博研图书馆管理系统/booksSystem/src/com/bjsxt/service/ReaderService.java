package com.bjsxt.service;

import java.util.List;

import com.bjsxt.entity.Borrow;
import com.bjsxt.entity.Reader;

public interface ReaderService {
	//读者信息校验查询
	Reader findReaderSer(String barcode);
	
	/**
	 * 获取读者的借书信息
	 * @param readerid
	 * @return
	 */
	List readerBorrowInfoSer(int readerid);
	
	/**
	 * 给学生添加借阅书籍
	 * @param addType
	 * @param addKey
	 * @return
	 */
	boolean addBookToReaderSer(Borrow borrow);
	
	/**
	 * 图书续借
	 * @param readerid
	 * @param bookid
	 * @return
	 */
	int bookRenewSer(int borrowid,int sid);
	
	/**
	 * 图书归还
	 * @param readerid
	 * @param bookid
	 * @return
	 */
	boolean bookBackSer(int borrowid,int sid);
	
	/**
	 * 通过借书id  获取单个的借书信息
	 * @param readerid
	 * @param bookid
	 * @return
	 */
	Borrow getSigleBorrowInfoSer(int borrowid);
	
	/**
	 * 通过读者类型名查询所有读者类型
	 */
	public int queryReaderTypeByNameSer(String name);
}
