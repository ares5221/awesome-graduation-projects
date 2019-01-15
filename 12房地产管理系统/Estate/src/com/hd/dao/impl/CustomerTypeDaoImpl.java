/**
 * @author Administrator
 * @date 2017年8月16日
 */
package com.hd.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hd.dao.CustomerTypeDao;
import com.hd.entity.CustomerType;
import com.hd.util.DBUtil;

/**
 * @author Administrator
 * 
 */
public class CustomerTypeDaoImpl implements CustomerTypeDao {

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.hd.dao.CustomerTypeDao#findAllCount()
	 */
	@Override
	public int findAllRequiredCount(String typeName) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int n = 0;
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			String sql = "select count(1) from customer_type where type_name like '%"
					+ typeName + "%' ";

			rs = stmt.executeQuery(sql);
			rs.next();
			n = rs.getInt(1);
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);

		}

		return n;

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.hd.dao.CustomerTypeDao#findRequired(int, int, java.lang.String)
	 */
	@Override
	public List<CustomerType> findRequired(int start, int size, String typeName) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<CustomerType> list = new ArrayList<CustomerType>();
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			String sql = "select * from customer_type  where type_name like '%"
					+ typeName + "%' limit " + start + "," + size + "";

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				int typeId = rs.getInt("type_id");
				String typeName2 = rs.getString("type_name");
				String isUsed = rs.getString("is_used");
				CustomerType ct = new CustomerType(typeId, typeName2, isUsed);
				list.add(ct);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);

		}

		return list;

	}

	/*
	 * 添加客户类型的方法
	 * 
	 * @see com.hd.dao.CustomerTypeDao#add(java.lang.String)
	 */
	@Override
	public int add(String typeName) {

		String sql = "insert into customer_type values(null,?,default)";
		Object[] params = { typeName };
		int n = DBUtil.executeUpdate(sql, params);
		return n;
	}

	/*
	 * 删除客户类型的信息
	 * 
	 * @see com.hd.dao.CustomerTypeDao#delete(int)
	 */
	@Override
	public int delete(int typeId) {
		String sql = "delete from customer_type where type_id = ?";
		Object[] params = { typeId };
		int n = DBUtil.executeUpdate(sql, params);
		return n;
	}

	@Override
	public List<CustomerType> findAll() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<CustomerType> list = new ArrayList<CustomerType>();
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from customer_type");
			while (rs.next()) {
				int typeId = rs.getInt("type_id");
				String typeName = rs.getString("type_name");
				String isUsed = rs.getString("is_used");
				CustomerType ct = new CustomerType(typeId, typeName, isUsed);
				list.add(ct);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);

		}

		return list;
	}

}
