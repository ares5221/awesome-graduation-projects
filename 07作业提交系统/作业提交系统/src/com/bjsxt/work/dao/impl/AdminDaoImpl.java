/**
 * 
 */
package com.bjsxt.work.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bjsxt.work.dao.AdminDao;
import com.bjsxt.work.entity.Admin;
import com.bjsxt.work.entity.Record;
import com.bjsxt.work.entity.Student;
import com.bjsxt.work.entity.Work;
import com.bjsxt.work.util.DBUtil;

/**
 * @author 李军伟
 * @function: 管理员
 * @date: 2017年8月30日
 */
public class AdminDaoImpl implements AdminDao {

	// 管理员登录
	@Override
	public boolean login(Admin admin) {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from t_admin where aname=? and password=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, admin.getAname());
			pstmt.setString(2, admin.getPassword());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				flag = true; //登录成功
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, pstmt, conn);
		}
		
		return flag;
	}

	// 更新管理员信息
	@Override
	public boolean update(Admin admin) {
		Connection conn = DBUtil.getConnection();
		String sql = "update t_admin set password=? where aname=?";
		PreparedStatement pstmt = null;
		int update = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, admin.getPassword());
			pstmt.setString(2, admin.getAname());
			update = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(null, pstmt, conn);
		}
		
		return update > 0 ? true : false;
	}

	// 查询所有已提交作业记录
	@Override
	public List<Record> findAllRecords() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from t_record where 1=1 order by submittime desc";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Record> lrecord = new ArrayList<Record>();
		try {
			pstmt = conn.prepareStatement(sql);
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

	// 查询所有已提交作业学生
	@Override
	public List<Student> findAllCWStudent() {
		Connection conn = DBUtil.getConnection();
		String sql = "SELECT * FROM t_student s where s.sid in (select r.sid from t_record r)";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Student> lstu = new ArrayList<Student>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Student s = new Student(rs.getInt("sid"), rs.getInt("gid"), 
						rs.getInt("cid"), rs.getString("sname"), rs.getString("password"));
				lstu.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, pstmt, conn);
		}
		
		return lstu;
	}

	// 保存发布的作业
	@Override
	public int publish(Work work) {
		String sql = "insert into t_work values(seq_work.nextval, ?, ?, sysdate)";
		Object[] params = {
			work.getHname(), work.getContent()	
		};
		return DBUtil.executeUpdate(sql, params);
	}

	// 查询所有的已发布作业
	@Override
	public List<Work> showAllWork() {
		Connection conn = DBUtil.getConnection();
		String sql = "SELECT * FROM t_work order by hid desc";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Work> lwork = new ArrayList<Work>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Work w = new Work(rs.getInt("hid"), rs.getString("hname"), 
						rs.getString("cont"), rs.getDate("releasetime"));
				lwork.add(w);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, pstmt, conn);
		}
		
		return lwork;
	}

	// 删除已发布作业
	@Override
	public int deleteWorkByHid(int hid) {
		String sql = "delete from t_work where hid=?";
		return DBUtil.executeUpdate(sql, new Object[]{hid});
	}

	// 删除文件上传的记录
	@Override
	public int delteRecordsByHid(int hid) {
		String sql = "delete from t_record where hid=?";
		return DBUtil.executeUpdate(sql, new Object[]{hid});
	}
	
	// 删除对应的上传文件
	
	


}
