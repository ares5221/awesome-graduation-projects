package com.bjsxt.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bjsxt.dao.ManagerDao;
import com.bjsxt.entity.BookCase;
import com.bjsxt.entity.Card;
import com.bjsxt.entity.Manager;
import com.bjsxt.entity.Purview;
import com.bjsxt.util.BjsxtJdbc;
import com.bjsxt.util.SxtPageUtil;

public class ManagerDaoImpl implements ManagerDao{

	@Override
	public void findAllManager(SxtPageUtil<Manager> sxtPageUtil) {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet resultSet = null;
		List<Manager> list= new ArrayList<>();
		try {
			connection = BjsxtJdbc.getConnection();
			StringBuilder sql = new StringBuilder("select m.sid sid, m.pid pid,m.name name1, m.pwd pwd,p.sysset sysset,p.readerset readerset,p.bookset bookset,p.borrowback boorrowback,p.sysquery sysquery " 
					+" from tb_manager m left join  tb_purview p on m.pid=p.pid ");
			sql.append(" limit "+ sxtPageUtil.getStart() +","+ sxtPageUtil.getSize());
			ps = BjsxtJdbc.getPreparedStatement(connection, sql);
			resultSet = ps.executeQuery();
			while(resultSet.next()){
				int pid=resultSet.getInt("pid");
				int sysset=resultSet.getInt("sysset");
				int readerset=resultSet.getInt("readerset");
				int bookset=resultSet.getInt("bookset");
				int borrowback=resultSet.getInt("boorrowback");
				int sysquery=resultSet.getInt("sysquery");
				Purview pur=new Purview(pid, sysset, readerset, bookset, borrowback, sysquery);
				int sid=resultSet.getInt("sid");
				String name=resultSet.getString("name1");
				String pwd=resultSet.getString("pwd");
				Manager m=new Manager(sid, pid, name, pwd, pur);
				list.add(m);
				
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
		int n2=0;
		try {
			connection = BjsxtJdbc.getConnection();
			String sql="select count(*) count from tb_manager m,tb_purview p where m.pid=p.pid";
			ps = BjsxtJdbc.getPreparedStatement(connection, sql);
			resultSet = ps.executeQuery();
			while(resultSet.next()){
				n2=resultSet.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BjsxtJdbc.closeAll(resultSet, ps, connection);
		}
		return n2;
	}

	@Override
	public int deleteManagePurview(int pid) {
		String sql="delete  from tb_manager where sid=? ";
		Object[]objes={pid};
		return BjsxtJdbc.excuteDML(sql, objes);
	}

	@Override
	public Manager findOneManagePurview(int pid) {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet resultSet = null;
		Manager m=null;
		try {
			connection = BjsxtJdbc.getConnection();
			StringBuilder sql = new StringBuilder("select m.sid sid, m.pid pid,m.name name1, m.pwd pwd,p.sysset sysset,p.readerset readerset,p.bookset bookset,p.borrowback boorrowback,p.sysquery sysquery " 
					+" from tb_manager m,tb_purview p where m.pid=p.pid and m.pid=? ");
			
			ps = BjsxtJdbc.getPreparedStatement(connection, sql);
			ps.setInt(1, pid);
			resultSet = ps.executeQuery();
			while(resultSet.next()){
				
				int sysset=resultSet.getInt("sysset");
				int readerset=resultSet.getInt("readerset");
				int bookset=resultSet.getInt("bookset");
				int borrowback=resultSet.getInt("boorrowback");
				int sysquery=resultSet.getInt("sysquery");
				Purview pur=new Purview(pid, sysset, readerset, bookset, borrowback, sysquery);
				int sid=resultSet.getInt("sid");
				String name=resultSet.getString("name1");
				String pwd=resultSet.getString("pwd");
				 m=new Manager(sid, pid, name, pwd, pur);
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BjsxtJdbc.closeAll(resultSet, ps, connection);
		}
		
		return m;
	}

	@Override
	public int ModifyManagePurview(Purview p) {
		String sql="update tb_purview set sysset=?,readerset=?,bookset=?,borrowback=?,sysquery=? where pid=? ";
		Object[]objes={p.getSysset(),p.getReaderset(),p.getBookset(),p.getBorrowback(),p.getSysquery(),p.getPid()};
		return BjsxtJdbc.excuteDML(sql, objes);
	}

	@Override
	public int addManage(Manager m) {
		int n = addPuview(); 
		String sql="insert into tb_manager(pid,name, pwd) VALUES (?,?,?) ";
		Object[]objs={n,m.getName(),m.getPwd()};
		return BjsxtJdbc.excuteDML(sql, objs);
	}

	@Override
	public int addPuview() {
		String sql="INSERT INTO tb_purview (sysset,readerset,borrowback,sysquery,bookset) VALUES (?,?,?,?,?) ";
		
		Object[] objs={0,0,0,0,0};
		BjsxtJdbc.excuteDML(sql, objs);
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet resultSet = null;
		int n2=0;
		try {
			connection = BjsxtJdbc.getConnection();
			String sql1="select max(pid) p from tb_purview";
			ps = BjsxtJdbc.getPreparedStatement(connection, sql1);
			resultSet = ps.executeQuery();
			while(resultSet.next()){
				n2=resultSet.getInt("p");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BjsxtJdbc.closeAll(resultSet, ps, connection);
		}
		return n2;
	
	}

	@Override
	public Card findCard() {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet resultSet = null;
		Card card=null;
		try {
			connection = BjsxtJdbc.getConnection();
			String sql1="select *  from tb_card ";
			ps = BjsxtJdbc.getPreparedStatement(connection, sql1);
			resultSet = ps.executeQuery();
			while(resultSet.next()){
				int id =resultSet.getInt("id");
				int validity=resultSet.getInt("validity");
				double fees=resultSet.getInt("fees");
				card=new Card(id, validity, fees);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BjsxtJdbc.closeAll(resultSet, ps, connection);
		}
		
		return card;
	}

	@Override
	public int modifyCard(Card c) {
		
		String sql="update tb_card set fees=?, validity=? where id=? ";
		Object[] objs={c.getFees(),c.getValidity(),c.getId()};
		return BjsxtJdbc.excuteDML(sql, objs);
	}

	@Override
	public int couttBookCase() {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet resultSet = null;
		int n2=0;
		try {
			connection = BjsxtJdbc.getConnection();
			String sql="select count(*) count from tb_bookcase ";
			ps = BjsxtJdbc.getPreparedStatement(connection, sql);
			resultSet = ps.executeQuery();
			while(resultSet.next()){
				n2=resultSet.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BjsxtJdbc.closeAll(resultSet, ps, connection);
		}
		return n2;
	}

	@Override
	public void findallBookcase(SxtPageUtil<BookCase> sxtPageUtil) {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet resultSet = null;
		List<BookCase> li= new ArrayList<>();
		try {
			connection = BjsxtJdbc.getConnection();
			StringBuilder sql = new StringBuilder("select *from  tb_bookcase " );
			sql.append(" limit "+ sxtPageUtil.getStart() +","+ sxtPageUtil.getSize());
			ps = BjsxtJdbc.getPreparedStatement(connection, sql);
			resultSet = ps.executeQuery();
			while(resultSet.next()){
				int bcid = resultSet.getInt("bcid");
				String bcname=resultSet.getString("bcname");
				BookCase book=new  BookCase(bcid, bcname);
				li.add(book);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BjsxtJdbc.closeAll(resultSet, ps, connection);
		}
		sxtPageUtil.setList(li);
		
	}

	@Override
	public BookCase findBookcaseone(int id) {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet resultSet = null;
		BookCase book=null;
		try {
			connection = BjsxtJdbc.getConnection();
			StringBuilder sql = new StringBuilder("select *from  tb_bookcase where bcid = ?" );
			
			ps = BjsxtJdbc.getPreparedStatement(connection, sql);
			ps.setInt(1, id);
			resultSet = ps.executeQuery();
			while(resultSet.next()){
				int bcid = resultSet.getInt("bcid");
				String bcname=resultSet.getString("bcname");
				 book=new  BookCase(bcid, bcname);
			
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BjsxtJdbc.closeAll(resultSet, ps, connection);
		}
	return book;
	}

	@Override
	public int modifyBookcaseCard(BookCase c) {
		String sql="update tb_bookcase set bcname = ? where bcid = ? ";
		Object[] objs={c.getBcname(),c.getBcid()};
		return BjsxtJdbc.excuteDML(sql, objs);
	}

	@Override
	public int deleteBookid(int pid) {
		String sql="delete  from tb_bookcase where bcid=? ";
		Object[]objes={pid};
		return BjsxtJdbc.excuteDML(sql, objes);
	}

	@Override
	public int addBookid(String ca) {
		String sql=" INSERT INTO tb_bookcase (bcname) VALUES (?) ";
		Object[]objes={ca};
		return BjsxtJdbc.excuteDML(sql, objes);
	}

	
	
}
