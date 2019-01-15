package com.bjsxt.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//封装jdbc
import java.sql.Statement;
import java.util.Properties;


public class BjsxtJdbc {
	public static Connection getConnection(){
		//声明连接
		Connection connection = null;
		try {
			//加载驱动
			Class.forName("org.logicalcobwebs.proxool.ProxoolDriver");
			//创建连接
			connection = DriverManager.getConnection("proxool.test");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	//创建sql命令发生器preparedStatement
	public static PreparedStatement getPreparedStatement(Connection connection,CharSequence sql){
		//声明sql命令发送器对象
		PreparedStatement preparedStatement = null;
		try {
			preparedStatement = connection.prepareStatement(sql.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return preparedStatement;
	}
	
	//创建statement命令发生器
	public static Statement getStatement(Connection connection){
		//声明sql命令发送器对象
		Statement statement = null;
		try {
			statement = connection.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return statement;
	}
	
	//关闭资源连接 connection,statement,resultset
	public static void closeAll(ResultSet resultSet,Statement statement,Connection connection){
		//后开的先关， 判断是否为空
		try {
			if(resultSet!=null){
				resultSet.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			if(statement!=null){
				statement.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			if(connection!=null){
				connection.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	//封装DML语句
	public static int excuteDML(CharSequence sql,Object...objs){
		//声明一个变量
		int n = 0;
		//声明连接
		Connection connection = null;
		//声明sql命令发送器
		PreparedStatement preparedStatement = null;		
		try {
			//创建连接
			connection = getConnection();
			preparedStatement = getPreparedStatement(connection, sql.toString());
			//赋值
			for (int i = 0; i < objs.length; i++) {
				preparedStatement.setObject(i+1, objs[i]);
			}
			//发送sql
			n = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			//关闭连接
			closeAll(null,preparedStatement,connection);
		}
		return n;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
