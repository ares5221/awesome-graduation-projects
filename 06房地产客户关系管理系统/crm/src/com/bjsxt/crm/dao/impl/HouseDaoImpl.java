package com.bjsxt.crm.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bjsxt.crm.dao.HouseDao;
import com.bjsxt.crm.entity.Customer;
import com.bjsxt.crm.entity.House;
import com.bjsxt.crm.entity.House_Type;
import com.bjsxt.crm.entity.User;
import com.bjsxt.crm.util.DBUtil;


public class HouseDaoImpl implements HouseDao {

	@Override
	public int findCount(int queryType, String houseInput) {
//		System.out.println("HouseDaoImpl.findCount():---" + houseInput);
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		int count = 0;
		// cc dao 灞傛煡鎬绘暟

		try {
			stmt = conn.createStatement();

			// cc 杩欓噷鏄煡鎵炬埧灞嬫�鏁扮殑鍒楄〃sql璇彞娌″畬鎴�
			StringBuffer sql = new StringBuffer(
					"select count(*) from house_info h join user_info u on (h.user_id=u.user_id) join house_type t on(h.type_id=t.type_id) where 1=1");
			if ((houseInput != null && !"".equals(houseInput)) & queryType == 1) {
				sql.append(" and t.type_name like '%" + houseInput + "%'");
			}
			if ((houseInput != null && !"".equals(houseInput)) & queryType == 2) {
				sql.append(" and h.house_address like '%" + houseInput + "%'");
			}

			rs = stmt.executeQuery(sql.toString());
			rs.next();
			count = rs.getInt(1);

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return count;

	}

	@Override
	public List<House> findStu(int startRow, int endRow, int queryType,
			String houseInput) {
		// cc dao灞傛煡鍑篽ouse琛�
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		List<House> houseList = new ArrayList<House>();
		try {
			stmt = conn.createStatement();
			// cc 杩欓噷鏄煡鎵炬埧灞嬬殑鍒楄〃sql璇彞娌″畬鎴�
			StringBuffer sql = new StringBuffer(
					"select * from house_info h join user_info u on (h.user_id=u.user_id) join house_type t on(h.type_id=t.type_id) where 1=1 ");
			if ((houseInput != null && !"".equals(houseInput)) & queryType == 1) {
				sql.append(" and t.type_name like '%" + houseInput + "%'");
			}
			if ((houseInput != null && !"".equals(houseInput)) & queryType == 2) {
				sql.append(" and h.house_address like '%" + houseInput + "%'");
			}

			String sql2 = "select  * from (select rownum rn,stu2.* "
					+ "from ( " + sql.toString() + " ) stu2 "
					+ "where rownum <=" + endRow + " ) " + "where rn >"
					+ startRow;
			rs = stmt.executeQuery(sql2);
			while (rs.next()) {
				House house = new House();
				house.setHouse_ID(rs.getInt("house_ID"));
				house.setType_ID(rs.getInt("type_ID"));
				house.setHouse_address(rs.getString("house_address"));
				house.setHouse_price(rs.getDouble("house_price"));
				house.setHouse_ambient(rs.getString("house_ambient"));

				User user = new User();
				user.setUser_name((rs.getString("user_name")));

				House_Type house_type = new House_Type();
				house_type.setType_ID(rs.getInt("house_ID"));
				house_type.setType_name(rs.getString("type_name"));

				house.setHouse_type(house_type);
				house.setUser(user);
				houseList.add(house);
			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return houseList;
	}

	@Override
	public void delete(int house_ID) {
		String sql="delete  from house_info where house_id=?";
		Object[] params={house_ID};
		DBUtil.executeUpdate(sql, params);
		
	}

	@Override
	public House findHouse(int house_ID) {
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs =null;
		House house=new House();
		
		try {
			conn = DBUtil.getConnection();
			String sql="select * from house_info h left join user_info u on (h.user_id=u.user_id)left  join house_type t on(h.type_id=t.type_id)  where h.house_ID="+house_ID;
			stmt =conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				house.setHouse_ID(house_ID);
				house.setType_ID(rs.getInt("type_id"));
				house.setUser_ID(rs.getInt("user_id"));
				house.setHouse_price(rs.getDouble("house_price"));
				house.setHouse_address(rs.getString("house_address"));
				house.setHouse_ambient(rs.getString("house_ambient"));
				house.setIs_used(rs.getString("is_used"));
				
				Customer customer = new Customer();
				customer.setCustomer_ID(rs.getInt("house_owner"));
//				customer.setCustomer_name(rs.getString("customer_name"));
				User user = new User();
				user.setUser_ID(rs.getInt("user_id"));
				user.setUser_name(rs.getString("user_name"));
				House_Type house_type = new House_Type();
				house_type.setType_ID(rs.getInt("type_id"));
				house_type.setType_name(rs.getString("type_name"));
				
				house.setCustomer(customer);
				house.setHouse_type(house_type);
				house.setUser(user);
				
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, stmt, conn);
		}
		return house;
	}

	@Override
	public List<House_Type> findAllType() {
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		List<House_Type> hTypeList = new ArrayList<House_Type>();
		try {
			
			stmt = conn.createStatement();
			
			String sql = "select * from house_type ";
			rs = stmt.executeQuery(sql);
			
			
			while (rs.next()) {
				House_Type ht=		new House_Type();
				ht.setType_ID(rs.getInt("type_id"));
				ht.setType_name(rs.getString("type_name"));
				hTypeList.add(ht);
				
			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		
		return hTypeList;
	}

	@Override
	public void modify(House house) {
		
		System.out.println(house.getHouse_ambient());
		String sql="update house_info  set  type_id=?,user_id=?,house_address=?,house_price=?,house_ambient=? ,is_used=?,house_owner=? where house_id"
				+ "=?";
		Object[] params={house.getType_ID(),house.getUser_ID(),house.getHouse_address(),house.getHouse_price(),house.getHouse_ambient(),house.getIs_used(),
				house.getCustomer_ID(),house.getHouse_ID()};
		DBUtil.executeUpdate(sql, params);
	}

	@Override
	public void add(House house) {
		System.out.println(house.getHouse_ambient());
		String sql="insert into house_info values (seq_house.nextval,?,?,?,?,?,?,?)";
				
		Object[] params={house.getType_ID(),house.getUser_ID(),house.getHouse_address(),house.getHouse_price(),house.getHouse_ambient(),house.getIs_used(),
				house.getCustomer_ID()};
		DBUtil.executeUpdate(sql, params);
		
	}

	@Override
	public int findTypeCount(String houseInput) {
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		int count = 0;
		// cc dao 灞傛煡鎬绘暟

		try {
			stmt = conn.createStatement();

			// cc 杩欓噷鏄煡鎵炬埧灞嬫�鏁扮殑鍒楄〃sql璇彞娌″畬鎴�
			StringBuffer sql = new StringBuffer(
					"select count(*) from house_type  where 1=1");
			if (houseInput != null && !"".equals(houseInput)) {
				sql.append(" and type_name like '%" + houseInput + "%'");
			}
			

			rs = stmt.executeQuery(sql.toString());
			rs.next();
			count = rs.getInt(1);

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return count;
	}

	@Override
	public List<House_Type> findType(int startRow, int endRow, String houseInput) {
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		List<House_Type> typeList = new ArrayList<House_Type>();
		try {
			stmt = conn.createStatement();
			// cc 杩欓噷鏄煡鎵炬埧灞嬬殑鍒楄〃sql璇彞娌″畬鎴�
			StringBuffer sql = new StringBuffer(
					"select * from house_type  where 1=1 ");
			if (houseInput != null && !"".equals(houseInput)) {
				sql.append(" and type_name like '%" + houseInput + "%'");
			}
			
			String sql2 = "select  * from (select rownum rn,stu2.* "
					+ "from ( " + sql.toString() + " ) stu2 "
					+ "where rownum <=" + endRow + " ) " + "where rn >"
					+ startRow;
			rs = stmt.executeQuery(sql2);
			while (rs.next()) {
				House_Type ht=new House_Type();
				ht.setType_ID(rs.getInt("type_id"));
				ht.setType_name(rs.getString("type_name"));
				typeList.add(ht);
			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return typeList;
	}

	@Override
	public void addType(String type_name) {
		String sql="insert into house_type (type_id,type_name) values (seq_htype.nextval,?)";
		
		Object[] params={type_name};
		DBUtil.executeUpdate(sql, params);
		
	}
	

	@Override
	public void deleteType(int type_ID) {
			String sql="delete from house_type where type_ID=?";
		
				Object[] params={type_ID};
				DBUtil.executeUpdate(sql, params);
	}

	@Override
	public int findCount1(int queryType, String houseInput, int user_ID) {
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		int count = 0;
		// cc dao 灞傛煡鎬绘暟

		try {
			stmt = conn.createStatement();
			System.out.println(queryType);
			// cc 杩欓噷鏄煡鎵炬埧灞嬫�鏁扮殑鍒楄〃sql璇彞娌″畬鎴�
			StringBuffer sql = new StringBuffer(
					"select count(*) from house_info h left join user_info u on (h.user_id=u.user_id)left  join house_type t on(h.type_id=t.type_id) where 1=1");
			if ((houseInput != null && !"".equals(houseInput)) & queryType == 1) {
				sql.append(" and t.type_name like '%" + houseInput + "%'");
			}
			if ((houseInput != null && !"".equals(houseInput)) & queryType == 2) {
				sql.append(" and h.house_address like '%" + houseInput + "%'");
			}
			if (queryType == 3) {
				sql.append(" and h.user_id = " + user_ID );
				System.out.println("dddddddd");
			}

			rs = stmt.executeQuery(sql.toString());
			rs.next();
			count = rs.getInt(1);

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return count;
	}

	@Override
	public List<House> findStu1(int startRow, int endRow, int queryType,
			String houseInput, int user_ID) {
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		List<House> houseList = new ArrayList<House>();
		try {
			stmt = conn.createStatement();
			// cc 杩欓噷鏄煡鎵炬埧灞嬬殑鍒楄〃sql璇彞娌″畬鎴�
			StringBuffer sql = new StringBuffer(
					"select * from house_info h left join user_info u on (h.user_id=u.user_id) left join house_type t on(h.type_id=t.type_id) where 1=1 ");
			if ((houseInput != null && !"".equals(houseInput)) & queryType == 1) {
				sql.append(" and t.type_name like '%" + houseInput + "%'");
			}
			if ((houseInput != null && !"".equals(houseInput)) & queryType == 2) {
				sql.append(" and h.house_address like '%" + houseInput + "%'");
			}
			if (queryType == 3) {
				sql.append(" and h.user_id = " + user_ID );

			}

			String sql2 = "select  * from (select rownum rn,stu2.* "
					+ "from ( " + sql.toString() + " ) stu2 "
					+ "where rownum <=" + endRow + " ) " + "where rn >"
					+ startRow;
			rs = stmt.executeQuery(sql2);
			while (rs.next()) {
				House house = new House();
				house.setHouse_ID(rs.getInt("house_ID"));
				house.setType_ID(rs.getInt("type_ID"));
				house.setHouse_address(rs.getString("house_address"));
				house.setHouse_price(rs.getDouble("house_price"));
				house.setHouse_ambient(rs.getString("house_ambient"));

				User user = new User();
				user.setUser_name((rs.getString("user_name")));
				user.setUser_ID(rs.getInt("user_id"));
				House_Type house_type = new House_Type();
				house_type.setType_ID(rs.getInt("house_ID"));
				house_type.setType_name(rs.getString("type_name"));

				house.setHouse_type(house_type);
				house.setUser(user);
				houseList.add(house);
			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return houseList;
	}

	@Override
	public int findCount20(int i, String houseInput, int user_ID) {
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		int count = 0;
		// cc dao 灞傛煡鎬绘暟

		try {
			stmt = conn.createStatement();
			
			// cc 杩欓噷鏄煡鎵炬埧灞嬫�鏁扮殑鍒楄〃sql璇彞娌″畬鎴�
			StringBuffer sql = new StringBuffer(
					"select count(*) from house_info h left join user_info u on (h.user_id=u.user_id)left  join house_type t on(h.type_id=t.type_id) where 1=1");
			sql.append(" and h.user_id = " + user_ID );
			if (houseInput != null && !"".equals(houseInput)) {
				sql.append(" and t.type_name like '%" + houseInput + "%'");
				sql.append(" and h.house_address like '%" + houseInput + "%'");
			}
			
		
				
			

			rs = stmt.executeQuery(sql.toString());
			rs.next();
			count = rs.getInt(1);

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return count;
	}

	@Override
	public List<House> findStu20(int startRow, int endRow, int i,
			String houseInput, int user_ID) {
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		List<House> houseList = new ArrayList<House>();
		try {
			stmt = conn.createStatement();
			// cc 杩欓噷鏄煡鎵炬埧灞嬬殑鍒楄〃sql璇彞娌″畬鎴�
			StringBuffer sql = new StringBuffer(
					"select * from house_info h left join user_info u on (h.user_id=u.user_id)left  join house_type t on(h.type_id=t.type_id) where 1=1 ");
			
			
			sql.append(" and h.user_id = " + user_ID );
			if (houseInput != null && !"".equals(houseInput)) {
				sql.append(" and t.type_name like '%" + houseInput + "%'");
				sql.append(" and h.house_address like '%" + houseInput + "%'");
			}

			String sql2 = "select  * from (select rownum rn,stu2.* "
					+ "from ( " + sql.toString() + " ) stu2 "
					+ "where rownum <=" + endRow + " ) " + "where rn >"
					+ startRow;
			rs = stmt.executeQuery(sql2);
			while (rs.next()) {
				House house = new House();
				house.setHouse_ID(rs.getInt("house_ID"));
				house.setType_ID(rs.getInt("type_ID"));
				house.setHouse_address(rs.getString("house_address"));
				house.setHouse_price(rs.getDouble("house_price"));
				house.setHouse_ambient(rs.getString("house_ambient"));

				User user = new User();
				user.setUser_name((rs.getString("user_name")));
				user.setUser_ID(rs.getInt("user_id"));
				House_Type house_type = new House_Type();
				house_type.setType_ID(rs.getInt("house_ID"));
				house_type.setType_name(rs.getString("type_name"));

				house.setHouse_type(house_type);
				house.setUser(user);
				houseList.add(house);
			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return houseList;
	}

	@Override
	public int findCount21(int i, String houseInput, int user_ID) {
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		int count = 0;
		// cc dao 灞傛煡鎬绘暟

		try {
			stmt = conn.createStatement();
			
			// cc 杩欓噷鏄煡鎵炬埧灞嬫�鏁扮殑鍒楄〃sql璇彞娌″畬鎴�
			StringBuffer sql = new StringBuffer(
					"select count(*) from house_info h left join user_info u on (h.user_id=u.user_id)left  join house_type t on(h.type_id=t.type_id) where 1=1");
			sql.append(" and h.user_id = " + user_ID );
			if (houseInput != null && !"".equals(houseInput)) {
				sql.append(" and t.type_name like '%" + houseInput + "%'");
				
			}
			
		
				
			

			rs = stmt.executeQuery(sql.toString());
			rs.next();
			count = rs.getInt(1);

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return count;
	}

	@Override
	public List<House> findStu21(int startRow, int endRow, int i,
			String houseInput, int user_ID) {
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		List<House> houseList = new ArrayList<House>();
		try {
			stmt = conn.createStatement();
			// cc 杩欓噷鏄煡鎵炬埧灞嬬殑鍒楄〃sql璇彞娌″畬鎴�
			StringBuffer sql = new StringBuffer(
					"select * from house_info h left join user_info u on (h.user_id=u.user_id)left  join house_type t on(h.type_id=t.type_id) where 1=1 ");
			
			
			sql.append(" and h.user_id = " + user_ID );
			if (houseInput != null && !"".equals(houseInput)) {
				sql.append(" and t.type_name like '%" + houseInput + "%'");
				
			}

			String sql2 = "select  * from (select rownum rn,stu2.* "
					+ "from ( " + sql.toString() + " ) stu2 "
					+ "where rownum <=" + endRow + " ) " + "where rn >"
					+ startRow;
			rs = stmt.executeQuery(sql2);
			while (rs.next()) {
				House house = new House();
				house.setHouse_ID(rs.getInt("house_ID"));
				house.setType_ID(rs.getInt("type_ID"));
				house.setHouse_address(rs.getString("house_address"));
				house.setHouse_price(rs.getDouble("house_price"));
				house.setHouse_ambient(rs.getString("house_ambient"));

				User user = new User();
				user.setUser_name((rs.getString("user_name")));
				user.setUser_ID(rs.getInt("user_id"));
				House_Type house_type = new House_Type();
				house_type.setType_ID(rs.getInt("house_ID"));
				house_type.setType_name(rs.getString("type_name"));

				house.setHouse_type(house_type);
				house.setUser(user);
				houseList.add(house);
			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return houseList;
	}

	@Override
	public int findCount22(int i, String houseInput, int user_ID) {
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		int count = 0;
		// cc dao 灞傛煡鎬绘暟

		try {
			stmt = conn.createStatement();
			
			// cc 杩欓噷鏄煡鎵炬埧灞嬫�鏁扮殑鍒楄〃sql璇彞娌″畬鎴�
			StringBuffer sql = new StringBuffer(
					"select count(*) from house_info h left join user_info u on (h.user_id=u.user_id)left  join house_type t on(h.type_id=t.type_id) where 1=1");
			sql.append(" and h.user_id = " + user_ID );
			if (houseInput != null && !"".equals(houseInput)) {
				
				sql.append(" and h.house_address like '%" + houseInput + "%'");
			}
			
		
				
			

			rs = stmt.executeQuery(sql.toString());
			rs.next();
			count = rs.getInt(1);

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return count;
	}

	@Override
	public List<House> findStu22(int startRow, int endRow, int i,
			String houseInput, int user_ID) {
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		List<House> houseList = new ArrayList<House>();
		try {
			stmt = conn.createStatement();
			// cc 杩欓噷鏄煡鎵炬埧灞嬬殑鍒楄〃sql璇彞娌″畬鎴�
			StringBuffer sql = new StringBuffer(
					"select * from house_info h left join user_info u on (h.user_id=u.user_id)left  join house_type t on(h.type_id=t.type_id) where 1=1 ");
			
			
			sql.append(" and h.user_id = " + user_ID );
			if (houseInput != null && !"".equals(houseInput)) {
				
				sql.append(" and h.house_address like '%" + houseInput + "%'");
			}

			String sql2 = "select  * from (select rownum rn,stu2.* "
					+ "from ( " + sql.toString() + " ) stu2 "
					+ "where rownum <=" + endRow + " ) " + "where rn >"
					+ startRow;
			rs = stmt.executeQuery(sql2);
			while (rs.next()) {
				House house = new House();
				house.setHouse_ID(rs.getInt("house_ID"));
				house.setType_ID(rs.getInt("type_ID"));
				house.setHouse_address(rs.getString("house_address"));
				house.setHouse_price(rs.getDouble("house_price"));
				house.setHouse_ambient(rs.getString("house_ambient"));

				User user = new User();
				user.setUser_name((rs.getString("user_name")));
				user.setUser_ID(rs.getInt("user_id"));
				House_Type house_type = new House_Type();
				house_type.setType_ID(rs.getInt("house_ID"));
				house_type.setType_name(rs.getString("type_name"));

				house.setHouse_type(house_type);
				house.setUser(user);
				houseList.add(house);
			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return houseList;
	}
	
}
