package com.hd.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import oracle.net.aso.n;

import com.hd.dao.NoticeDao;
import com.hd.entity.NoticeInfo;
import com.hd.util.DBUtil;

public class NoticeDaoImpl implements NoticeDao{

	@Override
	public void delete(int notice_id) {
		String sql = "delete from notice_info where notice_id = ?";
		Object params [] = {notice_id};
		DBUtil.executeUpdate(sql, params);
		
		
	}

	@Override
	public List<NoticeInfo> findAll() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<NoticeInfo> noticeList = new ArrayList<NoticeInfo>();
		try {			
			//（和数据库）建立连接
			conn = DBUtil.getConnection();
			//（向数据库）发送命令并得到结果
			String sql ="select * from notice_info";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			//处理结果
			while(rs.next()){
				//获取各列的数据

				int notice_id = rs.getInt("notice_id");
				int user_id = rs.getInt("user_id");
				String notice_item = rs.getString("notice_item");
				String notice_content = rs.getString("notice_content");
				Date notice_time = rs.getDate("notice_time");
				Date notice_endtime = rs.getDate("notice_endtime");
				String is_used = rs.getString("is_used");

				//将各列的数据封装到Employee对象中
				NoticeInfo noticeInfo = new NoticeInfo(notice_id, user_id, notice_item, notice_content, notice_time, notice_endtime, is_used);
				noticeList.add(noticeInfo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		//返回数据
		System.out.println(noticeList.size());
		return noticeList;
	}

	@Override
	public int save(NoticeInfo noticeInfo) {
		String sql = "insert into notice_info values(null,?,?,?,?,?,default);";
		Object[] params = {noticeInfo.getUser_id(),noticeInfo.getNotice_item(),noticeInfo.getNotice_content(),noticeInfo.getNotice_time(),noticeInfo.getNotice_endtime()};
		int n = DBUtil.executeUpdate(sql, params);
		return n;
	}

	/* 
	 *获取符合查询条件的数据数量
	 */
	@Override
	public int findRequiredCount(String selectContent, String selectType) {
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int n = 0;
		try {			
			//（和数据库）建立连接
			conn = DBUtil.getConnection();
			//（向数据库）发送命令并得到结果
			StringBuffer sql =new StringBuffer("select count(1) from notice_info where 1=1 ");
			
			if(selectType!=null&&!"".equals(selectType)){
				
				sql.append(" and "+selectType+" like '%"+selectContent+"%'");
			}
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			//处理结果
			
			rs.next();
			n = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		return n;
	}

	/* 
	 * 获取分页查询的条目
	 */
	@Override
	public List<NoticeInfo> findRequiredItems(int start, int size,
			String selectContent, String selectType) {
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<NoticeInfo> noticeList = new ArrayList<NoticeInfo>();
		try {			
			//（和数据库）建立连接
			conn = DBUtil.getConnection();
			//（向数据库）发送命令并得到结果
			StringBuffer sql =new StringBuffer("select ni.*,user_info.user_name from notice_info ni join user_info on (ni.user_id=user_info.user_id) where 1=1 ");
			
			if(selectType!=null&&!"".equals(selectType)){
				
				sql.append(" and "+selectType+" like '%"+selectContent+"%'");
			}
			
			sql.append(" limit "+start+","+size);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			//处理结果
			while(rs.next()){
				//获取各列的数据

				int notice_id = rs.getInt("notice_id");
				int user_id = rs.getInt("user_id");
				String notice_item = rs.getString("notice_item");
				String notice_content = rs.getString("notice_content");
				Date notice_time = rs.getDate("notice_time");
				Date notice_endtime = rs.getDate("notice_endtime");
				String is_used = rs.getString("is_used");
				String user_name = rs.getString("user_name");
				//将各列的数据封装到对象中
				NoticeInfo noticeInfo = new NoticeInfo(notice_id, user_id, notice_item, notice_content, notice_time, notice_endtime, is_used);
				noticeInfo.setUser_name(user_name);
				noticeList.add(noticeInfo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		//返回数据
		System.out.println(noticeList.size());
		return noticeList;
	}

	/* 获取符合查询条件的公告
	 */
	@Override
	public List<NoticeInfo> findDateNotice(int days) {
		

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<NoticeInfo> noticeList = new ArrayList<NoticeInfo>();
		try {			
			//（和数据库）建立连接
			conn = DBUtil.getConnection();
			//（向数据库）发送命令并得到结果
			StringBuffer sql =new StringBuffer("select ni.*,user_info.user_name "
					+ "from notice_info ni join user_info "
					+ "on (ni.user_id=user_info.user_id) where 1=1 and notice_time<date_add(now(),interval+"+days+" day) ");
			
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			//处理结果
			while(rs.next()){
				//获取各列的数据

				int notice_id = rs.getInt("notice_id");
				int user_id = rs.getInt("user_id");
				String notice_item = rs.getString("notice_item");
				String notice_content = rs.getString("notice_content");
				Date notice_time = rs.getDate("notice_time");
				Date notice_endtime = rs.getDate("notice_endtime");
				String is_used = rs.getString("is_used");
				String user_name = rs.getString("user_name");
				//将各列的数据封装到对象中
				NoticeInfo noticeInfo = new NoticeInfo(notice_id, user_id, notice_item, notice_content, notice_time, notice_endtime, is_used);
				noticeInfo.setUser_name(user_name);
				noticeList.add(noticeInfo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		//返回数据
		System.out.println(noticeList.size());
		return noticeList;
	}

}
