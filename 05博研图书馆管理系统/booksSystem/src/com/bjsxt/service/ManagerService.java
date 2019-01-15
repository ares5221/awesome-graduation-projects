package com.bjsxt.service;

import com.bjsxt.entity.BookCase;
import com.bjsxt.entity.Card;
import com.bjsxt.entity.Manager;
import com.bjsxt.entity.Purview;
import com.bjsxt.util.SxtPageUtil;

public interface ManagerService {
	//查询a管理员的权限与管理员信息
		void findAllManager(SxtPageUtil<Manager> sxtPageUtil);
		//查询a管理员的权限与管理员信息总数
		int count();
		int deleteManagePurview(int pid);
		Manager findOneManagePurview(int pid);
		int ModifyManagePurview(Purview pur);
		int addManage(Manager m); 
		Card findCard();
		int modifyCard(Card card);
		//查询一共多少书架
		int couttBookCase();
		//查询书架信息；
		void findallBookcase(SxtPageUtil<BookCase> sxtPageUtil);
		BookCase FindbookCardone(int bcid);
		int updectbookCase(BookCase book);
		int deleoneBookc(int bcid);
		int addoneBookc(String name);
		
}
