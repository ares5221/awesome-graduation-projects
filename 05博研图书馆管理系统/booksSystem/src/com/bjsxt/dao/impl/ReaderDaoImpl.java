package com.bjsxt.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;








import com.bjsxt.dao.ReaderDao;
import com.bjsxt.entity.Borrow;
import com.bjsxt.entity.Reader;
import com.bjsxt.entity.ReaderType;
import com.bjsxt.util.BjsxtJdbc;
import com.bjsxt.util.BjsxtUtil;
import com.bjsxt.util.SxtPageUtil;

public class ReaderDaoImpl implements ReaderDao {

	/**
	 * 读者信息校验查询
	 */
	@Override
	public Reader findReaderDao(String barcode) {
		// 声明连接
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet result = null;
		Reader reader = null;
		try {
			// 获取连接
			conn = BjsxtJdbc.getConnection();
			// 声明sql语句
			String sql = "select * from tb_reader r join tb_readertype rt on r.tid=rt.id where barcode = ? ";
			preStmt = BjsxtJdbc.getPreparedStatement(conn, sql);
			preStmt.setString(1, barcode);
			// 获得结果集
			result = preStmt.executeQuery();
			// 判断
			if (result.next()) {
				// 读者基本信息
				int rid = result.getInt("rid");
				String name = result.getString("name");
				String sex = result.getString("sex");
				int id = result.getInt("tid");
				String vocation = result.getString("vocation");
				Date birthday = result.getDate("birthday");
				String paperType = result.getString("paperType");
				String paperNo = result.getString("paperNo");
				String tel = result.getString("tel");
				String email = result.getString("email");
				Date createDate = result.getDate("createDate");
				String operator = result.getString("operator");
				String remark = result.getString("remark");
				Date endDate = result.getDate("endDate");
				// 读者类型信息
				int tid = result.getInt("id");
				String tname = result.getString(17);
				int number = result.getInt("number");
				reader = new Reader(rid, name, sex, id, barcode, vocation,
						birthday, paperType, paperNo, tel, email, createDate,
						operator, remark, endDate, new ReaderType(tid, tname,
								number));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			BjsxtJdbc.closeAll(result, preStmt, conn);
		}
		return reader;
	}

	/**
	 * 获取读者的借书信息
	 */
	@Override
	public List readerBorrowInfoDao(int readerid) {
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
			String sql = "select bw.id,bsk.bid,bsk.bname,bw.borrowTime,bw.backTime,pb.publishName,bc.bcname,bk.price from tb_reader r "
					+ " join tb_borrow bw on r.rid=bw.rid "
					+ " join tb_bookbaseinfo bsk on bw.bid=bsk.bid "
					+ " join tb_bookinfo bk on bsk.bid=bk.bid "
					+ " join tb_publishing pb on bsk.ISBN=pb.ISBN "
					+ " join tb_bookcase bc on bsk.bcid=bc.bcid "
					+ " where r.rid= ? ;";
			preStmt = BjsxtJdbc.getPreparedStatement(conn, sql);
			preStmt.setInt(1, readerid);
			// 获得结果集
			result = preStmt.executeQuery();
			// 判断
			while (result.next()) {
				// 获取图书查询
				int id = result.getInt("id");
				int bid = result.getInt("bid");
				String bname = result.getString("bname");
				Date borrowTime = result.getDate("borrowtime");
				Date backTime = result.getDate("backtime");
				String publishName = result.getString("publishname");
				String bcname = result.getString("bcname");
				String price = result.getString("price");

				List list = new ArrayList<>();
				list.add(id);
				list.add(bid);
				list.add(bname);
				list.add(borrowTime);
				list.add(backTime);
				list.add(publishName);
				list.add(bcname);
				list.add(price);
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
	 * 给学生添加借阅书籍
	 */
	@Override
	public boolean addBookToReaderDao(Borrow b) {
		// 添加图书
		System.out.println("ReaderDaoImpl.addBookToReaderDao()" + b.toString());
		String sql1 = "insert into tb_borrow(rid,bid,sid,borrowtime,backtime,ifback)  values(?,?,?,?,?,0)";
		Object[] objs = { b.getRid(), b.getBid(), b.getSid(),b.getBorrowTime(), b.getBackTime() };
		int n1 = BjsxtJdbc.excuteDML(sql1, objs);
		// 该图书借出量+1
		// 获取书的剩余量
		int count = new BookDaoImpl().findBookByIdDao(b.getBid()).getCount();
		//获取借阅次数
		int borrowcount = new BookDaoImpl().findBookByIdDao(b.getBid()).getBorrowcount();
		
		String sql2 = "update tb_bookbaseinfo set count = ?,borrowcount = ? where bid = ? ";
		Object[] objs2 = { count-1,borrowcount + 1, b.getBid() };
		int n2 = BjsxtJdbc.excuteDML(sql2, objs2);

		if (n1 > 0) {
			System.out.println("ReaderDaoImpl.addBookToReaderDao(添加成功-------)");
		}
		if (n2 > 0) {
			System.out.println("ReaderDaoImpl.addBookToReaderDao(修改成功-------)");
		}
		return n1 > 0 && n2 > 0;
	}

	/**
	 * 图书续借
	 */
	@Override
	public int bookRenewDao(int borrowid,int sid) {
		// 1.修改图书归还状态 、修改归还日期
		// 获取tb_borrow表信息 归还日期
        Date backTime = getSigleBorrowInfoDao(borrowid).getBackTime();
        Calendar cal = Calendar.getInstance();
		cal.setTime(backTime);
		cal.add(Calendar.DATE, 30);
        String newBackTime = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
		System.out.println("ReaderDaoImpl.bookRenewDao()"+newBackTime);
		//更改归还日期和状态
		String sql="update tb_borrow set backtime = ? , ifback = 1 , sid = ? where id = ? ";
		Object[] objs={newBackTime,sid,borrowid};		
		return BjsxtJdbc.excuteDML(sql, objs);
	}

	/**
	 * 图书归还
	 */
	@Override
	public boolean bookBackDao(int borrowid,int sid) {
		System.out.println("ReaderDaoImpl.bookBackDao()"+borrowid);
		 //1.获取rid，bid
        Borrow borrow = getSigleBorrowInfoDao(borrowid);
		
		// 2.删除借书信息
		String sql1="delete from tb_borrow  where id = ? ";
		Object[] objs1={borrowid};		
		int n1=BjsxtJdbc.excuteDML(sql1, objs1);
		if(n1>0){
			System.out.println("ReaderDaoImpl.bookBackDao(借书表信息删除成功)");
		}
		//3.增加归还信息
	     //获取归还时间
        String backDate = BjsxtUtil.nowdatestr();
		String sql2=" insert into tb_giveback(rid,bid,sid,backtime) values(?,?,?,?)";
		Object[] objs2={borrow.getRid(),borrow.getBid(),sid,backDate};		
		int n2=BjsxtJdbc.excuteDML(sql2, objs2);
		if(n2>0){
			System.out.println("ReaderDaoImpl.enclosing_method(还书表添加成功)");
		}
		
		//4.更新在架图书借出数量
		  //获取归还之前的图书剩余量
		// 获取书的剩余量
		int count = new BookDaoImpl().findBookByIdDao(borrow.getBid()).getCount();
		String sql3 = "update tb_bookbaseinfo set count = ? where bid = ? ";
		Object[] objs3 = { count+1,borrow.getBid() };		
		int n3=BjsxtJdbc.excuteDML(sql3, objs3);
		if(n3>0){
			System.out.println("ReaderDaoImpl.enclosing_method(馆藏数量修改成功)");
		}
		
		return n1>0&&n2>0&&n3>0;
	}

	/**
	 * 通过rid 和 bid 获取单个的借书信息
	 */
	@Override
	public Borrow getSigleBorrowInfoDao(int borrowid) {
		// 声明连接
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet result = null;
		Borrow borrow = null;
		try {
			// 获取连接
			conn = BjsxtJdbc.getConnection();
			// 声明sql语句
			String sql = "select * from tb_borrow  where id= ? ;";
			preStmt = BjsxtJdbc.getPreparedStatement(conn, sql);
			preStmt.setInt(1, borrowid);
			// 获得结果集
			result = preStmt.executeQuery();
			// 判断
			if (result.next()) {
				// 获取图书查询
				int id = result.getInt("id");
				int rid = result.getInt("rid");
				int bid = result.getInt("bid");
				int sid = result.getInt("sid");
				Date borrowTime = result.getDate("borrowtime");
				Date backTime = result.getDate("backtime");
				int ifback = result.getInt("ifback");
				borrow = new Borrow(bid, rid, sid, borrowTime, backTime, ifback);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			BjsxtJdbc.closeAll(result, preStmt, conn);
		}
		return borrow;
	}
	
	@Override
	public List<ReaderType> findAllRederType() {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet resultSet = null;
		List<ReaderType> list= new ArrayList<>();
		try {
			connection = BjsxtJdbc.getConnection();
			StringBuilder sql = new StringBuilder("select *from tb_readertype");

			ps = BjsxtJdbc.getPreparedStatement(connection, sql);
			resultSet = ps.executeQuery();
			while(resultSet.next()){
				int id=resultSet.getInt("id");
				String name=resultSet.getString("name");
				int number=resultSet.getInt("number");
				ReaderType readerType=new ReaderType(id, name, number);
				list.add(readerType);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BjsxtJdbc.closeAll(resultSet, ps, connection);
		}
	return list;
	}

	@Override
	public int addRederType(ReaderType r) {
		String sql ="INSERT into tb_readertype(name ,number) VALUES (?,?)";
		Object[] objs={r.getName(),r.getNumber()};
		return BjsxtJdbc.excuteDML(sql, objs);
	}

	@Override
	public ReaderType findRederTypeone(int id) {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet resultSet = null;
		ReaderType rp=null;
		try {
			connection = BjsxtJdbc.getConnection();
			StringBuilder sql = new StringBuilder("select *from tb_readertype where id=?");

			ps = BjsxtJdbc.getPreparedStatement(connection, sql);
			ps.setInt(1,id);
			resultSet = ps.executeQuery();
			while(resultSet.next()){
				
				String name=resultSet.getString("name");
				int number=resultSet.getInt("number");
				rp=new ReaderType(id, name, number);
			
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BjsxtJdbc.closeAll(resultSet, ps, connection);
		}
	return rp;
	}

	@Override
	public int modifyRederType(ReaderType r) {
		
		String sql="update  tb_readertype set name=?,number=? WHERE id=? ";
		Object[] objs={r.getName(),r.getNumber(),r.getId()};
		return BjsxtJdbc.excuteDML(sql, objs);
	}

	@Override
	public int deleteRederType(int id) {
		
		CharSequence sql="delete  from tb_readertype where id=?";
		Object []objs={id};
		return BjsxtJdbc.excuteDML(sql, objs);
	}

	@Override
	public void findAllManager(SxtPageUtil<Reader> sxtPageUtil) {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet resultSet = null;
		List<Reader> list= new ArrayList<>();
		try {
			connection = BjsxtJdbc.getConnection();
			StringBuilder sql = new StringBuilder("select r.rid rid,r.barcode barcode ,r.name name1,"
					+ "t.name name2,r.paperType paperType,"
					+ "r.paperNO paperNO,r.tel tel ,r.email "
					+ "email from tb_reader r,tb_readertype  "
					+ "t where t.id=r.tid");
			sql.append(" limit "+ sxtPageUtil.getStart() +","+ sxtPageUtil.getSize());
			ps = BjsxtJdbc.getPreparedStatement(connection, sql);
			resultSet = ps.executeQuery();
			while(resultSet.next()){
				Reader r=new Reader();
				ReaderType rt=new ReaderType();
				r.setRid(resultSet.getInt("rid"));
				r.setBarcode(resultSet.getString("barcode"));
				r.setName(resultSet.getString("name1"));
				rt.setName(resultSet.getString("name2"));
				r.setPaperType(resultSet.getString("paperType"));
				
				r.setPaperNo(resultSet.getString("paperNO"));
				r.setTel(resultSet.getString("tel"));
				r.setEmail(resultSet.getString("email"));
				r.setReaderType(rt);
				list.add(r);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BjsxtJdbc.closeAll(resultSet, ps, connection);
		}
		sxtPageUtil.setList(list);
		
	}

	@Override
	public int count() {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet resultSet = null;
		int int1 = 0;
		try {
			connection = BjsxtJdbc.getConnection();
			StringBuilder sql = new StringBuilder("select count(*) coun from tb_reader ");
			
			ps = BjsxtJdbc.getPreparedStatement(connection, sql);
			resultSet = ps.executeQuery();
			while(resultSet.next()){
			int1 = resultSet.getInt("coun");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BjsxtJdbc.closeAll(resultSet, ps, connection);
		}
		
		return int1 ;
	}

	@Override
	public int modifyReder(Reader readertype) {
		
		return 0;
	}

	@Override
	public Reader findReder(int id) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Reader reader = new Reader();
		try {
			conn = BjsxtJdbc.getConnection();
			stmt = conn.createStatement();
			String sql = "SELECT * FROM tb_reader r JOIN tb_readerType rt  ON r.id=rt.id WHERE r.rid="
					+ id;
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				String name = rs.getString(2);
				String sex = rs.getString("sex");
				int id1 = rs.getInt("id");
				String barcode = rs.getString("barcode");
				String vocation = rs.getString("vocation");
				Date birthday = rs.getDate("birthday");
				String paperType = rs.getString("paperType");
				String paperNo = rs.getString("paperNo");
				String tel = rs.getString("tel");
				String email = rs.getString("email");
				Date createDate = rs.getDate("createDate");
				String operator = rs.getString("operator");
				String remark = rs.getString("remark");
				Date endDate = rs.getDate("endDate");
				int number = rs.getInt("number");
				String rname = rs.getString(17);
				ReaderType readerType = new ReaderType(id, rname, number);
				reader = new Reader(id1, name, sex, id, barcode, vocation,
						birthday, paperType, paperNo, tel, email, createDate,
						operator, remark, endDate, readerType);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return reader;
		
	}

	@Override
	public int addReder(Reader readertype) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReder(int id) {
		return 0;
	}

	/**
	 * 通过读者类型名查询所有读者类型
	 */
	@Override
	public int queryReaderTypeByNameDao(String name) {
		// 声明连接
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet result = null;
		try {
			// 获取连接
			conn = BjsxtJdbc.getConnection();
			// 声明sql语句
			String sql="select *  from tb_readertype where name= ? ";
			preStmt=BjsxtJdbc.getPreparedStatement(conn, sql);
			preStmt.setString(1, name);
			result = preStmt.executeQuery();
			if(result.next()){
				return 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			BjsxtJdbc.closeAll(result, preStmt, conn);
		}
				
		return -1;
	}

	
	
	
}
