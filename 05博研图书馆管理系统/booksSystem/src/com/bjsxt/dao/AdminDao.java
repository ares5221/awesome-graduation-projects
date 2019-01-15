package com.bjsxt.dao;

import java.util.Date;
import java.util.List;

import com.bjsxt.entity.BookCase;
import com.bjsxt.entity.BookType;
import com.bjsxt.entity.Manager;



public interface AdminDao {
	/**
	 * 更改管理员密码
	 * @param sid
	 * @param pwd
	 * @return
	 */
	int modifyPwdDao(int sid,String pwd);
	
	/**
	 * 管理员登录
	 * @param name
	 * @param pwd
	 * @return
	 */
	Manager managerloginDao(String name,String pwd);
	/**
	 * 查找图书类型
	 * @return
	 */
	List<BookType> selectBookTypeDao();
	/**
	 * 删除图书类型
	 * @param tid
	 * @return
	 */
	int delBookDao(String tid);
	
	/**
	 * 管理图书档案
	 * @return
	 */
	List selectBookDao();
	
	/**
	 * 查找书架
	 * @return
	 */
	List<BookCase> selectpagesDao();
	/***
	 * 添加图书类型
	 * @param bookType
	 * @return
	 */
	int addBookTypeDao(BookType bookType);
	
	/**
	 * 模糊查询管理图书
	 * @param key
	 * @param name
	 * @return
	 */
	List likeBookDao(String key,String name);
	/**
	 * 模糊查询 图书借阅查询
	 * @param key
	 * @param name
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	List likeBorrowBookDao(int key,String name,Date startTime,Date endTime);
	/**
	 * 根据编号查找图书类型
	 * @param tid
	 * @return
	 */
	BookType selectBookNoDao(int tid);
	
	/**
	 * 修改图书类型
	 * @param bookType
	 * @return
	 */
	int updateBookTypeDao(BookType bookType);
	
	/**
	 * 删除图书档案管理
	 * @param bid
	 * @return
	 */
	int delbookTypeDao(int bid);
}
