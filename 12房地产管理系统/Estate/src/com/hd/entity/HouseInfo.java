package com.hd.entity;

import java.io.Serializable;

public class HouseInfo implements Serializable{
	private int house_id;
	private int type_id;
	private int user_id;
	private String house_address;
	private double house_price;
	private String house_ambient;
	
	private String type_name;
	private String user_name;
	
	
	
	
	public HouseInfo(int type_id, int user_id, String house_address,
			double house_price, String house_ambient) {
		super();
		this.type_id = type_id;
		this.user_id = user_id;
		this.house_address = house_address;
		this.house_price = house_price;
		this.house_ambient = house_ambient;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public HouseInfo() {
		super();
	}

	public HouseInfo(int house_id, int type_id, int user_id,
			String house_address, double house_price, String house_ambient){
		super();
		this.house_id = house_id;
		this.type_id = type_id;
		this.user_id = user_id;
		this.house_address = house_address;
		this.house_price = house_price;
		this.house_ambient = house_ambient;
	}

	public int getHouse_id() {
		return house_id;
	}

	public void setHouse_id(int house_id) {
		this.house_id = house_id;
	}

	public int getType_id() {
		return type_id;
	}

	public void setType_id(int type_id) {
		this.type_id = type_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getHouse_address() {
		return house_address;
	}

	public void setHouse_address(String house_address) {
		this.house_address = house_address;
	}

	public double getHouse_price() {
		return house_price;
	}

	public void setHouse_price(double house_price) {
		this.house_price = house_price;
	}

	public String getHouse_ambient() {
		return house_ambient;
	}

	public void setHouse_ambient(String house_ambient) {
		this.house_ambient = house_ambient;
	}





	@Override
	public int hashCode() {
		final int prime = 31;
		double result = 1;
		result = prime * result
				+ ((house_address == null) ? 0 : house_address.hashCode());
		result = prime * result
				+ ((house_ambient == null) ? 0 : house_ambient.hashCode());
		result = prime * result + house_id;
		result = prime * result + house_price;
		result = prime * result + type_id;
		result = prime * result + user_id;
		return (int) result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		HouseInfo other = (HouseInfo) obj;
		if (house_address == null) {
			if (other.house_address != null)
				return false;
		} else if (!house_address.equals(other.house_address))
			return false;
		if (house_ambient == null) {
			if (other.house_ambient != null)
				return false;
		} else if (!house_ambient.equals(other.house_ambient))
			return false;
		if (house_id != other.house_id)
			return false;
		if (house_price != other.house_price)
			return false;
		if (type_id != other.type_id)
			return false;
		if (user_id != other.user_id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "HouseInfo [house_id=" + house_id + ", type_id=" + type_id
				+ ", user_id=" + user_id + ", house_address=" + house_address
				+ ", house_price=" + house_price + ", house_ambient="
				+ house_ambient + ", is_used="+ "]";
	}
	
	
}
