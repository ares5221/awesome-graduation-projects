package com.bjsxt.school.dao;

import java.util.List;

import com.bjsxt.school.entity.Book;

public interface BookDao {

	int save(Book book);

	int findCount(String bookId, String bookName, String press);

	List<Book> find(int start, int end, String bookId, String bookName,
			String press);

	Book findById(String bookId);

	int delete(String bookId);

	int update(Book book);

	int countUpdate(Book book);

}
