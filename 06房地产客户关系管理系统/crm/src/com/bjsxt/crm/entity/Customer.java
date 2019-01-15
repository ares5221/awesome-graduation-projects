package com.bjsxt.crm.entity;

import java.io.Serializable;
import java.util.Date;
//�˿�
public class Customer implements Comparable<Customer>,Serializable {
				private int customer_ID;
				private String customer_name;
				private int customer_state;
				private String customer_state2;
				private int customer_source;
				private int customer_emp;
				private int customer_type;
				private String customer_gender;
				private String customer_tel;
				private int customer_qq;
				private String customer_mail;
				private String customer_position;
				private String customer_com;
				private String customer_remark;
				private int source_id;
				private String source_name;
				private String is_used;
				private int condition_id;
				private String condition_Name;
				private String condition_Explain;
				private int type_id;
				private String type_name;
				private int care_id;
				private String care_theme;
				private String care_way;
				private Date care_time;
				private String care_remark;
				private Date care_nexttime;
				private String care_people;
				private String customer_company;
				private String customer_job;
				private Date customer_date;//客户出生日期
				private String customer_address;
				private String customer_mtel;//客户座机号
				private String customer_createPeople;//客户创建人
				private String customer_revisePeople;//客户修改人
				private String customer_blog;
				private String customer_msn;
				
				
				public Customer(int customer_ID, String customer_name,
						String customer_state2,
						int customer_emp, String customer_gender,
						String customer_tel, int customer_qq,
						String customer_mail, String customer_position,
						String customer_remark, String source_name,
						String type_name,
						String customer_company, Date customer_date,
						String customer_address, String customer_mtel,
						String customer_createPeople,
						String customer_revisePeople, String customer_blog,
						String customer_msn) {
					super();
					this.customer_ID = customer_ID;
					this.customer_name = customer_name;
					this.customer_state2 = customer_state2;
					this.customer_emp = customer_emp;
					this.customer_gender = customer_gender;
					this.customer_tel = customer_tel;
					this.customer_qq = customer_qq;
					this.customer_mail = customer_mail;
					this.customer_position = customer_position;
					this.customer_remark = customer_remark;
					this.source_name = source_name;
					this.type_name = type_name;
					this.customer_company = customer_company;
					this.customer_date = customer_date;
					this.customer_address = customer_address;
					this.customer_mtel = customer_mtel;
					this.customer_createPeople = customer_createPeople;
					this.customer_revisePeople = customer_revisePeople;
					this.customer_blog = customer_blog;
					this.customer_msn = customer_msn;
				}
				
				public Customer(String customer_name,
						String customer_state2,
						int customer_emp, String customer_gender,
						String customer_tel, int customer_qq,
						String customer_mail, String customer_position,
						String customer_remark, String source_name,
						String type_name,
						String customer_company, Date customer_date,
						String customer_address, String customer_mtel,
						String customer_createPeople,
						String customer_revisePeople, String customer_blog,
						String customer_msn) {
					super();
					this.customer_name = customer_name;
					this.customer_state2 = customer_state2;
					this.customer_emp = customer_emp;
					this.customer_gender = customer_gender;
					this.customer_tel = customer_tel;
					this.customer_qq = customer_qq;
					this.customer_mail = customer_mail;
					this.customer_position = customer_position;
					this.customer_remark = customer_remark;
					this.source_name = source_name;
					this.type_name = type_name;
					this.customer_company = customer_company;
					this.customer_date = customer_date;
					this.customer_address = customer_address;
					this.customer_mtel = customer_mtel;
					this.customer_createPeople = customer_createPeople;
					this.customer_revisePeople = customer_revisePeople;
					this.customer_blog = customer_blog;
					this.customer_msn = customer_msn;
				}
				
				public String getCustomer_state2() {
					return customer_state2;
				}
				public void setCustomer_state2(String customer_state2) {
					this.customer_state2 = customer_state2;
				}
				public Date getCustomer_date() {
					return customer_date;
				}
				public void setCustomer_date(Date customer_date) {
					this.customer_date = customer_date;
				}
				public String getCustomer_address() {
					return customer_address;
				}
				public void setCustomer_address(String customer_address) {
					this.customer_address = customer_address;
				}
				public String getCustomer_mtel() {
					return customer_mtel;
				}
				public void setCustomer_mtel(String customer_mtel) {
					this.customer_mtel = customer_mtel;
				}
				public String getCustomer_createPeople() {
					return customer_createPeople;
				}
				public void setCustomer_createPeople(String customer_createPeople) {
					this.customer_createPeople = customer_createPeople;
				}
				public String getCustomer_revisePeople() {
					return customer_revisePeople;
				}
				public void setCustomer_revisePeople(String customer_revisePeople) {
					this.customer_revisePeople = customer_revisePeople;
				}
				public String getCustomer_blog() {
					return customer_blog;
				}
				public void setCustomer_blog(String customer_blog) {
					this.customer_blog = customer_blog;
				}
				public String getCustomer_msn() {
					return customer_msn;
				}
				public void setCustomer_msn(String customer_msn) {
					this.customer_msn = customer_msn;
				}
				public String getCustomer_company() {
					return customer_company;
				}
				public void setCustomer_company(String customer_company) {
					this.customer_company = customer_company;
				}
				public String getCustomer_job() {
					return customer_job;
				}
				public void setCustomer_job(String customer_job) {
					this.customer_job = customer_job;
				}
				public Customer(int customer_ID, String customer_name,String is_used, int care_id,
						String care_theme, String care_way, Date care_time,
						String care_remark, Date care_nexttime,
						String care_people) {
					super();
					this.customer_ID = customer_ID;
					this.customer_name = customer_name;
					this.is_used = is_used;
					this.care_id = care_id;
					this.care_theme = care_theme;
					this.care_way = care_way;
					this.care_time = care_time;
					this.care_remark = care_remark;
					this.care_nexttime = care_nexttime;
					this.care_people = care_people;
				}
				public int getCare_id() {
					return care_id;
				}
				public void setCare_id(int care_id) {
					this.care_id = care_id;
				}
				public String getCare_theme() {
					return care_theme;
				}
				public void setCare_theme(String care_theme) {
					this.care_theme = care_theme;
				}
				public String getCare_way() {
					return care_way;
				}
				public void setCare_way(String care_way) {
					this.care_way = care_way;
				}
				public Date getCare_time() {
					return care_time;
				}
				public void setCare_time(Date care_time) {
					this.care_time = care_time;
				}
				public String getCare_remark() {
					return care_remark;
				}
				public void setCare_remark(String care_remark) {
					this.care_remark = care_remark;
				}
				public Date getCare_nexttime() {
					return care_nexttime;
				}
				public void setCare_nexttime(Date care_nexttime) {
					this.care_nexttime = care_nexttime;
				}
				public String getCare_people() {
					return care_people;
				}
				public void setCare_people(String care_people) {
					this.care_people = care_people;
				}
				public int getType_id() {
					return type_id;
				}
				public void setType_id(int type_id) {
					this.type_id = type_id;
				}
				public String getType_name() {
					return type_name;
				}
				public void setType_name(String type_name) {
					this.type_name = type_name;
				}
				public int getCondition_id() {
					return condition_id;
				}
				public void setCondition_id(int condition_id) {
					this.condition_id = condition_id;
				}
				public String getCondition_Name() {
					return condition_Name;
				}
				public void setCondition_Name(String condition_Name) {
					this.condition_Name = condition_Name;
				}
				public String getCondition_Explain() {
					return condition_Explain;
				}
				public void setCondition_Explain(String condition_Explain) {
					this.condition_Explain = condition_Explain;
				}
				public Customer(int source_id, String source_name,
						String is_used) {
					super();
					this.source_id = source_id;
					this.source_name = source_name;
					this.is_used = is_used;
				}
				public String getIs_used() {
					return is_used;
				}
				public void setIs_used(String is_used) {
					this.is_used = is_used;
				}
				public int getSource_id() {
					return source_id;
				}
				public void setSource_id(int source_id) {
					this.source_id = source_id;
				}
				public String getSource_name() {
					return source_name;
				}
				public void setSource_name(String source_name) {
					this.source_name = source_name;
				}
				public int getCustomer_ID() {
					return customer_ID;
				}
				public void setCustomer_ID(int customer_ID) {
					this.customer_ID = customer_ID;
				}
				public String getCustomer_name() {
					return customer_name;
				}
				public void setCustomer_name(String customer_name) {
					this.customer_name = customer_name;
				}
				public int getCustomer_state() {
					return customer_state;
				}
				public void setCustomer_state(int customer_state) {
					this.customer_state = customer_state;
				}
				public int getCustomer_source() {
					return customer_source;
				}
				public void setCustomer_source(int customer_source) {
					this.customer_source = customer_source;
				}
				public int getCustomer_emp() {
					return customer_emp;
				}
				public void setCustomer_emp(int customer_emp) {
					this.customer_emp = customer_emp;
				}
				public int getCustomer_type() {
					return customer_type;
				}
				public void setCustomer_type(int customer_type) {
					this.customer_type = customer_type;
				}
				public String getCustomer_gender() {
					return customer_gender;
				}
				public void setCustomer_gender(String customer_gender) {
					this.customer_gender = customer_gender;
				}
				public String getCustomer_tel() {
					return customer_tel;
				}
				public void setCustomer_tel(String customer_tel) {
					this.customer_tel = customer_tel;
				}
				public int getCustomer_qq() {
					return customer_qq;
				}
				public void setCustomer_qq(int customer_qq) {
					this.customer_qq = customer_qq;
				}
				public String getCustomer_mail() {
					return customer_mail;
				}
				public void setCustomer_mail(String customer_mail) {
					this.customer_mail = customer_mail;
				}
				public String getCustomer_position() {
					return customer_position;
				}
				public void setCustomer_position(String customer_position) {
					this.customer_position = customer_position;
				}
				public String getCustomer_com() {
					return customer_com;
				}
				public void setCustomer_com(String customer_com) {
					this.customer_com = customer_com;
				}
				public String getCustomer_remark() {
					return customer_remark;
				}
				public void setCustomer_remark(String customer_remark) {
					this.customer_remark = customer_remark;
				}
				@Override
				public String toString() {
					return "Customer [customer_ID=" + customer_ID
							+ ", customer_name=" + customer_name
							+ ", customer_state=" + customer_state
							+ ", customer_source=" + customer_source
							+ ", customer_emp=" + customer_emp
							+ ", customer_type=" + customer_type
							+ ", customer_gender=" + customer_gender
							+ ", customer_tel=" + customer_tel
							+ ", customer_qq=" + customer_qq
							+ ", customer_mail=" + customer_mail
							+ ", customer_position=" + customer_position
							+ ", customer_com=" + customer_com
							+ ", customer_remark=" + customer_remark + "]";
				}
				/**
				public Customer(int customer_ID, String customer_name,
						int customer_state, int customer_source,
						int customer_emp, int customer_type,
						String customer_gender, String customer_tel,
						int customer_qq, String customer_mail,
						String customer_position, String customer_com,
						String customer_remark) {
					super();
					this.customer_ID = customer_ID;
					this.customer_name = customer_name;
					this.customer_state = customer_state;
					this.customer_source = customer_source;
					this.customer_emp = customer_emp;
					this.customer_type = customer_type;
					this.customer_gender = customer_gender;
					this.customer_tel = customer_tel;
					this.customer_qq = customer_qq;
					this.customer_mail = customer_mail;
					this.customer_position = customer_position;
					this.customer_com = customer_com;
					this.customer_remark = customer_remark;
				}
				**/
				public Customer() {
					super();
				}
				
				@Override
				public int compareTo(Customer o) {
					// TODO Auto-generated method stub
					return this.customer_ID-o.customer_ID;
				}
				public Customer(String is_used, int condition_id,
						String condition_Name, String condition_Explain) {
					super();
					this.is_used = is_used;
					this.condition_id = condition_id;
					this.condition_Name = condition_Name;
					this.condition_Explain = condition_Explain;
				}
				public Customer(String is_used, int type_id, String type_name) {
					super();
					this.is_used = is_used;
					this.type_id = type_id;
					this.type_name = type_name;
				}
				public Customer(int customer_ID, String customer_name,
						int customer_state, int customer_source,
						int customer_emp, int customer_type,
						String customer_gender, String customer_tel,
						int customer_qq, String customer_mail,
						String customer_remark, String customer_company,
						String customer_job) {
					super();
					this.customer_ID = customer_ID;
					this.customer_name = customer_name;
					this.customer_state = customer_state;
					this.customer_source = customer_source;
					this.customer_emp = customer_emp;
					this.customer_type = customer_type;
					this.customer_gender = customer_gender;
					this.customer_tel = customer_tel;
					this.customer_qq = customer_qq;
					this.customer_mail = customer_mail;
					this.customer_remark = customer_remark;
					this.customer_company = customer_company;
					this.customer_job = customer_job;
				}

				public Customer(int customer_ID, String customer_name,
						String customer_state2, 
						int customer_emp, 
						String customer_gender, String customer_tel,
						int customer_qq, String customer_mail,
						String customer_remark, String customer_company
						) {
					super();
					this.customer_ID = customer_ID;
					this.customer_name = customer_name;
					this.customer_state2 = customer_state2;
					//this.customer_source = customer_source;
					this.customer_emp = customer_emp;
					//this.customer_type = customer_type;
					this.customer_gender = customer_gender;
					this.customer_tel = customer_tel;
					this.customer_qq = customer_qq;
					this.customer_mail = customer_mail;
					this.customer_remark = customer_remark;
					this.customer_company = customer_company;
				//	this.customer_job = customer_job;
				}
				
				
				
				
				
}
