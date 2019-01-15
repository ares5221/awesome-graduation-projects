package com.bjsxt.school.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bjsxt.school.dao.TeacherDao;
import com.bjsxt.school.entity.Teacher;
import com.bjsxt.school.entity.TeacherCourse;
import com.bjsxt.school.util.DBUtils;

public class TeacherDaoImpl implements TeacherDao {

	@Override
	public int save(Teacher teacher) {
		String sql = "insert into DOCU_TEA_INFO values(seq_teacher.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		Object[] params = { teacher.getTname(), teacher.getMno(),
				teacher.getSex(), teacher.getAge(), teacher.getNation(),
				teacher.getPolitics(), teacher.getEducation(),
				teacher.getMarital(),
				new java.sql.Date(teacher.getBirth().getTime()),
				teacher.getIdCard(), teacher.getPhone(),
				new java.sql.Date(teacher.getWorkDate().getTime()),
				teacher.getJobDesc() };

		return DBUtils.doDML(sql, params);
	}

	@Override
	public int findCount(String tname, String mname) {
		Connection conn = DBUtils.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			stmt = conn.createStatement();
			StringBuffer sql = new StringBuffer(
					"select count(*) from DOCU_TEA_INFO t join SYSTEM_SPECIALTY_CODE s on t.mno = s.mno where 1=1 ");
			if (tname != null && !"".equals(tname)) {
				sql.append(" and tname like '%" + tname + "%'");
			}
			if (mname != null && !"".equals(mname)) {
				sql.append(" and mname like '%" + mname + "%'");
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
	public List<Teacher> findTeacher(int startRow, int endRow, String tname,
			String mname) {
		Connection conn = DBUtils.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		List<Teacher> teaList = new ArrayList<Teacher>();
		try {
			stmt = conn.createStatement();
			StringBuffer sql = new StringBuffer(
					"select * from DOCU_TEA_INFO t join SYSTEM_SPECIALTY_CODE s on t.mno = s.mno where 1=1 ");
			if (tname != null && !"".equals(tname)) {
				sql.append(" and tname like '%" + tname + "%'");
			}
			if (mname != null && !"".equals(mname)) {
				sql.append(" and mname like '%" + mname + "%'");
			}

			String sql2 = "select * from (select rownum rn,t2.* from ("
					+ sql.toString() + " ) t2 " + "where rownum <=" + endRow
					+ " ) " + "where rn >" + startRow;

			rs = stmt.executeQuery(sql2);
			while (rs.next()) {
				String tno = rs.getString("tno");
				String mno = rs.getString("mno");
				String tname2 = rs.getString("tname");
				String sex = rs.getString("sex");
				String nation = rs.getString("nation");
				String politics = rs.getString("politics");
				String education = rs.getString("education");
				String marital = rs.getString("marital");
				String idCard = rs.getString("idCard");
				String phone = rs.getString("phone");
				String jobDesc = rs.getString("jobDesc");
				int age = rs.getInt("age");
				Date birth = rs.getDate("birth");
				Date workDate = rs.getDate("workDate");
				Teacher teacher = new Teacher(tno, tname2, mno, sex, age,
						nation, politics, education, marital, birth, idCard,
						phone, workDate, jobDesc);
				teaList.add(teacher);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, stmt, conn);
		}
		return teaList;
	}

	@Override
	public Teacher findById(String tno) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Teacher teacher = null;
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from DOCU_TEA_INFO where tno =" + tno;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				String tname = rs.getString("tname");
				String sex = rs.getString("sex");
				String nation = rs.getString("nation");
				String politics = rs.getString("politics");
				String education = rs.getString("education");
				String marital = rs.getString("marital");
				String idCard = rs.getString("idCard");
				String phone = rs.getString("phone");
				String jobDesc = rs.getString("jobDesc");
				int age = rs.getInt("age");
				Date birth = rs.getDate("birth");
				Date workDate = rs.getDate("workDate");
				String mno = rs.getString("mno");
				teacher = new Teacher(tno, tname, mno, sex, age, nation,
						politics, education, marital, birth, idCard, phone,
						workDate, jobDesc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, stmt, conn);
		}
		return teacher;
	}

	@Override
	public int update(Teacher teacher) {
		String sql = "update DOCU_TEA_INFO "
				+ "set tname = ?,mno= ?, sex = ?, age= ?, nation = ?, "
				+ "politics = ?, education = ?, marital= ?, birth = ?, "
				+ "idCard= ?, phone = ?, workDate= ?, jobDesc = ? "
				+ " where tno = ?";
		Object[] params = { teacher.getTname(), teacher.getMno(),
				teacher.getSex(), teacher.getAge(), teacher.getNation(),
				teacher.getPolitics(), teacher.getEducation(),
				teacher.getMarital(),
				new java.sql.Date(teacher.getBirth().getTime()),
				teacher.getIdCard(), teacher.getPhone(),
				new java.sql.Date(teacher.getWorkDate().getTime()),
				teacher.getJobDesc(), teacher.getTno() };

		return DBUtils.doDML(sql, params);
	}

	@Override
	public int delete(String tno) {
		String sql = "delete from DOCU_TEA_INFO where tno = ?";
		Object[] params = { tno };
		return DBUtils.doDML(sql, params);	}

	@Override
	public int arrangeCourse(String tno, String mno, Date workDate) {
		String sql = "update empl_assign_charge set majorname=?,jobdate=? where tid =?";
		Object[] params = {mno,workDate,tno};	
		
		
		return DBUtils.doDML(sql, params);
	}

	@Override
	public Teacher findByMno(String msg1) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Teacher teacher = null;
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from DOCU_TEA_INFO where mno =" +"'"+ msg1+"'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				String tno=rs.getString("tno");
				String tname = rs.getString("tname");
				String sex = rs.getString("sex");
				String nation = rs.getString("nation");
				String politics = rs.getString("politics");
				String education = rs.getString("education");
				String marital = rs.getString("marital");
				String idCard = rs.getString("idCard");
				String phone = rs.getString("phone");
				String jobDesc = rs.getString("jobDesc");
				int age = rs.getInt("age");
				Date birth = rs.getDate("birth");
				Date workDate = rs.getDate("workDate");
				String mno = rs.getString("mno");
				teacher = new Teacher(tno, tname, mno, sex, age, nation,
						politics, education, marital, birth, idCard, phone,
						workDate, jobDesc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, stmt, conn);
		}
		return teacher;
	}

	@Override
	public Teacher findByTname(String msg1) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Teacher teacher = null;
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from DOCU_TEA_INFO where Tname =" + "'"+msg1+"'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				String tno=rs.getString("tno");
				String tname = rs.getString("tname");
				String sex = rs.getString("sex");
				String nation = rs.getString("nation");
				String politics = rs.getString("politics");
				String education = rs.getString("education");
				String marital = rs.getString("marital");
				String idCard = rs.getString("idCard");
				String phone = rs.getString("phone");
				String jobDesc = rs.getString("jobDesc");
				int age = rs.getInt("age");
				Date birth = rs.getDate("birth");
				Date workDate = rs.getDate("workDate");
				String mno = rs.getString("mno");
				teacher = new Teacher(tno, tname, mno, sex, age, nation,
						politics, education, marital, birth, idCard, phone,
						workDate, jobDesc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, stmt, conn);
		}
		return teacher;
	}

	@Override
	public List<TeacherCourse> selectPosition(String msg1) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
	List <TeacherCourse> list=new ArrayList<TeacherCourse>();
		try {
			conn = DBUtils.getConnection();
			String sql = "select d.*,e.* from docu_tea_info d  , empl_assign_charge e where tid=(select tno from docu_tea_info t where tno= '" +msg1+"')" ;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String tno=rs.getString("tno");
				String tname = rs.getString("tname");
				String sex = rs.getString("sex");
				String nation = rs.getString("nation");
				String politics = rs.getString("politics");
				String education = rs.getString("education");
				String marital = rs.getString("marital");
				String idCard = rs.getString("idCard");
				String phone = rs.getString("phone");
				String jobDesc = rs.getString("jobDesc");
				int age = rs.getInt("age");
				Date birth = rs.getDate("birth");
				Date workDate = rs.getDate("workDate");
				String mno = rs.getString("mno");
				Teacher teacher=new Teacher(tno, tname, mno, sex, age, nation, politics, education, marital, birth, idCard, phone, workDate, jobDesc);
				String classid = rs.getString("classid");
				String tid = rs.getString("tid");
				String majorname = rs.getString("majorname");
				String classname = rs.getString("classname");
				Date leavedate = rs.getDate("leavedate");
				Date jobdate = rs.getDate("jobdate");
				
				TeacherCourse teacherCourse=new TeacherCourse(tname, classid, tid, majorname, classname, leavedate, jobdate, teacher);
			     
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, stmt, conn);
		}
		return list;
	}

	@Override
	public List<TeacherCourse> selectPosition1(String msg1) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
	List <TeacherCourse> list=new ArrayList<TeacherCourse>();
		try {
			conn = DBUtils.getConnection();
			String sql = "select d.*,e.* from docu_tea_info d  , empl_assign_charge e where tid=(select tno from docu_tea_info t where tno= '" +msg1+"')" ;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String tno=rs.getString("tno");
				String tname = rs.getString("tname");
				String sex = rs.getString("sex");
				String nation = rs.getString("nation");
				String politics = rs.getString("politics");
				String education = rs.getString("education");
				String marital = rs.getString("marital");
				String idCard = rs.getString("idCard");
				String phone = rs.getString("phone");
				String jobDesc = rs.getString("jobDesc");
				int age = rs.getInt("age");
				Date birth = rs.getDate("birth");
				Date workDate = rs.getDate("workDate");
				String mno = rs.getString("mno");
				Teacher teacher=new Teacher(tno, tname, mno, sex, age, nation, politics, education, marital, birth, idCard, phone, workDate, jobDesc);
				String classid = rs.getString("classid");
				String tid = rs.getString("tid");
				String majorname = rs.getString("majorname");
				String classname = rs.getString("classname");
				Date leavedate = rs.getDate("leavedate");
				Date jobdate = rs.getDate("jobdate");
				
				TeacherCourse teacherCourse=new TeacherCourse(tname, classid, tid, majorname, classname, leavedate, jobdate, teacher);
			     
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, stmt, conn);
		}
		return list;
	}

	@Override
	public int teacherInCharge(String tno, Date jobdate, String classname,
			String classid) {String sql = "update empl_assign_charge set tid = ? ,set jobdate=?  "
					+ " where classname = ? and classid =?";
			Object[] params = { tno,jobdate,classname,classid };

			return DBUtils.doDML(sql, params);
	}

	@Override
	public List<TeacherCourse> selectAll() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
	List <TeacherCourse> list=new ArrayList<TeacherCourse>();
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from empl_assign_charge t" ;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String tname =rs.getString("tname");
				String classid = rs.getString("classid");
				String tid = rs.getString("tid");
				String majorname = rs.getString("majorname");
				String classname = rs.getString("classname");
				Date leavedate = rs.getDate("leavedate");
				Date jobdate = rs.getDate("jobdate");
				
				TeacherCourse teacherCourse=new TeacherCourse(tname, classid, tid, majorname, classname, leavedate, jobdate);
			    list.add(teacherCourse);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, stmt, conn);
		}
		return list;
	}

}
