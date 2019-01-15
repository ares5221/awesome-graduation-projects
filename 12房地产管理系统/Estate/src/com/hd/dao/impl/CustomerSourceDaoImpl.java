package com.hd.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hd.dao.CustomerSourceDao;
import com.hd.entity.CustomerSource;
import com.hd.util.DBUtil;

/**
 * 客户来源数据库实现类
 * 
 * @author wmy
 * @day 2017年8月11日
 * @time 下午4:54:11
 * 
 */
public class CustomerSourceDaoImpl implements CustomerSourceDao {

	@Override
	public int save(CustomerSource cusSou) {
		String sql = "insert into customer_source values(?,?,default)";
		Object[] params = { null, cusSou.getSource_name() };
		return DBUtil.executeUpdate(sql, params);
	}

	@Override
	public int delete(int source_id) {
		String sql = "delete from customer_source where source_id = ?";
		Object[] params = { source_id };
		return DBUtil.executeUpdate(sql, params);
	}

	@Override
	public List<CustomerSource> findByName(String sourceName, int index,
			int size) {
		// 数据库连接
		Connection conn = null;
		// 查询工具对象
		Statement stmt = null;
		// 查询结果对象
		ResultSet rs = null;
		// 获取的数据集合
		List<CustomerSource> cusSouList = new ArrayList<CustomerSource>();
		// 创建一个数据对象
		CustomerSource cusSou = null;
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();

			StringBuilder sbSql = new StringBuilder(
					"select * from customer_source where 1=1");
			if (sourceName != null && !"".equals(sourceName)) {
				// 有查询条件
				sbSql.append(" and source_name like '%" + sourceName + "%'");
			}
			// 添加分页条件
			sbSql.append(" limit " + (index - 1) * size + "," + size);
			rs = stmt.executeQuery(sbSql.toString());

			while (rs.next()) {
				// 初始化数据对象
				cusSou = new CustomerSource();
				cusSou.setSource_id(rs.getInt("source_id"));
				cusSou.setSource_name(rs.getString("source_name"));
				cusSou.setIs_used(rs.getString("is_used"));
				// 将查询到的对象添加到集合中
				cusSouList.add(cusSou);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return cusSouList;
	}

	@Override
	public int findCount(String sourceName) {
		// 数据库连接
		Connection conn = null;
		// 查询工具对象
		Statement stmt = null;
		// 查询结果对象
		ResultSet rs = null;
		// 返回数据
		int count = 0;
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			StringBuilder sbSql = new StringBuilder(
					"select count(*) from customer_source where 1=1");
			if (sourceName != null && !"".equals(sourceName)) {
				// 有查询条件
				sbSql.append(" and source_name like '%" + sourceName + "%'");
			}
			rs = stmt.executeQuery(sbSql.toString());

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return count;
	}

	@Override
	public List<CustomerSource> findAll() {
		// 数据库连接
		Connection conn = null;
		// 查询工具对象
		Statement stmt = null;
		// 查询结果对象
		ResultSet rs = null;
		// 获取的数据集合
		List<CustomerSource> cusSouList = new ArrayList<CustomerSource>();
		// 创建一个数据对象
		CustomerSource cusSou = null;
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from customer_source");

			while (rs.next()) {
				// 初始化数据对象
				cusSou = new CustomerSource();
				cusSou.setSource_id(rs.getInt("source_id"));
				cusSou.setSource_name(rs.getString("source_name"));
				cusSou.setIs_used(rs.getString("is_used"));
				// 将查询到的对象添加到集合中
				cusSouList.add(cusSou);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return cusSouList;
	}
}
