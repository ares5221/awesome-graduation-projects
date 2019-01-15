package com.hd.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.hd.dao.EmployeeDao;
import com.hd.entity.UserInfo;
import com.hd.util.DBUtil;

public class EmployeeDaoImpl implements EmployeeDao {

	@Override
	public int upDate(UserInfo ui) {
		String sql = "update user_info set user_name = ?, user_age = ?,user_sex = ?,"
				+ "user_nation = ?,user_diploma = ?,is_married = ?,department_id = ?,"
				+ "role_id = ?,user_tel = ?,user_intest = ?,user_bankcard = ?,user_mobile = ?,"
				+ "user_idnum = ?,user_addtime = ?,user_addman = ?,user_changeman = ?,"
				+ "user_email = ?,user_address = ? where user_id = ?";

		Object params[] = { ui.getUser_name(), ui.getUser_age(),
				ui.getUser_sex(), ui.getUser_nation(), ui.getUser_diploma(),
				ui.getIs_married(), ui.getDepartment_id(), ui.getRole_id(),
				ui.getUser_tel(), ui.getUser_intest(), ui.getUser_bankcard(),
				ui.getUser_mobile(), ui.getUser_idnum(), ui.getUser_addtime(),
				ui.getUser_addman(), ui.getUser_changeman(),
				ui.getUser_email(), ui.getUser_address(), ui.getUser_id() };
		// System.out.println(ui.getUser_name());
		return DBUtil.executeUpdate(sql, params);
	}

	/**
	 * 用户登录的方法，返回user对象
	 */
	@Override
	public UserInfo login(String userNum, String userPw) {

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		UserInfo user = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			String sql = "select * from user_info where user_num='" + userNum
					+ "' and user_pw = '" + userPw + "'";
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				int user_id = rs.getInt("user_id");
				int department_id = rs.getInt("department_id");
				int role_id = rs.getInt("role_id");
				String user_name = rs.getString("user_name");
				String user_sex = rs.getString("user_sex");
				String user_mobile = rs.getString("user_mobile");
				int user_age = rs.getInt("user_age");
				String user_address = rs.getString("user_address");
				String user_num = rs.getString("user_num");
				String user_pw = rs.getString("user_pw");
				String user_tel = rs.getString("user_tel");
				String user_idnum = rs.getString("user_idnum");
				String user_email = rs.getString("user_email");

				Date user_addtime = rs.getTimestamp("user_addtime");
				String user_addman = rs.getString("user_addman");
				Date user_changetime = rs.getTimestamp("user_changetime");
				String user_changeman = rs.getString("user_changeman");
				String user_intest = rs.getString("user_intest");
				String user_diploma = rs.getString("user_diploma");
				String user_bankcard = rs.getString("user_bankcard");
				String user_nation = rs.getString("user_nation");
				String is_married = rs.getString("is_married");
				String is_used = rs.getString("is_used");

				user = new UserInfo(user_id, department_id, role_id, user_name,
						user_sex, user_mobile, user_age, user_address,
						user_num, user_pw, user_tel, user_idnum, user_email,
						user_addtime, user_addman, user_changetime,
						user_changeman, user_intest, user_diploma,
						user_bankcard, user_nation, is_married, is_used);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}

		return user;
	}

	@Override
	public int  delete(int user_id) {
		String sql = "delete from user_info where user_id = ?";
		Object params[] = { user_id };
		return DBUtil.executeUpdate(sql, params);

	}

	@Override
	public List<UserInfo> findAll() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<UserInfo> empList = new ArrayList<UserInfo>();
		try {
			// （和数据库）建立连接
			conn = DBUtil.getConnection();
			// （向数据库）发送命令并得到结果
			String sql = "select * from user_info";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			// 处理结果
			while (rs.next()) {
				// 获取各列的数据

				int user_id = rs.getInt("user_id");
				String user_name = rs.getString("user_name");
				int user_age = rs.getInt("user_age");
				String user_sex = rs.getString("user_sex");
				String user_nation = rs.getString("user_nation");
				String user_diploma = rs.getString("user_diploma");
				String is_married = rs.getString("is_married");
				int department_id = rs.getInt("department_id");
				int role_id = rs.getInt("role_id");
				String user_tel = rs.getString("user_tel");
				String user_intest = rs.getString("user_intest");
				String user_bankcard = rs.getString("user_bankcard");

				String user_mobile = rs.getString("user_mobile");
				String user_idnum = rs.getString("user_idnum");
				Date user_addtime = rs.getDate("user_addtime");
				String user_addman = rs.getString("user_addman");
				String user_changeman = rs.getString("user_changeman");
				String user_email = rs.getString("user_email");
				Date user_changetime = rs.getDate("user_changetime");
				String user_address = rs.getString("user_address");

				// 将各列的数据封装到Employee对象中

				UserInfo userInfo = new UserInfo(user_id, department_id,
						role_id, user_name, user_sex, user_mobile, user_age,
						user_address, user_tel, user_idnum, user_email,
						user_addtime, user_addman, user_changetime,
						user_changeman, user_intest, user_diploma,
						user_bankcard, user_nation, is_married);
				empList.add(userInfo);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		// 返回数据
		System.out.println(empList.size());
		return empList;
	}

	@Override
	public UserInfo findById(int user_id1) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		UserInfo userInfo = null;
		try {
			// （和数据库）建立连接
			conn = DBUtil.getConnection();
			// （向数据库）发送命令并得到结果
			String sql = "select * from user_info where user_id = " + user_id1;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			// 处理结果
			if (rs.next()) {
				// 获取各列的数据
				int user_id = rs.getInt("user_id");
				String user_name = rs.getString("user_name");
				int user_age = rs.getInt("user_age");
				String user_sex = rs.getString("user_sex");
				String user_nation = rs.getString("user_nation");
				String user_diploma = rs.getString("user_diploma");
				String is_married = rs.getString("is_married");
				int department_id = rs.getInt("department_id");
				int role_id = rs.getInt("role_id");
				String user_tel = rs.getString("user_tel");
				String user_intest = rs.getString("user_intest");
				String user_bankcard = rs.getString("user_bankcard");
				String user_mobile = rs.getString("user_mobile");
				String user_idnum = rs.getString("user_idnum");
				Date user_addtime = rs.getDate("user_addtime");
				String user_addman = rs.getString("user_addman");
				String user_changeman = rs.getString("user_changeman");
				String user_email = rs.getString("user_email");
				Date user_changetime = rs.getDate("user_changetime");
				String user_address = rs.getString("user_address");
				// 将各列的数据封装到Employee对象中
				userInfo = new UserInfo(user_id, user_name, user_age, user_sex,
						user_nation, user_diploma, is_married, department_id,
						role_id, user_tel, user_intest, user_bankcard,
						user_mobile, user_idnum, user_addtime, user_addman,
						user_changeman, user_email, user_changetime,
						user_address);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		// 返回数据
		return userInfo;
	}

	/* 
	 * 获取符合条件的数据数目，用于设置pageBean
	 */
	@Override
	public int findRequiredCount(String selectType, String selectContent) {
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int n = 0;
		try {
			// （和数据库）建立连接
			conn = DBUtil.getConnection();
			// （向数据库）发送命令并得到结果
			String sql = "select count(1) from user_info ui left join user_role ur on (ui.role_id=ur.role_id) left join department_info di on(ui.department_id=di.department_id) where 1=1 ";
			
			if(selectContent!=null&&!"".equals(selectContent)){
				sql+=" and "+selectType+" like '%"+selectContent+"%'";
				
			}
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			// 处理结果
			rs.next();
			n = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		// 返回数据
		return n;
	}

	/* 
	 * 获取所有符合条件的数据
	 */
	@Override
	public List<UserInfo> findRequiredItems(int start, int size,
			String selectType, String selectContent) {
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<UserInfo> empList = new ArrayList<UserInfo>();
		try {
			// （和数据库）建立连接
			conn = DBUtil.getConnection();
			// （向数据库）发送命令并得到结果
			StringBuffer sql = new StringBuffer("select ui.*,ur.role_name,di.department_name from user_info ui left join user_role ur on (ui.role_id=ur.role_id) left join department_info di on(ui.department_id=di.department_id) where 1=1");
			
			if(selectContent!=null&&!"".equals(selectContent)){
				sql.append(" and "+selectType+" like '%"+selectContent+"%'");
				
			}
			sql.append(" limit "+start+","+size);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			// 处理结果
			while (rs.next()) {
				// 获取各列的数据

				int user_id = rs.getInt("user_id");
				String user_name = rs.getString("user_name");
				int user_age = rs.getInt("user_age");
				String user_sex = rs.getString("user_sex");
				String user_nation = rs.getString("user_nation");
				String user_diploma = rs.getString("user_diploma");
				String is_married = rs.getString("is_married");
				int department_id = rs.getInt("department_id");
				int role_id = rs.getInt("role_id");
				String user_tel = rs.getString("user_tel");
				String user_intest = rs.getString("user_intest");
				String user_bankcard = rs.getString("user_bankcard");

				String user_mobile = rs.getString("user_mobile");
				String user_idnum = rs.getString("user_idnum");
				Date user_addtime = rs.getDate("user_addtime");
				String user_addman = rs.getString("user_addman");
				String user_changeman = rs.getString("user_changeman");
				String user_email = rs.getString("user_email");
				Date user_changetime = rs.getDate("user_changetime");
				String user_address = rs.getString("user_address");
				
				String role_name = rs.getString("role_name");
				String department_name = rs.getString("department_name");
				
				// 将各列的数据封装到Employee对象中

				UserInfo userInfo = new UserInfo(user_id, department_id,
						role_id, user_name, user_sex, user_mobile, user_age,
						user_address, user_tel, user_idnum, user_email,
						user_addtime, user_addman, user_changetime,
						user_changeman, user_intest, user_diploma,
						user_bankcard, user_nation, is_married);
				userInfo.setRole_name(role_name);
				userInfo.setDepartment_name(department_name);
				empList.add(userInfo);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		// 返回数据
		System.out.println(empList.size());
		return empList;
	}
}
