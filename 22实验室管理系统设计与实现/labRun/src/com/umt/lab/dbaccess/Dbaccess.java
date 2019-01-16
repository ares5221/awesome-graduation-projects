package com.umt.lab.dbaccess;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbaccess {
	
	private Connection conn ;
	
	private String url = "jdbc:oracle:thin:@10.1.1.254:1521:orcl";
	
	/**
	 * 数据库连接
	 */
	public void connect()
	{
		try {
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
			conn = DriverManager.getConnection(url, "ym", "ym");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 获得数据库连接
	 */
	public Connection getConn()
	{
		if (conn!=null)
		{			
			return this.conn;			
		}
		else
		{
			this.connect();
			return this.conn;
		}
	
	}
	
	/**
	 * 关闭数据库连接
	 */
	public void closeConn(Connection conn)
	{
		if (conn!=null)
		{			
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}
	}
}
