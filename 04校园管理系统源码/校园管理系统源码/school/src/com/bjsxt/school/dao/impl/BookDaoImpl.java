package com.bjsxt.school.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bjsxt.school.dao.BookDao;
import com.bjsxt.school.entity.Book;
import com.bjsxt.school.entity.Student;
import com.bjsxt.school.util.DBUtils;


public class BookDaoImpl implements BookDao {

	@Override
	public int save(Book book) {
		String sql = "insert into BOOK_REGINSTER values(?,?,?,?,?,?,?,?,?,?,?)";
		Object params[] = { book.getBookId(), book.getBookName(),
				book.getBookType(), book.getWriter(), book.getPress(),
				book.getPressDate(), book.getPrice(), book.getRegDate(),
				book.getCount(), book.getOperator(), book.getRemark() };
		return DBUtils.doDML(sql, params);

	}

	@Override
	public int findCount(String bookId, String bookName, String press) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			conn = DBUtils.getConnection();
			stmt = conn.createStatement();
			StringBuffer sql = new StringBuffer(
					"select count(*) from BOOK_REGINSTER where 1=1");
			if (bookId != null && !"".equals(bookId)) {
				sql.append(" and bookId like '%" + bookId + "%'");
			}
			if (bookName != null && !"".equals(bookName)) {
				sql.append(" and bookName like '%" + bookName + "%'");
			}
			if (press != null && !"".equals(press)) {
				sql.append(" and press like '%" + press + "%'");
			}
			rs = stmt.executeQuery(sql.toString());
			rs.next();
			count = rs.getInt(1);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, stmt, conn);
		}
		return count;
	}

	@Override
	public List<Book> find(int start, int end, String bookId, String bookName,
			String press) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Book> bookList = new ArrayList<Book>();
		try {
			conn = DBUtils.getConnection();
			stmt = conn.createStatement();
			StringBuffer sql = new StringBuffer(
					"select * from BOOK_REGINSTER where 1=1");
			if (bookId != null && !"".equals(bookId)) {
				sql.append(" and bookId like '%" + bookId + "%'");
			}
			if (bookName != null && !"".equals(bookName)) {
				sql.append(" and bookName like '%" + bookName + "%'");
			}
			if (press != null && !"".equals(press)) {
				sql.append(" and press like '%" + press + "%'");
			}

			String sql2 = "select  * from (select rownum rn,t2.* from ("
					+ sql.toString() + " ) t2 " + "where rownum <=" + end
					+ " ) " + "where rn >" + start;
			rs = stmt.executeQuery(sql2);
			while (rs.next()) {
				String bookId1 = rs.getString("bookId");
				String bookName1 = rs.getString("bookName");
				String bookType = rs.getString("bookType");
				String writer = rs.getString("writer");
				String press1 = rs.getString("press");
				Date pressDate = rs.getDate("pressDate");
				double price = rs.getDouble("price");
				Date regDate = rs.getDate("regDate");
				int count = rs.getInt("count");
				String operator = rs.getString("operator");
				String remark = rs.getString("remark");

				Book book = new Book(bookId1, bookName1, bookType, writer,
						press1, pressDate, price, regDate, count, operator,
						remark);
				bookList.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, stmt, conn);
		}

		return bookList;
	}

	@Override
	public Book findById(String bookId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Book book=null;
		try {
			conn=DBUtils.getConnection();
			
			String sql = "select * from BOOK_REGINSTER where bookid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String bookId1 = rs.getString("bookId");
				String bookName1 = rs.getString("bookName");
				String bookType = rs.getString("bookType");
				String writer = rs.getString("writer");
				String press1 = rs.getString("press");
				Date pressDate = rs.getDate("pressDate");
				double price = rs.getDouble("price");
				Date regDate = rs.getDate("regDate");
				int count = rs.getInt("count");
				String operator = rs.getString("operator");
				String remark = rs.getString("remark");

				book = new Book(bookId1, bookName1, bookType, writer,
						press1, pressDate, price, regDate, count, operator,
						remark);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, pstmt, conn);
		}
		return book;
	}

	@Override
	public int  delete(String bookId) {
		String sql = "delete from BOOK_REGINSTER where bookid=?";
		Object params[] = { bookId };
		return DBUtils.doDML(sql, params);

	}

	@Override
	public int update(Book book) {
	
		String sql="update BOOK_REGINSTER set bookname=?,booktype=?"
				+ ",writer=? , press=?, pressdate=?, price=?, regdate=?"
				+ ",count=?, operator=?, remark=? where bookid=?";
		Object params[] = {book.getBookName(),book.getBookType(), 
				book.getWriter(), book.getPress(),book.getPressDate(),
				book.getPrice(), book.getRegDate(),book.getCount(), 
				book.getOperator(), book.getRemark(),book.getBookId() };
		return DBUtils.doDML(sql, params);
	}


	@Override
	public int countUpdate(Book book) {
		String sql="update BOOK_REGINSTER set count=? where bookid=?";
		Object params[] = {book.getCount(),book.getBookId()};
		return DBUtils.doDML(sql, params);
	}


}
