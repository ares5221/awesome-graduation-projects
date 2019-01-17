package com.v246;
import java.sql.*;
import javax.sql.*;
import java.io.*;
/**
 *实现具体的业务逻辑，它被Action类调用
 *并且和HttpRequest等无关，这样增加了重用性
 */
 public class UserBean
 {
 	private Connection conn;
 	private Connections tmpConn=new Connections();
 	public UserBean()throws Exception
 	{
 		this.conn=tmpConn.getConnection();
 	}
 	/**
 	 *在数据库里增加一个用户
 	 */
 	 public void addUser(User user)throws Exception
 	 {
 	 	Statement stm=conn.createStatement();
 	 	stm.execute("insert into users(UserName,Passwords) values('"+user.getUserName()+"','"+user.getPasswords()+"')");
 	 }
 }