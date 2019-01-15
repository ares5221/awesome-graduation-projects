package com.bjsxt.work.dao.impl;

import java.sql.Connection;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bjsxt.work.util.DBUtil;
import com.bjsxt.work.dao.InformDao;
import com.bjsxt.work.entity.Inform;

public class InformDaoImpl implements InformDao {

	// 保存
	@Override
	public int save(Inform inform) {
		String sql = "insert into t_inform values(seq_inform.nextval,?,?, sysdate)";
		Object[] params = { inform.getTitle(), inform.getContent()};
		return DBUtil.executeUpdate(sql, params);
	}

	// 查看列表
	@Override
	public List<Inform> findAll() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Inform> informList = new ArrayList<Inform>();
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from t_inform order by iid desc";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				int iid = rs.getInt("iid");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Date date = rs.getDate("idate");
				Inform inform = new Inform(iid, title, content, date);
				informList.add(inform);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return informList;
	}

	// 显示详情
	@Override
	public Inform findById(int iid, String title) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Inform inform = null;
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from t_inform where iid=" + iid;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				int iid2 = rs.getInt("iid");
				String content = rs.getString("content");
				Date date = rs.getDate("idate");
				inform = new Inform(iid2, content, date);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return inform;
	}

	@Override
	public int delete(int iid) {
		String sql = "delete from t_inform where iid=?";
		Object[] params = {iid};
		return DBUtil.executeUpdate(sql, params);
	}

}
