package com.bjsxt.school.service.impl;

import java.util.List;

import com.bjsxt.school.dao.BookDao;
import com.bjsxt.school.dao.StudentBookDao;
import com.bjsxt.school.dao.StudentDao;
import com.bjsxt.school.dao.impl.BookDaoImpl;
import com.bjsxt.school.dao.impl.StudentBookDaoImpl;
import com.bjsxt.school.dao.impl.StudentDaoImpl;
import com.bjsxt.school.entity.Book;
import com.bjsxt.school.entity.Student;
import com.bjsxt.school.entity.StudentBook;
import com.bjsxt.school.service.LibraryService;
import com.bjsxt.school.util.PageBean;

public class LibraryServiceImpl implements LibraryService{
	private BookDao bookDao=new BookDaoImpl();
	private StudentDao stuDao=new StudentDaoImpl();
	private StudentBookDao stuBookDao=new StudentBookDaoImpl();
	@Override
	public int bookRegister(Book book) {
		
		return this.bookDao.save(book);
	}
	@Override
	public void find(PageBean<Book> pageBean, String bookId, String bookName,
			String press) {
		int totalCount=bookDao.findCount(bookId,bookName,press);
		pageBean.setTotalCount(totalCount);
		
		int start=pageBean.getStartRow();
		int end=pageBean.getEndRow();
		List<Book> bookList=bookDao.find(start,end,bookId,bookName,press);
		pageBean.setList(bookList);
		
	}
	@Override
	public Book showBookById(String bookId) {
		
		return this.bookDao.findById(bookId);
	}
	@Override
	public int deleteBook(String bookId) {
		return this.bookDao.delete(bookId);
		
	}
	@Override
	public int updateBook(Book book) {
		
		return this.bookDao.update(book);
	}
	@Override
	public Student showStuById(String stuId) {
		
		return this.stuDao.findById(stuId);
	}
	@Override
	public List<StudentBook> showStuBookByStuId(String stuId) {
		
		return this.stuBookDao.findByStuId(stuId);
	}
	@Override
	public int bookCountSubtract(Book book) {
		book.setCount(book.getCount()-1);
		return this.bookDao.countUpdate(book);
	}
	@Override
	public int addBorrowBook(StudentBook stuBook) {
		
		return this.stuBookDao.add(stuBook);
	}
	@Override
	public void bookCountAdd(Book book) {
		book.setCount(book.getCount()+1);
		this.bookDao.countUpdate(book);
		
	}
	@Override
	public void deleteBorrowBook(String stuId, String bookId) {
		this.stuBookDao.delete(stuId,bookId);
		
	}
	@Override
	public List<StudentBook> showBorrowBook(String select, String text) {
		
		return this.stuBookDao.findBorrowBook(select,text);
	}
	

}
