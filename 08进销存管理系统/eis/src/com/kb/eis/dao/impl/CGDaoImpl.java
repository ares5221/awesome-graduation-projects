package com.kb.eis.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kb.eis.dao.CGDao;
import com.kb.eis.pojo.CG;
import com.kb.eis.pojo.GYS;
import com.kb.eis.pojo.Pojo;
import com.kb.eis.pojo.SPInfo;
import com.kb.eis.util.DBUtil;

public class CGDaoImpl implements CGDao {
	
	/**
	 * 查询所有采购单上商品的信息
	 */
	@Override
	public List<Pojo> queryAllCG() {
		List<Pojo> cgList = new ArrayList<Pojo>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			sql = "select * from tab_cgdan cg "
					+ "join tab_spinfo sp on cg.spid = sp.spid"
					+ " join tab_gysinfo gys on gys.gyid = sp.gysid"
					+ " where iscg=1";
			rs = stmt.executeQuery(sql );
			while (rs.next()) {
				Pojo base = new Pojo();
				CG cg = DBUtil.packaging(CG.class, rs);
				SPInfo sp = DBUtil.packaging(SPInfo.class, rs);
				GYS gys = DBUtil.packaging(GYS.class, rs);
				//封装并添加到集合中
				base.setSpInfo(sp);
				base.setCg(cg);
				base.setGys(gys);
				cgList.add(base);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return cgList;
	}

	/**
	 * 通过采购单id查询采购单
	 */
	@Override
	public CG queryByCGID(String cgid) {
		Connection conn = DBUtil.getConnection();
		CG cg = null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "select * from tab_cgdan where id='"+cgid+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				cg = DBUtil.packaging(CG.class, rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cg;
	}
	
	/**
	 * 查询采购，商品，供应商信息
	 */
	@Override
	public List<Pojo> queryAll() {
		List<Pojo> pjList = new ArrayList<Pojo>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CG cg = null;
		SPInfo spInfo = null;
		GYS gys = null;
		try {
			 conn = DBUtil.getConnection();
			 String sql = "select * from tab_cgdan cg join tab_spinfo s on cg.spid = s.spid join tab_gysinfo gy on s.gysid = gy.gyid where iscg=1 ";
			 pstmt = conn.prepareStatement(sql);
			 rs = pstmt.executeQuery();
			 while(rs.next()) {
				 Pojo base = new Pojo();
				 cg = DBUtil.packaging(CG.class, rs);
				 spInfo = DBUtil.packaging(SPInfo.class, rs);
				 gys = DBUtil.packaging(GYS.class, rs);
				 //封装并加入集合
				 base.setCg(cg);
				 base.setSpInfo(spInfo);
				 base.setGys(gys);
				 pjList.add(base);

			 }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, pstmt, conn);
		}
		return pjList;
	}

	@Override
	public String findCSById(String sspid) {
		String cs = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			String sql = "select cs from tab_spinfo where spid =?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, sspid);
			rs = stmt.executeQuery();
			if(rs.next()) {
				cs= rs.getString(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return cs;
	}
	
	/**
	 * 根据采购编号查询采购表，商品表，供应商表
	 */
	@Override
	public List<Pojo> queryById(String id) {
		List<Pojo> pojo = new ArrayList<Pojo>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CG cg = null;
		SPInfo spInfo = null;
		GYS gys = null;
		try {
			 conn = DBUtil.getConnection();
			 String sql = "select * from tab_cgdan cg join tab_spinfo s on cg.spid = s.spid join tab_gysinfo gy on s.gysid = gy.gyid where cg.id=?";
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, id);
			 rs = pstmt.executeQuery();
			 while(rs.next()) {
				 Pojo base = new Pojo();
				 cg = DBUtil.packaging(CG.class, rs);
				 spInfo = DBUtil.packaging(SPInfo.class, rs);
				 gys = DBUtil.packaging(GYS.class, rs);
				 //封装并加入集合
				 base.setCg(cg);
				 base.setSpInfo(spInfo);
				 base.setGys(gys);
				 pojo.add(base);

			 }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, pstmt, conn);
		}
		return pojo;
	}

	@Override
	public int add(CG cg) {
		String sql ="insert into tab_cgdan values(seq_cgdan.nextval,?,?,?,?,sysdate,?,1)";
		Object [] params = {cg.getSpid(),cg.getDj(),cg.getSl(),cg.getJe(),cg.getMemo()};
		return DBUtil.executeUpdate(sql, params);
	}

	@Override
	public int update(CG cg) {
		String sql = "update tab_cgdan set dj=?, sl=?, je=?,memo=? where id=?";
		Object[] params = {cg.getDj(),cg.getSl(),cg.getJe(),cg.getMemo(),cg.getid()};
		int n = DBUtil.executeUpdate(sql, params);
		return n;
	}

	/**
	 * 更改判断字段
	 * @param cgid
	 * @return
	 */
	public int set(String cgid) {
		String sql = "update tab_cgdan set iscg=2 where id = ?";
		Object[] params = {cgid};
		return DBUtil.executeUpdate(sql, params);
	}

	@Override
	public List<Pojo> queryis() {
		List<Pojo> cgList = new ArrayList<Pojo>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			sql = "select * from tab_cgdan cg "
					+ "join tab_spinfo sp on cg.spid = sp.spid"
					+ " join tab_gysinfo gys on gys.gyid = sp.gysid"
					+ " where iscg=2";
			rs = stmt.executeQuery(sql );
			while (rs.next()) {
				Pojo base = new Pojo();
				CG cg = DBUtil.packaging(CG.class, rs);
				SPInfo sp = DBUtil.packaging(SPInfo.class, rs);
				GYS gys = DBUtil.packaging(GYS.class, rs);
				//封装并添加到集合中
				base.setSpInfo(sp);
				base.setCg(cg);
				base.setGys(gys);
				cgList.add(base);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return cgList;
	}

	
}
