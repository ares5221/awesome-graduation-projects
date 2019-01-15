package com.bjsxt.school.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bjsxt.school.dao.StudentBookDao;
import com.bjsxt.school.entity.Student;
import com.bjsxt.school.entity.StudentBook;
import com.bjsxt.school.util.DBUtils;

public class StudentBookDaoImpl implements StudentBookDao {

	@Override
	public List<StudentBook> findByStuId(String stuId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<StudentBook> stuBookList=new ArrayList<StudentBook>();
		try {
			conn=DBUtils.getConnection();
			String sql = "select * from BOOK_BORROW_INFO where sid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, stuId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String borrowId = rs.getString("borrowid");
				String bookId = rs.getString("bookid");
				String sId = rs.getString("sid");
				String bookName = rs.getString("bookname");
				double price=rs.getDouble("price");
				String bookType = rs.getString("booktype");
				Date borrowDate = rs.getDate("borrowdate");
				Date returnDate = rs.getDate("returndate");
				String operator = rs.getString("operator");
				StudentBook stuBook=new StudentBook(borrowId, bookId, sId, bookName, price, bookType, borrowDate, returnDate, operator);
				stuBookList.add(stuBook);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, pstmt, conn);
		}
		return stuBookList;
	}

	@Override
	public int add(StudentBook stuBook) {
		String sql="insert into BOOK_BORROW_INFO values(seq_stubook.nextval,?,?,?,?,?,?,?,?)";
		Object params[] = { stuBook.getBookId(), stuBook.getsId(),
				stuBook.getBookName(),stuBook.getPrice(),stuBook.getBookType(),
				stuBook.getBorrowDate(),stuBook.getReturnDate(),stuBook.getOperator()};
		return DBUtils.doDML(sql, params);
		
	}

	@Override
	public void delete(String stuId, String bookId) {
		String sql="delete from BOOK_BORROW_INFO where sid=? and bookid=?";
		Object params[] = {stuId,bookId};
		DBUtils.doDML(sql, params);
	}

	@Override
	public List<StudentBook> findBorrowBook(String select, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<StudentBook> stuBookList=new ArrayList<StudentBook>();
		try {
			conn=DBUtils.getConnection();
			StringBuffer sql=new StringBuffer("select * from BOOK_BORROW_INFO where 1=1");
			if("stuId".equals(select)){
				sql.append(" and sid= ?");
			}else if("bookId".equals(select)){
				sql.append(" and bookid= ?");
			}else if("borrowDate".equals(select)){
				sql.append(" and to_char(borrowdate,'yyyy-MM-dd')=?");
			}
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, text);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String borrowId = rs.getString("borrowid");
				String bookId = rs.getString("bookid");
				String sId = rs.getString("sid");
				String bookName = rs.getString("bookname");
				double price=rs.getDouble("price");
				String bookType = rs.getString("booktype");
				Date borrowDate = rs.getDate("borrowdate");
				Date returnDate = rs.getDate("returndate");
				String operator = rs.getString("operator");
				StudentBook stuBook=new StudentBook(borrowId, bookId, sId, bookName, price, bookType, borrowDate, returnDate, operator);
				stuBookList.add(stuBook);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, pstmt, conn);
		}
		return stuBookList;
	}

}
