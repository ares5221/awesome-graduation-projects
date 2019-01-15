package com.bjsxt.service;

import java.util.Date;
import java.util.List;

import com.bjsxt.entity.BookCase;
import com.bjsxt.entity.BookType;
import com.bjsxt.entity.Manager;



public interface AdminService {
	/**
	 * 更改管理员密码
	 * @param sid
	 * @param pwd
	 * @return
	 */
	int modifyPwdSer(int sid,String pwd);

	//管理员登录
	Manager managerloginSer(String name,String pwd);
	//查找图书类型
	List<BookType> selectBookTypeSer();
	//删除图书类型
	int delBookDao(String tid);
	
	//管理图书档案
	List selectBookSer();
		
	//查找书架
	List<BookCase> selectpagesSer();
	
	//添加图书类型
	int addBookTypeSer(BookType bookType);
	
	//模糊查询管理图书
	List likeBookSer(String key,String name);
	
	//模糊查询 图书借阅查询
	List likeBorrowBookSer(int key,String name,Date startTime,Date endTime);
	
	//根据编号查找图书类型
	BookType selectBookNoSer(int tid);
	
	//修改图书类型
	int updateBookTypeSer(BookType bookType);
	

	/**
	 * 删除图书档案管理
	 * @param bid
	 * @return
	 */
	int delbookTypeDao(int bid);
}
