package com.bjsxt.service.impl;

import java.util.Date;
import java.util.List;

import com.bjsxt.dao.AdminDao;
import com.bjsxt.dao.impl.AdminDaoImpl;
import com.bjsxt.entity.BookCase;
import com.bjsxt.entity.BookType;
import com.bjsxt.entity.Manager;
import com.bjsxt.service.AdminService;

public class AdminServiceImpl implements AdminService{
	 
	AdminDao adminDao=new AdminDaoImpl();
	/**
	 * 更改管理员密码
	 */
	@Override
	public int modifyPwdSer(int sid, String pwd) {
		
		return adminDao.modifyPwdDao(sid, pwd);
	}

	//登录
	@Override
	public Manager managerloginSer(String name, String pwd) {
		
		return adminDao.managerloginDao(name, pwd);
	}
	//查找图书类型
	@Override
	public List<BookType> selectBookTypeSer() {
		
		return adminDao.selectBookTypeDao();
	}
	//删除图书类型
	@Override
	public int delBookDao(String tid) {
		
		return adminDao.delBookDao(tid);
	}
	//管理图书档案	
	@Override
	public List selectBookSer() {
	
		return adminDao.selectBookDao();
	}
	//查找书架
	@Override
	public List<BookCase> selectpagesSer() {
		
		return adminDao.selectpagesDao();
	}
	//添加图书类型
	@Override
	public int addBookTypeSer(BookType bookType) {
		
		return adminDao.addBookTypeDao(bookType);
	}
	@Override
	public List likeBookSer(String key,String name) {
		
		return adminDao.likeBookDao(key,name);
	}
	@Override
	public List likeBorrowBookSer(int key,String name,Date startTime,Date endTime) {
		
		return adminDao.likeBorrowBookDao(key, name, startTime, endTime);
	}
	//根据编号查找图书类型
	@Override
	public BookType selectBookNoSer(int tid) {
		
		return adminDao.selectBookNoDao(tid);
	}
	//修改图书类型
	@Override
	public int updateBookTypeSer(BookType bookType) {
		
		return adminDao.updateBookTypeDao(bookType);
	}
	
	/**
	 * 删除图书档案管理
	 */
	@Override
	public int delbookTypeDao(int bid) {
		
		return adminDao.delbookTypeDao(bid);
	}
}
