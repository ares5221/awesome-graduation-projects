package com.bjsxt.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.bjsxt.dao.AdminDao;
import com.bjsxt.entity.BookCase;
import com.bjsxt.entity.BookType;
import com.bjsxt.entity.Manager;
import com.bjsxt.util.BjsxtJdbc;

public class AdminDaoImpl implements AdminDao{

	/**
	 * 更改管理员密码
	 */
	@Override
	public int modifyPwdDao(int sid, String pwd) {
		String sql="update tb_manager set pwd= ? where sid = ?";
		Object[] objs={pwd,sid};
		return BjsxtJdbc.excuteDML(sql, objs);
	}

	//管理员登录
		@Override
		public Manager managerloginDao(String name, String pwd) {
			//声明
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			Manager manager=null;
			
			conn=BjsxtJdbc.getConnection();
			String sql="select * from tb_manager where name=? and pwd=?";
			pstmt=BjsxtJdbc.getPreparedStatement(conn, sql);
			try {
				pstmt.setString(1, name);
				pstmt.setString(2, pwd);
				
				//发送sql，获取结果
				rs=pstmt.executeQuery();
				if(rs.next()){
					 int sid=rs.getInt("sid");
					 int pid=rs.getInt("pid");
					
					manager=new Manager(sid, pid, name, pwd); 
					System.out.println("AdminDaoImpl.managerloginDao()"+manager);	 
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return manager;
		}
		
		/**
		 * 查找图书类型
		 */
		@Override
		public List<BookType> selectBookTypeDao() {
			//声明
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<BookType> bookTypeList=new ArrayList<>();
			
			conn=BjsxtJdbc.getConnection();
			String sql="select * from tb_booktype ";
			pstmt=BjsxtJdbc.getPreparedStatement(conn, sql);
			try {
				//发送sql，获取结果
				rs=pstmt.executeQuery();
				while(rs.next()){
					 int tid=rs.getInt("tid");
					 String typeName=rs.getString("typename");
					 int days=rs.getInt("days");
					 
					 BookType bookType=new BookType(tid, typeName, days);
					 bookTypeList.add(bookType);
					 System.out.println("AdminDaoImpl.selectBookTypeDao()"+bookType);
				}
			} catch (SQLException e) {
					e.printStackTrace();
		    }finally{
		    	BjsxtJdbc.closeAll(rs, pstmt, conn);
		    }
			return bookTypeList;
	    }
		
		/**
		 * 删除图书类型
		 */
		@Override
		public int delBookDao(String tid) {
			String sql="delete from tb_booktype where tid=?";
			Object [] objs={tid};
			return BjsxtJdbc.excuteDML(sql, objs);
		}
		//管理图书档案
		@Override
		public List selectBookDao() {
			//声明
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List bookquaryList=new ArrayList<>();
			
			conn=BjsxtJdbc.getConnection();
			String sql="select f.bid,f.bcid,f.ISBN,f.tid,f.barcode,f.bname,y.typename,p.publishName,c.bcname from tb_bookbaseinfo f join tb_bookcase c on f.bcid=c.bcid join tb_booktype y on y.tid=f.tid join tb_publishing  p on p.ISBN=f.ISBN";
			pstmt=BjsxtJdbc.getPreparedStatement(conn, sql);
			try {
			
				
				//发送sql，获取结果
				rs=pstmt.executeQuery();
				while(rs.next()){
					int bid=rs.getInt("bid");// 图书id
					String ISBN=rs.getString("ISBN");// ISBN
					 
					 int tid=rs.getInt("tid");//图书类型编号
					 int bcid=rs.getInt("bcid");// 书架编号
					 String barcode=rs.getString("barcode");// 条形码
					 String bname=rs.getString("bname");// 书名
					 //出版社
					  String publish=rs.getString("publishname");
					 //书架名
					 String bcname=rs.getString("bcname");
					//图书类型
					  String typeName=rs.getString("typename");
					  
					  List bookList = new ArrayList<>();
					  
					  bookList.add(bid);
					  bookList.add(ISBN);
					  bookList.add(tid);
					  
					  bookList.add(bcid);
					  bookList.add(barcode);
					  bookList.add(bname);
					  bookList.add(publish);
					  bookList.add(bcname);
					  bookList.add(typeName);
					  
					  bookquaryList.add(bookList);
				}
	         } catch (SQLException e) {
							e.printStackTrace();
             }finally{
            	 BjsxtJdbc.closeAll(rs, pstmt, conn);
             }
			 return bookquaryList;
		}
		
		/**
		 * 查找书架
		 */
		@Override
		public List<BookCase> selectpagesDao() {
			//声明
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<BookCase> pagesList=new ArrayList<>();
			
			conn=BjsxtJdbc.getConnection();
			String sql="select * from tb_bookcase ";
			pstmt=BjsxtJdbc.getPreparedStatement(conn, sql);
			try {
				//发送sql，获取结果
				rs=pstmt.executeQuery();
				while(rs.next()){
					 int bcid=rs.getInt("bcid");
					 String bcname=rs.getString("bcname");
					
					 BookCase bookCase=new BookCase(bcid, bcname);
					 pagesList.add(bookCase); 
				}
			} catch (SQLException e) {
					e.printStackTrace();
			}finally{
				BjsxtJdbc.closeAll(rs, pstmt, conn);
			}
			return pagesList;
		}
		
		/**
		 * 添加图书类型
		 */
		@Override
		public int addBookTypeDao(BookType bookType) {
			String sql="INSERT into tb_booktype(typename,days) values ( ?,? )";
			Object [] objs={bookType.getTypeName(),bookType.getDays()};
			return BjsxtJdbc.excuteDML(sql, objs);
		}
		
		/**
		 * 模糊查询图书
		 */
		@Override
		public List likeBookDao(String key,String name) {
			//声明
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List bookquaryList=new ArrayList<>();
			
			int key1=Integer.parseInt(key);
			System.out.println("AdminDaoImpl.likeBookDao()"+"---------"+name);
			try {
				
				conn=BjsxtJdbc.getConnection();
				StringBuilder sql= new StringBuilder("select f.bid,f.bcid,f.ISBN,f.tid,f.barcode,f.bname,y.typename,p.publishname,c.bcname from tb_bookbaseinfo f join tb_bookcase c on f.bcid=c.bcid join tb_booktype y on y.tid=f.tid join tb_publishing  p on p.ISBN=f.ISBN where 1=1 ");
				
				//判断
				if(key1==1 && name!=null&&!"".equals(name)){
					sql.append(" and  barcode like ?");
					pstmt=BjsxtJdbc.getPreparedStatement(conn, sql);
					//设置参数
					pstmt.setString(1,"%"+name+"%");
					
					
				}else if(key1==2 && name!=null&&!"".equals(name)){
					sql.append(" and bname like ?");
					pstmt=BjsxtJdbc.getPreparedStatement(conn, sql);
					//设置参数
					pstmt.setString(1,"%"+name+"%");	
					
				}else if(key1==3 && name!=null&&!"".equals(name)){
					sql.append(" and typename like ? ");
					pstmt=BjsxtJdbc.getPreparedStatement(conn, sql);
					//设置参数
					pstmt.setString(1,"%"+name+"%");	
				}else if(key1==4 && name!=null&&!"".equals(name)){
					sql.append(" and publishName like ?");
					pstmt=BjsxtJdbc.getPreparedStatement(conn, sql);
					//设置参数
					pstmt.setString(1,"%"+name+"%");	
				}else if(key1==5 && name!=null&&!"".equals(name)){
					sql.append(" and  bcname like ?");
					pstmt=BjsxtJdbc.getPreparedStatement(conn, sql);
					//设置参数
					pstmt.setString(1,"%"+name+"%");				
				}else {
					pstmt=BjsxtJdbc.getPreparedStatement(conn, sql);
				}
				System.out.println("AdminDaoImpl.selectLike()"+sql);
				//发送触发器，接收结果集
				rs=pstmt.executeQuery();
				while(rs.next()){
					int bid=rs.getInt("bid");// 图书id
					String ISBN=rs.getString("ISBN");// ISBN
					 
					 int tid=rs.getInt("tid");//图书类型编号
					 int bcid=rs.getInt("bcid");// 书架编号
					 String barcode=rs.getString("barcode");// 条形码
					 String bname=rs.getString("bname");// 书名
					 //出版社
					  String publish=rs.getString("publishname");
					 //书架名
					 String bcname=rs.getString("bcname");
					//图书类型
					  String typeName=rs.getString("typename");
					  
					  List bookList = new ArrayList<>();
					  
					  bookList.add(bid);
					  bookList.add(ISBN);
					  bookList.add(tid);
					  
					  bookList.add(bcid);
					  bookList.add(barcode);
					  bookList.add(bname);
					  bookList.add(publish);
					  bookList.add(bcname);
					  bookList.add(typeName);
					  
					  bookquaryList.add(bookList);
					  System.out.println("AdminDaoImpl.likeBookDao()"+sql);  
				 }
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				BjsxtJdbc.closeAll(rs, pstmt, conn);
			}
			return bookquaryList;
		}
		
		//图书借阅查询 (模糊查询)
		@Override
		public List likeBorrowBookDao(int key,String name,Date startTime,Date endTime) {
			//声明
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List borrowBooksList=new ArrayList<>();
			
			System.out.println("AdminDaoImpl.likeBookDao()"+"---------"+name);
			try {
				
				conn=BjsxtJdbc.getConnection();
				StringBuilder sql= new StringBuilder("select f.bid,f.bcid,f.ISBN,f.lid,f.tid,f.barcode,f.bname,r.barcode,r.barcode,r.`name`,b.borrowTime,b.backTime,b.ifback from tb_bookbaseinfo f join tb_borrow b on b.bid=f.bid join tb_reader r on b.id=r.id where 1=1 ");
				
				//判断
				if(key==1 && name!=null&&!"".equals(name)){
					sql.append(" and  barcode like ?");
					pstmt=BjsxtJdbc.getPreparedStatement(conn, sql);
					//设置参数
					pstmt.setString(1,"%"+name+"%");
					
					
				}else if(key==2 && name!=null&&!"".equals(name)){
					sql.append(" and bname like ?");
					pstmt=BjsxtJdbc.getPreparedStatement(conn, sql);
					//设置参数
					pstmt.setString(1,"%"+name+"%");	
					
				}else if(key==3 && name!=null&&!"".equals(name)){
					sql.append(" and barcode like ? ");
					pstmt=BjsxtJdbc.getPreparedStatement(conn, sql);
					//设置参数
					pstmt.setString(1,"%"+name+"%");	
				}else if(key==4 && name!=null&&!"".equals(name)){
					sql.append(" and name like ?");
					pstmt=BjsxtJdbc.getPreparedStatement(conn, sql);
					//设置参数
					pstmt.setString(1,"%"+name+"%");
					
					//借阅时间
				}else if((startTime!=null&&!"".equals(startTime))&&(endTime!=null&&!"".equals(endTime))){
					sql.append(" and borrowTime=? ");
					pstmt=BjsxtJdbc.getPreparedStatement(conn, sql);
					//设置参数
					pstmt.setString(1,name);
					
				}else if((startTime!=null&&!"".equals(startTime))){
					sql.append(" and backTime=? ");
					pstmt=BjsxtJdbc.getPreparedStatement(conn, sql);
					//设置参数
					pstmt.setString(1,name);
					
				}else if((endTime!=null&&!"".equals(endTime))){
					sql.append(" and ifback=? ");
					pstmt=BjsxtJdbc.getPreparedStatement(conn, sql);
					//设置参数
					pstmt.setString(1,name);
				}else {
					pstmt=BjsxtJdbc.getPreparedStatement(conn, sql);
				}
				System.out.println("AdminDaoImpl.selectLike()"+sql);
				//发送触发器，接收结果集
				rs=pstmt.executeQuery();
				while(rs.next()){
					int bid=rs.getInt("bid");// 图书id
					String ISBN=rs.getString("ISBN");// ISBN
					 
					 int tid=rs.getInt("tid");//图书类型编号
					 int bcid=rs.getInt("bcid");// 书架编号
					 String barcode=rs.getString("barcode");// 条形码
					 String bname=rs.getString("bname");// 书名
					//借书 
					Date borrowTime=rs.getDate("borrowTime");
					Date backTime=rs.getDate("backTime");
					int ifback=rs.getInt("ifback");
					//读者
					 String name1=rs.getString("name");
					 String barcode1=rs.getString("barcode");
					
					  
					  List bookList = new ArrayList<>();
					  
					  bookList.add(bid);
					  bookList.add(ISBN);
					  bookList.add(tid);
					  
					  bookList.add(bcid);
					  bookList.add(barcode);
					  bookList.add(bname);
					  bookList.add(borrowTime);
					  bookList.add(backTime);
					  bookList.add(ifback);
					  
					  bookList.add(name1);
					  bookList.add(barcode1);
					  
					  borrowBooksList.add(bookList);
					  System.out.println("AdminDaoImpl.likeBookDao()"+sql);  
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				BjsxtJdbc.closeAll(rs, pstmt, conn);
			}
			return borrowBooksList;
		}
		
		/**
		 * 根据编号查找图书类型
		 */
		@Override
		public BookType selectBookNoDao(int tid) {

			//声明
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			BookType bookType=null;
			
			conn=BjsxtJdbc.getConnection();
			String sql="select * from tb_booktype where tid=?";
			pstmt=BjsxtJdbc.getPreparedStatement(conn, sql);
			try {
				pstmt.setInt(1, tid);
				//发送sql，获取结果
				rs=pstmt.executeQuery();
				if(rs.next()){
					 int tid1=rs.getInt("tid");
					 String typeName=rs.getString("typename");
					 int days=rs.getInt("days");
					 
					 bookType=new BookType(tid1, typeName, days);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				BjsxtJdbc.closeAll(rs, pstmt, conn);
			}
			return bookType;
		}
		
		/**
		 * 修改
		 */
		@Override
		public int updateBookTypeDao(BookType bookType) {
			String sql="update tb_booktype set typename=?, days=? where tid=? ";
			Object [] objs={bookType.getTypeName(),bookType.getDays(),bookType.getTid()};
			System.out.println("AdminDaoImpl.updateBookTypeDao()"+sql);
			return BjsxtJdbc.excuteDML(sql, objs);
		}
		
		/**
		 * 删除图书档案管理
		 */
		@Override
		public int delbookTypeDao(int bid) {
			String sql="delete from tb_bookbaseinfo where bid=?";
			Object [] objs={bid};
			return BjsxtJdbc.excuteDML(sql, objs);
		}
}
