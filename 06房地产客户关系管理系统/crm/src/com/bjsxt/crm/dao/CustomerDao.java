package com.bjsxt.crm.dao;

import java.sql.Date;
import java.util.List;

import com.bjsxt.crm.entity.Customer;

public interface CustomerDao {
	/**
	 * 客户来源
	 * @param source_Name
	 * @return
	 */
	List<Customer> findSource(String source_Name);
	/**
	 * 
	 * @param source_Name
	 * @return
	 */
	int addSource(String source_Name);
	/**
	 * 删除用户来源
	 * @param source_id
	 */
	void updateSource(int source_id);
	/**
	 * 客户状态查询
	 * @param condition_Name
	 * @return
	 */
	List<Customer> findCondition(String condition_name);
	/**
	 * 添加客户状态
	 * @param condition_Name
	 * @param condition_Explain
	 * @return
	 */
	int addCondition(String condition_Name, String condition_Explain);
	/**
	 * 删除客户状态
	 * @param condition_id
	 */
	void updateCondition(int condition_id);
	/**
	 * 查询客户类型
	 * @param type_Name
	 * @return
	 */
	List<Customer> findcustType(String type_Name);
	/**
	 * 添加客户类型
	 * @param type_Name
	 * @return
	 */
	int addCuType(String type_Name);
	/**
	 * 删除客户类型
	 * @param type_id
	 */
	void updateCuType(int type_id);
	/**
	 * 查询用户关怀
	 * @param careQuery_Type
	 * @param customerInput
	 * @return
	 */
	int findCare(int careQuery_Type, String customerInput);
	/**
	 * 删除客户关怀
	 * @param care_id
	 */
	int updateCare(int care_id);
	/**
	 * 预添加客户关怀，提前查询客户列表，获取客户信息
	 * @return
	 */
	List<Customer> findCustomer();
	/**
	 * 添加客户关怀
	 * @param customer_Id
	 * @param care_theme
	 * @param care_way
	 * @param care_remark
	 * @param care_nexttime
	 * @param care_people
	 * @return
	 */
	int addCare(int customer_Id, String care_theme, String care_way,
			String care_remark, Date care_nexttime, String care_people);
	/**
	 * 分页查询的客户关怀
	 * @param startRow
	 * @param endRow
	 * @param careQuery_Type
	 * @param customerInput
	 * @return
	 */
	List<Customer> findCare2(int startRow, int endRow, int careQuery_Type,
			String customerInput);
	
	
	/**
	 * 查询所有员工
	 */
	List<Customer> findAll(int queryType,String customerInput);
	
	/**
	 * 添加员工
	 * @param cus
	 * @return
	 */
	int addCus(Customer cus);
	
	/**
	 * 根据员工编号查询员工信息
	 * @param customer_ID
	 * @return
	 */
	Customer findById(int customer_ID);
	
	/**
	 * 更新客户
	 * @param cus
	 * @return
	 */
	int updateCus(Customer cus);
	
	/**
	 * 删除客户
	 * @param customer_ID
	 * @return
	 */
	int delCus(int customer_ID);
	


}
