package com.bjsxt.work.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.bjsxt.work.dao.RankingDao;
import com.bjsxt.work.entity.Group;
import com.bjsxt.work.entity.Record;
import com.bjsxt.work.entity.Student;
import com.bjsxt.work.entity.Work;
import com.bjsxt.work.util.DBUtil;

public class RankingDaoImpl implements RankingDao {

	@Override
	public int findByName(int hid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;
		String sql = "  select count(*) from t_group join "
				+ "(select rw.*,stu.sname,stu.gid from t_student stu join "
				+ "(select * from t_record  where hid='"+hid+"' order by submittime)rw "
				+ "on rw.sid=stu.sid)zz "
				+ "on zz.gid=t_group.gid";
		
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
		rs.next();
		count = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(null, pstmt, conn);
		}
		return count;
	}

	@Override
	public List<Student> findPage(int start,int end,int hid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = " select zz.* ,gname from t_group join "
				+ "(select rownum rn,rw.*,stu.sname,stu.gid from t_student stu join "
				+ "(select * from t_record  where hid='"+hid+"' )rw on "
				+ "rw.sid=stu.sid)zz on "
				+ "zz.gid=t_group.gid where rn>"+start+" and rownum<="+end +"order by submittime";

		List<Student> stuList = new ArrayList<Student>();
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				String sname = rs.getString("sname");
				//int hid = rs.getInt("hid");
				Date submitTime = rs.getDate("submitTime");
				String fileName = rs.getString("fileName");
				String gname = rs.getString("gname");
				int rid = rs.getInt("rid");
				Work work = new Work(hid);
				Record record = new Record(rid,submitTime, fileName);
				Group group = new Group(gname);
				Student stu = new Student(sname, record, work, group);
				stu.setWork(work);
				stu.setGroup(group);
				stu.setRecord(record);
				stuList.add(stu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(null, pstmt, conn);
		}
		return stuList;
	}

	
	@Override
	public List<Work> findWork() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from t_work";
		List<Work> workList =new ArrayList<Work>();
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				Integer hid = rs.getInt("hid");
				String hname = rs.getString("hname");
				Work work = new Work(hid, hname);
				workList.add(work);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(null, pstmt, conn);
		}
		return workList;
	}
	
	/**
	 * 小组排名
	 */
	@Override
	public List<Student> rankingForGroup(int hid) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select max(str.submittime)submittime,str.gid,str.gname from ("
				+ "select tr.filename,tr.submittime,tg.gid,tg.gname from t_record tr join t_student ts "
				+ "on ts.sid=tr.sid join t_work tw on tr.hid=tw.hid join t_group tg "
				+ "on ts.gid=tg.gid where tr.hid='"+hid+"')str group by str.gid,str.gname order by submittime";
		List<Student> stuList =new ArrayList<Student>();
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				int gid = rs.getInt("gid");
				String gname = rs.getString("gname");
				Date submittime = rs.getDate("submittime");
				Student stu = new Student();
				Work work = new Work(hid);
				Record record = new Record(submittime);
				Group group = new Group(gid,gname);
				stu.setWork(work);
				stu.setGroup(group);
				stu.setRecord(record);
				stuList.add(stu);
				//groupList.add(group);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(null, pstmt, conn);
		}
		return stuList;
	}
	
	@Override
	public List<Group> findName12() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select tsg1.name1,tsg2.name2,tsg1.gid from("
				+ "select ts.sname name1,tg.gid from t_group tg join t_student ts "
				+ "on tg.sid1=ts.sid)tsg1 join ("
				+ "select ts.sname name2,tg.gid from t_group tg join t_student ts "
				+ "on tg.sid2=ts.sid)tsg2 on tsg1.gid=tsg2.gid";
		List<Group> groupList =new ArrayList<Group>();
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				int gid = rs.getInt("gid");
				String name1 = rs.getString("name1");
				String name2 = rs.getString("name2");
				Group group = new Group(gid,name1,name2);
				groupList.add(group);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(null, pstmt, conn);
		}
		return groupList;
	}	


	

}
