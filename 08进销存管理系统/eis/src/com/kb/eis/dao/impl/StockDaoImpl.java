package com.kb.eis.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kb.eis.dao.StockDao;
import com.kb.eis.pojo.Stock;
import com.kb.eis.util.DBUtil;

public class StockDaoImpl implements StockDao {
	
	/**
	 * 实现查询所有库存信息的功能
	 */
	@Override
	public List<Stock> findAllStock() {
		List<Stock> list = new ArrayList<Stock>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from tab_kucun"; 
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list = DBUtil.encapsulation(Stock.class,rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	/**
	 * 库存品价格调整
	 */
	@Override
	public void updateStockPrice(String id) {
		String sql = "update tab_kucun set dj=? where id=?";
		Object [] params = {id};
		DBUtil.executeUpdate(sql, params);
	}

}
