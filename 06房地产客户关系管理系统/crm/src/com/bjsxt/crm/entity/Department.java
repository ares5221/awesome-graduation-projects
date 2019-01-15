package com.bjsxt.crm.entity;

import java.io.Serializable;
//部门
public class Department implements Comparable<Department>,Serializable{
		private int department_ID;
		private String department_name;
		private String department_desc;
		private String is_used;
		
		
		
		


		public Department(String department_name, String department_desc,
				String is_used) {
			super();
			this.department_name = department_name;
			this.department_desc = department_desc;
			this.is_used = is_used;
		}






		public Department() {
			super();
		}






		public Department(int department_ID, String department_name,
				String department_desc, String is_used) {
			super();
			this.department_ID = department_ID;
			this.department_name = department_name;
			this.department_desc = department_desc;
			this.is_used = is_used;
		}






		@Override
		public String toString() {
			return "Department [department_ID=" + department_ID
					+ ", department_name=" + department_name
					+ ", department_desc=" + department_desc + ", is_used="
					+ is_used + "]";
		}






		public int getDepartment_ID() {
			return department_ID;
		}






		public void setDepartment_ID(int department_ID) {
			this.department_ID = department_ID;
		}






		public String getDepartment_name() {
			return department_name;
		}






		public void setDepartment_name(String department_name) {
			this.department_name = department_name;
		}






		public String getDepartment_desc() {
			return department_desc;
		}






		public void setDepartment_desc(String department_desc) {
			this.department_desc = department_desc;
		}






		public String getIs_used() {
			return is_used;
		}






		public void setIs_used(String is_used) {
			this.is_used = is_used;
		}






		@Override
		public int compareTo(Department o) {
			
			return this.department_ID-o.department_ID;
		}
}
