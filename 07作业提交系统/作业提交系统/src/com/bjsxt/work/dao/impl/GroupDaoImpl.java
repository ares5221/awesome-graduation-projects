package com.bjsxt.work.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bjsxt.work.dao.GroupDao;
import com.bjsxt.work.entity.Group;
import com.bjsxt.work.entity.Student;
import com.bjsxt.work.util.DBUtil;

public class GroupDaoImpl implements GroupDao {

	@Override
	public int addGroup(Group group, Student stu1, Student stu2) {

		String sql = "insert into t_group values(seq_group.nextval, ?, ?, ?)";
		Object[] params = { stu1.getSid(), stu2.getSid(), group.getGname() };
		return DBUtil.executeUpdate(sql, params);
	}

	@Override
	public List<Student> findStudent() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Student> studentList = new ArrayList<Student>();

		try {
			// 创建一个连接
			conn = DBUtil.getConnection();
			// 发送sql
			String sql = "select * from t_student";
			// 创建发射器
			stmt = conn.createStatement();

			// 得到结果集
			rs = stmt.executeQuery(sql);

			// 处理结果集
			while (rs.next()) {
				int sid = rs.getInt("sid");

				String sname = rs.getString("sname");
				String password = rs.getString("password");

				// 封装成对象
				Student student = new Student(sid, sname, password);
				studentList.add(student);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}

		return studentList;

	}

	@Override
	public List<Group> showAllGroup() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Group> groupList = new ArrayList<Group>();
		try {
			// 创建一个连接
			conn = DBUtil.getConnection();
			// 发送sql
			String sql = "select * from t_group";
			// 创建发射器
			stmt = conn.createStatement();

			// 得到结果集
			rs = stmt.executeQuery(sql);

			// 处理结果集
			while (rs.next()) {
				int gid = rs.getInt("gid");
				int sid1 = rs.getInt("sid1");
				int sid2 = rs.getInt("sid2");
				String gname = rs.getString("gname");

				// 封装成对象
				Group group = new Group(gid, gname);
				group.getSlist().add(new Student(sid1));
				group.getSlist().add(new Student(sid2));
				groupList.add(group);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}

		return groupList;
	}
	
	/**
	 * 删除小组信息
	 */
	@Override
	public int deleteG(int gid) {
		String sql1 = "update t_student set gid=null where gid=?";
		String sql2 = "delete from t_group where gid=?";
		Object[] params1 = {gid};
		Object[] params2 = {gid};
		return DBUtil.executeUpdate(sql1, params1) > 0 && DBUtil.executeUpdate(sql2, params2) > 0 ? 1 : 0;
	}



    /**
     * 通过Id查找小组信息
     */
	@Override
	public List<Group> findById(int gid) {
		Connection conn = null;//javascript undefined 
		Statement stmt = null;
		ResultSet rs = null;
		List<Group> groupList = new ArrayList<Group>();
	   
		try {
			//建立连接
			conn  = DBUtil.getConnection();
			
			//向数据库发送SQL命令并得到结果
			String sql = "select * from t_group where gid =  "+gid;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			//处理返回结果
			if(rs.next()){
				String gname = rs.getString("gname");
				int sid1 = rs.getInt("sid1");
				int sid2 = rs.getInt("sid2"); 
				Group group = new Group(gid,gname);
				group.getSlist().add(new Student(sid1));
				group.getSlist().add(new Student(sid2)) ;
				//封装成对象
				 
				groupList.add(group);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭数据库资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		
		return groupList;
	
	}
    /**
     * 修改小组信息
     */
	@Override
	public int updateGroupInfo(Group group, Student stu1, Student stu2) {
		String sql = "update t_group set gname=?,sid1=?,sid2=? where gid = ?";
		
		Object[] params={group.getGname(),stu1.getSid(),stu2.getSid(),group.getGid() };
		return DBUtil.executeUpdate(sql, params);
	}	
	

}
