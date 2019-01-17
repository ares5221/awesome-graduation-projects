package com.bjsxt.shopping.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.bjsxt.shopping.category.Category;
import com.bjsxt.shopping.util.DB;

public class ProductMySQLDAO implements ProductDAO {

	public void add(Product p) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConn();
			String sql = "insert into product values (null, ?, ?, ?, ?, ?, ?)";
			pstmt = DB.prepare(conn, sql);
			pstmt.setString(1, p.getName());
			pstmt.setString(2, p.getDescr());
			pstmt.setDouble(3, p.getNormalPrice());
			pstmt.setDouble(4, p.getMemberPrice());
			pstmt.setTimestamp(5, new Timestamp(p.getPdate().getTime()));
			pstmt.setInt(6, p.getCategoryId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}

	public void delete(int id) {
		Connection conn = null;
		Statement stmt = null;
		String sql;
		try {
			conn = DB.getConn();
			sql = "delete from product where id = " + id;
			stmt = DB.getStatement(conn);
			DB.executeUpdate(stmt, sql);
		} finally {
			DB.close(stmt);
			DB.close(conn);
		}
	}

	public List<Product> getProducts() {
		Connection conn = DB.getConn();
		Statement stmt = DB.getStatement(conn);
		String sql = "select * from product order by pdate desc";
		ResultSet rs = DB.getResultSet(stmt, sql);
		List<Product> products = new ArrayList<Product>();
		try {
			while (rs.next()) {
				Product p = getProductFromRs(rs);
				products.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(stmt);
			DB.close(rs);
			DB.close(conn);
		}

		return products;
	}
	
	/**
	 * @param lazy 为true时，只取Product的信息，否则同时取出Product内Category对象的信息
	 */
	public int getProducts(List<Product> products, int pageNo, int pageSize, boolean lazy) {
		int totalRecords = -1;
		Connection conn = DB.getConn();
		Statement stmt = DB.getStatement(conn);
		
		String sql = "";
		if(lazy) {
			sql = "select * from product order by pdate desc";
		} else {
			sql = "select p.id productid, p.name pname, p.descr pdescr, p.normalprice, " +
					" p.memberprice, p.pdate, p.categoryid , " +
					" c.id categoryid, c.name cname, c.descr cdescr, c.pid, c.cno, c.grade " +
					" from product p join category c on (p.categoryid = c.id) order by p.pdate desc";
		}
		sql +=  " limit " + (pageNo - 1) * pageSize + "," + pageSize;
				
		
		ResultSet rs = DB.getResultSet(stmt, sql);
		
		Statement stmtCount = DB.getStatement(conn);
		ResultSet rsCount = DB.getResultSet(stmtCount,
				"select count(*) from product");
		
		//products = new ArrayList<Product>(); 千万小心这句话不要添加
		try {
			rsCount.next();
			totalRecords = rsCount.getInt(1);
			
			while (rs.next()) {
				Product p = null;
				if(lazy) {
					p = this.getProductFromRs(rs);
				} else {
					p = new Product();
					p.setId(rs.getInt("productid"));
					p.setName(rs.getString("pname"));
					p.setDescr(rs.getString("pdescr"));
					p.setNormalPrice(rs.getDouble("normalprice"));
					p.setMemberPrice(rs.getDouble("memberprice"));
					p.setPdate(rs.getTimestamp("pdate"));
					p.setCategoryId(rs.getInt("categoryid"));
					
					Category c = new Category();
					c.setId(rs.getInt("categoryid"));
					c.setName(rs.getString("cname"));
					c.setDescr(rs.getString("cdescr"));
					c.setPid(rs.getInt("pid"));
					c.setCno(rs.getInt("cno"));
					c.setGrade(rs.getInt("grade"));
					
					p.setCategory(c);
				}
				
				
				products.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rsCount);
			DB.close(stmtCount);
			DB.close(stmt);
			DB.close(rs);
			DB.close(conn);
		}

		return totalRecords;
	}

	public Product loadById(int id) {
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		Product p = null;

		try {
			String sql = "select * from product where id = " + id;
			conn = DB.getConn();
			stmt = DB.getStatement(conn);
			rs = DB.getResultSet(stmt, sql);
			if (rs.next()) {
				p = getProductFromRs(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(stmt);
			DB.close(rs);
			DB.close(conn);
		}
		return p;
	}

	public void update(Product p) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConn();
			String sql = "update product set name=? , descr=?, normalprice=?, memberprice=?, categoryid=? where id=?";
			pstmt = DB.prepare(conn, sql);
			pstmt.setString(1, p.getName());
			pstmt.setString(2, p.getDescr());
			pstmt.setDouble(3, p.getNormalPrice());
			pstmt.setDouble(4, p.getMemberPrice());
			pstmt.setInt(5, p.getCategoryId());
			pstmt.setInt(6, p.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}

	private Product getProductFromRs(ResultSet rs) {
		Product p = null;
		try {
			p = new Product();
			p.setId(rs.getInt("id"));
			p.setName(rs.getString("name"));
			p.setDescr(rs.getString("descr"));
			p.setNormalPrice(rs.getDouble("normalprice"));
			p.setMemberPrice(rs.getDouble("memberprice"));
			p.setPdate(rs.getTimestamp("pdate"));
			p.setCategoryId(rs.getInt("categoryid"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return p;
	}

	public void delete(String conditionStr) {
		Connection conn = null;
		Statement stmt = null;
		String sql;
		try {
			conn = DB.getConn();
			sql = "delete from product " + conditionStr;
			stmt = DB.getStatement(conn);
			DB.executeUpdate(stmt, sql);
		} finally {
			DB.close(stmt);
			DB.close(conn);
		}
	}

	public int find(List<Product> products, int pageNo, int pageSize, String queryStr) {
		int totalRecords = -1;
		Connection conn = DB.getConn();
		Statement stmt = DB.getStatement(conn);
		
		String sql = "";
		sql = "select p.id productid, p.name pname, p.descr pdescr, p.normalprice, " +
					" p.memberprice, p.pdate, p.categoryid , " +
					" c.id categoryid, c.name cname, c.descr cdescr, c.pid, c.cno, c.grade " +
					" from product p join category c on (p.categoryid = c.id)" + queryStr + 
					" order by p.pdate desc";
		
		sql +=  " limit " + (pageNo - 1) * pageSize + "," + pageSize;
System.out.println(sql);				
		
		ResultSet rs = DB.getResultSet(stmt, sql);
		
		Statement stmtCount = DB.getStatement(conn);
		ResultSet rsCount = DB.getResultSet(stmtCount,
				"select count(*) from product " + queryStr.replaceAll("p\\.", ""));
		
		try {
			rsCount.next();
			totalRecords = rsCount.getInt(1);
			
			while (rs.next()) {
				Product p = null;
				p = new Product();
				p.setId(rs.getInt("productid"));
				p.setName(rs.getString("pname"));
				p.setDescr(rs.getString("pdescr"));
				p.setNormalPrice(rs.getDouble("normalprice"));
				p.setMemberPrice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryId(rs.getInt("categoryid"));
				
				Category c = new Category();
				c.setId(rs.getInt("categoryid"));
				c.setName(rs.getString("cname"));
				c.setDescr(rs.getString("cdescr"));
				c.setPid(rs.getInt("pid"));
				c.setCno(rs.getInt("cno"));
				c.setGrade(rs.getInt("grade"));
				
				p.setCategory(c);
				
				products.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rsCount);
			DB.close(stmtCount);
			DB.close(stmt);
			DB.close(rs);
			DB.close(conn);
		}

		return totalRecords;
	}
}
