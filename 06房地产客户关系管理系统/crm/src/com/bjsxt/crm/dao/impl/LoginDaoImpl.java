package com.bjsxt.crm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.bjsxt.crm.dao.LoginDao;
import com.bjsxt.crm.entity.User;
import com.bjsxt.crm.util.DBUtil;


public class LoginDaoImpl implements LoginDao {

	@Override
	public User find(String user_num, String user_pw) {
		Connection conn = null;//javascript undefined 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User user = null;
		try {
			//建立连接
			conn  = DBUtil.getConnection();
			
			//向数据库发送SQL命令并得到结果
			String sql = "select * from user_info where user_num = ? and user_pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_num);
			pstmt.setString(2, user_pw);
			rs = pstmt.executeQuery();
			//处理返回结果
			if(rs.next()){
				//取出结果集当前行各个字段的值
				
				int user_ID=rs.getInt("user_ID");
				int department_ID=rs.getInt("department_ID");
				int role_ID=rs.getInt("role_ID");
				String user_name = rs.getString("user_name");
				String user_sex = rs.getString("user_sex");
				String user_mobile = rs.getString("user_mobile");
				int user_age=rs.getInt("user_age");
				String user_address = rs.getString("user_address");
				String user_tel = rs.getString("user_tel");
				String user_idnum = rs.getString("user_idnum");
				String user_email = rs.getString("user_email");
				Date user_addtime = rs.getDate("user_addtime");
				String user_addman = rs.getString("user_addman");
				Date user_changetime = rs.getDate("user_changetime");
				String user_changeman = rs.getString("user_changeman");
				String user_intest = rs.getString("user_intest");
				String user_diploma = rs.getString("user_diploma");
				String user_bankcard = rs.getString("user_bankcard");
				String user_nation = rs.getString("user_nation");
				String is_married = rs.getString("is_married");
				String is_used = rs.getString("is_used");
				
				//封装成对象
				user = new User(user_ID, department_ID, role_ID, user_name, user_sex, user_mobile, user_age, user_address, user_num, user_pw, user_tel, user_idnum, user_email, user_addtime, user_addman, user_changetime, user_changeman, user_intest, user_diploma, user_bankcard, user_nation, is_married, is_used);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭数据库资源
			DBUtil.closeAll(rs, pstmt, conn);
		}
		
		return user;
	}

}
