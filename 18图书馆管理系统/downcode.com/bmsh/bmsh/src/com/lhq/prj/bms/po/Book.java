package com.lhq.prj.bms.po;

import java.io.Serializable;
import java.util.Date;

/**
 * Book.java Create on 2008-9-22 下午08:48:34
 * 
 * 图书
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
@SuppressWarnings("serial")
public class Book implements Serializable {

	private Integer bookId;

	/** 书名 */
	private String bookName;

	/** 作者 */
	private String author;

	/** 出版社 */
	private String press;

	/** 出版时间 */
	private Date publicationDate;

	/** 定价 */
	private String price;

	/** 版次 */
	private String editionNo;

	/** ISBN */
	private String isbn;

	/** 所属分类 */
	private Integer categoryId;

	/** 所属分类名称 */
	private String categoryName;

	/** 字数 */
	private String wordCount;

	/** 页数 */
	private String pageCount;

	/** 开本 */
	private String bookSize;

	/** 纸张 */
	private String paper;

	/** 包装 */
	private String pack;

	/** 封面 */
	private String imageUrl;

	/** 藏书地址 */
	private String address;

	/** 编辑推荐 */
	private String editorRecommend;

	/** 内容简介 */
	private String description;

	/** 作者简介 */
	private String authorDesc;

	/** 当前状态 */
	private Integer state;
	
	/** 当前借阅人id */
	private Integer currentReaderId;
	
	/** 当前借阅人姓名 */
	private String currentReader;
	
	/** 当前关联的借阅记录id */
	private Integer logId;

	public Book() {
	}

	public Book(Integer bookId) {
		this.bookId = bookId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Integer getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookSize() {
		return bookSize;
	}

	public void setBookSize(String bookSize) {
		this.bookSize = bookSize;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getEditionNo() {
		return editionNo;
	}

	public void setEditionNo(String editionNo) {
		this.editionNo = editionNo;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getPack() {
		return pack;
	}

	public void setPack(String pack) {
		this.pack = pack;
	}

	public String getPaper() {
		return paper;
	}

	public void setPaper(String paper) {
		this.paper = paper;
	}

	public String getPress() {
		return press;
	}

	public void setPress(String press) {
		this.press = press;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Date getPublicationDate() {
		return publicationDate;
	}

	public void setPublicationDate(Date publicationDate) {
		this.publicationDate = publicationDate;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getPageCount() {
		return pageCount;
	}

	public void setPageCount(String pageCount) {
		this.pageCount = pageCount;
	}

	public String getWordCount() {
		return wordCount;
	}

	public void setWordCount(String wordCount) {
		this.wordCount = wordCount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEditorRecommend() {
		return editorRecommend;
	}

	public void setEditorRecommend(String editorRecommend) {
		this.editorRecommend = editorRecommend;
	}

	public String getAuthorDesc() {
		return authorDesc;
	}

	public void setAuthorDesc(String authorDesc) {
		this.authorDesc = authorDesc;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Integer getLogId() {
		return logId;
	}

	public void setLogId(Integer currentLogId) {
		this.logId = currentLogId;
	}

	public String getCurrentReader() {
		return currentReader;
	}

	public void setCurrentReader(String currentReader) {
		this.currentReader = currentReader;
	}

	public Integer getCurrentReaderId() {
		return currentReaderId;
	}

	public void setCurrentReaderId(Integer currentReaderId) {
		this.currentReaderId = currentReaderId;
	}

}
