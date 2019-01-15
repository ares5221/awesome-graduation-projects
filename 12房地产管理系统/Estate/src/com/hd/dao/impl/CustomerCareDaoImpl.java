/**
 * @author Administrator
 * @date 2017年8月15日
 */
package com.hd.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.hd.dao.CustomerCareDao;
import com.hd.entity.CustomerCare;
import com.hd.util.DBUtil;
import com.hd.util.PageBean;

/**
 * @author Administrator
 *
 */
public class CustomerCareDaoImpl implements CustomerCareDao{

	
	@Override
	public void find(PageBean pageBean, String customerName, String careTheme,
			String careWay) {
		//select cc.*,ci.customer_name from customer_care cc join customer_info ci on (cc.customer_id=ci.customer_id);
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<CustomerCare> list = new ArrayList<CustomerCare>();
		int start = pageBean.getStartRow();
		int size = pageBean.getSize();
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			String sql = "select cc.*,ci.customer_name from customer_care cc "
					+ "join customer_info ci "
					+ "on (cc.customer_id=ci.customer_id) where 1=1 "
					+ "and customer_name like '%"+customerName+"%' and care_theme like '%"+careTheme+"%' "
							+ "and care_way like '%"+careWay+"%' limit "+start+" , "+ size+" ";
			
			
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				
				int careId = rs.getInt("care_id");
				int customerId = rs.getInt("customer_id");
				String careTheme2 = rs.getString("care_theme");
				String careWay2 = rs.getString("care_way");
				Date careTime = rs.getDate("care_time");
				String careRemark = rs.getString("care_remark");
				Date careNexttime = rs.getDate("care_nexttime");
				String carePeople = rs.getString("care_people");
				String isUsed = rs.getString("is_used");
				String customerName2 = rs.getString("customer_name");
				CustomerCare cc = new CustomerCare(careId, customerId, careTheme2, careWay2, 
						careTime, careRemark, careNexttime, carePeople, isUsed);
				cc.setCustomerName(customerName2);
				list.add(cc);
				//System.out.println(list.size()+"---------------");
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, stmt, conn);
			
		}
		
		pageBean.setList(list);
		
		
	}

	//获取所有符合搜索条件的数目，设置pageBean
	@Override
	public int findRequiredCount(String customerName, String careTheme,
			String careWay) {
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int n = 0;
		
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			String sql = "select count(1) from customer_care cc "
					+ "join customer_info ci "
					+ "on (cc.customer_id=ci.customer_id) where 1=1 "
					+ "and customer_name like '%"+customerName+"%' and care_theme like '%"+careTheme+"%' "
							+ "and care_way like '%"+careWay+"%' ";
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

	//添加客户关怀的信息
	@Override
	public int save(CustomerCare cc) {
		String sql = "insert into customer_care values"
				+ "(null,?,?,?,?,?,date_add(?,interval+1 month),?,default)";
		Object[] params = {cc.getCustomerId(),cc.getCareTheme(),cc.getCareWay(),
				cc.getCareTime(),cc.getCareRemark(),cc.getCareTime(),cc.getCarePeople()};
		int n = DBUtil.executeUpdate(sql, params);
		return n;
	}

	/* (non-Javadoc)
	 * @see com.hd.dao.CustomerCareDao#findById(int)
	 */
	@Override
	public CustomerCare findById(int care_id) {
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		CustomerCare cc = null;
		
		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			String sql ="select * from customer_care where care_id = "+care_id;
			
			
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				
				int careId = rs.getInt("care_id");
				int customerId = rs.getInt("customer_id");
				String careTheme2 = rs.getString("care_theme");
				String careWay2 = rs.getString("care_way");
				Date careTime = rs.getDate("care_time");
				String careRemark = rs.getString("care_remark");
				Date careNexttime = rs.getDate("care_nexttime");
				String carePeople = rs.getString("care_people");
				String isUsed = rs.getString("is_used");
				
				 cc = new CustomerCare(careId, customerId, careTheme2, careWay2, 
						careTime, careRemark, careNexttime, carePeople, isUsed);
				
				
				
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, stmt, conn);
			
		}
		
		return cc;
	}

	/* (non-Javadoc)
	 * @see com.hd.dao.CustomerCareDao#update(com.hd.entity.CustomerCare)
	 */
	@Override
	public int update(CustomerCare cc) {
		String sql = " update customer_care set customer_id = ?,care_theme = ? , care_way = ? ,"
				+ " care_remark = ? , care_people = ?  where care_id = ?";
		Object[] params = {cc.getCustomerId(),cc.getCareTheme(),cc.getCareWay(),
				cc.getCareRemark(),cc.getCarePeople(),cc.getCareId()};
	
		int n = DBUtil.executeUpdate(sql, params);
		System.out.println("--------------"+n);
		return n;
	}

	/* (non-Javadoc)
	 * @see com.hd.dao.CustomerCareDao#delete(int)
	 */
	@Override
	public int delete(int careId) {
		String sql = "delete from customer_care where care_id = ?";
		Object[] params = {careId};
		int n = DBUtil.executeUpdate(sql, params);
		return n;
	}

	/* 
	 * 获取关怀信息
	 * 
	 */
	@Override
	public List<CustomerCare> findDateCare(int days) {
		
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				List<CustomerCare> list = new ArrayList<CustomerCare>();
				
				try {
					conn = DBUtil.getConnection();
					stmt = conn.createStatement();
					String sql = "select cc.*,ci.customer_name from customer_care cc join customer_info ci on (cc.customer_id=ci.customer_id) where cc.care_time<date_add(now(),interval+"+days+" day)";
					
					
					rs = stmt.executeQuery(sql);
					while(rs.next()){
						
						int careId = rs.getInt("care_id");
						int customerId = rs.getInt("customer_id");
						String careTheme2 = rs.getString("care_theme");
						String careWay2 = rs.getString("care_way");
						Date careTime = rs.getDate("care_time");
						String careRemark = rs.getString("care_remark");
						Date careNexttime = rs.getDate("care_nexttime");
						String carePeople = rs.getString("care_people");
						String isUsed = rs.getString("is_used");
						String customerName2 = rs.getString("customer_name");
						CustomerCare cc = new CustomerCare(careId, customerId, careTheme2, careWay2, 
								careTime, careRemark, careNexttime, carePeople, isUsed);
						cc.setCustomerName(customerName2);
						list.add(cc);
						
					}
				} catch (SQLException e) {
				
					e.printStackTrace();
				}finally{
					DBUtil.closeAll(rs, stmt, conn);
					
				}
				
				return list;
				
		
	}

}
