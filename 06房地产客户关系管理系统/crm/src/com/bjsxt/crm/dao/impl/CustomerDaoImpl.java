package com.bjsxt.crm.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bjsxt.crm.dao.CustomerDao;
import com.bjsxt.crm.entity.Customer;
import com.bjsxt.crm.util.DBUtil;



public class CustomerDaoImpl implements CustomerDao {

	@Override
	public List<Customer> findSource(String source_Name) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		//List<Student> stuList = null;
		List<Customer> sourceList  = new ArrayList<Customer>();
		try {
			//建立连接
			conn  = DBUtil.getConnection();
			//向数据库发送SQL命令并得到结果
			StringBuffer sql = new StringBuffer("select * from customer_source where 1=1  ");
			if(source_Name != null){
				sql.append(" and source_Name like '%"+source_Name+"%' ");
			}		
			sql.append(" order by source_id asc");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			//处理返回结果
			while(rs.next()){
				//取出结果集当前行中学生字段的的值
				int source_id = rs.getInt("source_id");
				String is_used = rs.getString("is_used");
				String source_name = rs.getString("source_name");
				//封装成来源对象
				Customer customer = new Customer(source_id, source_name, is_used);
				sourceList.add(customer);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭数据库资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		
		return sourceList;
	}
	/**
	 * 添加用户来源
	 */
	@Override
	public int addSource(String source_Name) {
		String sql = "insert into customer_source values(seq_id.nextval,?,1)";
		Object [] params = {source_Name};
		return DBUtil.executeUpdate(sql, params);
	}
	/**
	 * 删除用户来源
	 */
	@Override
	public void updateSource(int source_id) {
		String sql = "delete from customer_source where source_id = ?";
		Object [] params = {source_id};
		DBUtil.executeUpdate(sql, params);
		
	}
	/**
	 * 客户功能查询
	 */
	@Override
	public List<Customer> findCondition(String condition_name) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Customer> conditionList  = new ArrayList<Customer>();
		try {
			//建立连接
			conn  = DBUtil.getConnection();
			//向数据库发送SQL命令并得到结果
			StringBuffer sql = new StringBuffer("select * from customer_condition where 1=1  ");
			if(condition_name != null){
				sql.append(" and condition_Name like '%"+condition_name+"%' ");
			}		
			sql.append(" order by condition_id asc");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			//处理返回结果
			while(rs.next()){
				//取出结果集当前行中学生字段的的值
				String is_used = rs.getString("is_used");
				int condition_id = rs.getInt("condition_id");
				String condition_Name = rs.getString("condition_Name");
				String condition_Explain = rs.getString("condition_Explain");
				//封装成来源对象
				Customer condition =new Customer(is_used, condition_id, condition_Name, condition_Explain);
				conditionList.add(condition);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭数据库资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		
		return conditionList;
	}
	/**
	 * 添加客户状态
	 */
	@Override
	public int addCondition(String condition_Name, String condition_Explain) {
		String sql = "insert into customer_condition values(seq_id.nextval,?,?,1)";
		Object [] params = {condition_Name,condition_Explain};
		return DBUtil.executeUpdate(sql, params);
	}
	/**
	 * 删除客户状态
	 */
	@Override
	public void updateCondition(int condition_id) {
		String sql = "delete from customer_condition where condition_id = ?";
		Object [] params = {condition_id};
		DBUtil.executeUpdate(sql, params);
		
	}
	/**
	 * 查询客户类型
	 */
	@Override
	public List<Customer> findcustType(String type_Name) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Customer> cutypeList  = new ArrayList<Customer>();
		try {
			//建立连接
			conn  = DBUtil.getConnection();
			//向数据库发送SQL命令并得到结果
			StringBuffer sql = new StringBuffer("select * from customer_type where 1=1  ");
			if(type_Name != null){
				sql.append(" and type_name like '%"+type_Name+"%' ");
			}		
			sql.append(" order by type_id asc");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			//处理返回结果
			while(rs.next()){
				//取出结果集当前行中学生字段的的值
				String is_used = rs.getString("is_used");
				int type_id = rs.getInt("type_id");
				String type_name = rs.getString("type_name");
				
				//封装成来源对象
				Customer condition =new Customer(is_used, type_id, type_name);
				cutypeList.add(condition);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭数据库资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		
		return cutypeList;
	}
	/**
	 * 添加客户类型
	 */
	@Override
	public int addCuType(String type_Name) {
		String sql = "insert into customer_type values(seq_id.nextval,?,1)";
		Object [] params = {type_Name};
		return DBUtil.executeUpdate(sql, params);
	}
	/**
	 * 删除客户类型
	 */
	@Override
	public void updateCuType(int type_id) {
		String sql = "delete from customer_type where type_id = ?";
		Object [] params = {type_id};
		DBUtil.executeUpdate(sql, params);
	}
	/**
	 * 查询客户关怀
	 */
	@Override
	public int findCare(int careQuery_Type, String customerInput) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		//List<Student> stuList = null;
		//List<Customer> careList  = new ArrayList<Customer>();
		int count = 0;
		try {
			//建立连接
			conn  = DBUtil.getConnection();
			//向数据库发送SQL命令并得到结果
			StringBuffer sql = new StringBuffer("select count(*) from user_info u join customer_care c on (u.user_name = c.care_people) join customer d on(c.customer_id = d.customer_id) where 1=1  ");
			if ((customerInput != null && !"".equals(customerInput)) & careQuery_Type == 1) {
				sql.append(" and d.customer_name like '%" + customerInput + "%'");
			}
			if ((customerInput != null && !"".equals(customerInput)) & careQuery_Type == 2) {
				sql.append(" and c.care_theme like '%" + customerInput + "%'");
			}
			if ((customerInput != null && !"".equals(customerInput)) & careQuery_Type == 3) {
				sql.append(" and c.care_way like '%" + customerInput + "%'");
			}
			sql.append(" order by care_id asc");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			//处理返回结果
			rs.next();
			count = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭数据库资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		
		return count;
	}
	/**
	 * 删除客户关怀
	 */
	@Override
	public int updateCare(int care_id) {
		String sql = "delete from customer_care where care_id = ?";
		Object [] params = {care_id};
		 return DBUtil.executeUpdate(sql, params);
		
	}
	/**
	 * 预添加客户关怀，提前查询客户列表
	 */
	@Override
	public List<Customer> findCustomer() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		//List<Student> stuList = null;
		List<Customer> careCustList  = new ArrayList<Customer>();
		try {
			//建立连接
			conn  = DBUtil.getConnection();
			//向数据库发送SQL命令并得到结果
			StringBuffer sql = new StringBuffer("select * from customer ");
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			//处理返回结果
			while(rs.next()){
				//取出结果集当前行中学生字段的的值
				int customer_ID = rs.getInt("customer_ID");
				String customer_name = rs.getString("customer_name");
				String customer_state2 = rs.getString("customer_state2");
				//int customer_source = rs.getInt("customer_source");
				int customer_emp = rs.getInt("customer_emp");
				//int customer_type = rs.getInt("customer_type");
				String customer_gender = rs.getString("customer_gender");
				String customer_tel = rs.getString("customer_tel");
				int customer_qq = rs.getInt("customer_qq");
				String customer_mail = rs.getString("customer_mail");
				String customer_company = rs.getString("customer_company");
				//String customer_job = rs.getString("customer_job");
				String customer_remark = rs.getString("customer_remark");
				//封装成来源对象
				Customer customer = new Customer(customer_ID, customer_name, customer_state2,  customer_emp,  customer_gender, customer_tel, customer_qq, customer_mail, customer_remark, customer_company);
				careCustList.add(customer);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭数据库资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		
		return careCustList;
	}
	/**
	 * 添加客户关怀
	 */
	@Override
	public int addCare(int customer_Id, String care_theme,
			String care_way, String care_remark, Date care_nexttime,
			String care_people) {
		String sql = "insert into customer_care(care_id,customer_Id,care_theme,care_way,care_remark,care_nexttime,care_people) values(seq_id.nextval,?,?,?,?,?,?)";
		Object [] params = {customer_Id,care_theme,care_way,care_remark,care_nexttime,care_people};
		return DBUtil.executeUpdate(sql, params);
	}
	/**
	 * 分页查询的客户关怀
	 */
	@Override
	public List<Customer> findCare2(int startRow, int endRow,
			int careQuery_Type, String customerInput) {
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		//List<Student> stuList = null;
		List<Customer> careList  = new ArrayList<Customer>();
		//	int count = 0;
		try {
			
			stmt = conn.createStatement();
			//向数据库发送SQL命令并得到结果
			StringBuffer sql = new StringBuffer("select * from user_info u join customer_care c on (u.user_name = c.care_people) join customer d on(c.customer_id = d.customer_id) where 1=1  ");
			if ((customerInput != null && !"".equals(customerInput)) & careQuery_Type == 1) {
				sql.append(" and d.customer_name like '%" + customerInput + "%'");
			}
			if ((customerInput != null && !"".equals(customerInput)) & careQuery_Type == 2) {
				sql.append(" and c.care_theme like '%" + customerInput + "%'");
			}
			if ((customerInput != null && !"".equals(customerInput)) & careQuery_Type == 3) {
				sql.append(" and c.care_way like '%" + customerInput + "%'");
			}
			//sql.append(" order by care_id asc");
			
			String sql2 = "select  * from (select rownum rn, stu2.* "
					+ "from ( " + sql.toString() + " ) stu2 "
					+ "where rownum <=" + endRow + " ) " + "where rn >"
					+ startRow;
			rs = stmt.executeQuery(sql2);
			//处理返回结果
			while(rs.next()){
				//取出结果集当前行中学生字段的的值
				int care_id = rs.getInt("care_id");
				int customer_ID = rs.getInt("customer_ID");
				String customer_name = rs.getString("customer_name");
				String care_theme = rs.getString("care_theme");
				String care_way = rs.getString("care_way");
				Date care_time = rs.getDate("care_time");
				String care_remark = rs.getString("care_remark");
				Date care_nexttime = rs.getDate("care_nexttime");
				String care_people = rs.getString("care_people");
				String is_used = rs.getString("is_used");
				//封装成来源对象
				Customer customer = new Customer(customer_ID, customer_name, is_used, care_id, care_theme, care_way, care_time, care_remark, care_nexttime, care_people);
				careList.add(customer);
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭数据库资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		
		return careList;
	}
	
	/**
	 * 查询所有员工
	 */
	@Override
	public List<Customer> findAll(int queryType,String customerInput) {
		Connection conn = null;//javascript undefined 
		Statement stmt = null;
		ResultSet rs = null;
		List<Customer> cusList  = new ArrayList<Customer>();
		try {
			//建立连接
			conn  = DBUtil.getConnection();
			
			//向数据库发送SQL命令并得到结果
			StringBuffer sql = new StringBuffer("select * from customer c where 1=1");
			if ((customerInput != null && !"".equals(customerInput)) && queryType == 1) {
				sql.append(" and c.customer_name like '%"+customerInput+"%'");
			}
			if ((customerInput != null && !"".equals(customerInput)) && queryType == 2) {
				sql.append(" and c.customer_state2 like '%"+customerInput+"%'");
			}
			if ((customerInput != null && !"".equals(customerInput)) && queryType == 3) {
				sql.append(" and c.source_name like '%"+customerInput+"%'");
			}
			if ((customerInput != null && !"".equals(customerInput)) && queryType == 4) {
				sql.append(" and c.type_name like '%"+customerInput+"%'");
			}
			if ((customerInput != null && !"".equals(customerInput)) && queryType == 5) {
				sql.append(" and c.customer_emp like '%"+customerInput+"%'");
			}
			if ((customerInput != null && !"".equals(customerInput)) && queryType == 6) {
				sql.append(" and c.customer_company like '%"+customerInput+"%'");
			}
			sql.append(" order by c.customer_ID");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			//处理返回结果
			while(rs.next()){
				//取出结果集当前行各个字段的值
				int customer_ID = rs.getInt("customer_ID");
				String customer_name = rs.getString("customer_name");
				String customer_state2 = rs.getString("customer_state2");
				String source_name = rs.getString("source_name");
				int customer_emp = rs.getInt("customer_emp");
				String type_name = rs.getString("type_name");
				String customer_gender = rs.getString("customer_gender");
				String customer_tel = rs.getString("customer_tel");
				int customer_qq = rs.getInt("customer_qq");
				String customer_mail = rs.getString("customer_mail");
				String customer_position = rs.getString("customer_position");
				String customer_company = rs.getString("customer_company");
				String customer_remark = rs.getString("customer_remark");		
				Date customer_date = rs.getDate("customer_date");
				String customer_address = rs.getString("customer_address");
				String customer_mtel = rs.getString("customer_mtel");
				String customer_createPeople = rs.getString("customer_createPeople");
				String customer_revisePeople = rs.getString("customer_revisePeople");
				String customer_blog = rs.getString("customer_blog");
				String customer_msn = rs.getString("customer_msn");
				//封装成对象
				Customer cus = new Customer(customer_ID, customer_name, customer_state2,customer_emp, customer_gender, customer_tel, customer_qq, customer_mail, customer_position, customer_remark, source_name, type_name,customer_company, customer_date, customer_address, customer_mtel, customer_createPeople, customer_revisePeople, customer_blog, customer_msn);
				
				//将对象加入集合
				cusList.add(cus);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭数据库资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		
		return cusList;
	}
	
	
	@Override
	public int addCus(Customer cus) {
	
		String sql = "insert into customer values (cus_class.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object [] params = {cus.getCustomer_name(),cus.getCustomer_state2(),cus.getSource_name(),cus.getCustomer_emp(),
				cus.getType_name(),cus.getCustomer_gender(),cus.getCustomer_tel(),cus.getCustomer_qq(),
				cus.getCustomer_mail(),cus.getCustomer_position(),cus.getCustomer_company(),cus.getCustomer_remark(),
				cus.getCustomer_date(),cus.getCustomer_address(),cus.getCustomer_mtel(),cus.getCustomer_createPeople(),
				cus.getCustomer_revisePeople(),cus.getCustomer_blog(),cus.getCustomer_msn()};
		return DBUtil.executeUpdate(sql, params);
	
	}
	@Override
	public Customer findById(int customer_ID) {
		Connection conn = null;//javascript undefined 
		Statement stmt = null;
		ResultSet rs = null;
		Customer cus = null;
		try {
			//建立连接
			conn  = DBUtil.getConnection();
			
			//向数据库发送SQL命令并得到结果
			String sql = "select * from customer where customer_ID = "+customer_ID;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			//处理返回结果
			if(rs.next()){
				//取出结果集当前行各个字段的值
				String customer_name = rs.getString("customer_name");
				String customer_state2 = rs.getString("customer_state2");
				String source_name = rs.getString("source_name");
				int customer_emp = rs.getInt("customer_emp");
				String type_name = rs.getString("type_name");
				String customer_gender = rs.getString("customer_gender");
				String customer_tel = rs.getString("customer_tel");
				int customer_qq = rs.getInt("customer_qq");
				String customer_mail = rs.getString("customer_mail");
				String customer_position = rs.getString("customer_position");
				String customer_company = rs.getString("customer_company");
				String customer_remark = rs.getString("customer_remark");		
				Date customer_date = rs.getDate("customer_date");
				String customer_address = rs.getString("customer_address");
				String customer_mtel = rs.getString("customer_mtel");
				String customer_createPeople = rs.getString("customer_createPeople");
				String customer_revisePeople = rs.getString("customer_revisePeople");
				String customer_blog = rs.getString("customer_blog");
				String customer_msn = rs.getString("customer_msn");
				//封装成对象
				cus = new Customer(customer_ID, customer_name, customer_state2,customer_emp, customer_gender, customer_tel, customer_qq, customer_mail, customer_position, customer_remark, source_name, type_name,customer_company, customer_date, customer_address, customer_mtel, customer_createPeople, customer_revisePeople, customer_blog, customer_msn);
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭数据库资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		
		return cus;
	}
	
	/**
	 * 更新客户
	 */
	@Override
	public int updateCus(Customer cus) {
		String sql = "update customer set customer_name=?, customer_state2=?,source_name=?,customer_emp=?, "
				+ "type_name=?,customer_gender=?, customer_tel=?, customer_qq=?, customer_mail=?, "
				+ "customer_position=?, customer_remark=?,"
				+ "customer_company=?, customer_date=?, customer_address=?, customer_mtel=?, "
				+ "customer_createPeople=?, customer_revisePeople=?, customer_blog=?, customer_msn=? where customer_ID=?";
		Object [] params = {cus.getCustomer_name(),cus.getCustomer_state2(),cus.getSource_name(),cus.getCustomer_emp(),
				cus.getType_name(),cus.getCustomer_gender(),cus.getCustomer_tel(),cus.getCustomer_qq(),cus.getCustomer_mail(),
				cus.getCustomer_position(),cus.getCustomer_remark(),
				cus.getCustomer_company(),
				cus.getCustomer_date(),cus.getCustomer_address(),cus.getCustomer_mtel(),cus.getCustomer_createPeople(),
				cus.getCustomer_revisePeople(),cus.getCustomer_blog(),cus.getCustomer_msn(),cus.getCustomer_ID()};
		return DBUtil.executeUpdate(sql, params);
	}
	
	/**
	 * 删除客户
	 */
	@Override
	public int delCus(int customer_ID) {
		String sql = "delete from customer where customer_ID = ?";
		Object [] params = {customer_ID};
		return DBUtil.executeUpdate(sql, params);
	}
	
	
}
