package com.bjsxt.school.test;

import java.sql.Date;

import org.junit.Test;

import com.bjsxt.school.dao.impl.StudentDaoImpl;
import com.bjsxt.school.entity.Book;
import com.bjsxt.school.entity.Student;
import com.bjsxt.school.service.LibraryService;
import com.bjsxt.school.service.impl.LibraryServiceImpl;

public class TestLibraryService {
	@Test
	public void testBookRegister(){
		Date pressDate=Date.valueOf("2012-1-2");
		Date regDate=Date.valueOf("2012-1-2");
		Book book=new Book("aaa", "aaa", "aaa", "aaa", "aaa", pressDate, 12, regDate, 11, "aaa", "aaa");
		LibraryService LibraryService=new LibraryServiceImpl();
		int n = LibraryService.bookRegister(book);
		System.out.println(n);
	}
	@Test
	public void testStudentFindById(){
		StudentDaoImpl stuDao =new StudentDaoImpl();
		Student stu = stuDao.findById("aaa");
		System.out.println(stu);
		
		
	}
	
}
