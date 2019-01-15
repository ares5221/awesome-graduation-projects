package com.bjsxt.school.service;

import java.util.List;

import com.bjsxt.school.entity.Book;
import com.bjsxt.school.entity.Student;
import com.bjsxt.school.entity.StudentBook;
import com.bjsxt.school.util.PageBean;

public interface LibraryService {

	int bookRegister(Book book);


	void find(PageBean<Book> pageBean, String bookId, String bookName,
			String press);


	Book showBookById(String bookId);


	int deleteBook(String bookId);


	int updateBook(Book book);


	Student showStuById(String stuId);


	List<StudentBook> showStuBookByStuId(String stuId);


	int bookCountSubtract(Book book);


	int addBorrowBook(StudentBook stuBook);


	void bookCountAdd(Book book);


	void deleteBorrowBook(String stuId, String bookId);


	List<StudentBook> showBorrowBook(String select, String text);



	

}
