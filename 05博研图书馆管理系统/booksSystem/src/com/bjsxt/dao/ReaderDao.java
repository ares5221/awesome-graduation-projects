package com.bjsxt.dao;

import java.util.List;

import com.bjsxt.entity.Borrow;
import com.bjsxt.entity.Reader;
import com.bjsxt.entity.ReaderType;
import com.bjsxt.util.SxtPageUtil;

public interface ReaderDao {
	/**
	 * 读者信息校验查询
	 * @param barcode
	 * @return
	 */
	Reader findReaderDao(String barcode);
	
	/**
	 * 获取读者的借书信息
	 * @param readerid
	 * @return
	 */
	List readerBorrowInfoDao(int readerid);
	
	/**
	 * 给学生添加借阅书籍
	 * @param addType
	 * @param addKey
	 * @return
	 */
	boolean addBookToReaderDao(Borrow borrow);
	
	/**
	 * 图书续借
	 * @param borrowid
	 * @param sid
	 * @return
	 */
	int bookRenewDao(int borrowid,int sid);
	
	/**
	 * 图书归还
	 * @param readerid
	 * @param bookid
	 * @return
	 */
	boolean bookBackDao(int borrowid,int sid);
	
	/**
	 * 通过借书id  获取单个的借书信息
	 * @param readerid
	 * @param bookid
	 * @return
	 */
	Borrow getSigleBorrowInfoDao(int borrowid);
	
	//读者类型
		List<ReaderType> findAllRederType(); 
		//添加类型
		int addRederType(ReaderType readertype);
		//查找单个类型
		ReaderType findRederTypeone(int id);
		//修改类型
		int  modifyRederType(ReaderType readertype);
		//删除读者类型
		int deleteRederType(int id);
		//查询所有读者信息
		void findAllManager(SxtPageUtil<Reader> sxtPageUtil);
		//查询所有读者信息总数
		int count();
		//修改类型所有读者信息
		int  modifyReder(Reader readertype);
		//查找单个类型单个读者信息
		Reader findReder(int id);
		//添加类型读者
		int addReder(Reader readertype);
		//删除读者信息
		int deleteReder(int id);
		
		/**
		 * 通过读者类型名查询所有读者类型
		 * @param name
		 * @return
		 */
		int queryReaderTypeByNameDao(String name);
}
