package com.bjsxt.school.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.bjsxt.school.dao.StudentDao;
import com.bjsxt.school.entity.Student;
import com.bjsxt.school.util.DBUtils;

public class StudentDaoImpl implements StudentDao {

	@Override
	public Student findById(String sid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Student stu = null;
		try {
			conn = DBUtils.getConnection();

			String sql = "select * from DOCU_STU_INFO where sid =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String sname = rs.getString("sname");
				int age = rs.getInt("age");
				Date birth = rs.getDate("birth");
				String phone = rs.getString("phone");
				String sex = rs.getString("sex");
				String idCard = rs.getString("idCard");
				String address = rs.getString("address");
				String politics = rs.getString("politics");
				String health = rs.getString("health");

				stu = new Student(sid, sname, sex, age, idCard, birth, address,
						phone, politics, health);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, pstmt, conn);
		}
		return stu;
	}

	@Override
	public int save(Student stu) {
		String sql = "insert into DOCU_STU_INFO values(?,?,?,?,?,?,?,?,?,?)";

		Object[] params = { stu.getSid(), stu.getSname(), stu.getSex(),
				stu.getAge(), stu.getIdCard(),
				new java.sql.Date(stu.getBirth().getTime()), stu.getPolitics(),
				stu.getPhone(), stu.getAddress(), stu.getHealth() };

		return DBUtils.doDML(sql, params);
	}

	@Override
	public int findCount(String sname, String sid) {
		Connection conn = DBUtils.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			stmt = conn.createStatement();
			StringBuffer sql = new StringBuffer(
					"select count(*) from DOCU_STU_INFO where 1=1 ");
			if (sname != null && !"".equals(sname)) {
				sql.append(" and sname like '%" + sname + "%'");
			}
			if (sid != null && !"".equals(sid)) {
				sql.append(" and sid like '%" + sid + "%'");
			}

			rs = stmt.executeQuery(sql.toString());

			rs.next();
			count = rs.getInt(1);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, stmt, conn);
		}
		return count;
	}

	@Override
	public List<Student> findStudent(int startRow, int endRow, String sname,
			String sid) {
		Connection conn = DBUtils.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		List<Student> stuList = new ArrayList<Student>();
		try {
			stmt = conn.createStatement();
			StringBuffer sql = new StringBuffer(
					"select * from DOCU_STU_INFO  where 1=1 ");
			if (sname != null && !"".equals(sname)) {
				sql.append(" and sname like '%" + sname + "%'");
			}
			if (sid != null && !"".equals(sid)) {
				sql.append(" and sid like '%" + sid + "%'");
			}

			String sql2 = "select * from (select rownum rn,t2.* from ("
					+ sql.toString() + " ) t2 " + "where rownum <=" + endRow
					+ " ) " + "where rn >" + startRow;

			rs = stmt.executeQuery(sql2);
			while (rs.next()) {
				String sid2 = rs.getString("sid");
				String sname2 = rs.getString("sname");
				String sex = rs.getString("sex");
				String politics = rs.getString("politics");
				String health = rs.getString("health");
				String idCard = rs.getString("idCard");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				int age = rs.getInt("age");
				Date birth = rs.getDate("birth");
				Student stu = new Student(sid2, sname2, sex, age, idCard,
						birth, address, phone, politics, health);
				stuList.add(stu);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, stmt, conn);
		}
		return stuList;
	}

	@Override
	public int update(Student stu) {
		String sql = "update DOCU_STU_INFO set sname = ?,sex = ?, age = ?, idcard = ?, "
				+ "birth = ?,politics = ?, phone = ?, address = ?, health=? "
				+ "where sid = ?";

		Object[] params = { stu.getSname(), stu.getSex(), stu.getAge(),
				stu.getIdCard(), new java.sql.Date(stu.getBirth().getTime()),
				stu.getPolitics(), stu.getPhone(), stu.getAddress(),
				stu.getHealth(), stu.getSid() };

		return DBUtils.doDML(sql, params);
	}

	@Override
	public int delete(String sid) {
		String sql = "delete from DOCU_STU_INFO where sid = ?";
		Object[] params = { sid };
		return DBUtils.doDML(sql, params);
	}

	@Override
	public int saveCheckIn(Student stu) {
		String sql = "insert into DOCU_STU_REGISTER values(?,?,?,?,?,?,?)";

		Object[] params = { stu.getSname(), stu.getClassId(), stu.getSid(),
				new java.sql.Date(stu.getCheckDate().getTime()),
				stu.getOperator(), stu.getEnterScore(), stu.getmajorName() };

		return DBUtils.doDML(sql, params);
	}

	@Override
	public int findCheckedCount(String sname, int operator, double enterScore) {
		Connection conn = DBUtils.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			stmt = conn.createStatement();
			StringBuffer sql = new StringBuffer(
					"select count(*) from DOCU_STU_REGISTER where 1=1 ");
			if (sname != null && !"".equals(sname)) {
				sql.append(" and sname like '%" + sname + "%'");
			}

			String strOper = "";
			if (operator == 1) {
				strOper = ">";
			} else if (operator == 2) {
				strOper = "=";
			} else if (operator == 3) {
				strOper = "<";
			} else if (operator == 4) {
				strOper = ">=";
			} else if (operator == 5) {
				strOper = "<=";
			}

			if (enterScore != 0) {
				sql.append(" and enterScore " + strOper + " " + enterScore);
			}

			rs = stmt.executeQuery(sql.toString());

			rs.next();
			count = rs.getInt(1);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, stmt, conn);
		}
		return count;
	}

	@Override
	public List<Student> findCheckedStudent(int startRow, int endRow,
			String sname, int oper, double enterScore) {
		Connection conn = DBUtils.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		List<Student> stuList = new ArrayList<Student>();
		try {
			stmt = conn.createStatement();
			StringBuffer sql = new StringBuffer(
					"select * from DOCU_STU_REGISTER where 1=1 ");
			if (sname != null && !"".equals(sname)) {
				sql.append(" and sname like '%" + sname + "%'");
			}

			String strOper = "";
			if (oper == 1) {
				strOper = ">";
			} else if (oper == 2) {
				strOper = "=";
			} else if (oper == 3) {
				strOper = "<";
			} else if (oper == 4) {
				strOper = ">=";
			} else if (oper == 5) {
				strOper = "<=";
			}

			if (enterScore != 0) {
				sql.append(" and enterScore " + strOper + " " + enterScore);
			}

			String sql2 = "select * from (select rownum rn,t2.* from ("
					+ sql.toString() + " ) t2 " + "where rownum <=" + endRow
					+ " ) " + "where rn >" + startRow;

			rs = stmt.executeQuery(sql2);
			while (rs.next()) {
				String sid = rs.getString("sid");
				String sname2 = rs.getString("sname");
				String classId = rs.getString("classId");
				Double enterScore2 = Double.parseDouble(rs
						.getString("enterScore"));
				String majorName = rs.getString("majorName");
				String operator = rs.getString("operator");
				Date checkDate = rs.getDate("checkDate");

				Student stu = new Student(sid, sname2, classId, checkDate,
						enterScore2, majorName, operator);
				stuList.add(stu);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, stmt, conn);
		}
		return stuList;
	}

	@Override
	public Student findCheckedById(String sid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Student stu = null;
		try {
			conn = DBUtils.getConnection();

			String sql = "select * from DOCU_STU_REGISTER where sid =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String sname = rs.getString("sname");
				Date checkDate = rs.getDate("checkDate");
				String classId = rs.getString("classId");
				String majorName = rs.getString("majorName");
				String operator = rs.getString("operator");
				double enterScore = Double.parseDouble(rs
						.getString("enterScore"));
				stu = new Student(sid, sname, classId, checkDate, enterScore,
						majorName, operator);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, pstmt, conn);
		}
		return stu;
	}

	@Override
	public int deleteCheckedIn(String sid) {
		String sql = "delete from DOCU_STU_REGISTER where sid = ?";
		Object[] params = { sid };
		return DBUtils.doDML(sql, params);
	}

}
