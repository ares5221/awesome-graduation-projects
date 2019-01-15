package com.bjsxt.crm.entity;

import java.io.Serializable;
import java.util.Date;
//用户
public class User implements Comparable<User>,Serializable{
		private int  user_ID;//�û�id
		private int  department_ID;//����id
		private int role_ID;//��ɫid
		private String user_name;//�û�����
		private String user_sex;//�û��Ա�
		private String  user_mobile;//�û��ֻ�
		private int user_age;//�û�����
		private String user_address;//�û���ַ
		private String user_num;//�����룩��
		private String user_pw;//�û�����
		private String user_tel;//
		private String user_idnum;//
		private String user_email;//用户邮箱
		private Date user_addtime;//用户添加时间
		private String user_addman;//用户添加人
		private Date user_changetime;//
		private String user_changeman;//
		private String user_intest;//
		private String user_diploma;//学历
		private String user_bankcard;//
		private String user_nation;//
		private String is_married;//
		private String is_used;//
		//增加部门属性，多表查
		private Department department;
		//增加角色属性
		private Role role;



		
		public User(int department_ID, int role_ID, String user_name,
				String user_sex, String user_mobile, int user_age,
				String user_address, String user_num, String user_pw,
				String user_tel, String user_idnum, String user_email,
				Date user_addtime, String user_addman, String user_intest,
				String user_diploma, String user_bankcard, String user_nation,
				String is_married) {
			super();
			this.department_ID = department_ID;
			this.role_ID = role_ID;
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
			this.user_intest = user_intest;
			this.user_diploma = user_diploma;
			this.user_bankcard = user_bankcard;
			this.user_nation = user_nation;
			this.is_married = is_married;
			//this.department = department;
		}


		
	


		public User() {
			super();
		}
		
		public User(int user_ID, int department_ID, int role_ID,
				String user_name, String user_sex, String user_mobile,
				int user_age, String user_address, String user_num,
				String user_pw, String user_tel, String user_idnum,
				String user_email, Date user_addtime, String user_addman,
				Date user_changetime, String user_changeman,
				String user_intest, String user_diploma, String user_bankcard,
				String user_nation, String is_married, String is_used) {
			super();
			this.user_ID = user_ID;
			this.department_ID = department_ID;
			this.role_ID = role_ID;
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


		public User(int user_ID, int department_ID, int role_ID,
				String user_name, String user_sex, String user_mobile,
				int user_age, String user_address, String user_num,
				String user_pw, String user_tel, String user_idnum,
				String user_email, Date user_addtime, String user_addman,
				Date user_changetime, String user_changeman,
				String user_intest, String user_diploma, String user_bankcard,
				String user_nation, String is_married, String is_used,
				Department department,Role role) {
			super();
			this.user_ID = user_ID;
			this.department_ID = department_ID;
			this.role_ID = role_ID;
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
			this.department = department;
			this.role = role;
		}

		

		public User(int user_ID, int department_ID, int role_ID,
				String user_name, String user_sex, String user_mobile,
				int user_age, String user_address, String user_tel,
				String user_idnum, String user_email, Date user_changetime,
				String user_changeman, String user_intest, String user_diploma,
				String user_bankcard, String user_nation, String is_married) {
			super();
			this.user_ID = user_ID;
			this.department_ID = department_ID;
			this.role_ID = role_ID;
			this.user_name = user_name;
			this.user_sex = user_sex;
			this.user_mobile = user_mobile;
			this.user_age = user_age;
			this.user_address = user_address;
			this.user_tel = user_tel;
			this.user_idnum = user_idnum;
			this.user_email = user_email;
			this.user_changetime = user_changetime;
			this.user_changeman = user_changeman;
			this.user_intest = user_intest;
			this.user_diploma = user_diploma;
			this.user_bankcard = user_bankcard;
			this.user_nation = user_nation;
			this.is_married = is_married;
		}







		@Override
		public String toString() {
			return "User [user_ID=" + user_ID + ", department_ID="
					+ department_ID + ", role_ID=" + role_ID + ", user_name="
					+ user_name + ", user_sex=" + user_sex + ", user_mobile="
					+ user_mobile + ", user_age=" + user_age
					+ ", user_address=" + user_address + ", user_num="
					+ user_num + ", user_pw=" + user_pw + ", user_tel="
					+ user_tel + ", user_idnum=" + user_idnum + ", user_email="
					+ user_email + ", user_addtime=" + user_addtime
					+ ", user_addman=" + user_addman + ", user_changetime="
					+ user_changetime + ", user_changeman=" + user_changeman
					+ ", user_intest=" + user_intest + ", user_diploma="
					+ user_diploma + ", user_bankcard=" + user_bankcard
					+ ", user_nation=" + user_nation + ", is_married="
					+ is_married + ", is_used=" + is_used + "]";
		}



		public int getUser_ID() {
			return user_ID;
		}



		public void setUser_ID(int user_ID) {
			this.user_ID = user_ID;
		}



		public Department getDepartment() {
			return department;
		}
		public void setDepartment(Department departmen) {
			this.department = departmen;
		}
		
		public Role getRole() {
			return role;
		}
		public void setRole(Role role) {
			this.role = role;
		}
		
		public int getDepartment_ID() {
			return department_ID;
		}

		public void setDepartment_ID(int department_ID) {
			this.department_ID = department_ID;
		}



		public int getRole_ID() {
			return role_ID;
		}



		public void setRole_ID(int role_ID) {
			this.role_ID = role_ID;
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
		public int compareTo(User o) {
			// TODO Auto-generated method stub
			return this.user_ID-o.user_ID;
		}
		
		
}
