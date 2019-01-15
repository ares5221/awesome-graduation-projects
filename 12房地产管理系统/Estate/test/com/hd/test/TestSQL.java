package com.hd.test;

import java.sql.Connection;

import org.junit.Test;

import com.hd.util.DBUtil;

public class TestSQL {
	@Test
	public void testConn(){
		String sql = "update user_role set role_name=? where role_id=1";
		Object[] params = {"hello"};
		int n = DBUtil.executeUpdate(sql, params);
		System.out.println(n);
		System.out.println("王明月测试");
	}
}
