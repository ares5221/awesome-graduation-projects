package com.hd.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hd.dao.AdminDao;
import com.hd.entity.Department;
import com.hd.entity.UserInfo;
import com.hd.entity.UserRole;
import com.hd.util.DBUtil;

public class AdminDaoImpl implements AdminDao {
	/**
	 * 增加部门的具体实现，其中id为空，因为后台自动增长
	 * is_used为空，数据库默认为1
	 */
	@Override
	public int save(Department dept) {
		String sql = "insert into department_info values(?,?,?,default)";
		Object[] params = {null,dept.getDepartment_name(),dept.getDepartment_desc()};
		int n = DBUtil.executeUpdate(sql, params);
		return n;
	}

	@Override
	public int saveRole(UserRole userRole) {
		String sql = "insert into user_role values(?,?,?,default)";
		Object[] params = {null,userRole.getRole_name(),userRole.getRole_power()};
		int n = DBUtil.executeUpdate(sql, params);
		return n;
	}

	@Override
	public int saveUser(UserInfo userInfo) {
		String sql = "insert into user_info values(null,?,?,?"
				+ ",?,?,?,?,"
				+ "?,?,?,?,"
				+ "?,now(),?,"
				+ "default,default,?,?,?,?,?,?)";
		Object[] params = {userInfo.getDepartment_id(),userInfo.getRole_id(),userInfo.getUser_name(),
				
				userInfo.getUser_sex(),userInfo.getUser_mobile(),userInfo.getUser_age(),userInfo.getUser_address(),
				userInfo.getUser_num(),userInfo.getUser_pw(),userInfo.getUser_tel(),userInfo.getUser_idnum(),
				userInfo.getUser_email(),userInfo.getUser_addman(),
				userInfo.getUser_intest(),userInfo.getUser_diploma(),userInfo.getUser_bankcard(),
				userInfo.getUser_nation(),userInfo.getIs_married(),null};
		int n = DBUtil.executeUpdate(sql, params);
		return n;
	}

	@Override
	public List<UserRole> findAllRole() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<UserRole> userList = new ArrayList<UserRole>();
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			String sql = "select * from user_role";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				int role_id = rs.getInt("role_id");
				String role_name = rs.getString("role_name");
				int role_power = rs.getInt("role_power");
				String is_used = rs.getString("is_used");
				UserRole role = new UserRole(role_id, role_name, role_power, is_used);
				userList.add(role);
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, stmt, conn);
		}
		
		return userList;
		
	}

	@Override
	public int deleteRole(int role_id) {
		String sql = "delete from user_role where role_id = ?";
		Object[] params = {role_id};
		int n = DBUtil.executeUpdate(sql, params);
		return n;
	}

	@Override
	public int active(String email) {
		String sql = "update user_info set is_used = 'actived' where user_email = ? ";
		Object[] params = {email};
		int n = DBUtil.executeUpdate(sql, params);
		return n;
	}

	@Override
	public List<Department> findAllDept() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Department> deptList = new ArrayList<Department>();
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			String sql = "select * from department_info";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				int department_id = rs.getInt("department_id");
				String department_name = rs.getString("department_name");
				String department_desc = rs.getString("department_desc");
				String is_used = rs.getString("is_used");
				Department dept = new Department(department_id, department_name, department_desc, is_used);
				deptList.add(dept);
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, stmt, conn);
		}
		
		return deptList;
		
	}

	
}
