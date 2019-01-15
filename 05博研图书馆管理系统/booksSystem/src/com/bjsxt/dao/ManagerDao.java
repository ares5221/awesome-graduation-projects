package com.bjsxt.dao;

import java.util.List;

import com.bjsxt.entity.BookCase;
import com.bjsxt.entity.Card;
import com.bjsxt.entity.Manager;
import com.bjsxt.entity.Purview;
import com.bjsxt.util.SxtPageUtil;

public interface ManagerDao {
//查询a管理员的权限与管理员信息
	void findAllManager(SxtPageUtil<Manager> sxtPageUtil);
	//查询a管理员的权限与管理员信息总数
	int count();
	//删除管理源
	int deleteManagePurview(int pid);
	//查询单个管理源
	Manager findOneManagePurview(int pid);
	//更新管理员权限信息
	int ModifyManagePurview(Purview pur);
	//添加管理源
	int addManage(Manager m); 
	//给管理源添加权限
	int addPuview();
	//查询费用
	Card findCard();
	//修改费用
	int modifyCard(Card card);
	//查询一共多少书架
	int couttBookCase();
	//查询书架信息；
	void findallBookcase(SxtPageUtil<BookCase> sxtPageUtil);
	
	//查询单个的书架名称
	BookCase findBookcaseone( int id);
	//修该书架名称
	int modifyBookcaseCard(BookCase  card);
	//删除书架名称
	int deleteBookid(int pid);
	//添加书架名称
	int addBookid(String ca);
	
}
