package com.hd.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 客户信息实体类
 * 
 * @author wmy
 * @day 2017年8月9日
 * @time 下午4:23:30
 * 
 */
public class Customer implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 9096584068578868524L;
	/**
	 * 客户id
	 */
	private int customer_id;
	/**
	 * 状态id
	 */
	private int condition_id;
	/**
	 * 来源id
	 */
	private int source_id;
	/**
	 * 用户id
	 */
	private int user_id;
	/**
	 * 类型id
	 */
	private int type_id;
	/**
	 * 客户名称
	 */
	private String customer_name;
	/**
	 * 客户性别
	 */
	private String customer_sex;
	/**
	 * 客户手机
	 */
	private String customer_mobile;
	/**
	 * 客户qq号
	 */
	private String customer_qq;
	/**
	 * 客户地址
	 */
	private String customer_address;
	/**
	 * 客户邮箱
	 */
	private String customer_email;
	/**
	 * 客户备注
	 */
	private String customer_remark;
	/**
	 * 客户职位
	 */
	private String customer_job;
	/**
	 * 客户微博/博客
	 */
	private String customer_blog;
	/**
	 * 客户座机
	 */
	private String customer_tel;
	/**
	 * 客户MSN
	 */
	private String customer_msn;
	/**
	 * 出生日期
	 */
	private Date birth_day;
	/**
	 * 创建时间
	 */
	private Date customer_addtime;
	/**
	 * 创建人
	 */
	private String customer_addman;
	/**
	 * 修改时间
	 */
	private Date customer_changetime;
	/**
	 * 修改人
	 */
	private String change_man;
	/**
	 * 客户公司
	 */
	private String customer_company;
	/**
	 * 是否激活
	 */
	private String is_used;

	// 客户信息需要
	private CustomerCondition customerCondition;
	private CustomerSource customerSource;
	private CustomerType customerType;
	private UserInfo userInfo;
	private String condition_name;
	
	
	
	
	public String getCondition_name() {
		return condition_name;
	}

	public void setCondition_name(String condition_name) {
		this.condition_name = condition_name;
	}

	/**
	 * 添加客户时用的构造器
	 * 
	 * @param condition_id
	 * @param source_id
	 * @param user_id
	 * @param type_id
	 * @param customer_name
	 * @param customer_sex
	 * @param customer_mobile
	 * @param customer_qq
	 * @param customer_address
	 * @param customer_email
	 * @param customer_remark
	 * @param customer_job
	 * @param customer_blog
	 * @param customer_tel
	 * @param customer_msn
	 * @param birth_day
	 * @param customer_addtime
	 * @param customer_addman
	 * @param customer_changetime
	 * @param change_man
	 * @param customer_company
	 */
	public Customer(int condition_id, int source_id, int type_id,
			String customer_name, String customer_sex, String customer_mobile,
			String customer_qq, String customer_address, String customer_email,
			String customer_remark, String customer_job, String customer_blog,
			String customer_tel, String customer_msn, Date birth_day,
			Date customer_addtime, String customer_addman,
			Date customer_changetime, String change_man, String customer_company) {
		super();
		this.condition_id = condition_id;
		this.source_id = source_id;
		this.type_id = type_id;
		this.customer_name = customer_name;
		this.customer_sex = customer_sex;
		this.customer_mobile = customer_mobile;
		this.customer_qq = customer_qq;
		this.customer_address = customer_address;
		this.customer_email = customer_email;
		this.customer_remark = customer_remark;
		this.customer_job = customer_job;
		this.customer_blog = customer_blog;
		this.customer_tel = customer_tel;
		this.customer_msn = customer_msn;
		this.birth_day = birth_day;
		this.customer_addtime = customer_addtime;
		this.customer_addman = customer_addman;
		this.customer_changetime = customer_changetime;
		this.change_man = change_man;
		this.customer_company = customer_company;
	}

	public CustomerCondition getCustomerCondition() {
		return customerCondition;
	}

	public void setCustomerCondition(CustomerCondition customerCondition) {
		this.customerCondition = customerCondition;
	}

	public CustomerSource getCustomerSource() {
		return customerSource;
	}

	public void setCustomerSource(CustomerSource customerSource) {
		this.customerSource = customerSource;
	}

	public CustomerType getCustomerType() {
		return customerType;
	}

	public void setCustomerType(CustomerType customerType) {
		this.customerType = customerType;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public Customer() {
		super();
	}

	public Customer(int customer_id, String customer_name, int condition_id,
			int source_id, int user_id, int type_id, String customer_sex,
			String customer_mobile, String customer_qq, String customer_email,
			String customer_job, String customer_company,
			String customer_remark, Date birth_day) {
		super();
		this.customer_id = customer_id;
		this.condition_id = condition_id;
		this.source_id = source_id;
		this.user_id = user_id;
		this.type_id = type_id;
		this.customer_name = customer_name;
		this.customer_sex = customer_sex;
		this.customer_mobile = customer_mobile;
		this.customer_qq = customer_qq;
		this.customer_email = customer_email;
		this.customer_remark = customer_remark;
		this.customer_job = customer_job;
		this.customer_company = customer_company;
		this.birth_day = birth_day;
	}

	public Customer(int customer_id, int condition_id, int source_id,
			int user_id, int type_id, String customer_name,
			String customer_sex, String customer_mobile, String customer_qq,
			String customer_address, String customer_email,
			String customer_remark, String customer_job, String customer_blog,
			String customer_tel, String customer_msn, Date birth_day,
			Date customer_addtime, String customer_addman,
			Date customer_changetime, String change_man,
			String customer_company, String is_used) {
		super();
		this.customer_id = customer_id;
		this.condition_id = condition_id;
		this.source_id = source_id;
		this.user_id = user_id;
		this.type_id = type_id;
		this.customer_name = customer_name;
		this.customer_sex = customer_sex;
		this.customer_mobile = customer_mobile;
		this.customer_qq = customer_qq;
		this.customer_address = customer_address;
		this.customer_email = customer_email;
		this.customer_remark = customer_remark;
		this.customer_job = customer_job;
		this.customer_blog = customer_blog;
		this.customer_tel = customer_tel;
		this.customer_msn = customer_msn;
		this.birth_day = birth_day;
		this.customer_addtime = customer_addtime;
		this.customer_addman = customer_addman;
		this.customer_changetime = customer_changetime;
		this.change_man = change_man;
		this.customer_company = customer_company;
		this.is_used = is_used;
	}

	public Customer(int condition_id, int source_id, int user_id, int type_id,
			String customer_sex, String customer_mobile, String customer_qq,
			String customer_address, String customer_email,
			String customer_remark, String customer_job, String customer_blog,
			String customer_tel, String customer_msn, Date customer_changetime,
			String change_man, String customer_company, int customer_id) {

		this.condition_id = condition_id;
		this.source_id = user_id;
		this.user_id = user_id;
		this.type_id = type_id;
		this.customer_sex = customer_sex;
		this.customer_qq = customer_qq;
		this.customer_address = customer_address;
		this.customer_mobile = customer_mobile;
		this.customer_email = customer_email;
		this.customer_remark = customer_remark;
		this.customer_job = customer_job;
		this.customer_blog = customer_blog;
		this.customer_tel = customer_tel;
		this.customer_msn = customer_msn;
		this.customer_changetime = customer_changetime;
		this.change_man = change_man;
		this.customer_company = customer_company;
		this.customer_id = customer_id;
	}

	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}

	public int getCondition_id() {
		return condition_id;
	}

	public void setCondition_id(int condition_id) {
		this.condition_id = condition_id;
	}

	public int getSource_id() {
		return source_id;
	}

	public void setSource_id(int source_id) {
		this.source_id = source_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getType_id() {
		return type_id;
	}

	public void setType_id(int type_id) {
		this.type_id = type_id;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getCustomer_sex() {
		return customer_sex;
	}

	public void setCustomer_sex(String customer_sex) {
		this.customer_sex = customer_sex;
	}

	public String getCustomer_mobile() {
		return customer_mobile;
	}

	public void setCustomer_mobile(String customer_mobile) {
		this.customer_mobile = customer_mobile;
	}

	public String getCustomer_qq() {
		return customer_qq;
	}

	public void setCustomer_qq(String customer_qq) {
		this.customer_qq = customer_qq;
	}

	public String getCustomer_address() {
		return customer_address;
	}

	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}

	public String getCustomer_email() {
		return customer_email;
	}

	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}

	public String getCustomer_remark() {
		return customer_remark;
	}

	public void setCustomer_remark(String customer_remark) {
		this.customer_remark = customer_remark;
	}

	public String getCustomer_job() {
		return customer_job;
	}

	public void setCustomer_job(String customer_job) {
		this.customer_job = customer_job;
	}

	public String getCustomer_blog() {
		return customer_blog;
	}

	public void setCustomer_blog(String customer_blog) {
		this.customer_blog = customer_blog;
	}

	public String getCustomer_tel() {
		return customer_tel;
	}

	public void setCustomer_tel(String customer_tel) {
		this.customer_tel = customer_tel;
	}

	public String getCustomer_msn() {
		return customer_msn;
	}

	public void setCustomer_msn(String customer_msn) {
		this.customer_msn = customer_msn;
	}

	public Date getBirth_day() {
		return birth_day;
	}

	public void setBirth_day(Date birth_day) {
		this.birth_day = birth_day;
	}

	public Date getCustomer_addtime() {
		return customer_addtime;
	}

	public void setCustomer_addtime(Date customer_addtime) {
		this.customer_addtime = customer_addtime;
	}

	public String getCustomer_addman() {
		return customer_addman;
	}

	public void setCustomer_addman(String customer_addman) {
		this.customer_addman = customer_addman;
	}

	public Date getCustomer_changetime() {
		return customer_changetime;
	}

	public void setCustomer_changetime(Date customer_changetime) {
		this.customer_changetime = customer_changetime;
	}

	public String getChange_man() {
		return change_man;
	}

	public void setChange_man(String change_man) {
		this.change_man = change_man;
	}

	public String getCustomer_company() {
		return customer_company;
	}

	public void setCustomer_company(String customer_company) {
		this.customer_company = customer_company;
	}

	public String getIs_used() {
		return is_used;
	}

	public void setIs_used(String is_used) {
		this.is_used = is_used;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((birth_day == null) ? 0 : birth_day.hashCode());
		result = prime * result
				+ ((change_man == null) ? 0 : change_man.hashCode());
		result = prime * result + condition_id;
		result = prime * result
				+ ((customer_addman == null) ? 0 : customer_addman.hashCode());
		result = prime
				* result
				+ ((customer_address == null) ? 0 : customer_address.hashCode());
		result = prime
				* result
				+ ((customer_addtime == null) ? 0 : customer_addtime.hashCode());
		result = prime * result
				+ ((customer_blog == null) ? 0 : customer_blog.hashCode());
		result = prime
				* result
				+ ((customer_changetime == null) ? 0 : customer_changetime
						.hashCode());
		result = prime
				* result
				+ ((customer_company == null) ? 0 : customer_company.hashCode());
		result = prime * result
				+ ((customer_email == null) ? 0 : customer_email.hashCode());
		result = prime * result + customer_id;
		result = prime * result
				+ ((customer_job == null) ? 0 : customer_job.hashCode());
		result = prime * result
				+ ((customer_mobile == null) ? 0 : customer_mobile.hashCode());
		result = prime * result
				+ ((customer_msn == null) ? 0 : customer_msn.hashCode());
		result = prime * result
				+ ((customer_name == null) ? 0 : customer_name.hashCode());
		result = prime * result
				+ ((customer_qq == null) ? 0 : customer_qq.hashCode());
		result = prime * result
				+ ((customer_remark == null) ? 0 : customer_remark.hashCode());
		result = prime * result
				+ ((customer_sex == null) ? 0 : customer_sex.hashCode());
		result = prime * result
				+ ((customer_tel == null) ? 0 : customer_tel.hashCode());
		result = prime * result + ((is_used == null) ? 0 : is_used.hashCode());
		result = prime * result + source_id;
		result = prime * result + type_id;
		result = prime * result + user_id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Customer other = (Customer) obj;
		if (birth_day == null) {
			if (other.birth_day != null)
				return false;
		} else if (!birth_day.equals(other.birth_day))
			return false;
		if (change_man == null) {
			if (other.change_man != null)
				return false;
		} else if (!change_man.equals(other.change_man))
			return false;
		if (condition_id != other.condition_id)
			return false;
		if (customer_addman == null) {
			if (other.customer_addman != null)
				return false;
		} else if (!customer_addman.equals(other.customer_addman))
			return false;
		if (customer_address == null) {
			if (other.customer_address != null)
				return false;
		} else if (!customer_address.equals(other.customer_address))
			return false;
		if (customer_addtime == null) {
			if (other.customer_addtime != null)
				return false;
		} else if (!customer_addtime.equals(other.customer_addtime))
			return false;
		if (customer_blog == null) {
			if (other.customer_blog != null)
				return false;
		} else if (!customer_blog.equals(other.customer_blog))
			return false;
		if (customer_changetime == null) {
			if (other.customer_changetime != null)
				return false;
		} else if (!customer_changetime.equals(other.customer_changetime))
			return false;
		if (customer_company == null) {
			if (other.customer_company != null)
				return false;
		} else if (!customer_company.equals(other.customer_company))
			return false;
		if (customer_email == null) {
			if (other.customer_email != null)
				return false;
		} else if (!customer_email.equals(other.customer_email))
			return false;
		if (customer_id != other.customer_id)
			return false;
		if (customer_job == null) {
			if (other.customer_job != null)
				return false;
		} else if (!customer_job.equals(other.customer_job))
			return false;
		if (customer_mobile == null) {
			if (other.customer_mobile != null)
				return false;
		} else if (!customer_mobile.equals(other.customer_mobile))
			return false;
		if (customer_msn == null) {
			if (other.customer_msn != null)
				return false;
		} else if (!customer_msn.equals(other.customer_msn))
			return false;
		if (customer_name == null) {
			if (other.customer_name != null)
				return false;
		} else if (!customer_name.equals(other.customer_name))
			return false;
		if (customer_qq == null) {
			if (other.customer_qq != null)
				return false;
		} else if (!customer_qq.equals(other.customer_qq))
			return false;
		if (customer_remark == null) {
			if (other.customer_remark != null)
				return false;
		} else if (!customer_remark.equals(other.customer_remark))
			return false;
		if (customer_sex == null) {
			if (other.customer_sex != null)
				return false;
		} else if (!customer_sex.equals(other.customer_sex))
			return false;
		if (customer_tel == null) {
			if (other.customer_tel != null)
				return false;
		} else if (!customer_tel.equals(other.customer_tel))
			return false;
		if (is_used == null) {
			if (other.is_used != null)
				return false;
		} else if (!is_used.equals(other.is_used))
			return false;
		if (source_id != other.source_id)
			return false;
		if (type_id != other.type_id)
			return false;
		if (user_id != other.user_id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Customer [customer_id=" + customer_id + ", condition_id="
				+ condition_id + ", source_id=" + source_id + ", user_id="
				+ user_id + ", type_id=" + type_id + ", customer_name="
				+ customer_name + ", customer_sex=" + customer_sex
				+ ", customer_mobile=" + customer_mobile + ", customer_qq="
				+ customer_qq + ", customer_address=" + customer_address
				+ ", customer_email=" + customer_email + ", customer_remark="
				+ customer_remark + ", customer_job=" + customer_job
				+ ", customer_blog=" + customer_blog + ", customer_tel="
				+ customer_tel + ", customer_msn=" + customer_msn
				+ ", birth_day=" + birth_day + ", customer_addtime="
				+ customer_addtime + ", customer_addman=" + customer_addman
				+ ", customer_changetime=" + customer_changetime
				+ ", change_man=" + change_man + ", customer_company="
				+ customer_company + ", is_used=" + is_used + "]";
	}

}
