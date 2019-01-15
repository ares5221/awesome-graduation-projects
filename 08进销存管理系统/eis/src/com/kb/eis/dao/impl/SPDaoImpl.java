package com.kb.eis.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kb.eis.dao.SPDao;
import com.kb.eis.pojo.CG;
import com.kb.eis.pojo.GYS;
import com.kb.eis.pojo.KhInfo;
import com.kb.eis.pojo.KuCun;
import com.kb.eis.pojo.Pojo;
import com.kb.eis.pojo.RuKu;
import com.kb.eis.pojo.SPInfo;
import com.kb.eis.pojo.Sell;
import com.kb.eis.util.DBUtil;

public class SPDaoImpl implements SPDao {
	@Override
	public SPInfo selectById(String spId) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		SPInfo sp = null;
		try {
			// 建立连接
			conn = DBUtil.getConnection();
			// 向数据库发送SQL命令并得到结果
			String sql = "select * from tab_SPInfo where spId='"+spId+"'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			// 处理返回结果
			List<SPInfo> list = DBUtil.encapsulation(SPInfo.class, rs);
			sp = list.get(0);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		return sp;
	}

	@Override
	public List<Pojo> selectAll() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Pojo> pojoList = new ArrayList<>();
		try {
			// 建立连接
			conn = DBUtil.getConnection();
			// 向数据库发送SQL命令并得到结果
			String sql = "select * from tab_spinfo sp join tab_gysinfo gys on sp.gysid=gys.gyid";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			// 处理返回结果
			while (rs.next()) {
				Pojo pojo = new Pojo();
				SPInfo spInfo = DBUtil.packaging(SPInfo.class, rs);
				GYS gys = DBUtil.packaging(GYS.class, rs);
				pojo.setSpInfo(spInfo);
				pojo.setGys(gys);
				pojoList.add(pojo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		return pojoList;
	}

	@Override
	public int insert(SPInfo spInfo) {
		Connection conn = null;
		PreparedStatement pstmt  = null;
		int i = 0;
		try {
			// 建立连接
			conn = DBUtil.getConnection();
			// 向数据库发送SQL命令并得到结果
			String sql = "insert into tab_spinfo values(seq_spinfo.nextval,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			DBUtil.binding(pstmt, spInfo.getSpName(),spInfo.getJc(),spInfo.getCd(),
					spInfo.getDw(),spInfo.getGg(),spInfo.getPh(),spInfo.getMemo(),
					spInfo.getGysId(),spInfo.getBz(),spInfo.getCs());
			i = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库资源
			DBUtil.closeAll(null, pstmt, conn);
		}
		return i;
	}

	@Override
	public int update(SPInfo spInfo) {
		Connection conn = null;
		PreparedStatement pstmt  = null;
		int i = 0;
		try {
			// 建立连接
			conn = DBUtil.getConnection();
			// 向数据库发送SQL命令并得到结果
			String sql = "update tab_spinfo set spname =?,jc=?,cd=?,dw=?,gg=?,ph=?,memo=?,gysid=?,bz=?,cs=? where spid=?";
			pstmt = conn.prepareStatement(sql);
			DBUtil.binding(pstmt, spInfo.getSpName(),spInfo.getJc(),spInfo.getCd(),
					spInfo.getDw(),spInfo.getGg(),spInfo.getPh(),spInfo.getMemo(),
					spInfo.getGysId(),spInfo.getBz(),spInfo.getCs(),spInfo.getSpId());
			i = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库资源
			DBUtil.closeAll(null, pstmt, conn);
		}
		return i;
	}

	@Override
	public void delete(String spId) {
		Connection conn = null;
		PreparedStatement pstmt  = null;
		int i = 0;
		try {
			// 建立连接
			conn = DBUtil.getConnection();
			// 向数据库发送SQL命令并得到结果
			String sql = "delete tab_spinfo where spid=?";
			pstmt = conn.prepareStatement(sql);
			DBUtil.binding(pstmt, spId);
			i = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库资源
			DBUtil.closeAll(null, pstmt, conn);
		}
	}
	
	
	/**
	 * 商品销售
	 */
	@Override
	public int updateSell(Sell sell) {
		String sql = "insert into tab_sell_main values(seq_sell.nextval,?,?,?,sysdate,?,?,?,?,?,?,?)";
		Object [] params = {sell.getXsje(),sell.getYsje(),sell.getKhname(),
				sell.getCzy(),sell.getJsr(),sell.getJsfs(),sell.getSpName(),
				sell.getXsdj(),sell.getXssl(),sell.getWsje()};
		return DBUtil.executeUpdate(sql, params);
	}
	
	/**
	 * 销售记录查询
	 */
	@Override
	public List<Sell> findSalesRecord() {
		List<Sell> sellList = new ArrayList<Sell>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			String sql = "select * from tab_sell_main";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String sellId = rs.getString("sellId");
				double xsje = rs.getDouble("xsje");
				double ysje = rs.getDouble("ysje");
				String khname = rs.getString("khname");
				Date xsDate = rs.getDate("xsDate");
				String czy = rs.getString("czy");
				String jsr = rs.getString("jsr");
				String jsfs = rs.getString("jsfs");
				String spName = rs.getString("spName");
				double xsdj = rs.getDouble("xsdj");
				int xssl = rs.getInt("xssl");
				double wsje = rs.getDouble("wsje");
				Sell sell = new Sell(sellId,xsje, ysje, khname, xsDate, czy, jsr, 
						jsfs, spName, xsdj, xssl, wsje);
				sellList.add(sell);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return sellList.size()>0?sellList:null;
	}

	@Override
	public int qs(String id) {
		String sql = "update tab_sell_main set wsje=0 where sellid=?";
		Object[] params = {id};
		return DBUtil.executeUpdate(sql, params);
	}
}
