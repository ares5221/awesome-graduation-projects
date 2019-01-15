package com.hd.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hd.dao.CustomerConditionDao;
import com.hd.entity.CustomerCondition;
import com.hd.util.DBUtil;

/**
 * 客户状态数据库实现类
 * 
 * @author wmy
 * @day 2017年8月10日
 * @time 下午5:35:56
 * 
 */
public class CustomerConditionDaoImpl implements CustomerConditionDao {

	@Override
	public int save(CustomerCondition cusCon) {
		String sql = "insert into customer_condition values(?,?,?,default)";
		Object[] params = { null, cusCon.getCondition_name(),
				cusCon.getCondition_explain() };
		return DBUtil.executeUpdate(sql, params);
	}

	@Override
	public int delete(int condition_id) {
		String sql = "delete from customer_condition where condition_id = ?";
		Object[] params = { condition_id };
		return DBUtil.executeUpdate(sql, params);
	}

	@Override
	public List<CustomerCondition> findByName(String conditionName, int index,
			int size) {
		// 数据库连接
		Connection conn = null;
		// 查询工具对象
		Statement stmt = null;
		// 查询结果对象
		ResultSet rs = null;
		// 获取的数据集合
		List<CustomerCondition> cusConList = new ArrayList<CustomerCondition>();
		// 创建一个数据对象
		CustomerCondition cusCon = null;
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			StringBuilder sbSql = new StringBuilder(
					"select * from customer_condition where 1=1");
			if (conditionName != null && !"".equals(conditionName)) {
				// 有查询条件
				sbSql.append(" and condition_name like '%" + conditionName
						+ "%'");
			}
			// 添加分页条件
			sbSql.append(" limit " + (index - 1) * size + "," + size);
			System.out.println(sbSql.toString());
			rs = stmt.executeQuery(sbSql.toString());
			// 遍历读取数据库的数据
			while (rs.next()) {
				// 初始化数据对象
				cusCon = new CustomerCondition();
				cusCon.setCondition_id(rs.getInt("condition_id"));
				cusCon.setCondition_name(rs.getString("condition_name"));
				cusCon.setCondition_explain(rs.getString("condition_explain"));
				cusCon.setIs_used(rs.getString("is_used"));
				// 将查询到的对象添加到集合中
				cusConList.add(cusCon);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return cusConList;
	}

	@Override
	public int findCount(String conditionName) {
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
					"select count(*) from customer_condition where 1=1");
			if (conditionName != null && !"".equals(conditionName)) {
				// 有查询条件
				sbSql.append(" and condition_name like '%" + conditionName
						+ "%'");
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
	public List<CustomerCondition> findAll() {
		// 数据库连接
		Connection conn = null;
		// 查询工具对象
		Statement stmt = null;
		// 查询结果对象
		ResultSet rs = null;
		// 获取的数据集合
		List<CustomerCondition> cusConList = new ArrayList<CustomerCondition>();
		// 创建一个数据对象
		CustomerCondition cusCon = null;
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from customer_condition");
			// 遍历读取数据库的数据
			while (rs.next()) {
				// 初始化数据对象
				cusCon = new CustomerCondition();
				cusCon.setCondition_id(rs.getInt("condition_id"));
				cusCon.setCondition_name(rs.getString("condition_name"));
				cusCon.setCondition_explain(rs.getString("condition_explain"));
				cusCon.setIs_used(rs.getString("is_used"));
				// 将查询到的对象添加到集合中
				cusConList.add(cusCon);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return cusConList;
	}

}
