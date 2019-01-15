package com.hd.entity;

public class Department {
	private int department_id;
	private String department_name;
	private String department_desc;
	private String is_used;
	
	
	public Department() {
		super();
	}
	
	

	public Department(String department_name, String department_desc,
			String is_used) {
		super();
		this.department_name = department_name;
		this.department_desc = department_desc;
		this.is_used = is_used;
	}



	public Department(int department_id, String department_name,
			String department_desc, String is_used) {
		super();
		this.department_id = department_id;
		this.department_name = department_name;
		this.department_desc = department_desc;
		this.is_used = is_used;
	}


	public int getDepartment_id() {
		return department_id;
	}


	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
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
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((department_desc == null) ? 0 : department_desc.hashCode());
		result = prime * result + department_id;
		result = prime * result
				+ ((department_name == null) ? 0 : department_name.hashCode());
		result = prime * result + ((is_used == null) ? 0 : is_used.hashCode());
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
		Department other = (Department) obj;
		if (department_desc == null) {
			if (other.department_desc != null)
				return false;
		} else if (!department_desc.equals(other.department_desc))
			return false;
		if (department_id != other.department_id)
			return false;
		if (department_name == null) {
			if (other.department_name != null)
				return false;
		} else if (!department_name.equals(other.department_name))
			return false;
		if (is_used == null) {
			if (other.is_used != null)
				return false;
		} else if (!is_used.equals(other.is_used))
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "Department [department_id=" + department_id
				+ ", department_name=" + department_name + ", department_desc="
				+ department_desc + ", is_used=" + is_used + "]";
	}
	
	
}
