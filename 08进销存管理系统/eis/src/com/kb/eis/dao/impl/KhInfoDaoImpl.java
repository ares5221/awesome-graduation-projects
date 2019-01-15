package com.kb.eis.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.kb.eis.dao.KhInfoDao;
import com.kb.eis.pojo.KhInfo;
import com.kb.eis.pojo.Sell;
import com.kb.eis.util.DBUtil;
import com.kb.eis.util.PageBean;

public class KhInfoDaoImpl implements KhInfoDao {
	//写入到khinfo表
	@Override
	public int add(KhInfo kh) {
		String sql = "insert into tab_khinfo values(SEQ_KHINFO.Nextval,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {kh.getKhname(),kh.getJian(),kh.getAddress(),kh.getBianma(),
				kh.getTel(),kh.getFax(),kh.getLian(),kh.getLtel(),kh.getMail(),kh.getYinhang(),
				kh.getHao()};
		return DBUtil.executeUpdate(sql, params);
	}
	
	/**
	 * 预更新查询khinfo表 根据ID
	 */
	@Override
	public KhInfo toupdate(int khid) {
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		String sql = "select * from tab_khinfo where khid="+khid;
		ResultSet rs = null;
		KhInfo khInfo = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				khInfo = DBUtil.packaging(KhInfo.class, rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBUtil.closeAll(rs, stmt, conn);
		}
		return khInfo;
	}
	/**
	 * 删除khinfo表根据ID
	 */
	@Override
	public int delete(int khid) {
		String sql = "delete from tab_khinfo where khid=?";
		Object[] params = {khid};
		return DBUtil.executeUpdate(sql, params);
	}

	/**
	 * 查询符合条件的数据条数
	 */
	@Override
	public int count(String khname, String khid) {
		Connection conn = DBUtil.getConnection();
		String sql = "select count(*) rs from tab_khinfo";
		int count = 0 ;
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				count = rs.getInt("rs");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	/**
	 * 多条件分页查询
	 */
	@Override
	public List<KhInfo> query() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from tab_khinfo";
		List<KhInfo> list = null;
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			list = DBUtil.encapsulation(KhInfo.class, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int update(KhInfo kh) {
		String sql = "update tab_khinfo set khname=?,jian=?,address=?,"
				+ "bianma=?,tel=?,fax=?,lian=?,mail=?,yinhang=?,hao=? where khid=?";
		Object[] params = {kh.getKhname(),kh.getJian(),kh.getAddress(),kh.getBianma(),
				kh.getTel(),kh.getFax(),kh.getLian(),kh.getMail(),kh.getYinhang(),kh.getHao(),kh.getKhid()};
		return DBUtil.executeUpdate(sql, params);
	}

	@Override
	public int deletes(String[] idarr) {
		String ids = Arrays.toString(idarr);
		String ids2 = ids.replaceAll("\\[", "");
		String ids3 = ids2.replaceAll("\\]", "");
		String sql = "delete from tab_khinfo where khid in("+ids3+")";
		Connection conn = null; 
		conn = DBUtil.getConnection();
		Statement stmt = null;
		int rs = 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(null, stmt, conn);
		}
		return rs;
	}
	
	/**
	 * 查询客户信息
	 */
	@Override
	public List<KhInfo> queryAllClient() {
		List<KhInfo> clientList = new ArrayList<KhInfo>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			String sql = "select * from tab_khinfo";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				int khid = rs.getInt("khid");
				String khname = rs.getString("khname");
				String jian = rs.getString("jian");
				String address = rs.getString("address");
				String bianma = rs.getString("bianma");
				String tel = rs.getString("tel");
				String fax = rs.getString("fax");
				String lian = rs.getString("lian");
				String ltel = rs.getString("ltel");
				String mail = rs.getString("mail");
				String yinhang = rs.getString("yinhang");
				String hao = rs.getString("hao");
				KhInfo khInfo = new KhInfo(khid, khname, jian, address, bianma, tel, fax, 
											lian, ltel, mail, yinhang, hao);
				clientList.add(khInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return clientList.size()>0?clientList:null;
	}
	
}
