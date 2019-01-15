package com.bjsxt.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.bjsxt.dao.BookDao;
import com.bjsxt.entity.BookBaseInfo;
import com.bjsxt.entity.Reader;
import com.bjsxt.util.BjsxtJdbc;
import com.bjsxt.util.SxtPageUtil;


public class BookDaoImpl implements BookDao{

	/**
	 * 通过barcode查询book信息
	 */
	@Override
	public BookBaseInfo findBookByBarcodeDao(String barcode) {
		// 声明连接
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet result = null;
		BookBaseInfo bookBaseInfo=null;
		try {
			// 获取连接
			conn = BjsxtJdbc.getConnection();
			// 声明sql语句
			String sql = "select * from tb_bookbaseinfo where barcode = ? ";
			preStmt = BjsxtJdbc.getPreparedStatement(conn, sql);
			preStmt.setString(1, barcode);
			// 获得结果集
			result = preStmt.executeQuery();
			// 判断
			if (result.next()) {
				//获取图书查询	
				int bid = result.getInt("bid");
				String ISBN = result.getString("ISBN");
				int lid = result.getInt("lid");
				int tid = result.getInt("tid");
				int bcid = result.getInt("bcid");
				String bname = result.getString("bname");
				String author = result.getString("author");
				int count = result.getInt("count");
				int borrowcount = result.getInt("borrowcount");
				bookBaseInfo=new BookBaseInfo(bid, ISBN, lid, tid, bcid, barcode, bname, author, count, borrowcount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			BjsxtJdbc.closeAll(result, preStmt, conn);
		}
		return bookBaseInfo;
	}

	/**
	 * 通过书名查询book信息
	 */
	@Override
	public BookBaseInfo findBookByNameDao(String bname) {
		// 声明连接
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet result = null;
		BookBaseInfo bookBaseInfo=null;
		try {
			// 获取连接
			conn = BjsxtJdbc.getConnection();
			// 声明sql语句
			String sql = "select * from tb_bookbaseinfo where bname = ? ";
			preStmt = BjsxtJdbc.getPreparedStatement(conn, sql);
			preStmt.setString(1, bname);
			// 获得结果集
			result = preStmt.executeQuery();
			// 判断
			if (result.next()) {
				//获取图书查询	
				int bid = result.getInt("bid");
				String ISBN = result.getString("ISBN");
				int lid = result.getInt("lid");
				int tid = result.getInt("tid");
				int bcid = result.getInt("bcid");
				String barcode = result.getString("barcode");
				String author = result.getString("author");
				int count = result.getInt("count");
				int borrowcount = result.getInt("borrowcount");
				bookBaseInfo=new BookBaseInfo(bid, ISBN, lid, tid, bcid, barcode, bname, author, count, borrowcount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			BjsxtJdbc.closeAll(result, preStmt, conn);
		}
		return bookBaseInfo;
	}

	/**
	 * 通过书id查询book信息
	 */
	@Override
	public BookBaseInfo findBookByIdDao(int bid) {
		// 声明连接
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet result = null;
		BookBaseInfo bookBaseInfo=null;
		try {
			// 获取连接
			conn = BjsxtJdbc.getConnection();
			// 声明sql语句
			String sql = "select * from tb_bookbaseinfo where bid = ? ";
			preStmt = BjsxtJdbc.getPreparedStatement(conn, sql);
			preStmt.setInt(1, bid);
			// 获得结果集
			result = preStmt.executeQuery();
			// 判断
			if (result.next()) {
				//获取图书查询	
				String ISBN = result.getString("ISBN");
				int lid = result.getInt("lid");
				int tid = result.getInt("tid");
				int bcid = result.getInt("bcid");
				String barcode = result.getString("barcode");
				String bname = result.getString("bname");
				String author = result.getString("author");
				int count = result.getInt("count");
				int borrowcount = result.getInt("borrowcount");
				bookBaseInfo=new BookBaseInfo(bid, ISBN, lid, tid, bcid, barcode, bname, author, count, borrowcount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			BjsxtJdbc.closeAll(result, preStmt, conn);
		}
		return bookBaseInfo;
	}

	/**
	 * 获取过期图书
	 */
	@Override
	public List getOverdueBookInfoDao() {
		// 声明连接
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet result = null;
		List bookList = new ArrayList<>();
		Reader reader = null;
		try {
			// 获取连接
			conn = BjsxtJdbc.getConnection();
			// 声明sql语句
			String sql = "select bsk.barcode bbarcode,bsk.bname,r.barcode rbarcode,r.name,bw.borrowTime,bw.backTime from tb_reader r "
						+ "join tb_borrow bw on r.rid=bw.rid "
						+ "join tb_bookbaseinfo bsk on bw.bid=bsk.bid "
						+ " where backTime<SYSDATE()";
			preStmt = BjsxtJdbc.getPreparedStatement(conn, sql);
			// 获得结果集
			result = preStmt.executeQuery();
			// 判断
			while (result.next()) {
				// 获取图书查询
				String bbarcode = result.getString("bbarcode");
				String bname = result.getString("bname");
				String rbarcode = result.getString("rbarcode");
				String rname = result.getString("name");
				Date borrowTime = result.getDate("borrowtime");
				Date backTime = result.getDate("backtime");

				List list = new ArrayList<>();
				list.add(bbarcode);
				list.add(bname);
				list.add(rbarcode);
				list.add(rname);
				list.add(borrowTime);
				list.add(backTime);
				bookList.add(list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			BjsxtJdbc.closeAll(result, preStmt, conn);
		}
		return bookList;
	}

	/**
	 * 获取图书借阅信息
	 */
	@Override
	public List getBorrowInfoDao() {
		// 声明连接
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet result = null;
		List bookList = new ArrayList<>();
		Reader reader = null;
		try {
			// 获取连接
			conn = BjsxtJdbc.getConnection();
			// 声明sql语句
			String sql = "select bsk.barcode,bsk.bname,bsk.author,p.publishName,bk.price,y.typename,c.bcname,bsk.count,bsk.borrowcount from tb_bookbaseinfo bsk "
							+ "join tb_bookcase c  on bsk.bcid=c.bcid "
							+ "join tb_booktype y on y.tid=bsk.tid "
							+ "join tb_publishing  p on p.ISBN=bsk.ISBN "
							+ "join tb_bookinfo bk  on bk.bid=bsk.bid";
			preStmt = BjsxtJdbc.getPreparedStatement(conn, sql);
			// 获得结果集
			result = preStmt.executeQuery();
			// 判断
			while (result.next()) {
				// 获取图书查询
				String barcode = result.getString("barcode");
				String bname = result.getString("bname");
				String author = result.getString("author");
				String publishname = result.getString("publishname");
				double price = result.getDouble("price");
				String typename = result.getString("typename");
				String bcname = result.getString("bcname");
				int count = result.getInt("count");
				int borrowcount = result.getInt("borrowcount");
				List list = new ArrayList<>();
				list.add(barcode);
				list.add(bname);
				list.add(author);
				list.add(publishname);
				list.add(price);
				list.add(typename);
				list.add(bcname);
				list.add(count);
				list.add(borrowcount);
				
				bookList.add(list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			BjsxtJdbc.closeAll(result, preStmt, conn);
		}
		return bookList;
	}

	@Override
	public List findBorrowByFacDao(String type,String key) {
		// 声明连接
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet result = null;
		List bookList = new ArrayList<>();
		Reader reader = null;
		try {
			// 获取连接
			conn = BjsxtJdbc.getConnection();
			// 声明sql语句
			StringBuilder sql=new StringBuilder("select bsk.barcode,bsk.bname,bsk.author,p.publishName,bk.price,y.typename,c.bcname,bsk.count,bsk.borrowcount from tb_bookbaseinfo bsk "
					+ "join tb_bookcase c  on bsk.bcid=c.bcid "
					+ "join tb_booktype y on y.tid=bsk.tid "
					+ "join tb_publishing  p on p.ISBN=bsk.ISBN "
					+ "join tb_bookinfo bk  on bk.bid=bsk.bid where 1 = 1 ");
			
			preStmt = BjsxtJdbc.getPreparedStatement(conn, sql);
			//进行sql拼接
			if("0".equals(type)){//barcode
				sql.append(" and  bsk.barcode like ?");
				preStmt=BjsxtJdbc.getPreparedStatement(conn, sql);
				//设置参数
				preStmt.setString(1,"%"+key+"%");
			}else if("1".equals(type)){//bname
				sql.append(" and bsk.bname like ?");
				System.out.println("BookDaoImpl.findBorrowByFacDao()"+sql);
				preStmt=BjsxtJdbc.getPreparedStatement(conn, sql);
				//设置参数
				preStmt.setString(1,"%"+key+"%");
			}else{
				preStmt=BjsxtJdbc.getPreparedStatement(conn, sql);
			}
			// 获得结果集
			result = preStmt.executeQuery();
			// 判断
			while (result.next()) {
				// 获取图书查询
				String barcode = result.getString("barcode");
				String bname = result.getString("bname");
				String author = result.getString("author");
				String publishname = result.getString("publishname");
				double price = result.getDouble("price");
				String typename = result.getString("typename");
				String bcname = result.getString("bcname");
				int count = result.getInt("count");
				int borrowcount = result.getInt("borrowcount");
				List list = new ArrayList<>();
				list.add(barcode);
				list.add(bname);
				list.add(author);
				list.add(publishname);
				list.add(price);
				list.add(typename);
				list.add(bcname);
				list.add(count);
				list.add(borrowcount);
				
				bookList.add(list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			BjsxtJdbc.closeAll(result, preStmt, conn);
		}
		return bookList;
	}

	/**
	 * 获取借书排行榜信息
	 */
	@Override
	public List getRankListDao(SxtPageUtil<List> page) {
		// 声明连接
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet result = null;
		List bookList = new ArrayList<>();
		try {
			// 获取连接
			conn = BjsxtJdbc.getConnection();
			// 声明sql语句
			StringBuilder sql=new StringBuilder("select bsk.barcode,bsk.bname,bsk.author,p.publishName,bk.price,y.typename,c.bcname,bsk.count,bsk.borrowcount from tb_bookbaseinfo bsk "
					+ "join tb_bookcase c  on bsk.bcid=c.bcid "
					+ "join tb_booktype y on y.tid=bsk.tid "
					+ "join tb_publishing  p on p.ISBN=bsk.ISBN "
					+ "join tb_bookinfo bk  on bk.bid=bsk.bid "
					+ "ORDER BY  borrowcount  DESC"
					+ " limit ?,? ");
			
			preStmt = BjsxtJdbc.getPreparedStatement(conn, sql);
			preStmt.setInt(1,page.getStart());
			preStmt.setInt(2,page.getSize());
			// 获得结果集
			result = preStmt.executeQuery();
			// 判断
			int count=1;
			while (result.next()) {
				// 获取图书查询
				String barcode = result.getString("barcode");
				String bname = result.getString("bname");
				String typename = result.getString("typename");
				String bcname = result.getString("bcname");
				String publishname = result.getString("publishname");
				String author = result.getString("author");
				double price = result.getDouble("price");
				int borrowcount = result.getInt("borrowcount");
				List list = new ArrayList<>();
				list.add(page.getStart()+count);
				list.add(barcode);
				list.add(bname);
				list.add(typename);
				list.add(bcname);
				list.add(publishname);
				list.add(author);
				list.add(price);
				list.add(borrowcount);
				bookList.add(list);
				count++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			BjsxtJdbc.closeAll(result, preStmt, conn);
		}
		return bookList;
	}

	/**
	 *  获取书单总数
	 */
	@Override
	public int getBookNumDao() {
		// 声明连接
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet result = null;
		try {
			// 获取连接
			conn = BjsxtJdbc.getConnection();
			// 声明sql语句
			String sql="select count(*) c from tb_bookbaseinfo";
			preStmt=BjsxtJdbc.getPreparedStatement(conn, sql);
			result = preStmt.executeQuery();
			if(result.next()){
				return result.getInt("c");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			BjsxtJdbc.closeAll(result, preStmt, conn);
		}
				
		return 0;
	}

	
}
