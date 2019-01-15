package com.bjsxt.school.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bjsxt.school.dao.ClazzDao;
import com.bjsxt.school.entity.Clazz;
import com.bjsxt.school.util.DBUtils;

public class ClazzDaoImpl implements ClazzDao {

	@Override
	public List<Clazz> findAll() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Clazz> claList = new ArrayList<Clazz>();

		try {
			conn = DBUtils.getConnection();
			String sql = "select * from system_class_info";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String classId = rs.getString("classId");
				String gradeNo = rs.getString("gradeNo");
				String mno = rs.getString("mno");
				String className = rs.getString("className");

				Clazz clazz = new Clazz(classId, gradeNo, mno, className);
				claList.add(clazz);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, stmt, conn);
		}
		return claList;
	}

	@Override
	public String findMajorByClazzId(String classId) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String majorName = null;
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from system_class_info c "
					+ "join SYSTEM_SPECIALTY_CODE m on c.mno = m.mno "
					+ "where classid = " + classId;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				majorName = rs.getString("mname");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, stmt, conn);
		}
		return majorName;
	}

	@Override
	public int add(Clazz clazz) {
		String sql = "insert into system_class_info values(?,?,?,?)";
		Object[] params = { clazz.getClassId(), clazz.getGradeNo(),
				clazz.getMno(), clazz.getClassName() };
		return DBUtils.doDML(sql, params);
	}

	@Override
	public void delete(String classId) {
		String sql = "delete  from system_class_info where classId = ?";
		Object[] params = { classId };
		DBUtils.doDML(sql, params);
	}

}
