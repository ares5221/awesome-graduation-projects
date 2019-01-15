package com.bjsxt.service.impl;

import com.bjsxt.dao.LibraryDao;
import com.bjsxt.dao.impl.LibraryDaoImpl;
import com.bjsxt.entity.Library;
import com.bjsxt.service.LibraryService;

public class LibraryServiceImpl implements LibraryService{
	private LibraryDao libeDao=new LibraryDaoImpl();
	@Override
	public Library findLibrary() {
		
		return this.libeDao.findLibrary();
	}
	@Override
	public int modifyLibrary(Library library) {
		
		return this.libeDao.modifyLibrary(library);
	}

}
