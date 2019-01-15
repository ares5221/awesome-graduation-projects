package com.bjsxt.school.entity;

import java.io.Serializable;
import java.util.Date;

public class Book implements Serializable{
	private String bookId;
	private String bookName;
	private String bookType;
	private String writer;
	private String press;
	private Date pressDate;
	private double price;
	private Date regDate;
	private int count;
	private String operator;
	private String remark;
	
	
	public Book() {
		super();
	}
	public Book(String bookId, String bookName, String bookType, String writer,
			String press, Date pressDate, double price, Date regDate,
			int count, String operator, String remark) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.bookType = bookType;
		this.writer = writer;
		this.press = press;
		this.pressDate = pressDate;
		this.price = price;
		this.regDate = regDate;
		this.count = count;
		this.operator = operator;
		this.remark = remark;
	}
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookType() {
		return bookType;
	}
	public void setBookType(String bookType) {
		this.bookType = bookType;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPress() {
		return press;
	}
	public void setPress(String press) {
		this.press = press;
	}
	public Date getPressDate() {
		return pressDate;
	}
	public void setPressDate(Date pressDate) {
		this.pressDate = pressDate;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Book [bookId=" + bookId + ", bookName=" + bookName
				+ ", bookType=" + bookType + ", writer=" + writer + ", press="
				+ press + ", pressDate=" + pressDate + ", price=" + price
				+ ", regDate=" + regDate + ", count=" + count + ", operator="
				+ operator + ", remark=" + remark + "]";
	}
	

}
