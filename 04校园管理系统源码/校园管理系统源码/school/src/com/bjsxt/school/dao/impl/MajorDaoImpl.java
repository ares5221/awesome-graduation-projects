package com.bjsxt.school.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bjsxt.school.dao.MajorDao;
import com.bjsxt.school.entity.Major;
import com.bjsxt.school.util.DBUtils;

public class MajorDaoImpl implements MajorDao {

	@Override
	public List<Major> findAll() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Major> majorList = new ArrayList<Major>();

		try {
			conn = DBUtils.getConnection();
			String sql = "select * from SYSTEM_SPECIALTY_CODE";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String mno = rs.getString("mno");
				String mname = rs.getString("mname");

				Major major = new Major(mno, mname);
				majorList.add(major);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, stmt, conn);
		}
		return majorList;
	}

	@Override
	public int save(Major major) {
		String sql = "insert into system_specialty_code values(?,?)";
		Object[] params = { major.getMno(), major.getMname() };
		return DBUtils.doDML(sql, params);
	}

	@Override
	public void deleteMno(String mno) {
		String sql = "delete from system_specialty_code where mno =?";
		Object[] params = { mno };
		DBUtils.doDML(sql, params);
	}

	@Override
	public int updateMno(Major major) {
		String sql = "update system_specialty_code set mName=? where mno=?";
		Object params[] = { major.getMname(), major.getMno() };
		return DBUtils.doDML(sql, params);
	}

	@Override
	public Major findMajor(String mNo) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Major major = null;

		try {
			conn = DBUtils.getConnection();
			String sql = "select * from SYSTEM_SPECIALTY_CODE where mno="+mNo;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String mname = rs.getString("mname");
				major = new Major(mNo, mname);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, stmt, conn);
		}
		return major;
	}

}
