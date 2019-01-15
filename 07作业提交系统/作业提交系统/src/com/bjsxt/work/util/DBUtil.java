package com.bjsxt.work.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class DBUtil {
	/**
	 * 获取数据库连接    
	 * @return
	 */
	public static Connection getConnection(){
//		Connection conn = null;
//		String driver ="oracle.jdbc.OracleDriver";
//		String url ="jdbc:oracle:thin:@127.0.0.1:1521:orcl";
//		String user="bjsxt";
//		String password ="bjsxt";		
//		try {
//			//加载驱动
//			Class.forName(driver);
//			//（和数据库）建立连接
//			conn = DriverManager.getConnection(url, user, password);
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		Connection conn = ConnectPoolFactory.getInstance().getConnect();
		
		
//		Connection conn=null;
//		try {
//			Class.forName("org.logicalcobwebs.proxool.ProxoolDriver");
//			conn = DriverManager.getConnection("proxool.test");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		return conn;
	}
	/**
	 * 关闭数据库资源
	 * PrepraredStataement是Statement的子接口，也可以传入
	 * @param rs
	 * @param stmt
	 * @param conn
	 */
	public static void closeAll(ResultSet rs,Statement stmt,Connection conn){
		try {
			if(rs != null){
				rs.close();
			}				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			if(stmt != null){
				stmt.close();
			}				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			if(conn != null){
				conn.close();
			}				
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 完成DML操作：insert，update和delete
	 * @param sql
	 * @param params
	 * @return
	 */
	public static int executeUpdate(String sql,Object [] params) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		int n=0;
		try {			
			//（和数据库）建立连接
			conn = getConnection();
			//（向数据库）发送命令并得到结果			
			pstmt = conn.prepareStatement(sql);
			for(int i=0;i<params.length;i++){
				pstmt.setObject(i+1, params[i]);
			}
			n = pstmt.executeUpdate();
			//处理结果			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭资源
			closeAll(rs, pstmt, conn);
		}
		//返回数据
		return n;
	}
	
	public static void main(String[] args) {
		Connection conn = getConnection();
		System.out.println(conn);
		System.out.println(new Date());
	}
}
