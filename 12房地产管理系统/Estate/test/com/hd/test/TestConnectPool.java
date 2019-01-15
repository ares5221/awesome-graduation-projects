package com.hd.test;

import java.sql.Connection;
import java.sql.DriverManager;

import com.hd.util.ConnectPoolFactory;

public class TestConnectPool {

	public static void main(String[] args) throws Exception {
		long start = System.currentTimeMillis();
		for(int i=0; i< 200; i++){
		Connection conn = ConnectPoolFactory.getInstance().getConnect();
		conn.close();
		}
		long end = System.currentTimeMillis();
		
		System.out.println(end-start);

		
		start = System.currentTimeMillis();
		for(int i=0; i<=100; i++){
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/crm", "root", "root");
			conn1.close();
		}
		end = System.currentTimeMillis();
		
		System.out.println(end-start);
	}

}
