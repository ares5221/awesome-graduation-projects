package com.bjsxt.service.impl;

import com.bjsxt.dao.ManagerDao;
import com.bjsxt.dao.impl.ManagerDaoImpl;
import com.bjsxt.entity.BookCase;
import com.bjsxt.entity.Card;
import com.bjsxt.entity.Manager;
import com.bjsxt.entity.Purview;
import com.bjsxt.service.ManagerService;
import com.bjsxt.util.SxtPageUtil;

public class ManagerServiceImpl implements ManagerService{
	private ManagerDao maDao=new ManagerDaoImpl();
	@Override
	public void findAllManager(SxtPageUtil<Manager> sxtPageUtil) {
		
		maDao.findAllManager(sxtPageUtil);
	}

	@Override
	public int count() {
		
		return maDao.count();
	}

	@Override
	public int deleteManagePurview(int pid) {
		
		return maDao.deleteManagePurview(pid);
	}

	@Override
	public Manager findOneManagePurview(int pid) {
		// TODO Auto-generated method stub
		return maDao.findOneManagePurview(pid);
	}

	@Override
	public int ModifyManagePurview(Purview pur) {
		
		return maDao.ModifyManagePurview(pur);
	}

	@Override
	public int addManage(Manager m) {
		
		return maDao.addManage(m);
	}

	@Override
	public Card findCard() {
		
		return maDao.findCard();
	}

	@Override
	public int modifyCard(Card card) {
		// TODO Auto-generated method stub
		return maDao.modifyCard(card);
	}

	@Override
	public int couttBookCase() {
		
		return maDao.couttBookCase();
	}

	@Override
	public void findallBookcase(SxtPageUtil<BookCase> sxtPageUtil) {
		maDao.findallBookcase(sxtPageUtil);
		
	}

	@Override
	public BookCase FindbookCardone(int bcid) {
		
		return maDao.findBookcaseone(bcid);
	}

	@Override
	public int updectbookCase(BookCase book) {
		
		return maDao.modifyBookcaseCard(book);
	}

	@Override
	public int deleoneBookc(int bcid) {
		
		return maDao.deleteBookid(bcid);
	}

	@Override
	public int addoneBookc(String name) {
		
		return maDao.addBookid(name);
	}

}
