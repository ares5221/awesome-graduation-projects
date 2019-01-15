package com.bjsxt.crm.entity;

import java.io.Serializable;

public class Role implements Comparable<Role>,Serializable{
	private int role_ID;							
	private	String role_name;					
	private	int role_power;					
	private	String is_used;
	public Role(int role_ID, String role_name, int role_power, String is_used) {
		super();
		this.role_ID = role_ID;
		this.role_name = role_name;
		this.role_power = role_power;
		this.is_used = is_used;
	}
	public Role(String role_name, int role_power, String is_used) {
		super();
		this.role_name = role_name;
		this.role_power = role_power;
		this.is_used = is_used;
	}
	public Role() {
		super();
	}
	public int getRole_ID() {
		return role_ID;
	}
	public void setRole_ID(int role_ID) {
		this.role_ID = role_ID;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public int getRole_power() {
		return role_power;
	}
	public void setRole_power(int role_power) {
		this.role_power = role_power;
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
		result = prime * result + ((is_used == null) ? 0 : is_used.hashCode());
		result = prime * result + role_ID;
		result = prime * result
				+ ((role_name == null) ? 0 : role_name.hashCode());
		result = prime * result + role_power;
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
		Role other = (Role) obj;
		if (is_used == null) {
			if (other.is_used != null)
				return false;
		} else if (!is_used.equals(other.is_used))
			return false;
		if (role_ID != other.role_ID)
			return false;
		if (role_name == null) {
			if (other.role_name != null)
				return false;
		} else if (!role_name.equals(other.role_name))
			return false;
		if (role_power != other.role_power)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Role [role_ID=" + role_ID + ", role_name=" + role_name
				+ ", role_power=" + role_power + ", is_used=" + is_used + "]";
	}
	
	@Override
	public int compareTo(Role o) {
		// TODO Auto-generated method stub
		return this.role_ID-o.role_ID;
	}		
	
	
}
