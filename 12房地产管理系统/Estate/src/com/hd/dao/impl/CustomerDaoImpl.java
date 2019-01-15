package com.hd.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.hd.dao.CustomerDao;
import com.hd.entity.Customer;
import com.hd.entity.CustomerCondition;
import com.hd.entity.CustomerSource;
import com.hd.entity.CustomerType;
import com.hd.entity.UserInfo;
import com.hd.util.DBUtil;

public class CustomerDaoImpl implements CustomerDao {

	@Override
	public List<Customer> showAll() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Customer> customerList = new ArrayList<Customer>();
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from customer_info;";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {

				int customer_id = rs.getInt("customer_id");
				String customer_name = rs.getString("customer_name");
				int condition_id = rs.getInt("condition_id");
				int source_id = rs.getInt("source_id");
				int user_id = rs.getInt("user_id");
				int type_id = rs.getInt("type_id");
				String customer_sex = rs.getString("customer_sex");
				String customer_mobile = rs.getString("customer_mobile");
				String customer_qq = rs.getString("customer_qq");
				String customer_email = rs.getString("customer_email");
				String customer_job = rs.getString("customer_job");
				String customer_company = rs.getString("customer_company");
				String customer_remark = rs.getString("customer_remark");
				// 新增获得生日，我觉得改数据库要
				Date birth_day = rs.getDate("birth_day");
				Customer customer = new Customer(customer_id, customer_name,
						condition_id, source_id, user_id, type_id,
						customer_sex, customer_mobile, customer_qq,
						customer_email, customer_job, customer_company,
						customer_remark, birth_day);
				customerList.add(customer);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return customerList;

	}

	@Override
	public int delete(int customer_id) {
		String sql = "delete from customer_info where customer_id = ?";
		Object params[] = { customer_id };
		return DBUtil.executeUpdate(sql, params);
	}

	/*
	 * 获取符合查询条件的所有信息条目
	 */
	@Override
	public int findRequiredCount(String queryType, String customerInput) {

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int n = 0;
		try {
			conn = DBUtil.getConnection();
			StringBuffer sql = new StringBuffer(
					"select count(1) from customer_info i  "
							+ " left join user_info u on i.user_id=u.user_id "
							+ " left join customer_condition c on i.condition_id=c.condition_id "
							+ " left join customer_source s on i.source_id=s.source_id "
							+ " left join customer_type t on i.type_id=t.type_id where 1=1");

			if (customerInput != null && !"".equals(customerInput)) {
				sql.append(" and " + queryType + " like'%" + customerInput
						+ "%'");
			}
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			rs.next();
			n = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return n;

	}

	/*
	 * 获取符合条件的所有员工信息
	 */
	@Override
	public List<Customer> findRequiredCustomer(int start, int size,
			String queryType, String customerInput) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Customer> customerList = new ArrayList<Customer>();
		try {
			// （和数据库）建立连接
			conn = DBUtil.getConnection();
			// （向数据库）发送命令并得到结果
			StringBuffer sql = new StringBuffer(
					"select * from customer_info i  "
							+ " left join user_info u on i.user_id=u.user_id "
							+ " left join customer_condition c on i.condition_id=c.condition_id "
							+ " left join customer_source s on i.source_id=s.source_id "
							+ " left join customer_type t on i.type_id=t.type_id where 1=1");

			if (customerInput != null && !"".equals(customerInput)) {
				sql.append(" and " + queryType + " like'%" + customerInput
						+ "%'");
			}

			sql.append(" limit " + start + "," + size);

			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			// 处理结果
			while (rs.next()) {
				// 获取各列的数据
				int customer_id = rs.getInt("customer_id");
				String customer_name = rs.getString("customer_name");
				int condition_id = rs.getInt("condition_id");
				int source_id = rs.getInt("source_id");
				int user_id = rs.getInt("user_id");
				int type_id = rs.getInt("type_id");
				String customer_sex = rs.getString("customer_sex");
				String customer_mobile = rs.getString("customer_mobile");
				String customer_qq = rs.getString("customer_qq");
				String customer_email = rs.getString("customer_email");
				String customer_job = rs.getString("customer_job");
				String customer_company = rs.getString("customer_company");
				String customer_remark = rs.getString("customer_remark");
				Date birth_day = rs.getDate("birth_day");
				Date customer_addtime = rs.getDate("customer_addtime");
				Date customer_changetime = rs.getDate("customer_changtime");
				String customer_address = rs.getString("customer_address");
				String customer_blog = rs.getString("customer_blog");
				String customer_tel = rs.getString("customer_tel");
				String customer_msn = rs.getString("customer_msn");
				String customer_addman = rs.getString("customer_addman");
				String change_man = rs.getString("change_man");
				String is_used = rs.getString("is_used");

				// 将各列的数据封装到Employee对象中
				/*
				 * Customer customer = new Customer(customer_id, customer_name,
				 * condition_id, source_id, user_id, type_id, customer_sex,
				 * customer_mobile, customer_qq, customer_email, customer_job,
				 * customer_company, customer_remark, birth_day);
				 */
				Customer customer = new Customer(customer_id, condition_id,
						source_id, user_id, type_id, customer_name,
						customer_sex, customer_mobile, customer_qq,
						customer_address, customer_email, customer_remark,
						customer_job, customer_blog, customer_tel,
						customer_msn, birth_day, customer_addtime,
						customer_addman, customer_changetime, change_man,
						customer_company, is_used);
				int condition_id2 = rs.getInt("condition_id");
				String condition_name = rs.getString("condition_name");
				String condition_explain = rs.getString("condition_explain");
				String is_used3 = rs.getString("is_used");

				CustomerCondition customerCondition = new CustomerCondition(
						condition_id2, condition_name, condition_explain,
						is_used);
				customer.setCustomerCondition(customerCondition);
				int source_id2 = rs.getInt("source_id");
				String source_name = rs.getString("source_name");
				String is_used2 = rs.getString("is_used");
				CustomerSource customerSource = new CustomerSource(source_id2,
						source_name, is_used2);
				customer.setCustomerSource(customerSource);
				int typeId = rs.getInt("type_id");
				String typeName = rs.getString("type_name");
				String isUsed = rs.getString("is_used");
				CustomerType customerType = new CustomerType(typeId, typeName,
						isUsed);
				customer.setCustomerType(customerType);
				int user_id3 = rs.getInt("user_id");
				String user_name = rs.getString("user_name");
				
				
				
				UserInfo userInfo = new UserInfo(user_id3, user_name);
				customer.setUserInfo(userInfo);
				customerList.add(customer);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		// 返回数据
		return customerList;
	}

	@Override
	public int save(Customer customer) {
		String sql = "insert into customer_info values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		// 客户id和user_id为默认值,客户id默认自增,user_id默认为空
		Object[] params = { null, customer.getCondition_id(),
				customer.getSource_id(), null, customer.getType_id(),
				customer.getCustomer_name(), customer.getCustomer_sex(),
				customer.getCustomer_mobile(), customer.getCustomer_qq(),
				customer.getCustomer_address(), customer.getCustomer_email(),
				customer.getCustomer_remark(), customer.getCustomer_job(),
				customer.getCustomer_blog(), customer.getCustomer_tel(),
				customer.getCustomer_msn(), customer.getBirth_day(),
				customer.getCustomer_addtime(), customer.getCustomer_addman(),
				customer.getCustomer_changetime(), customer.getChange_man(),
				customer.getCustomer_company(), customer.getIs_used() };
		return DBUtil.executeUpdate(sql, params);
	}

	@Override
	public Customer findById(int customerId) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Customer customer = null;
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from customer_info i  "
					+ " left join user_info u on i.user_id=u.user_id "
					+ " left join customer_condition c on i.condition_id=c.condition_id "
					+ " left join customer_source s on i.source_id=s.source_id "
					+ " left join customer_type t on i.type_id=t.type_id where customer_id="
					+ customerId;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				// 获取各列的数据
				int customer_id = rs.getInt("customer_id");
				String customer_name = rs.getString("customer_name");
				int condition_id = rs.getInt("condition_id");
				int source_id = rs.getInt("source_id");
				int user_id = rs.getInt("user_id");
				int type_id = rs.getInt("type_id");
				String customer_sex = rs.getString("customer_sex");
				String customer_mobile = rs.getString("customer_mobile");
				String customer_qq = rs.getString("customer_qq");
				String customer_email = rs.getString("customer_email");
				String customer_job = rs.getString("customer_job");
				String customer_company = rs.getString("customer_company");
				String customer_remark = rs.getString("customer_remark");
				Date birth_day = rs.getDate("birth_day");
				Date customer_addtime = rs.getDate("customer_addtime");
				Date customer_changetime = rs.getDate("customer_changtime");
				String customer_address = rs.getString("customer_address");
				String customer_blog = rs.getString("customer_blog");
				String customer_tel = rs.getString("customer_tel");
				String customer_msn = rs.getString("customer_msn");
				String customer_addman = rs.getString("customer_addman");
				String change_man = rs.getString("change_man");
				String is_used = rs.getString("is_used");

				// 将各列的数据封装到Employee对象中
				customer = new Customer(customer_id, condition_id, source_id,
						user_id, type_id, customer_name, customer_sex,
						customer_mobile, customer_qq, customer_address,
						customer_email, customer_remark, customer_job,
						customer_blog, customer_tel, customer_msn, birth_day,
						customer_addtime, customer_addman, customer_changetime,
						change_man, customer_company, is_used);
				int condition_id2 = rs.getInt("condition_id");
				String condition_name = rs.getString("condition_name");
				String condition_explain = rs.getString("condition_explain");

				CustomerCondition customerCondition = new CustomerCondition(
						condition_id2, condition_name, condition_explain,
						is_used);
				customer.setCustomerCondition(customerCondition);
				int source_id2 = rs.getInt("source_id");
				String source_name = rs.getString("source_name");
				String is_used2 = rs.getString("is_used");
				CustomerSource customerSource = new CustomerSource(source_id2,
						source_name, is_used2);
				customer.setCustomerSource(customerSource);
				int typeId = rs.getInt("type_id");
				String typeName = rs.getString("type_name");
				String isUsed = rs.getString("is_used");
				CustomerType customerType = new CustomerType(typeId, typeName,
						isUsed);
				customer.setCustomerType(customerType);
				int user_id3 = rs.getInt("user_id");
				String user_name = rs.getString("user_name");
				UserInfo userInfo = new UserInfo(user_id3, user_name);
				customer.setUserInfo(userInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return customer;
	}

	@Override
	public List<Customer> findDistributeList() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Customer> customerList = new ArrayList<Customer>();
		Customer customer = null;
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from customer_info i  "
					+ " left join user_info u on i.user_id=u.user_id "
					+ " left join customer_condition c on i.condition_id=c.condition_id "
					+ " left join customer_source s on i.source_id=s.source_id "
					+ " left join customer_type t on i.type_id=t.type_id where i.user_id is null";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				// 获取各列的数据
				int customer_id = rs.getInt("customer_id");
				String customer_name = rs.getString("customer_name");
				int condition_id = rs.getInt("condition_id");
				int source_id = rs.getInt("source_id");
				int user_id = rs.getInt("user_id");
				int type_id = rs.getInt("type_id");
				String customer_sex = rs.getString("customer_sex");
				String customer_mobile = rs.getString("customer_mobile");
				String customer_qq = rs.getString("customer_qq");
				String customer_email = rs.getString("customer_email");
				String customer_job = rs.getString("customer_job");
				String customer_company = rs.getString("customer_company");
				String customer_remark = rs.getString("customer_remark");
				Date birth_day = rs.getDate("birth_day");
				Date customer_addtime = rs.getDate("customer_addtime");
				Date customer_changetime = rs.getDate("customer_changtime");
				String customer_address = rs.getString("customer_address");
				String customer_blog = rs.getString("customer_blog");
				String customer_tel = rs.getString("customer_tel");
				String customer_msn = rs.getString("customer_msn");
				String customer_addman = rs.getString("customer_addman");
				String change_man = rs.getString("change_man");
				String is_used = rs.getString("is_used");

				// 将各列的数据封装到Employee对象中
				customer = new Customer(customer_id, condition_id, source_id,
						user_id, type_id, customer_name, customer_sex,
						customer_mobile, customer_qq, customer_address,
						customer_email, customer_remark, customer_job,
						customer_blog, customer_tel, customer_msn, birth_day,
						customer_addtime, customer_addman, customer_changetime,
						change_man, customer_company, is_used);
				int condition_id2 = rs.getInt("condition_id");
				String condition_name = rs.getString("condition_name");
				String condition_explain = rs.getString("condition_explain");

				CustomerCondition customerCondition = new CustomerCondition(
						condition_id2, condition_name, condition_explain,
						is_used);
				customer.setCustomerCondition(customerCondition);
				int source_id2 = rs.getInt("source_id");
				String source_name = rs.getString("source_name");
				String is_used2 = rs.getString("is_used");
				CustomerSource customerSource = new CustomerSource(source_id2,
						source_name, is_used2);
				customer.setCustomerSource(customerSource);
				int typeId = rs.getInt("type_id");
				String typeName = rs.getString("type_name");
				String isUsed = rs.getString("is_used");
				CustomerType customerType = new CustomerType(typeId, typeName,
						isUsed);
				customer.setCustomerType(customerType);
				int user_id3 = rs.getInt("user_id");
				String user_name = rs.getString("user_name");
				UserInfo userInfo = new UserInfo(user_id3, user_name);
				customer.setUserInfo(userInfo);
				customerList.add(customer);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return customerList;
	}

	@Override
	public int update(Customer customer) {
		String sql = "update customer_info set condition_id=?, source_id=?,"
				+ " user_id=?, type_id=?, customer_sex=?, customer_mobile=?, customer_qq=?,"
				+ " customer_address=?, customer_email=?, customer_job=?, customer_blog=?,"
				+ " customer_tel=?,customer_msn=?,  change_man=?, customer_company=?,customer_remark=?"
				+ " where customer_id =?";
		Object params[] = { customer.getCondition_id(),
				customer.getSource_id(), customer.getUser_id(),
				customer.getType_id(), customer.getCustomer_sex(),
				customer.getCustomer_mobile(), customer.getCustomer_qq(),
				customer.getCustomer_address(), customer.getCustomer_email(),
				customer.getCustomer_job(), customer.getCustomer_blog(),
				customer.getCustomer_tel(), customer.getCustomer_msn(),
				customer.getChange_man(), customer.getCustomer_company(),
				customer.getCustomer_remark(), customer.getCustomer_id() };
		return DBUtil.executeUpdate(sql, params);
	}

	/* (non-Javadoc)
	 * @see com.hd.dao.CustomerDao#findDateCustomer(int)
	 */
	@Override
	public List<Customer> findDateCustomer(int days) {
	
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Customer> list = new ArrayList<Customer>();
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from customer_info i  "
					
					+ " left join customer_condition c on i.condition_id=c.condition_id "
					+ " where i.birth_day < date_add(now(),interval+"
							+ days + " day)";
					
			System.out.println(sql);	
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				// 获取各列的数据
				int customer_id = rs.getInt("customer_id");
				String customer_name = rs.getString("customer_name");
				int condition_id = rs.getInt("condition_id");
				int source_id = rs.getInt("source_id");
				int user_id = rs.getInt("user_id");
				int type_id = rs.getInt("type_id");
				String customer_sex = rs.getString("customer_sex");
				String customer_mobile = rs.getString("customer_mobile");
				String customer_qq = rs.getString("customer_qq");
				String customer_email = rs.getString("customer_email");
				String customer_job = rs.getString("customer_job");
				String customer_company = rs.getString("customer_company");
				String customer_remark = rs.getString("customer_remark");
				Date birth_day = rs.getDate("birth_day");
				Date customer_addtime = rs.getDate("customer_addtime");
				Date customer_changetime = rs.getDate("customer_changtime");
				String customer_address = rs.getString("customer_address");
				String customer_blog = rs.getString("customer_blog");
				String customer_tel = rs.getString("customer_tel");
				String customer_msn = rs.getString("customer_msn");
				String customer_addman = rs.getString("customer_addman");
				String change_man = rs.getString("change_man");
				String is_used = rs.getString("is_used");
				String customerCondition = rs.getString("condition_name");
				// 将各列的数据封装到Employee对象中
				Customer customer = new Customer(customer_id, condition_id, source_id,
						user_id, type_id, customer_name, customer_sex,
						customer_mobile, customer_qq, customer_address,
						customer_email, customer_remark, customer_job,
						customer_blog, customer_tel, customer_msn, birth_day,
						customer_addtime, customer_addman, customer_changetime,
						change_man, customer_company, is_used);
				customer.setCondition_name(customerCondition);
				

				list.add(customer);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeAll(rs, stmt, conn);
		}
		return list;
	}
}
