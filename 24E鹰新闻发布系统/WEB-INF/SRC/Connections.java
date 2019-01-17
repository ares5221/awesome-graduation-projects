package com.v246;
import java.sql.*;
public class Connections
{
	Connection conn=null;
	public Connection getConnection() throws Exception
	{
			String conn_class=null;
			String conn_string=null;
			Connection conn=null;
			conn_class="com.mysql.jdbc.Driver";
			conn_string="jdbc:mysql://localhost/aqu?useUnicode=true&characterEncoding=gb2312";
			Class.forName(conn_class);
			conn=DriverManager.getConnection(conn_string);
			return conn;
	}
	public static void main(String[] args)
	{
		try
		{
			Connections connTmp=new Connections();
			Connection conns=connTmp.getConnection();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}                                   