package com.umt.lab.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.umt.lab.dbaccess.Dbaccess;
import com.umt.lab.vo.labVo;

public class labDao {
	private Dbaccess db = null;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Statement stmt;
	
	// 查询项目所有
	private String SqlSearchAll = "select * from lab1_peng";
	//按用户名和密码和数据库中的数据进行核对查询是否正确
	private String SqlSearchname = "select count(*) as mycount  from lab5_peng  where username=? and userpwd =?";
	//添加实验记录
	 private String sqlInsert ="insert into lab1_peng(id,lore,labclass,labname,labDate,kts,team,teacher) " +
                               "values(into_id.nextval,?,?,?,?,?,?,?)";
	//修改实验数据
	 private String sqlUpdate="update lab1_peng set lore=?, labclass=?, labname=?, labDate=?, kts=?, team=?, teacher=?  where id=?";
	 //删除实验数据
	private String sqldelete ="delete from lab1_peng where id=?";
	 // 按主键查询
	private String SqlSearchByKey = "select * from lab1_peng  where id= ?";
	
	//查询最新实验发布
	private  String SqlAlllab="select * from lab2_peng";
	//添加最新实验
	private String SqlNewLab="insert into lab2_peng (id,labname,labtype,team,labDate,kts,labclass,teacher) " +
			                 "values(into_id.nextval,?,?,?,?,?,?,?)";
	
   //修改最新实验记录
	private String SqlNewUpdate="update lab2_peng set labname=?, labtype=?,team=?,labDate=?,kts=?,labclass=?,teacher=? where id=?";
	
	//删除最新实验记录
	private String SqlNewDelete="delete from lab2_peng where id=?";
	 // 按主键查询
	private String SqlSearchByKey2 = "select * from lab2_peng  where id=? ";	
	
	
	//查询所有演示实验信息
	private String SqlAllDemo="select *  from lab3_peng ";
	//添加演示实验信息
	private String sqlInsertDemo="insert into lab3_peng(id ,teacher,lore,labclass,labname,labDate) " +
			                      " values (into_id.nextval,?,?,?,?,?) ";
	//修改演示实验信息
	private String sqlUpdateDemo="update lab3_peng set teacher=?,lore=?, labclass=?, labname=?, labDate=?  where id=?";
	//删除演示实验信息
	private String sqlDeleteDemo="delete from lab3_peng where id=? ";
	//按主键查询演示实验信息
	private String sqlSeacherDemo ="select * from lab3_peng where id=? ";
	
	//查询所有物品借还信息
	private String sqlArticle=" select * " +
			                  " from lab4_peng l ,returna r   where l.returnno=r.returnno  ";
	//添加物品借还信息
	private String SqlInsertArticle="insert into  lab4_peng (id,borrowdate,borrowname,articlename,model,borrowlist,returndate, " +
			                        "returnlist,returnpeople,returnno )  " +
			                        " values (into_id.nextval ,?,?,?,?,?,?,?,?,?) ";
	//修改物品借还信息
	private String SqlUpdateArticle="update lab4_peng set borrowdate=?,borrowname=?,articlename=?,model=?,borrowlist=?,returndate=?, " +
			                        "  returnlist=?,returnpeople=?,returnno=?  where id=? ";
	//删除物品借还信息
	private String SqlDeleteAritcle="delete from lab4_peng  where id=? ";
	//按主键Id查询物品借还信息
	private String sqlArticleId="select l.id, l.borrowdate, l.borrowname,l.articlename,l.model,l.borrowlist,l.returndate,  " +
			                        " l.returnlist,l.returnpeople,l.returnno,r.returns as returnstate from lab4_peng l ,returna r where l.returnno=r.returnno and id=? ";
	
	//查询所有用户信息
	private String SqlAllPeople="select * from lab5_peng ";
	//添加用户信息
	private String SqlInsertPeople="insert into lab5_peng (studentno,studentname,sax,borndate,age,classname,username,userpwd,labname,fraction)  " +
			                       " values(studentno.nextval,?,?,?,?,?,?,?,?,?) ";
	
	//修改用户信息
	private String SqlUpdatePeople="update lab5_peng set studentname=?,sax=?,borndate=?,age=?,classname=?,username=?,userpwd=?,labname=?,fraction=? " +
			                       "  where studentno =?";
	//删除用户信息
	private String SqlDeletePeople="delete  from lab5_peng where studentno=? ";
	//按主键studentno查询用户信息
	private String SqlSeachPeople="select * from lab5_peng where studentno=?  ";
	
	
	/**
	 * 按用户名和密码查询是否有当前用户
	 * 
	 * @param empno
	 * 
	 */
	public boolean Searchname(String username, String userpwd) {

		
			 db  = new Dbaccess();
			 db.connect();
			 conn = db.getConn();
			 boolean b = false;
			 try {
				pstmt = conn.prepareStatement(SqlSearchname);
				pstmt.setString(1, username);
				pstmt.setString(2, userpwd);			
				rs = pstmt.executeQuery();			
				if (rs.next())
				{
					if (rs.getInt("mycount")==1)
					{
						b = true;
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally
			{
				db.closeConn(conn);
				pstmt = null;
				rs = null;		
			}
			return b;		
		}
		 
	
	
	
	
	
	
	/**查询所有实验记录
	 * 
	 * @return
	 */
	 
	public List SearchAll() {
		db = new Dbaccess();
		db.connect();
		conn = db.getConn();
		List list = null;
		labVo vo = null;
		try {
			list=new ArrayList();
			pstmt = conn.prepareStatement(SqlSearchAll);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new labVo(rs.getInt("id"),
					           rs.getString("lore"),
	            		       rs.getString("labclass"),
	            		       rs.getString("labname"),
	            		       rs.getDate("labDate"),
	            		       rs.getInt("kts"),
	            		       rs.getInt("team"),
	            		       rs.getString("teacher"));

				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.closeConn(conn);
			pstmt = null;
			rs = null;
		}
		return list;
	}

	
	
	
	
	
	/**
	 * 添加新的实验记录信息
	 * @param vo
	 * @return
	 */
	public boolean labInsert(labVo vo) {

		
		 db  = new Dbaccess();
		 db.connect();
		 conn = db.getConn();
		 boolean b = false;
		 try {
			pstmt = conn.prepareStatement(sqlInsert);
			pstmt.setString(1, vo.getLore());
			pstmt.setString(2, vo.getLabclass());		
			pstmt.setString(3, vo.getLabname());	
			//转换日期格式
			pstmt.setDate(4,vo.getLabDate());	
			
			pstmt.setInt(5, vo.getKts());	
			pstmt.setInt(6, vo.getTeam());	
			pstmt.setString(7, vo.getTeacher());	
		
			
			int i=pstmt.executeUpdate();	
          //判断是否插入2个以上的用户信息
			if (i>0)
			{
           	b=true;
           	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			db.closeConn(conn);
			pstmt = null;
			rs = null;		
		}
		return b;		
	}
	
	/**
	 * 修改实验记录信息后在进行添加
	 * @param vo
	 * @return
	 */
	
	public boolean labUpdate(labVo vo) {

		
		 db  = new Dbaccess();
		 db.connect();
		 conn = db.getConn();
		 boolean b = false;
		 try {
			pstmt = conn.prepareStatement(sqlUpdate);
			
			
			pstmt.setString(1, vo.getLore());
			pstmt.setString(2, vo.getLabclass());		
			pstmt.setString(3, vo.getLabname());	
			//转换日期格式
			pstmt.setDate(4,vo.getLabDate());	
			
			pstmt.setInt(5, vo.getKts());	
			pstmt.setInt(6, vo.getTeam());	
			pstmt.setString(7, vo.getTeacher());	
			pstmt.setInt(8, vo.getId()); 

			 
			int i=pstmt.executeUpdate();	
          //判断是否插入2个以上的用户信息
			if (i>0)
			{
           	b=true;
           	
			}
		} 
		 catch (SQLException e)
		    {
			// TODO Auto-generated catch block
			e.printStackTrace();
		    }
		finally
		{
			db.closeConn(conn);
			pstmt = null;
			rs = null;		
		}
		return b;		
	}
	
	
	/**
	 * 按主键查询所有实验记录
	 */
	public labVo SearchByKey2(int id) {
		db = new Dbaccess();
		db.connect();
		conn = db.getConn();

		labVo vo = null;
		try {
			pstmt = conn.prepareStatement(SqlSearchByKey);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();

            if (rs.next()) {
				vo = new labVo( rs.getInt("id"),
						       rs.getString("lore"), 
						       rs.getString("labclass"),
						       rs.getString("labname"), 
						       rs.getDate("labdate"),
						       rs.getInt("kts"), 
						       rs.getInt("team"),
						       rs.getString("teacher"));
     	}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.closeConn(conn);
			pstmt = null;
			rs = null;
		}
		return vo;
	}
	
	/**
	 * 删除实验记录
	 * @return
	 */
	public boolean labDelete(int id){
		 db=new Dbaccess();
		 db.connect();
		 conn=db.getConn();
		 boolean b=false;
		 try {
			pstmt=conn.prepareStatement(sqldelete);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			b=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			db.closeConn(conn);
			pstmt = null;
			rs = null;
		}
		return b;
		}
	
	
	/*
	 * 根据条件实验记录信息
	 * 模糊查询
	 * 
	 * 
	 */
	
	public List SearchempInfo(String sql) {
		db = new Dbaccess();
		db.connect();
		conn = db.getConn();
		List list = null;
		labVo vo = null;
		try {
		     stmt = conn.createStatement();
		     
		     
		   sql = "select * from ("+sql+") ";
		     

			 rs = stmt.executeQuery(sql);
			
				
			list = new ArrayList();
			while (rs.next()) {
				vo = new labVo(rs.getInt("id"),
					            rs.getString("lore"),
					            rs.getString("labclass"),
					            rs.getString("labname"),
					            rs.getDate("labDate"),
					            rs.getInt("kts"),
					            rs.getInt("team"),
					            rs.getString("teacher")
					            );	
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.closeConn(conn);
			pstmt = null;
			rs = null;
		}
		
		return list;
		
	}
	
	

	/**
	 * 查询所有的最新实验发布情况
	 * @return
	 */
	public List labIssUe(){
		db=new Dbaccess();
		db.connect();
		conn=db.getConn();
		List list =null;
		labVo vo=null;
		try {
			list=new ArrayList();
			pstmt=conn.prepareStatement(SqlAlllab);
			rs=pstmt.executeQuery();
			while (rs.next()){
				vo=new labVo( rs.getInt("id"),
						      rs.getString("labname"),
						      rs.getString("labtype"),
						      rs.getInt("team"),
						      rs.getDate("labDate"),
						      rs.getInt("kts"),
						      rs.getString("labclass"),
						      rs.getString("teacher"));
				list.add(vo);
				}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn(conn);
			pstmt=null;
			rs=null;
	    }
		 return list;
		 }
	
	
	/**
	 * 添加最新的实验记录
	 * @param vo
	 * @return
	 */
	public boolean labNewInsert(labVo vo){
		db=new Dbaccess();
		db.connect();
		conn=db.getConn();
		
		 boolean b = false;
		 try {
			pstmt = conn.prepareStatement(SqlNewLab);
			
			pstmt.setString(1,vo.getLabname());
			pstmt.setString(2, vo.getLabtype());
			pstmt.setInt(3, vo.getTeam());
			pstmt.setDate(4, vo.getLabDate());
			pstmt.setInt(5, vo.getKts());
			pstmt.setString(6, vo.getLabclass());
			pstmt.setString(7, vo.getTeacher());
			
			int i=pstmt.executeUpdate();	
          //判断是否插入2个以上的用户信息
			if (i>0)
			{
           	b=true;
           	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			db.closeConn(conn);
			pstmt = null;
			rs = null;		
		}
		return b;		
	}
	
	
	
	/**
	 * 按主键id得到最新实验数据
	 * @param id
	 * @return
	 */
	public labVo SearchByKey3(int id) {
		db = new Dbaccess();
		db.connect();
		conn = db.getConn();

		labVo vo = null;
		try {
			pstmt = conn.prepareStatement(SqlSearchByKey2);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
		
            if (rs.next()) {
				vo = new labVo( rs.getInt("id"),
						       rs.getString("labname"),
						       rs.getString("labtype"), 
						       rs.getInt("team"),
						       rs.getDate("labDate"),
						       rs.getInt("kts"), 
						       rs.getString("labclass"),
						       rs.getString("teacher"));
     	}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.closeConn(conn);
			pstmt = null;
			rs = null;
		}
		return vo;
	}
	
	
	/**
	 * 修改最新实验信息后在进行添加
	 * @param vo
	 * @return
	 */
	
	public boolean labNewUpdate(labVo vo) {

		
		 db  = new Dbaccess();
		 db.connect();
		 conn = db.getConn();
		 boolean b = false;
		 try {
			pstmt = conn.prepareStatement(SqlNewUpdate);
			
			
			pstmt.setString(1,vo.getLabname());
			pstmt.setString(2, vo.getLabtype());  
			pstmt.setInt(3, vo.getTeam());
			pstmt.setDate(4,vo.getLabDate());
			pstmt.setInt(5, vo.getKts());
			pstmt.setString(6, vo.getLabclass());
			pstmt.setString(7, vo.getTeacher());
			pstmt.setInt(8, vo.getId());
			 
			pstmt.executeUpdate();	
         
		} 
		 catch (SQLException e)
		    {
			// TODO Auto-generated catch block
			e.printStackTrace();
		    }
		finally
		{
			db.closeConn(conn);
			pstmt = null;
			rs = null;		
		}
		return b;		
	}
	
	
	
	
	/**
	 * 删除最新实验记录
	 * @return
	 */
	public boolean labNewDelete(int id){
		 db=new Dbaccess();
		 db.connect();
		 conn=db.getConn();
		 boolean b=false;
		 try {
			pstmt=conn.prepareStatement(SqlNewDelete);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			b=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			db.closeConn(conn);
			pstmt = null;
			rs = null;
		}
		return b;
		}
	
	
	

	/**
	 * 根据条件查询最新实验信息
	 * 模糊查询
	 * @param sql
	 * @return
	 */
	public List SearchempInfo2(String sql) {
		db = new Dbaccess();
		db.connect();
		conn = db.getConn();
		List list = null;
		labVo vo = null;
		try {
		     stmt = conn.createStatement();
		     
		     
		   sql = "select * from ("+sql+") ";
		     

			 rs = stmt.executeQuery(sql);
			
			
			list = new ArrayList();
			while (rs.next()) {
				vo = new labVo( rs.getInt("id"),
						        rs.getString("labname"),
					            rs.getString("labtype"),
					            rs.getInt("team"),
					            rs.getDate("labDate"),
					            rs.getInt("kts"),
					            rs.getString("labclass"),
					            rs.getString("teacher")
					            
					            );	
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.closeConn(conn);
			pstmt = null;
			rs = null;
		}
		
		return list;
		
	}
	
	
	/**
	 * 查询所有的演示实验信息
	 * @return
	 */
	public List labAllDemo(){
		db=new Dbaccess();
		db.connect();
		conn=db.getConn();
		List list =null;
		labVo vo=null;
		try {
			list=new ArrayList();
			pstmt=conn.prepareStatement(SqlAllDemo);
			rs=pstmt.executeQuery();
			while (rs.next()){
				vo=new labVo(rs.getInt("id"),
						     rs.getString("teacher"),
				             rs.getString("lore"),
         		             rs.getString("labclass"),
         		             rs.getString("labname"),
         		             rs.getDate("labDate"));
				list.add(vo);
				}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn(conn);
			pstmt=null;
			rs=null;
	    }
		 return list;
		 }
	
	/**
	 *添加演示实验信息
	 * @return
	 */
	public boolean  labInsertDemo(labVo vo){
		db=new Dbaccess();
		db.connect();
	    conn=db.getConn();
	    boolean b=false;
	    try {
			pstmt=conn.prepareStatement(sqlInsertDemo);
			
			pstmt.setString(1,vo.getTeacher());
			pstmt.setString(2, vo.getLore());
			pstmt.setString(3, vo.getLabclass());
			pstmt.setString(4, vo.getLabname());
			pstmt.setDate(5,vo.getLabDate());
		
			pstmt.executeUpdate();	
	          //判断是否插入2个以上的用户信息
				
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn(conn);
			pstmt=null;
			rs=null;
			
		}return b;
		}
	

	/**
	 * 按主键id得到演示实验信息
	 * @param id
	 * @return
	 */
	public labVo SearchByKey4(int id) {
		db = new Dbaccess();
		db.connect();
		conn = db.getConn();

		labVo vo = null;
		try {
			pstmt = conn.prepareStatement(sqlSeacherDemo);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			 if (rs.next()) {
				vo = new labVo( rs.getInt("id"),
					        	rs.getString("teacher"),
					            rs.getString("lore"),
					        	rs.getString("labclass"),
						        rs.getString("labname"),
						        rs.getDate("labDate"));
     	}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.closeConn(conn);
			pstmt = null;
			rs = null;
		}
		return vo;
	}
	
	
	/**
	 * 修改演示实验信息后在进行添加
	 * @param vo
	 * @return
	 */
	
	public boolean labDemoUpdate(labVo vo) {

		
		 db  = new Dbaccess();
		 db.connect();
		 conn = db.getConn();
		 boolean b = false;
		 try {
			pstmt = conn.prepareStatement(sqlUpdateDemo);
			
			pstmt.setString(1, vo.getTeacher());
			pstmt.setString(2, vo.getLore());
			pstmt.setString(3, vo.getLabclass());
			pstmt.setString(4,vo.getLabname());
			pstmt.setDate(5, vo.getLabDate());
			pstmt.setInt(6, vo.getId());
	        pstmt.executeUpdate();
		 }
		 catch (SQLException e)
		    {
			// TODO Auto-generated catch block
			e.printStackTrace();
		    }
		finally
		{
			db.closeConn(conn);
			pstmt = null;
			rs = null;		
		}
		return b;		
	}
	/**
	 * 删除演示实验记录
	 * @return
	 */
	public boolean labDemoDelete(int id){
		 db=new Dbaccess();
		 db.connect();
		 conn=db.getConn();
		 boolean b=false;
		 try {
			pstmt=conn.prepareStatement(sqlDeleteDemo);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			b=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			db.closeConn(conn);
			pstmt = null;
			rs = null;
		}
		return b;
		}
	
	
	

	/**
	 * 根据条件查询最新实验信息
	 * 模糊查询
	 * @param sql
	 * @return
	 */
	public List SearchempInfo3(String sql) {
		db = new Dbaccess();
		db.connect();
		conn = db.getConn();
		List list = null;
		labVo vo = null;
		try {
		     stmt = conn.createStatement();
		     sql = "select * from ("+sql+") ";
		     rs = stmt.executeQuery(sql);
			list = new ArrayList();
			while (rs.next()) {
				vo = new labVo( rs.getInt("id"),
						        rs.getString("teacher"),
						        rs.getString("lore"),
						        rs.getString("labclass"),
						        rs.getString("labname"),
					            rs.getDate("labDate") );	
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.closeConn(conn);
			pstmt = null;
			rs = null;
		}
		
		return list;
		
	}
	
	/**
	 * 查询所有的物品借还信息
	 * @return
	 */
	public List labAllArticle(){
		db=new Dbaccess();
		db.connect();
		conn=db.getConn();
		List list =null;
		labVo vo=null;
		try {
			list=new ArrayList();
			pstmt=conn.prepareStatement(sqlArticle);
			rs=pstmt.executeQuery();
			while (rs.next()){
				
				
				vo=new labVo(rs.getInt("id"),
						     rs.getDate("borrowdate"),
						     rs.getString("borrowname"),
						     rs.getString("articlename"),
						     rs.getString("model"),
						     rs.getInt("borrowlist"),
						     rs.getDate("returndate"),
						     rs.getInt("returnlist"),
						     rs.getString("returnpeople"),
						     rs.getString("returns"));
				list.add(vo);
				}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn(conn);
			pstmt=null;
			rs=null;
	    }
		 return list;
		 }
	
	/**
	 * 添加物品借还信息
	 * @param vo
	 * @return
	 */
	public boolean labInsertArticle(labVo vo) {

		
		 db  = new Dbaccess();
		 db.connect();
		 conn = db.getConn();
		 boolean b = false;
		 try {
			pstmt = conn.prepareStatement(SqlInsertArticle);
			
			pstmt.setDate(1,vo.getBorrowdate());
			pstmt.setString(2, vo.getBorrowname());
			pstmt.setString(3, vo.getArticlename());
			pstmt.setString(4, vo.getModel());
			pstmt.setInt(5, vo.getBorrowlist());
			pstmt.setDate(6, vo.getReturndate());
			pstmt.setInt(7, vo.getReturnlist());
			pstmt.setString(8, vo.getReturnpeople());
			pstmt.setInt(9, vo.getReturnno());
			pstmt.executeUpdate();	
          
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			db.closeConn(conn);
			pstmt = null;
			rs = null;		
		}
		return b;		
	}
	
	
	/**
	 * 修改物品借还信息后在进行添加
	 * @param vo
	 * @return
	 */
	
	public boolean labUpdateArticle(labVo vo) {

		
		 db  = new Dbaccess();
		 db.connect();
		 conn = db.getConn();
		 boolean b = false;
		 try {
			pstmt = conn.prepareStatement(SqlUpdateArticle);
			
			
			pstmt.setDate(1, vo.getBorrowdate());
			pstmt.setString(2, vo.getBorrowname());
			pstmt.setString(3, vo.getArticlename());
			pstmt.setString(4, vo.getModel());
			pstmt.setInt(5, vo.getBorrowlist());
			pstmt.setDate(6, vo.getReturndate());
			pstmt.setInt(7, vo.getReturnlist());
			pstmt.setString(8, vo.getReturnpeople());
			pstmt.setInt(9, vo.getReturnno());
			pstmt.setInt(10, vo.getId());
			pstmt.executeUpdate();	
		} 
		 catch (SQLException e)
		    {
			// TODO Auto-generated catch block
			e.printStackTrace();
		    }
		finally
		{
			db.closeConn(conn);
			pstmt = null;
			rs = null;		
		}
		return b;		
	}
	
	
	/**
	 * 按主键查询物品借还管理
	 * @param id
	 * @return
	 */
	public labVo SearchByKey5(int id) {
		db = new Dbaccess();
		db.connect();
		conn = db.getConn();

		labVo vo = null;
		try {
			pstmt = conn.prepareStatement(sqlArticleId);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();

			
            if (rs.next()) {
				vo = new labVo( rs.getInt("id"),
						        rs.getDate("borrowdate"),
						        rs.getString("borrowname"),
						        rs.getString("articlename"),
						        rs.getString("model"),
						        rs.getInt("borrowlist"),
						        rs.getDate("returndate"),
						        rs.getInt("returnlist"),
						        rs.getString("returnpeople"),
						        rs.getInt("returnno"),
						        rs.getString("returnstate"));
     	}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.closeConn(conn);
			pstmt = null;
			rs = null;
		}
		return vo;
	}
	
	/**
	 * 删除物品借还记录
	 * @return
	 */
	public boolean labDeleteArticle(int id){
		 db=new Dbaccess();
		 db.connect();
		 conn=db.getConn();
		 boolean b=false;
		 try {
			pstmt=conn.prepareStatement(SqlDeleteAritcle);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			b=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			db.closeConn(conn);
			pstmt = null;
			rs = null;
		}
		return b;
		}
	
	
	/**
	 * 根据条件物品借还记录信息
	 * 模糊查询
	 * 
	 * 
	 */
	
	public List SearchempInfo4(String sql) {
		db = new Dbaccess();
		db.connect();
		conn = db.getConn();
		List list = null;
		labVo vo = null;
		try {
		     stmt = conn.createStatement();
		     
		     
		   sql = "select * from ("+sql+") ";
		     

			 rs = stmt.executeQuery(sql);
			
				
			list = new ArrayList();
			while (rs.next()) {
				vo = new labVo(rs.getInt("id"),
				               rs.getDate("borrowdate"),
				               rs.getString("borrowname"),
				               rs.getString("articlename"),
				               rs.getString("model"),
				               rs.getInt("borrowlist"),
				               rs.getDate("returndate"),
				               rs.getInt("returnlist"),
				               rs.getString("returnpeople"),
				               rs.getString("returnno"));
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.closeConn(conn);
			pstmt = null;
			rs = null;
		}
		
		return list;
		
	}
	
	
	/**
	 * 查询所有的用户信息
	 * @return
	 */
	public List SeachAllPeople(){
		db=new Dbaccess();
		db.connect();
		conn=db.getConn();
		List list =null;
		labVo vo=null;
		try {
			list=new ArrayList();
			pstmt=conn.prepareStatement(SqlAllPeople);
			rs=pstmt.executeQuery();
			while (rs.next()){
				
				vo=new labVo(rs.getInt("studentno"),
						     rs.getString("studentname"),
						     rs.getString("sax"),
						     rs.getDate("borndate"),
						     rs.getInt("age"),
						     rs.getString("classname"),
						     rs.getString("username"),
						     rs.getString("userpwd"),
						     rs.getString("labname"),
						     rs.getInt("fraction"));
				list.add(vo);
				}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeConn(conn);
			pstmt=null;
			rs=null;
	    }
		 return list;
		 }
	
	
	/**
	 * 添加用户信息
	 * @param vo
	 * @return
	 */
	public boolean InsertPeople(labVo vo){
		db=new Dbaccess();
		db.connect();
		conn=db.getConn();
		
		 boolean b = false;
		 try {
			pstmt = conn.prepareStatement(SqlInsertPeople);
			
			
			
			 pstmt.setString(1, vo.getStudentname());
			 pstmt.setString(2, vo.getSax());
			 pstmt.setDate(3, vo.getBorndate());
			 pstmt.setInt(4, vo.getAge());
			 pstmt.setString(5, vo.getClassname());
			 pstmt.setString(6, vo.getUsername());
			 pstmt.setString(7, vo.getUserpwd());
			 pstmt.setString(8, vo.getLabname());
			 pstmt.setInt(9, vo.getFraction());
			 int i=pstmt.executeUpdate();	
          //判断是否插入2个以上的用户信息
			if (i>0)
			{
           	b=true;
           	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			db.closeConn(conn);
			pstmt = null;
			rs = null;		
		}
		return b;		
	}
	
	
	
	/**
	 * 按主键id得到用户信息
	 * @param id
	 * @return
	 */
	public labVo SearchByKey6(int studentno) {
		db = new Dbaccess();
		db.connect();
		conn = db.getConn();

		labVo vo = null;
		try {
			pstmt = conn.prepareStatement(SqlSeachPeople);
			pstmt.setInt(1, studentno);
			rs = pstmt.executeQuery();
			
		
            if (rs.next()) {
				vo = new labVo( rs.getInt("studentno"),
					            rs.getString("studentname"),
					            rs.getString("sax"),
					            rs.getDate("borndate"),
					            rs.getInt("age"),
					            rs.getString("classname"),
					            rs.getString("username"),
					            rs.getString("userpwd"),
					            rs.getString("labname"),
					            rs.getInt("fraction"));
     	}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.closeConn(conn);
			pstmt = null;
			rs = null;
		}
		return vo;
	}
	
	
	/**
	 * 修改用户信息后在进行添加
	 * @param vo
	 * @return
	 */
	
	public boolean UpdatePeople(labVo vo) {

		
		 db  = new Dbaccess();
		 db.connect();
		 conn = db.getConn();
		 boolean b = false;
		 try {
			pstmt = conn.prepareStatement(SqlUpdatePeople);
			
			
			
			 pstmt.setString(1, vo.getStudentname());
			 pstmt.setString(2, vo.getSax());
			 pstmt.setDate(3, vo.getBorndate());
			 pstmt.setInt(4, vo.getAge());
			 pstmt.setString(5, vo.getClassname());
			 pstmt.setString(6, vo.getUsername());
			 pstmt.setString(7, vo.getUserpwd());
			 pstmt.setString(8, vo.getLabname());
			 pstmt.setInt(9, vo.getFraction());
			 pstmt.setInt(10, vo.getStudentno());
			 
			pstmt.executeUpdate();	
         
		} 
		 catch (SQLException e)
		    {
			// TODO Auto-generated catch block
			e.printStackTrace();
		    }
		finally
		{
			db.closeConn(conn);
			pstmt = null;
			rs = null;		
		}
		return b;		
	}
	
	
	
	
	/**
	 * 删除用户信息
	 * @return
	 */
	public boolean DeletePeople(int studentno){
		 db=new Dbaccess();
		 db.connect();
		 conn=db.getConn();
		 boolean b=false;
		 try {
			pstmt=conn.prepareStatement(SqlDeletePeople);
			pstmt.setInt(1, studentno);
			pstmt.executeUpdate();
			b=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			db.closeConn(conn);
			pstmt = null;
			rs = null;
		}
		return b;
		}
	
	
	

	/**
	 * 根据条件查询用户信息
	 * 模糊查询
	 * @param sql
	 * @return
	 */
	public List SearchempInfo5(String sql) {
		db = new Dbaccess();
		db.connect();
		conn = db.getConn();
		List list = null;
		labVo vo = null;
		try {
		     stmt = conn.createStatement();
		     
		     
		   sql = "select * from ("+sql+") ";
		     

			 rs = stmt.executeQuery(sql);
			
			
			list = new ArrayList();
			while (rs.next()) {
				vo = new labVo( rs.getInt("studentno"),
			                    rs.getString("studentname"),
			                    rs.getString("sax"),
			                    rs.getDate("borndate"),
			                    rs.getInt("age"),
			                    rs.getString("classname"),
			                    rs.getString("username"),
			                    rs.getString("userpwd"),
			                    rs.getString("labname"),
			                    rs.getInt("fraction"));
					            
					           	
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.closeConn(conn);
			pstmt = null;
			rs = null;
		}
		
		return list;
		
	}
	
	
	
	
	
	
	
	
	
}
