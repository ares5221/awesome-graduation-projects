package com.bjsxt.crm.entity;

import java.io.Serializable;
//房屋
public class House implements Comparable<House>,Serializable{
		private int house_ID;//房屋id
		private int type_ID;//类型id
		private int user_ID;//用户id
		private int customer_ID;
		
		private House_Type house_type;
		
		private User user;
		private Customer customer;
		
		
		
		private String house_address;//房屋类型
		private double house_price;
		private String house_ambient;
		private String is_used;
		
		
		
		
		public House(int house_ID, int type_ID, int user_ID, int customer_ID,
				String house_address, double house_price, String house_ambient,
				String is_used) {
			super();
			this.house_ID = house_ID;
			this.type_ID = type_ID;
			this.user_ID = user_ID;
			this.customer_ID = customer_ID;
			this.house_address = house_address;
			this.house_price = house_price;
			this.house_ambient = house_ambient;
			this.is_used = is_used;
		}
		public int getCustomer_ID() {
			return customer_ID;
		}
		public void setCustomer_ID(int customer_ID) {
			this.customer_ID = customer_ID;
		}
		public House_Type getHouse_type() {
			return house_type;
		}
		public void setHouse_type(House_Type house_type) {
			this.house_type = house_type;
		}
		
		public User getUser() {
			return user;
		}
		public void setUser(User user) {
			this.user = user;
		}
		public Customer getCustomer() {
			return customer;
		}
		public void setCustomer(Customer customer) {
			this.customer = customer;
		}
		public House(int house_ID, int type_ID, int user_ID,
				String house_address, double house_price, String house_ambient,
				String is_used) {
			super();
			this.house_ID = house_ID;
			this.type_ID = type_ID;
			this.user_ID = user_ID;
			this.house_address = house_address;
			this.house_price = house_price;
			this.house_ambient = house_ambient;
			this.is_used = is_used;
		}
		public House() {
			super();
		}
		public int getHouse_ID() {
			return house_ID;
		}
		public void setHouse_ID(int house_ID) {
			this.house_ID = house_ID;
		}
		public int getType_ID() {
			return type_ID;
		}
		public void setType_ID(int type_ID) {
			this.type_ID = type_ID;
		}
		public int getUser_ID() {
			return user_ID;
		}
		public void setUser_ID(int user_ID) {
			this.user_ID = user_ID;
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
		public String getIs_used() {
			return is_used;
		}
		public void setIs_used(String is_used) {
			this.is_used = is_used;
		}
		
		@Override
		public String toString() {
			return "House [house_ID=" + house_ID + ", type_ID=" + type_ID
					+ ", user_ID=" + user_ID + ", house_type=" + house_type
					+ ", user=" + user + ", customer=" + customer
					+ ", house_address=" + house_address + ", house_price="
					+ house_price + ", house_ambient=" + house_ambient
					+ ", is_used=" + is_used + "]";
		}
		@Override
		public int compareTo(House o) {
			// TODO Auto-generated method stub
			return this.house_ID-o.house_ID;
		}
		
		
}
