package com.bjsxt.school.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bjsxt.school.dao.GradeDao;
import com.bjsxt.school.entity.Grade;
import com.bjsxt.school.entity.Major;
import com.bjsxt.school.util.DBUtils;

public class GradeDaoImpl implements GradeDao {
	// 添加年级
	@Override
	public int save(Grade grade) {
		String sql = "insert into system_grade_code values(?,?)";
		Object[] params = { grade.getGradeNo(), grade.getGradeName() };
		return DBUtils.doDML(sql, params);
	}

	@Override
	public List<Grade> findAll() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Grade> gradeList = new ArrayList<Grade>();
		try {
			// （和数据库）建立连接
			conn = DBUtils.getConnection();
			// （向数据库）发送命令并得到结果
			String sql = "select * from system_grade_code";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
			// 处理结果
			while (rs.next()) {
				// 获取各列的数据
				String gradeNo = rs.getString("gradeNo");
				String gradeName = rs.getString("gradeName");
				// 将各列的数据封装到Employee对象中
				Grade grade = new Grade(gradeNo, gradeName);
				gradeList.add(grade);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtils.closeAll(rs, stmt, conn);
		}
		// 返回数据
		return gradeList;
	}

	@Override
	public void delete(String gradeNo) {
		String sql = "delete  from system_grade_code where gradeNo =?";
		Object[] params = { gradeNo };
		DBUtils.doDML(sql, params);

	}

	@Override
	public int update(Grade grade) {
		String sql = "update system_grade_code set gradeName=? where gradeNo=?";
		Object params[] = { grade.getGradeName(), grade.getGradeNo() };
		return DBUtils.doDML(sql, params);
	}

	@Override
	public Grade findGrade(String gradeNo) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Grade grade = null;
		try {
			// （和数据库）建立连接
			conn = DBUtils.getConnection();
			// （向数据库）发送命令并得到结果
			String sql = "select * from system_grade_code where gradeNo ="+gradeNo;
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
			// 处理结果
			while (rs.next()) {
				// 获取各列的数据
				String gradeName = rs.getString("gradeName");
				// 将各列的数据封装到Employee对象中
				grade = new Grade(gradeNo, gradeName);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtils.closeAll(rs, stmt, conn);
		}
		// 返回数据
		return grade;
	}

}
