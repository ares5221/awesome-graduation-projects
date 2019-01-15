package com.kb.eis.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kb.eis.dao.RKDao;
import com.kb.eis.pojo.CG;
import com.kb.eis.pojo.GYS;
import com.kb.eis.pojo.Pojo;
import com.kb.eis.pojo.RuKu;
import com.kb.eis.pojo.SPInfo;
import com.kb.eis.util.DBUtil;

public class RKDaoImpl implements RKDao {

	/**
	 * 查询所有没有提交的入库单
	 */
	@Override
	public List<Pojo> query() {
		Connection conn = DBUtil.getConnection();
		List<Pojo> rkList = new ArrayList<Pojo>();
		ResultSet rs = null;
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			String sql = "select * from tab_ruku_main rk"
					+ " join "
					+ " tab_spinfo sp on rk.spid=sp.spid"
					+ " join"
					+ " tab_cgdan cg on rk.cgid=cg.id"
					+ " join tab_gysinfo gys on sp.gysid=gys.gyid where rk.isrk=1";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Pojo base = new Pojo();
				SPInfo sp = DBUtil.packaging(SPInfo.class, rs);
				CG cg = DBUtil.packaging(CG.class, rs);
				RuKu rk = DBUtil.packaging(RuKu.class, rs);
				GYS gys = DBUtil.packaging(GYS.class, rs);
				base.setCg(cg);
				base.setRuku(rk);
				base.setSpInfo(sp);
				base.setGys(gys);
				rkList.add(base);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return rkList;
	}

	/**
	 * 通过id查数据
	 */
	@Override
	public RuKu queryByID(String rkid) {
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		RuKu rk = null;
		try {
			stmt = conn.createStatement();
			String sql = "select * from tab_ruku_main where rkid='" + rkid
					+ "'";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				rk = DBUtil.packaging(RuKu.class, rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return rk;
	}

	/**
	 * 提交过以后更改判断字段
	 * 
	 * @param rkid
	 * @return
	 */
	public int updateByID(String rkid) {
		String sql = "update tab_ruku_main set isrk='2' where rkid=?";
		Object[] params = {rkid};
		int rs = DBUtil.executeUpdate(sql, params);
		return rs;
	}

	/**
	 * 查询所有提交过的入库单
	 */
	public List<Pojo> queryRecord() {
		Connection conn = DBUtil.getConnection();
		List<Pojo> rkList = new ArrayList<Pojo>();
		ResultSet rs = null;
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			String sql = "select * from tab_ruku_main rk"
					+ " join "
					+ " tab_spinfo sp on rk.spid=sp.spid"
					+ " join"
					+ " tab_cgdan cg on rk.cgid=cg.id"
					+ " join tab_gysinfo gys on sp.gysid=gys.gyid where rk.isrk=2";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Pojo base = new Pojo();
				SPInfo sp = DBUtil.packaging(SPInfo.class, rs);
				CG cg = DBUtil.packaging(CG.class, rs);
				RuKu rk = DBUtil.packaging(RuKu.class, rs);
				GYS gys = DBUtil.packaging(GYS.class, rs);
				base.setCg(cg);
				base.setRuku(rk);
				base.setSpInfo(sp);
				base.setGys(gys);
				rkList.add(base);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return rkList;
	}

	/**
	 * 保存数据至入库表
	 * @param ruKu
	 * @return
	 */
	public int saveRuKuInfo(RuKu ruKu) {
		String sql = "insert into tab_ruku_main (rkid,sf,gysname,rkdate,czy,jsr,jsfs,wf,spid,cgid) values (seq_ruku.nextval,?,?,sysdate,?,?,?,?,?,?)";
		Object [] params = {ruKu.getSf(),ruKu.getGysname(),
				ruKu.getCzy(),ruKu.getJsr(),ruKu.getJsfs(),ruKu.getWf(),ruKu.getSpid(),ruKu.getCgid()};
		return DBUtil.executeUpdate(sql, params);
	}
	

	@Override
	public int delete(String rkid) {
		String sql = "delete from tab_ruku_main where rkid = ?";
		int id = Integer.parseInt(rkid);
		Object[] params = {id};
		return DBUtil.executeUpdate(sql, params);
	}

}
