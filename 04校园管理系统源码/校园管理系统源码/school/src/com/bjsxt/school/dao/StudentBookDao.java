package com.bjsxt.school.dao;

import java.util.List;

import com.bjsxt.school.entity.StudentBook;

public interface StudentBookDao {

	List<StudentBook> findByStuId(String stuId);

	int add(StudentBook stuBook);

	void delete(String stuId, String bookId);

	List<StudentBook> findBorrowBook(String select, String text);

}
