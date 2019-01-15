/**
 * 
 */
package com.bjsxt.work.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.bjsxt.work.dao.StudentDao;
import com.bjsxt.work.entity.Clazz;
import com.bjsxt.work.entity.Group;
import com.bjsxt.work.entity.Record;
import com.bjsxt.work.entity.Student;
import com.bjsxt.work.entity.Teacher;
import com.bjsxt.work.entity.Work;
import com.bjsxt.work.util.DBUtil;

/**
 * @author 李军伟
 * @function: 学生持久层实现
 * @date: 2017年9月1日
 */
public class StudentDaoImpl implements StudentDao {

	// 查询所有班级
	@Override
	public List<Clazz> findAllClazz() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from t_clazz";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Clazz> lclazz = new ArrayList<Clazz>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// 创建班级
				Clazz c = new Clazz(rs.getInt("cid"), rs.getString("cname"));
				// 把班级放到集合
				lclazz.add(c);
				// 创建老师的set集合
				Set<Teacher> teacher = new HashSet<Teacher>();
				teacher.add(new Teacher(rs.getInt("tid1")));
				teacher.add(new Teacher(rs.getInt("tid2")));
				teacher.add(new Teacher(rs.getInt("tid3")));
				// 把老师集合放到班级中
				c.setTeacher(teacher);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, pstmt, conn);
		}
		
		return lclazz;
	}

	// 查询所有小组
	@Override
	public List<Group> findALLGroup() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from t_group";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Group> lgroup = new ArrayList<Group>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Group g = new Group(rs.getInt("gid"), rs.getString("gname"));
				g.getStudent().add(new Student(rs.getInt("sid1")));
				g.getStudent().add(new Student(rs.getInt("sid2")));
				lgroup.add(g);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, pstmt, conn);
		}
		
		return lgroup;
	}

	// 通过班级小组和学生信息进行查询 登录
	@Override
	public Student findStuByCGAccount(Student user) {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from t_student where cid=? and gid=? and sname=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Student s = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user.getClazz().getCid());
			pstmt.setInt(2, user.getGroup().getGid());
			pstmt.setString(3, user.getSname());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				s = new Student(rs.getInt("sid"), user.getGroup().getGid(), 
						user.getClazz().getCid(), user.getSname(), user.getPassword());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, pstmt, conn);
		}
		
		return s;
	}

	// 修改密码
	@Override
	public boolean update(Student student) {
		Connection conn = DBUtil.getConnection();
		String sql = "update t_student set password=? where sname=?";
		PreparedStatement pstmt = null;
		int update = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, student.getPassword());
			pstmt.setString(2, student.getSname());
			update = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(null, pstmt, conn);
		}
		
		return update > 0 ? true : false;
	}

	// 查询所有已发布作业
	@Override
	public List<Work> findAllWorkType() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from t_work";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Work> lwork = new ArrayList<Work>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Work w = new Work(rs.getInt("hid"), rs.getString("hname"), rs.getDate("releasetime"));
				lwork.add(w);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, pstmt, conn);
		}
		
		return lwork;
	}

	// 向数据中添加一条提交作业的记录
	@Override
	public boolean update(Integer sid, int hid, Date date, String fileName) {
		SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// to_date( ? ,'yyyy-MM-dd HH24:mi:ss')
		String time = formater.format(date);
		String sql = "insert into t_record values(seq_record.nextval, ?, ?, to_date( ? ,'yyyy-MM-dd HH24:mi:ss'), ?)";
		
		Object[] params = {
			sid, hid, time, fileName
		};
		return DBUtil.executeUpdate(sql, params) > 0 ? true : false;
	}

	// 查询当前学生所有的作业提交记录
	@Override
	public List<Record> findRecordsBySid(int sid) {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from t_record where sid = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Record> lrecord = new ArrayList<Record>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Record record = new Record(rs.getInt("rid"),rs.getInt("sid"), 
						rs.getInt("hid"), rs.getDate("submittime"), rs.getString("filename"));
				lrecord.add(record);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, pstmt, conn);
		}
		
		return lrecord;
	}

	// 通过记录的id和作业的id查询作业提交记录的文件名
	@Override
	public String findRecordByRIDWID(int rid, int hid) {
		Connection conn = DBUtil.getConnection();
		String sql = "select fileName from t_record where rid = ? and hid = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String fileName = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rid);
			pstmt.setInt(2, hid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				fileName = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, pstmt, conn);
		}
		
		return fileName;
	}

	// 查询所有的学生信息
	@Override
	public List<Student> findAllStudent() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from t_student";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Student> sList = new ArrayList<Student>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Student s = new Student(rs.getInt("sid"), rs.getInt("gid"),
						rs.getInt("cid"), rs.getString("sname"), rs.getString("password"));
				sList.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, pstmt, conn);
		}
		
		return sList;
	}

}
