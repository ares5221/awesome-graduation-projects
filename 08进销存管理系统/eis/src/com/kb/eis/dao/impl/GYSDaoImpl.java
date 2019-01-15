package com.kb.eis.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kb.eis.dao.GYSDao;
import com.kb.eis.pojo.GYS;
import com.kb.eis.util.DBUtil;

public class GYSDaoImpl implements GYSDao {

	@Override
	public List<GYS> query() {
		List<GYS> list = new ArrayList<GYS>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select * from tab_gysinfo";
		try {
			conn = DBUtil.getConnection();
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()){
				String gyid = rs.getString("gyid");
				String name = rs.getString("name");
				String jc = rs.getString("jc");
				String address = rs.getString("address");
				String bianMa = rs.getString("bianma");
				String tel = rs.getString("tel");
				String lian = rs.getString("lian");
				String ltel = rs.getString("ltel");
				String yh = rs.getString("yh");
				String mail = rs.getString("mail");
				GYS gys = new GYS(gyid, name, jc, address, bianMa, tel, lian, ltel, yh, mail);
				list.add(gys);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (NullPointerException e) {
			e.printStackTrace();
		}
		finally{
			DBUtil.closeAll(rs, pst, conn);
		}
		return list.size()>0?list:null;
	}

	@Override
	public GYS queryByID(String gyid) {
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		GYS gys = null;
		String sql = "select * from tab_gysinfo where gyid = "+gyid;
		try {
			conn = DBUtil.getConnection();
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			if(rs.next()){
				String name = rs.getString("name");
				String jc = rs.getString("jc");
				String address = rs.getString("address");
				String bianMa = rs.getString("bianMa");
				String tel = rs.getString("tel");
				String lian = rs.getString("lian");
				String ltel = rs.getString("ltel");
				String yh = rs.getString("yh");
				String mail = rs.getString("mail");
				gys = new GYS(gyid, name, jc, address, bianMa, tel, lian, ltel, yh, mail);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, pst, conn);
		}
		return gys;
	}

	@Override
	public int insert(GYS gys) {
		String sql ="insert into tab_gysinfo values(seq_gysinfo.nextval,?,?,?,?,?,?,?,?,?)";
		Object [] params = {gys.getName(),gys.getJc(),gys.getAddress(),gys.getBianMa(),gys.getTel(),
				gys.getLian(),gys.getLtel(),gys.getYh(),gys.getMail()};
		return DBUtil.executeUpdate(sql, params);
	}

	@Override
	public List<GYS> queryByName(String gysname) {
		List<GYS> list = new ArrayList<GYS>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select * from tab_gysinfo g where g.name like '%"+gysname+"%'";
		try {
			conn = DBUtil.getConnection();
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()){
				String name = rs.getString("name");
				String gyid = rs.getString("gyid");
				String jc = rs.getString("jc");
				String address = rs.getString("address");
				String bianMa = rs.getString("bianma");
				String tel = rs.getString("tel");
				String lian = rs.getString("lian");
				String ltel = rs.getString("ltel");
				String yh = rs.getString("yh");
				String mail = rs.getString("mail");
				GYS gys = new GYS(gyid, name, jc, address, bianMa, tel, lian, ltel, yh, mail);
				list.add(gys);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, pst, conn);
		}
		return list;
	}

	@Override
	public int update(GYS gys) {
		String sql = "update tab_gysinfo set name=?, jc=?, address=?,bianma=?,"
				+ "tel=?,lian=?,ltel=?, yh=?, mail=? where gyid=?";
		Object[] params = {gys.getName(),gys.getJc(),gys.getAddress(),gys.getBianMa(),
				gys.getTel(),gys.getLian(),gys.getLtel(),gys.getYh(),gys.getMail(),gys.getGyid()};
		int n = DBUtil.executeUpdate(sql, params);
		return n;
	}
	
}
