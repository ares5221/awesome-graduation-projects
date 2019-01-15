package com.hd.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hd.dao.CustomerLinkDao;
import com.hd.entity.CustomerLinkReord;
import com.hd.entity.UserRole;
import com.hd.util.DBUtil;

/**
 * 客户联系数据库实现类
 * 
 * @author wmy
 * @day 2017年8月17日
 * @time 下午6:17:08
 * 
 */
public class CustomerLinkDaoImpl implements CustomerLinkDao {

	@Override
	public List<CustomerLinkReord> findAll() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<CustomerLinkReord> cusLinkReordList = new ArrayList<CustomerLinkReord>();
		CustomerLinkReord cusLinkReord = null;
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			String sql = "select * from user_role";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				cusLinkReord = new CustomerLinkReord();
				cusLinkReord.setRecord_id(rs.getInt("record_id"));
				cusLinkReord.setCustomer_id(rs.getInt("customer_id"));
				cusLinkReord.setLink_time(rs.getTimestamp("link_time"));
				cusLinkReord.setWho_link(rs.getString("who_link"));
				cusLinkReord.setLink_type(rs.getString("link_type"));
				cusLinkReord.setLink_theme(rs.getString("link_theme"));
				cusLinkReord.setLink_nexttime(rs.getTimestamp("link_nexttime"));
				cusLinkReord.setLink_remark(rs.getString("link_remark"));
				cusLinkReord.setIs_used(rs.getString("is_used"));
				cusLinkReordList.add(cusLinkReord);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}

		return cusLinkReordList;
	}

	@Override
	public List<CustomerLinkReord> findBeforeTime(int days) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<CustomerLinkReord> cusLinkReordList = new ArrayList<CustomerLinkReord>();
		CustomerLinkReord cusLinkReord = null;
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			String sql = "select cl.*,ci.customer_name from customer_linkreord cl join customer_info ci on (cl.customer_id=ci.customer_id) where link_time < date_add(now(),interval+"
					+ days + " day)";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				cusLinkReord = new CustomerLinkReord();
				cusLinkReord.setRecord_id(rs.getInt("record_id"));
				cusLinkReord.setCustomer_id(rs.getInt("customer_id"));
				cusLinkReord.setLink_time(rs.getTimestamp("link_time"));
				cusLinkReord.setWho_link(rs.getString("who_link"));
				cusLinkReord.setLink_type(rs.getString("link_type"));
				cusLinkReord.setLink_theme(rs.getString("link_theme"));
				cusLinkReord.setLink_nexttime(rs.getTimestamp("link_nexttime"));
				cusLinkReord.setLink_remark(rs.getString("link_remark"));
				cusLinkReord.setIs_used(rs.getString("is_used"));
				cusLinkReord.setCustomer_name(rs.getString("customer_name"));
				cusLinkReordList.add(cusLinkReord);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}

		return cusLinkReordList;
	}
}
