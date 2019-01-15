package com.hd.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hd.dao.HouseTypeDao;
import com.hd.entity.HouseType;
import com.hd.util.DBUtil;

public class HouseTypeDaoImpl implements HouseTypeDao {

	@Override
	public int save(HouseType hou) {
		String sql = "insert into house_type values(seq_hou.nextval,?,?)";
		Object params [] = {hou.getType_id(),hou.getType_name()};
		return DBUtil.executeUpdate(sql, params);
	}

	@Override
	public List<HouseType> findAll() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<HouseType> houList = new ArrayList<HouseType>();
		try {			
			
			conn = DBUtil.getConnection();
			
			String sql ="select * from house_type";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				int type_id = rs.getInt("type_id");
				String type_name = rs.getString("type_name");
				HouseType hou = new HouseType(type_id,type_name);
				houList.add(hou);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{		
			DBUtil.closeAll(rs, stmt, conn);
		}
		
		return houList;
	}

	@Override
	public void delete(int type_id) {
		String sql = "delete from house_type where type_id = ?";
		Object params [] = {type_id};
		DBUtil.executeUpdate(sql, params);
		
	}

	@Override
	public HouseType findById(int type_id) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		HouseType hou = null;
		try {			
			
			conn = DBUtil.getConnection();
			
			String sql ="select * from house_info where type_id = "+type_id;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()){
				String house_address = rs.getString("house_address");
				hou = new HouseType(type_id,house_address);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, stmt, conn);
		}
		return hou;
	}

	@Override
	public List<HouseType> find(String select) {
		
		return null;
	}

	@Override
	public int add(String typeName) {
		String sql = "insert into house_type values(null,?,default)";
		Object[] params = {typeName};
		int n = DBUtil.executeUpdate(sql, params);
		return n;
	}

	
	
	/* 
	 * 获取符合查询条件的数据数量
	 */
	@Override
	public int findRequiredCount(String houseType) {
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int n = 0;
		try {			
			
			conn = DBUtil.getConnection();
			
			String sql ="select count(1) from house_type where 1=1 ";
			if(houseType!=null&&!"".equals(houseType)){
				sql+=" and type_name like '%"+houseType+"%'";
			}	
				
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			rs.next();
			n = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, stmt, conn);
		}
		return n;
	}

	/* 获取符合查询条件的信息
	 */
	@Override
	public List<HouseType> findRequiredItems(int start, int size,
			String houseType) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<HouseType> houList = new ArrayList<HouseType>();
		try {			
			
			conn = DBUtil.getConnection();
			
			StringBuffer sql =new StringBuffer("select * from house_type where 1=1 ");
			if(houseType!=null&&!"".equals(houseType)){
				sql.append(" and type_name like '%"+houseType+"%'");
				
			}
			sql.append(" limit "+start+","+size);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			
			while(rs.next()){
				int type_id = rs.getInt("type_id");
				String type_name = rs.getString("type_name");
				HouseType hou = new HouseType(type_id,type_name);
				houList.add(hou);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{		
			DBUtil.closeAll(rs, stmt, conn);
		}
		
		return houList;
	}

}
