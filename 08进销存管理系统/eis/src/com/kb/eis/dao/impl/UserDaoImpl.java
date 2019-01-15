package com.kb.eis.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.kb.eis.dao.UserDao;
import com.kb.eis.pojo.User;
import com.kb.eis.util.DBUtil;
public class UserDaoImpl implements UserDao{
/**
 * 添加操作员
 */
	@Override
	public int add(User user) {
		String sql="insert into tab_user values(seq_user.nextval,?,?,?,?,?,?)";
		Object[] params={user.getName(),user.getUserName(),user.getPass(),user.getQuan(),user.getPhone(),user.getStatus()};
		return DBUtil.executeUpdate(sql, params);
	}
/**
 * 修改操作员信息
 */
	@Override
	public int update(User user) {
		String sql="update tab_user set name=?,userName=?,pass=?,quan=?,phone=?,status=? where id=?";
		Object[] params={user.getName(),user.getUserName(),
				         user.getPass(),user.getQuan(),
				         user.getPhone(),user.getStatus(),
				         user.getId()};
		return DBUtil.executeUpdate(sql, params);
	}
/**
 * 删除操作员
 */
	@Override
	public void delete(int id) {
		String sql="delete from tab_user where id=?";
		Object[] params={id};
		DBUtil.executeUpdate(sql, params);
	}
/**
 *  查询所有操作员
 */
	@Override
	public List<User> queryAll() {
		Connection conn=null;
		Statement stmt=null;
		String sql="select*from tab_user order by id";
		ResultSet rs=null;
		List<User>  list=new ArrayList<User>();
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			rs= stmt.executeQuery(sql);
			list = DBUtil.encapsulation(User.class, rs);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, stmt, conn);
		}
		return list;
	}
/**
 * 根据姓名模糊查询操作员
 */
	@Override
	public List<User> queryByName(String uName) {
		Connection conn=null;
		Statement stmt=null;
		String sql="select*from tab_user where name like '%"+uName+"%' or userName like '%"+uName+"%'";
		ResultSet rs=null;
		List<User>  list=new ArrayList<User>();
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			rs= stmt.executeQuery(sql);
			list = DBUtil.encapsulation(User.class, rs);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, stmt, conn);
		}
		return list;
	}
@Override
public void updateStatus(int id,int status) {
	String sql="";
	if(status==0){
		sql="update tab_user set status=1 where id=? and status=?";
	}else {
		sql="update tab_user set status=0 where id=? and status=?";
	}
	Object[] params={id,status};
	DBUtil.executeUpdate(sql, params);	
}
@Override
public void deletMore(String[] check) {  //  1,2,3,4,5,6  
	String checkId="";
	if(check!=null){
		for(int i=0;i<check.length;i++){
			checkId=checkId+check[i]+",";
		}
		checkId=checkId.substring(0, checkId.length()-1);	
		//String params=checkId;
		String sql="delete from tab_user where id in("+checkId+")";
		//params.
		executeUpdate1(sql);
	}	
}
public static int executeUpdate1(String sql) {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int n = 0;
	try {
		// （和数据库）建立连接
		conn = DBUtil.getConnection();
		// （向数据库）发送命令并得到结果
		pstmt = conn.prepareStatement(sql);
		//pstmt.setString(1, params);
		n = pstmt.executeUpdate();
		// 处理结果
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		// 关闭资源
		DBUtil.closeAll(rs, pstmt, conn);
	}
	// 返回数据
	return n;
}
@Override
public User queryUser(String name2, String pass) {
	Connection conn=null;
	Statement stmt=null;
	String sql="select*from tab_user where name='"+name2+"' and pass='"+pass+"'";
	ResultSet rs=null;
	User user=null;
	try {
		conn = DBUtil.getConnection();
		stmt = conn.createStatement();
		rs= stmt.executeQuery(sql);
		if(rs.next()){
			String name=rs.getString("name");
			String userName=rs.getString("username");
			int id=rs.getInt("id");
			String phone=rs.getString("phone");
			int quan=rs.getInt("quan");
			int status=rs.getInt("status");
			user=new User(id, name, userName, pass, phone, quan, status);
		}
		//user=(User)DBUtil.encapsulation(User.class, rs);
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}finally{
		DBUtil.closeAll(rs, stmt, conn);
	}
	return user;
	
	
}
@Override
public User findById(int id) {
	Connection conn=null;
	Statement stmt=null;
	String sql="select*from tab_user where id="+id;
	ResultSet rs=null;
	User  user=new User();
	try {
		conn = DBUtil.getConnection();
		stmt = conn.createStatement();
		rs= stmt.executeQuery(sql);
		if(rs.next()){
			String name=rs.getString("name");
			String userName=rs.getString("username");
			//int id=rs.getInt("id");
			String pass=rs.getString("pass");
			String phone=rs.getString("phone");
			int quan=rs.getInt("quan");
			int status=rs.getInt("status");
			user=new User(id, name, userName, pass, phone, quan, status);
		}
	} catch (SQLException e) {
		
		e.printStackTrace();
	}finally{
		DBUtil.closeAll(rs, stmt, conn);
	}
	return user;
	
}


}
