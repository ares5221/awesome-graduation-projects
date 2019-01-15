package com.kb.eis.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kb.eis.dao.KuCunDao;
import com.kb.eis.pojo.CG;
import com.kb.eis.pojo.KuCun;
import com.kb.eis.pojo.Pojo;
import com.kb.eis.pojo.RuKu;
import com.kb.eis.pojo.SPInfo;
import com.kb.eis.util.DBUtil;

public class KuCunDaoImpl implements KuCunDao {

	/**
	 * 通过商品id查询库存信息
	 * @param spid
	 * @return
	 */
	@Override
	public KuCun queryBySPID(String spid) {
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		KuCun kc = null;
		try {
			stmt = conn.createStatement();
			String sql = "select * from tab_kucun where spid='"+spid+"'";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				kc = DBUtil.packaging(KuCun.class, rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, stmt, conn);
		}
		return kc;
	}

	/**
	 * 添加新的库存商品
	 * @param rk
	 * @param cg
	 * @param sp
	 * @return
	 */
	public int add(CG cg, SPInfo sp) {
		String sql = "insert into tab_kucun values(SEQ_KUCUN.nextval,?,?,?,?,?,?,?,?,?)";
		Object[] params = {sp.getSpName(),sp.getJc(),sp.getCd(),sp.getGg(),sp.getDw(),cg.getDj(),cg.getSl(),cg.getSpid(),0};
		int rs = DBUtil.executeUpdate(sql, params);
		return rs;
	}

	/**
	 * 对老库存商品数量进行修改
	 * @param kcid 
	 * @param rk
	 * @param cg
	 * @param sp
	 * @return
	 */
	public int update(KuCun kc, CG cg, SPInfo sp) {
		String sql = "update tab_kucun set kcsl=? where id=?";
		int cgsl = Integer.parseInt(cg.getSl());
		int sl = kc.getKcsl()+cgsl;
		Object[] params = {sl,kc.getId()};
		int rs = DBUtil.executeUpdate(sql, params);
		return rs;
	}

	public List<KuCun> queryAll() {
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		List<KuCun> kcList = new ArrayList<KuCun>();
		try {
			stmt = conn.createStatement();
			String sql = "select * from tab_kucun";
			rs = stmt.executeQuery(sql);
			kcList = DBUtil.encapsulation(KuCun.class, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, stmt, conn);
		}
		return kcList;
	}
	
	/**
	 * 据库存编号查询库存
	 * @param id
	 * @return
	 */
	public KuCun queryStockById(String id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		KuCun kuCun = null;
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from tab_kucun where id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			while(rs.next()) {
				kuCun = DBUtil.packaging(KuCun.class, rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, stmt, conn);
		}
		return kuCun;
	}
	
	/**
	 * 更新库存数据
	 * @return
	 */

	public int updateStock(KuCun kuCun) {
		String sql = "update tab_kucun set kcsl=?,xsjg=? where id=?";
		Object [] params = {kuCun.getKcsl(),kuCun.getXsjg(),kuCun.getId()};
		return DBUtil.executeUpdate(sql, params);
	}

	/**
	 * 修改库存数量
	 * @param xssl
	 * @return
	 */
	@Override
	public int updateSl(String kcid, int kcsl) {
		String sql = "update tab_kucun set kcsl=? where id=?";
		Object[] params = {kcsl,kcid};
		return DBUtil.executeUpdate(sql, params);
	}

}
