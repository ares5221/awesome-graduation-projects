package com.hd.entity;

import java.io.Serializable;
import java.util.Date;

public class UserInfo implements Serializable {
	
			 /* `user_id` int(10) NOT NULL AUTO_INCREMENT,主键
			  `department_id` int(10) DEFAULT NULL,
			  `role_id` int(10) DEFAULT NULL,
			  `user_name` varchar(50) DEFAULT NULL,
			  `user_sex` varchar(10) DEFAULT NULL,
			  `user_mobile` varchar(20) DEFAULT NULL,
			  `user_age` int(10) DEFAULT NULL,
			  `user_address` varchar(500) DEFAULT NULL,
			  `user_num` varchar(100) DEFAULT NULL,
			  `user_pw` varchar(50) DEFAULT NULL,
			  `user_tel` varchar(20) DEFAULT NULL,
			  `user_idnum` varchar(20) DEFAULT NULL,
			  `user_email` varchar(100) DEFAULT NULL,
			  `user_addtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
			  `user_addman` varchar(50) DEFAULT NULL,
			  `user_changetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
			  `user_changeman` varchar(50) DEFAULT NULL,
			  `user_intest` varchar(1000) DEFAULT NULL,
			  `user_diploma` varchar(20) DEFAULT NULL,
			  `user_bankcard` varchar(20) DEFAULT NULL,
			  `user_nation` varchar(20) DEFAULT NULL,
			  `is_married` varchar(10) DEFAULT NULL,
			  `is_used` varchar(10) DEFAULT '1',
			 */
	private int user_id;
	private int department_id;
	private int role_id;
	private String user_name;
	private String user_sex;
	private String user_mobile;
	private int user_age;
	private String user_address;
	private String user_num;
	private String user_pw;
	private String user_tel;
	private String user_idnum;//身份证号
	private String user_email;
	private Date user_addtime;//添加时间
	private String user_addman;
	private Date user_changetime;
	private String user_changeman;
	private String user_intest;//兴趣
	private String user_diploma;//学历
	private String user_bankcard;
	private String user_nation;//民族
	private String is_married;
	private String is_used;
	
	private String role_name;
	private String department_name;
	
	public UserInfo() {
		super();
	}
	//顾客信息查询里需要的员工姓名
	public UserInfo(int user_id, String user_name) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
	}
	//除user_id之外所有参数均赋值
	public UserInfo(int department_id, int role_id, String user_name,
			String user_sex, String user_mobile, int user_age,
			String user_address, String user_num, String user_pw,
			String user_tel, String user_idnum, String user_email,
			Date user_addtime, String user_addman, Date user_changetime,
			String user_changeman, String user_intest, String user_diploma,
			String user_bankcard, String user_nation, String is_married,
			String is_used) {
		super();
		this.department_id = department_id;
		this.role_id = role_id;
		this.user_name = user_name;
		this.user_sex = user_sex;
		this.user_mobile = user_mobile;
		this.user_age = user_age;
		this.user_address = user_address;
		this.user_num = user_num;
		this.user_pw = user_pw;
		this.user_tel = user_tel;
		this.user_idnum = user_idnum;
		this.user_email = user_email;
		this.user_addtime = user_addtime;
		this.user_addman = user_addman;
		this.user_changetime = user_changetime;
		this.user_changeman = user_changeman;
		this.user_intest = user_intest;
		this.user_diploma = user_diploma;
		this.user_bankcard = user_bankcard;
		this.user_nation = user_nation;
		this.is_married = is_married;
		this.is_used = is_used;
	}
	//全部属性的构造方法，用于获取员工信息使用
	public UserInfo(int user_id, int department_id, int role_id,
			String user_name, String user_sex, String user_mobile,
			int user_age, String user_address, String user_num, String user_pw,
			String user_tel, String user_idnum, String user_email,
			Date user_addtime, String user_addman, Date user_changetime,
			String user_changeman, String user_intest, String user_diploma,
			String user_bankcard, String user_nation, String is_married,
			String is_used) {
		super();
		this.user_id = user_id;
		this.department_id = department_id;
		this.role_id = role_id;
		this.user_name = user_name;
		this.user_sex = user_sex;
		this.user_mobile = user_mobile;
		this.user_age = user_age;
		this.user_address = user_address;
		this.user_num = user_num;
		this.user_pw = user_pw;
		this.user_tel = user_tel;
		this.user_idnum = user_idnum;
		this.user_email = user_email;
		this.user_addtime = user_addtime;
		this.user_addman = user_addman;
		this.user_changetime = user_changetime;
		this.user_changeman = user_changeman;
		this.user_intest = user_intest;
		this.user_diploma = user_diploma;
		this.user_bankcard = user_bankcard;
		this.user_nation = user_nation;
		this.is_married = is_married;
		this.is_used = is_used;
	}
	//部分属性，用于员工更新操作使用

	public UserInfo(int user_id ,String user_name2, int user_age2, String user_sex2,

			String user_nation2, String user_diploma2, String is_married2,
			int department_id2, int role_id2, String user_tel2,
			String user_intest2, String user_bankcard2, String user_mobile2,
			String user_idnum2, Date user_addtime2, String user_addman2,
			String user_changeman2, String user_email2, String user_address2) {
		super();

		this.user_id = user_id;
		this.user_name = user_name2;
		this.user_age = user_age2;
		this.user_sex = user_sex2;
		this.user_nation = user_nation2;
		this.user_diploma = user_diploma2;
		this.is_married = is_married2;
		this.department_id = department_id2;
		this.role_id = role_id2;
		this.user_tel = user_tel2;
		this.user_intest = user_intest2;
		this.user_bankcard = user_bankcard2;
		this.user_mobile = user_mobile2;
		this.user_idnum = user_idnum2;
		this.user_addtime = user_addtime2;
		this.user_addman = user_addman2;
		this.user_changeman = user_changeman2;
		this.user_email = user_email2;
		this.user_address = user_address2;
	}
	//部分属性，用于员工详情查询
	public UserInfo(int user_id2,String user_name2, int user_age2, String user_sex2,
			String user_nation2, String user_diploma2, String is_married2,
			int department_id2, int role_id2, String user_tel2,
			String user_intest2, String user_bankcard2, String user_mobile2,
			String user_idnum2, Date user_addtime2, String user_addman2,
			String user_changeman2, String user_email2, Date user_changetime2,
			String user_address2) {
		super();
		this.user_id = user_id2;
		this.user_name = user_name2;
		this.user_age = user_age2;
		this.user_sex = user_sex2;
		this.user_nation = user_nation2;
		this.user_diploma = user_diploma2;
		this.is_married = is_married2;
		this.department_id = department_id2;
		this.role_id = role_id2;
		this.user_tel = user_tel2;
		this.user_intest = user_intest2;
		this.user_bankcard = user_bankcard2;
		this.user_mobile = user_mobile2;
		this.user_idnum = user_idnum2;
		this.user_addtime = user_addtime2;
		this.user_addman = user_addman2;
		this.user_changeman = user_changeman2;
		this.user_email = user_email2;
		this.user_changetime = user_changetime2;
		this.user_address = user_address2;
	}
	/**
	 * @param user_id2
	 * @param department_id2
	 * @param role_id2
	 * @param user_name2
	 * @param user_sex2
	 * @param user_mobile2
	 * @param user_age2
	 * @param user_address2
	 * @param user_tel2
	 * @param user_idnum2
	 * @param user_email2
	 * @param user_addtime2
	 * @param user_addman2
	 * @param user_changetime2
	 * @param user_changeman2
	 * @param user_intest2
	 * @param user_diploma2
	 * @param user_bankcard2
	 * @param user_nation2
	 * @param is_married2
	 */
	
	
	public UserInfo(int user_id, int department_id, int role_id,
			String user_name, String user_sex, String user_mobile,
			int user_age, String user_address, String user_tel,
			String user_idnum, String user_email, Date user_addtime,
			String user_addman, Date user_changetime, String user_changeman,
			String user_intest, String user_diploma, String user_bankcard,
			String user_nation, String is_married) {
		super();
		this.user_id = user_id;
		this.department_id = department_id;
		this.role_id = role_id;
		this.user_name = user_name;
		this.user_sex = user_sex;
		this.user_mobile = user_mobile;
		this.user_age = user_age;
		this.user_address = user_address;
		this.user_tel = user_tel;
		this.user_idnum = user_idnum;
		this.user_email = user_email;
		this.user_addtime = user_addtime;
		this.user_addman = user_addman;
		this.user_changetime = user_changetime;
		this.user_changeman = user_changeman;
		this.user_intest = user_intest;
		this.user_diploma = user_diploma;
		this.user_bankcard = user_bankcard;
		this.user_nation = user_nation;
		this.is_married = is_married;
	}
	
	
	
	
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public int getUser_id() {
		return user_id;
	}
	
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}
	public String getUser_mobile() {
		return user_mobile;
	}
	public void setUser_mobile(String user_mobile) {
		this.user_mobile = user_mobile;
	}
	public int getUser_age() {
		return user_age;
	}
	public void setUser_age(int user_age) {
		this.user_age = user_age;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_num() {
		return user_num;
	}
	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getUser_idnum() {
		return user_idnum;
	}
	public void setUser_idnum(String user_idnum) {
		this.user_idnum = user_idnum;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public Date getUser_addtime() {
		return user_addtime;
	}
	public void setUser_addtime(Date user_addtime) {
		this.user_addtime = user_addtime;
	}
	public String getUser_addman() {
		return user_addman;
	}
	public void setUser_addman(String user_addman) {
		this.user_addman = user_addman;
	}
	public Date getUser_changetime() {
		return user_changetime;
	}
	public void setUser_changetime(Date user_changetime) {
		this.user_changetime = user_changetime;
	}
	public String getUser_changeman() {
		return user_changeman;
	}
	public void setUser_changeman(String user_changeman) {
		this.user_changeman = user_changeman;
	}
	public String getUser_intest() {
		return user_intest;
	}
	public void setUser_intest(String user_intest) {
		this.user_intest = user_intest;
	}
	public String getUser_diploma() {
		return user_diploma;
	}
	public void setUser_diploma(String user_diploma) {
		this.user_diploma = user_diploma;
	}
	public String getUser_bankcard() {
		return user_bankcard;
	}
	public void setUser_bankcard(String user_bankcard) {
		this.user_bankcard = user_bankcard;
	}
	public String getUser_nation() {
		return user_nation;
	}
	public void setUser_nation(String user_nation) {
		this.user_nation = user_nation;
	}
	public String getIs_married() {
		return is_married;
	}
	public void setIs_married(String is_married) {
		this.is_married = is_married;
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
		result = prime * result + department_id;
		result = prime * result
				+ ((is_married == null) ? 0 : is_married.hashCode());
		result = prime * result + ((is_used == null) ? 0 : is_used.hashCode());
		result = prime * result + role_id;
		result = prime * result
				+ ((user_addman == null) ? 0 : user_addman.hashCode());
		result = prime * result
				+ ((user_address == null) ? 0 : user_address.hashCode());
		result = prime * result
				+ ((user_addtime == null) ? 0 : user_addtime.hashCode());
		result = prime * result + user_age;
		result = prime * result
				+ ((user_bankcard == null) ? 0 : user_bankcard.hashCode());
		result = prime * result
				+ ((user_changeman == null) ? 0 : user_changeman.hashCode());
		result = prime * result
				+ ((user_changetime == null) ? 0 : user_changetime.hashCode());
		result = prime * result
				+ ((user_diploma == null) ? 0 : user_diploma.hashCode());
		result = prime * result
				+ ((user_email == null) ? 0 : user_email.hashCode());
		result = prime * result + user_id;
		result = prime * result
				+ ((user_idnum == null) ? 0 : user_idnum.hashCode());
		result = prime * result
				+ ((user_intest == null) ? 0 : user_intest.hashCode());
		result = prime * result
				+ ((user_mobile == null) ? 0 : user_mobile.hashCode());
		result = prime * result
				+ ((user_name == null) ? 0 : user_name.hashCode());
		result = prime * result
				+ ((user_nation == null) ? 0 : user_nation.hashCode());
		result = prime * result
				+ ((user_num == null) ? 0 : user_num.hashCode());
		result = prime * result + ((user_pw == null) ? 0 : user_pw.hashCode());
		result = prime * result
				+ ((user_sex == null) ? 0 : user_sex.hashCode());
		result = prime * result
				+ ((user_tel == null) ? 0 : user_tel.hashCode());
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
		UserInfo other = (UserInfo) obj;
		if (department_id != other.department_id)
			return false;
		if (is_married == null) {
			if (other.is_married != null)
				return false;
		} else if (!is_married.equals(other.is_married))
			return false;
		if (is_used == null) {
			if (other.is_used != null)
				return false;
		} else if (!is_used.equals(other.is_used))
			return false;
		if (role_id != other.role_id)
			return false;
		if (user_addman == null) {
			if (other.user_addman != null)
				return false;
		} else if (!user_addman.equals(other.user_addman))
			return false;
		if (user_address == null) {
			if (other.user_address != null)
				return false;
		} else if (!user_address.equals(other.user_address))
			return false;
		if (user_addtime == null) {
			if (other.user_addtime != null)
				return false;
		} else if (!user_addtime.equals(other.user_addtime))
			return false;
		if (user_age != other.user_age)
			return false;
		if (user_bankcard == null) {
			if (other.user_bankcard != null)
				return false;
		} else if (!user_bankcard.equals(other.user_bankcard))
			return false;
		if (user_changeman == null) {
			if (other.user_changeman != null)
				return false;
		} else if (!user_changeman.equals(other.user_changeman))
			return false;
		if (user_changetime == null) {
			if (other.user_changetime != null)
				return false;
		} else if (!user_changetime.equals(other.user_changetime))
			return false;
		if (user_diploma == null) {
			if (other.user_diploma != null)
				return false;
		} else if (!user_diploma.equals(other.user_diploma))
			return false;
		if (user_email == null) {
			if (other.user_email != null)
				return false;
		} else if (!user_email.equals(other.user_email))
			return false;
		if (user_id != other.user_id)
			return false;
		if (user_idnum == null) {
			if (other.user_idnum != null)
				return false;
		} else if (!user_idnum.equals(other.user_idnum))
			return false;
		if (user_intest == null) {
			if (other.user_intest != null)
				return false;
		} else if (!user_intest.equals(other.user_intest))
			return false;
		if (user_mobile == null) {
			if (other.user_mobile != null)
				return false;
		} else if (!user_mobile.equals(other.user_mobile))
			return false;
		if (user_name == null) {
			if (other.user_name != null)
				return false;
		} else if (!user_name.equals(other.user_name))
			return false;
		if (user_nation == null) {
			if (other.user_nation != null)
				return false;
		} else if (!user_nation.equals(other.user_nation))
			return false;
		if (user_num == null) {
			if (other.user_num != null)
				return false;
		} else if (!user_num.equals(other.user_num))
			return false;
		if (user_pw == null) {
			if (other.user_pw != null)
				return false;
		} else if (!user_pw.equals(other.user_pw))
			return false;
		if (user_sex == null) {
			if (other.user_sex != null)
				return false;
		} else if (!user_sex.equals(other.user_sex))
			return false;
		if (user_tel == null) {
			if (other.user_tel != null)
				return false;
		} else if (!user_tel.equals(other.user_tel))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "UserInfo [user_id=" + user_id + ", department_id="
				+ department_id + ", role_id=" + role_id + ", user_name="
				+ user_name + ", user_sex=" + user_sex + ", user_mobile="
				+ user_mobile + ", user_age=" + user_age + ", user_address="
				+ user_address + ", user_num=" + user_num + ", user_pw="
				+ user_pw + ", user_tel=" + user_tel + ", user_idnum="
				+ user_idnum + ", user_email=" + user_email + ", user_addtime="
				+ user_addtime + ", user_addman=" + user_addman
				+ ", user_changetime=" + user_changetime + ", user_changeman="
				+ user_changeman + ", user_intest=" + user_intest
				+ ", user_diploma=" + user_diploma + ", user_bankcard="
				+ user_bankcard + ", user_nation=" + user_nation
				+ ", is_married=" + is_married + ", is_used=" + is_used + "]";
	}
	
	
	
}
