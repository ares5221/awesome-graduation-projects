package com.hd.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	//获取数据库连接
	public static Connection getConnection(){
		return ConnectPoolFactory.getInstance().getConnect();
	}
	//关闭数据库连接方法
	public static void closeAll(ResultSet rs,Statement stmt,Connection conn){
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
		}
		if(stmt!=null){
			try {
				stmt.close();
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
	}
	//执行sql语句，返回值n
	public static  int executeUpdate(String sql,Object[] params){
		Connection conn  = null;
		PreparedStatement pstmt = null;
		int  n = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			for(int i = 0;i<params.length;i++){
				pstmt.setObject(i+1, params[i]);
			}
			n = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeAll(null,pstmt,conn);
		}
		return n;
		
	}
}
