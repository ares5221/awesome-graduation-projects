package com.bjsxt.entity;

import java.io.Serializable;

public class ReaderBorrowSort implements Serializable,
		Comparable<ReaderBorrowSort> {
	/**
	 * 图书借阅排行榜
	 */
	private static final long serialVersionUID = -745434189685584434L;
	private String isbn;// 图书条形码
	private String name;// 图书名称
	private String type;// 图书类型
	private String bookCase;// 书架
	private String publishName;// 出版社
	private String author;// 作者
	private Integer borrowCount;// 借阅次数

	public ReaderBorrowSort() {
		super();
	}

	public ReaderBorrowSort(String isbn, String name, String type,
			String bookCase, String publishName, String author,
			Integer borrowCount) {
		super();
		this.isbn = isbn;
		this.name = name;
		this.type = type;
		this.bookCase = bookCase;
		this.publishName = publishName;
		this.author = author;
		this.borrowCount = borrowCount;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBookCase() {
		return bookCase;
	}

	public void setBookCase(String bookCase) {
		this.bookCase = bookCase;
	}

	public String getPublishName() {
		return publishName;
	}

	public void setPublishName(String publishName) {
		this.publishName = publishName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Integer getBorrowCount() {
		return borrowCount;
	}

	public void setBorrowCount(Integer borrowCount) {
		this.borrowCount = borrowCount;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((author == null) ? 0 : author.hashCode());
		result = prime * result
				+ ((bookCase == null) ? 0 : bookCase.hashCode());
		result = prime * result
				+ ((borrowCount == null) ? 0 : borrowCount.hashCode());
		result = prime * result + ((isbn == null) ? 0 : isbn.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result
				+ ((publishName == null) ? 0 : publishName.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
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
		ReaderBorrowSort other = (ReaderBorrowSort) obj;
		if (author == null) {
			if (other.author != null)
				return false;
		} else if (!author.equals(other.author))
			return false;
		if (bookCase == null) {
			if (other.bookCase != null)
				return false;
		} else if (!bookCase.equals(other.bookCase))
			return false;
		if (borrowCount == null) {
			if (other.borrowCount != null)
				return false;
		} else if (!borrowCount.equals(other.borrowCount))
			return false;
		if (isbn == null) {
			if (other.isbn != null)
				return false;
		} else if (!isbn.equals(other.isbn))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (publishName == null) {
			if (other.publishName != null)
				return false;
		} else if (!publishName.equals(other.publishName))
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		return true;
	}

	@Override
	public int compareTo(ReaderBorrowSort other) {
		return borrowCount.compareTo(other.borrowCount);
	}
}
