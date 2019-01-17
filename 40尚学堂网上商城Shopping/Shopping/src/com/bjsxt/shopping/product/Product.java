package com.bjsxt.shopping.product;

import java.util.Date;

import com.bjsxt.shopping.category.Category;

public class Product {
	private int id;

	private String name;

	private String descr;

	private double normalPrice;

	private double memberPrice;

	private Date pdate;

	private int categoryId;
	
	private Category category;
	
	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getMemberPrice() {
		return memberPrice;
	}

	public void setMemberPrice(double memberPrice) {
		this.memberPrice = memberPrice;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getNormalPrice() {
		return normalPrice;
	}

	public void setNormalPrice(double normalPrice) {
		this.normalPrice = normalPrice;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	
	public void update() {
		
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	
}
