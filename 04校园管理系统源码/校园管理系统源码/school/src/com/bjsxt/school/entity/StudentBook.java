package com.bjsxt.school.entity;

import java.io.Serializable;
import java.util.Date;

public class StudentBook implements Serializable{
	private String borrowId;
	private String bookId;
	private String sId;
	private String bookName;
	private double price;
	private String bookType;
	private Date borrowDate;
	private Date returnDate;
	private String operator;
	
	
	public StudentBook() {
		super();
	}
	public StudentBook(String borrowId, String bookId, String sId,
			String bookName, double price, String bookType, Date borrowDate,
			Date returnDate, String operator) {
		super();
		this.borrowId = borrowId;
		this.bookId = bookId;
		this.sId = sId;
		this.bookName = bookName;
		this.price = price;
		this.bookType = bookType;
		this.borrowDate = borrowDate;
		this.returnDate = returnDate;
		this.operator = operator;
	}
	public String getBorrowId() {
		return borrowId;
	}
	public void setBorrowId(String borrowId) {
		this.borrowId = borrowId;
	}
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getBookType() {
		return bookType;
	}
	public void setBookType(String bookType) {
		this.bookType = bookType;
	}
	public Date getBorrowDate() {
		return borrowDate;
	}
	public void setBorrowDate(Date borrowDate) {
		this.borrowDate = borrowDate;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	

}
