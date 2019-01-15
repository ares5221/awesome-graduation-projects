package com.hd.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.hd.dao.DepartmentDao;
import com.hd.entity.Department;
import com.hd.entity.NoticeInfo;
import com.hd.util.DBUtil;

public class DepartmentDaoImpl implements DepartmentDao{

	@Override
	public void delete(int department_id) {
		String sql = "delete from department_info where department_id = ?";
		Object params [] = {department_id};
		DBUtil.executeUpdate(sql, params);
		
	}

	@Override
	public List<Department> findAll() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Department> depList = new ArrayList<Department>();
		try {			
			//（和数据库）建立连接
			conn = DBUtil.getConnection();
			//（向数据库）发送命令并得到结果
			String sql ="select * from department_info";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			//处理结果
			while(rs.next()){
				//获取各列的数据
				int department_id = rs.getInt("department_id");
				String department_name = rs.getString("department_name");
				String department_desc = rs.getString("department_desc");
				String is_used = rs.getString("is_used");

				//将各列的数据封装到Employee对象中
				Department department = new Department(department_id, department_name, department_desc, is_used);				
				depList.add(department);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		//返回数据
		System.out.println(depList.size());
		return depList;
	}

	/* 
	 * 获取符合查询条件的数据数量
	 */
	@Override
	public int findRequiredCount(String deptName) {
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int n = 0;
		try {			
			//（和数据库）建立连接
			conn = DBUtil.getConnection();
			//（向数据库）发送命令并得到结果
			String sql ="select count(1) from department_info where 1=1";
			if(deptName!=null&&!"".equals(deptName)){
				
				sql+=" and department_name like '%"+deptName+"%'";
			}
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			//处理结果
			rs.next();
			n = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		//返回数据
		
		return n;
	}

	/* 
	 * 获取符合条件的数据
	 */
	@Override
	public List<Department> findRequiredItems(int start, int size,
			String deptName) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Department> depList = new ArrayList<Department>();
		try {			
			//（和数据库）建立连接
			conn = DBUtil.getConnection();
			//（向数据库）发送命令并得到结果
			String sql ="select * from department_info where 1=1 ";
			if(deptName!=null&&!"".equals(deptName)){
				
				sql+=" and department_name like '%"+deptName+"%'";
			}
			sql+=" limit "+start+","+size;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			//处理结果
			while(rs.next()){
				//获取各列的数据
				int department_id = rs.getInt("department_id");
				String department_name = rs.getString("department_name");
				String department_desc = rs.getString("department_desc");
				String is_used = rs.getString("is_used");
				//将各列的数据封装到Employee对象中
				Department department = new Department(department_id, department_name, department_desc, is_used);				
				depList.add(department);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		//返回数据
		System.out.println(depList.size());
		return depList;
	}

}
