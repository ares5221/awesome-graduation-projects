package com.bjsxt.shopping.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.bjsxt.shopping.product.Product;
import com.bjsxt.shopping.user.User;
import com.bjsxt.shopping.util.DB;

public class OrderMySQLDAO implements OrderDAO {

	public int add(SalesOrder so) {

		int orderId = -1;

		Connection conn = DB.getConn();
		boolean autoCommit = true;
		try {
			autoCommit = conn.getAutoCommit();
			conn.setAutoCommit(false);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		String sql = "insert into salesorder values (null, ?, ?, ? ,?)";
		PreparedStatement pstmt = DB.prepare(conn, sql,
				Statement.RETURN_GENERATED_KEYS);
		String sqlDetail = "insert into salesitem values (null, ?, ?, ?, ?)";
		PreparedStatement pstmtDetail = DB.prepare(conn, sqlDetail);
		ResultSet rsKey = null;
		try {
			pstmt.setInt(1, so.getUser().getId());
			pstmt.setString(2, so.getAddr());
			pstmt.setTimestamp(3, new Timestamp(so.getODate().getTime()));
			pstmt.setInt(4, so.getStatus());
			pstmt.executeUpdate();
			rsKey = pstmt.getGeneratedKeys();
			rsKey.next();
			orderId = rsKey.getInt(1);

			List<SalesItem> items = so.getItems();
			Iterator<SalesItem> it = items.iterator();
			while (it.hasNext()) {
				SalesItem si = it.next();
				pstmtDetail.setInt(1, si.getProduct().getId());
				pstmtDetail.setDouble(2, si.getUnitPrice());
				pstmtDetail.setInt(3, si.getCount());
				pstmtDetail.setInt(4, orderId);
				pstmtDetail.addBatch();
			}
			pstmtDetail.executeBatch();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(autoCommit);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DB.close(rsKey);
			DB.close(pstmtDetail);
			DB.close(pstmt);
			DB.close(conn);
		}

		return orderId;
	}

	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	public void delete(String conditionStr) {
		// TODO Auto-generated method stub

	}

	public int find(List<SalesOrder> products, int pageNo, int pageSize,
			String queryStr) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<SalesOrder> getOrders() {
		// TODO Auto-generated method stub
		return null;
	}

	public int getOrders(List<SalesOrder> orders, int pageNo, int pageSize) {
		Connection conn = DB.getConn();
		Statement stmtCount = DB.getStatement(conn);
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = null;
		ResultSet rsCount = null;
		int totalRecords = 0;
		try {
			rsCount = DB.getResultSet(stmtCount,
					"select count(*) from salesorder");
			rsCount.next();
			totalRecords = rsCount.getInt(1);
			conn = DB.getConn();
			String sql = "select salesorder.id, salesorder.userid, salesorder.odate, salesorder.addr, salesorder.status , "
					+ " user.id uid, user.username, user.password, user.addr uaddr, user.phone, user.rdate from salesorder "
					+ " left join user on (salesorder.userid = user.id)"
					+ " limit " + (pageNo - 1) * pageSize + "," + pageSize;
System.out.println(sql);
			rs = DB.getResultSet(stmt, sql);
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("uid"));
				u.setAddr(rs.getString("uaddr"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setRdate(rs.getTimestamp("rdate"));

				SalesOrder so = new SalesOrder();
				so.setId(rs.getInt("id"));
				so.setAddr(rs.getString("addr"));
				so.setODate(rs.getTimestamp("odate"));
				so.setStatus(rs.getInt("status"));
				so.setUser(u);

				orders.add(so);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(stmt);
			DB.close(stmtCount);
			DB.close(rs);
			DB.close(rsCount);
			DB.close(conn);
		}

		return totalRecords;
	}

	public SalesOrder loadById(int id) {
		Connection conn = DB.getConn();
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = null;
		SalesOrder so = null;
		try {
			String sql = "select salesorder.id, salesorder.userid, salesorder.odate, salesorder.addr, salesorder.status , " +
			 			 " user.id uid, user.username, user.password, user.addr uaddr, user.phone, user.rdate from salesorder " +
			 			 " join user on (salesorder.userid = user.id) where salesorder.id = " + id; 
			rs = DB.getResultSet(stmt, sql);
			if(rs.next()) {
				User u = new User();
				u.setId(rs.getInt("uid"));
				u.setAddr(rs.getString("uaddr"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setRdate(rs.getTimestamp("rdate"));
				
				so = new SalesOrder();
				so.setId(rs.getInt("id"));
				so.setAddr(rs.getString("addr"));
				so.setODate(rs.getTimestamp("odate"));
				so.setStatus(rs.getInt("status"));
				so.setUser(u);
				

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		
		return so;
	}

	public void update(SalesOrder so) {

	}

	public List<SalesItem> getSalesItems(int orderId) {
		Connection conn = DB.getConn();
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = null;
		List<SalesItem> items = new ArrayList<SalesItem>();
		try {
			conn = DB.getConn();
			String sql = "select salesorder.id, salesorder.userid, salesorder.odate, salesorder.addr, salesorder.status , " +
						 " salesitem.id itemid, salesitem.productid, salesitem.unitprice, salesitem.pcount, salesitem.orderid, " +
						 " product.id pid, product.name, product.descr, product.normalprice, product.memberprice, product.pdate, product.categoryid" +
						 " from salesorder join salesitem on (salesorder.id = salesitem.orderid)" +
						 " join product on (salesitem.productid = product.id) where salesorder.id = " + orderId;
System.out.println(sql);
			rs = DB.getResultSet(stmt, sql);
			while(rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("pid"));
				p.setCategoryId(rs.getInt("categoryid"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setNormalPrice(rs.getDouble("normalprice"));
				p.setMemberPrice(rs.getDouble("memberprice"));
				
				SalesItem si = new SalesItem();
				si.setOrderId(orderId);
				si.setId(rs.getInt("itemid"));
				si.setUnitPrice(rs.getDouble("unitprice"));
				si.setCount(rs.getInt("pcount"));
				si.setProduct(p);
				
				items.add(si);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		
		return items;
	}

	public void updateStatus(SalesOrder order) {
		Connection conn = DB.getConn();
		Statement stmt = DB.getStatement(conn);
		try {
			String sql = "update salesorder set status = " + order.getStatus() + " where id = " + order.getId();
			DB.executeUpdate(stmt, sql);
		} finally {
			DB.close(stmt);
			DB.close(conn);
		}		
	}

}
