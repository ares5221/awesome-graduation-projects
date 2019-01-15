package com.hd.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hd.dao.HouseInfoDao;
import com.hd.entity.HouseInfo;
import com.hd.entity.HouseType;
import com.hd.util.DBUtil;

public class HouseInfoDaoImpl implements HouseInfoDao {

	@Override
	public int save(HouseInfo hou) {
		String sql = "insert into house_info values(null,?,?,?,?,?,default)";
		Object params [] = {hou.getType_id(),hou.getUser_id(),hou.getHouse_address(),hou.getHouse_price(),hou.getHouse_ambient()};
		return DBUtil.executeUpdate(sql, params);
	}

	@Override
	public List<HouseInfo> findAll() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<HouseInfo> houList = new ArrayList<HouseInfo>();
		try {			
			
			conn = DBUtil.getConnection();
			
			String sql ="select * from house_info";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				
				int house_id = rs.getInt("house_id");
				int type_id = rs.getInt("type_id");
				int user_id = rs.getInt("user_id");
				String house_address = rs.getString("house_address");
				double house_price = rs.getDouble("house_price");
				String house_ambient = rs.getString("house_ambient");
				HouseInfo hou = new HouseInfo(house_id,type_id,user_id,house_address,house_price,house_ambient);
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
	public void delete(int house_id) {
		String sql = "delete from house_info where house_id = ?";
		Object params [] = {house_id};
		DBUtil.executeUpdate(sql, params);
		
	}

	@Override
	public HouseInfo findById(int house_id) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		HouseInfo hou = null;
		try {			
			
			conn = DBUtil.getConnection();
			
			String sql ="select hi.*,ht.type_name,ui.user_name "
					+ "from house_info hi "
					+ "join house_type ht on(hi.type_id=ht.type_id) "
					+ "join user_info ui on(hi.user_id=ui.user_id) where house_id= "+house_id;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()){
				int house_id2 = rs.getInt("house_id");
				int type_id = rs.getInt("type_id");
				int user_id = rs.getInt("user_id");
				String house_address = rs.getString("house_address");
				double house_price = rs.getDouble("house_price");
				String house_ambient = rs.getString("house_ambient");
				String type_name = rs.getString("type_name");
				String user_name = rs.getString("user_name");
				 hou = new HouseInfo(house_id2,type_id,user_id,house_address,house_price,house_ambient);
				
				hou.setType_name(type_name);
				hou.setUser_name(user_name);		
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, stmt, conn);
		}
		return hou;
	}

	@Override
	public int update(HouseInfo hou) {
		String sql = "update house_info set type_id=? , user_id=? , house_address =? ,house_price=?, house_ambient=? where house_id =?";
		Object params [] = {hou.getType_id(),hou.getUser_id(),hou.getHouse_address(),hou.getHouse_price(),hou.getHouse_ambient(),hou.getHouse_id()};
		
		
		return DBUtil.executeUpdate(sql, params);
	}

	//获取各种房屋类型的数量
	@Override
	public List<HouseType> findHouseNum() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<HouseType> houList = new ArrayList<HouseType>();
		try {			
			
			conn = DBUtil.getConnection();
			
			String sql ="select one.*,h.type_name,h.is_used "
					+ "from (select type_id,count(1) num "
					+ "from house_info group by type_id) "
					+ "one join house_type h on (one.type_id=h.type_id);";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
						
				int type_id = rs.getInt("type_id");
				String type_name = rs.getString("type_name");
				int num = rs.getInt("num");			
				HouseType houseType = new HouseType(type_id, type_name);
				houseType.setNum(num);
				houList.add(houseType);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			
			DBUtil.closeAll(rs, stmt, conn);
		}
		
		return houList;
		
	}

	@Override
	public int add(HouseInfo hou) {
		String sql = "insert into house_info values(null,?,?,?,?,?,default)";
		Object params [] = {hou.getType_id(),hou.getUser_id(),hou.getHouse_address(),hou.getHouse_price(),hou.getHouse_ambient()};
		return DBUtil.executeUpdate(sql, params);
	}

	
	
	/* 获取符合条件的数目
	 */
	@Override
	public int findRequiredCount(String selectType, String selectContent) {
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int n = 0;
		try {			
			
			conn = DBUtil.getConnection();
			
			StringBuffer  sql =new StringBuffer("select count(1) from house_info hi left join house_type ht on(hi.type_id=ht.type_id) where 1=1"); 
			
			if(selectContent!=null&&!"".equals(selectContent)){
				sql.append(" and "+selectType+" like '%"+selectContent+"%'");
			}
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql.toString());
			
			rs.next();
			n = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			
			DBUtil.closeAll(rs, stmt, conn);
		}
		
		return n;
	}

	/* 获取符合查询条件的数据
	 */
	@Override
	public List<HouseInfo> findRequiredItems(int start, int size,
			String selectType, String selectContent) {
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<HouseInfo> houList = new ArrayList<HouseInfo>();
		try {			
			
			conn = DBUtil.getConnection();
			
			StringBuffer sql =new StringBuffer("select hi.*,ht.type_name,ui.user_name from house_info hi left join house_type ht on(hi.type_id=ht.type_id) left join user_info ui on(hi.user_id=ui.user_id) where 1=1 ");
			if(selectContent!=null&&!"".equals(selectContent)){
				sql.append("and "+selectType+" like '%"+selectContent+"%'");
			}
			sql.append("limit "+start+","+size);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			System.out.println(sql.toString());
			while(rs.next()){
				
				int house_id = rs.getInt("house_id");
				int type_id = rs.getInt("type_id");
				int user_id = rs.getInt("user_id");
				String house_address = rs.getString("house_address");
				double house_price = rs.getDouble("house_price");
				String house_ambient = rs.getString("house_ambient");
				String type_name = rs.getString("type_name");
				String user_name = rs.getString("user_name");
				HouseInfo hou = new HouseInfo(house_id,type_id,user_id,house_address,house_price,house_ambient);
				
				hou.setType_name(type_name);
				hou.setUser_name(user_name);
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
