package com.bjsxt.work.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bjsxt.work.dao.ClazzDao;
import com.bjsxt.work.entity.Clazz;
import com.bjsxt.work.entity.Teacher;
import com.bjsxt.work.util.DBUtil;

public class ClazzDaoImpl implements ClazzDao {

	// 添加班级
	@Override
	public int save(Clazz clazz, Teacher teacher1, Teacher teacher2, Teacher teacher3) {
		String sql = "insert into t_clazz values(seq_clazz.nextval,?,?,?,?)";
		Object[] params = { teacher1.getTid(), teacher2.getTid(), teacher3.getTid(), clazz.getCname() };
		return DBUtil.executeUpdate(sql, params);
	}

	// 查询老师，将老师放入 添加学生 的老师下拉栏选项中
	@Override
	public List<Teacher> findAllTeacher() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Teacher> teacherList = new ArrayList<Teacher>();

		try {
			// 创建一个连接
			conn = DBUtil.getConnection();
			// 发送sql
			String sql = "select * from t_teacher";
			// 创建发射器
			stmt = conn.createStatement();

			// 得到结果集
			rs = stmt.executeQuery(sql);

			// 处理结果集
			while (rs.next()) {
				int tid = rs.getInt("tid");
				String tname = rs.getString("tname");
				String password = rs.getString("password");

				// 封装成对象
				Teacher teacher = new Teacher(tid, tname, password);

				teacherList.add(teacher);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}

		return teacherList;

	}

	// 查询所有的班级信息 
	@Override
	public List<Clazz> findClazz() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Clazz> clazzList = new ArrayList<Clazz>();
		try {
			// 创建一个连接
			conn = DBUtil.getConnection();
			// 发送sql
			String sql = "select * from t_clazz order by cid";
			// 创建发射器
			stmt = conn.createStatement();

			// 得到结果集
			rs = stmt.executeQuery(sql);

			// 处理结果集
			while (rs.next()) {
				int cid = rs.getInt("cid");
				int tid1 = rs.getInt("tid1");
				int tid2 = rs.getInt("tid2");
				int tid3 = rs.getInt("tid3");
				String cname = rs.getString("cname");

				// 封装成对象
				Clazz clazz = new Clazz(cid, cname);
				
				clazz.getTlist().add(new Teacher(tid1));
				clazz.getTlist().add(new Teacher(tid2));
				clazz.getTlist().add(new Teacher(tid3));
				clazzList.add(clazz);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}

		return clazzList;
	}

}
