package com.lhq.prj.bms.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
// Download by http://www.codefans.net
import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Book;
import com.lhq.prj.bms.service.IBookService;

/**
 * BookAction.java Create on 2008-9-24 下午09:18:34
 * 
 * 图书管理
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
@SuppressWarnings("serial")
public class BookAction extends BaseAction {
	private IBookService bookService;

	private Book book;
	
	private boolean success;

	private Page page;
	
	private Integer bookId;

	private File upload;// 上传的文件

	private String uploadContentType;// 上传问文件类型

	private String uploadFileName; // 上传文件名

	private String allowedTypes;// 允许上传的文件类型列表

	private String savePath;// 文件保存路径,通过ioc注入

	private float maxHeightSize;// 缩略图最大高度
	
	private float maxWidthSize;//缩略图最大宽度
	
	private String bookName;

	private String author;

	private String press;

	private String price;

	private String editionNo;

	private String isbn;

	private Integer categoryId;

	private String categoryName;

	private String wordCount;

	private String pageCount;

	private String bookSize;

	private String paper;

	private String pack;
	
	private String imageUrl;

	private String address;
	
	private String editorRecommend;

	private String description;

	private String authorDesc;

	private Integer state;

	/**
	 * 添加图书
	 * 
	 * @return
	 */
	public String saveBook() {
		book = this.upload(book);
		bookId = (Integer) bookService.saveBook(book);
		if (bookId != null) {
			this.jsonString = "{bookId:" + bookId + ",success:true,imageUrl:'" + book.getImageUrl() + "'}";
			getRequest().setAttribute("jsonString", jsonString);
			return SUCCESS;
		}
		this.jsonString = "{success:false,contentTypeIsValid:" + MyUtils.isValid(getUploadContentType(), getAllowedTypes().split(",")) + "}";
		getRequest().setAttribute("jsonString", jsonString);
		return INPUT;
	}

	/**
	 * 查找图书信息
	 * 
	 * @return
	 */
	public String findAllBook() {
		String strCondition = getRequest().getParameter("conditions");
		List conditions = new ArrayList();
		MyUtils.addToCollection(conditions, MyUtils.split(strCondition, " ,"));
		page = new Page();
		page.setConditions(conditions);
		int start = Integer.valueOf(getRequest().getParameter("start"));
		int limit = Integer.valueOf(getRequest().getParameter("limit"));
		page.setStart(++start);
		page.setLimit(limit = limit == 0 ? 20 : limit);
		page = bookService.findByPage(page);
		return SUCCESS;
	}

	/**
	 * 删除图书
	 * 
	 * @return
	 */
	public String deleteBook() {
		String strBookId = getRequest().getParameter("bookId");
		if (strBookId != null && !"".equals(strBookId)) {
			success = bookService.deleteBook(getSession().getServletContext().getRealPath("/"), Integer.valueOf(strBookId));
		}
		return SUCCESS;
	}
	
	/**
	 * 修改图书信息
	 *
	 * @return
	 * @throws Exception
	 */
	public String updateBook() throws Exception{
		Book book = new Book();
		book.setAddress(address);
		book.setAuthor(author);
		book.setAuthorDesc(authorDesc);
		book.setBookId(bookId);
		book.setBookName(bookName);
		book.setBookSize(bookSize);
		book.setCategoryId(categoryId);
		book.setCategoryName(categoryName);
		book.setDescription(description);
		book.setEditionNo(editionNo);
		book.setEditorRecommend(editorRecommend);
		book.setIsbn(isbn);
		book.setPack(pack);
		book.setPageCount(pageCount);
		book.setWordCount(wordCount);
		book.setState(state);
		book.setPrice(price);
		book.setPress(press);
		book.setPaper(paper);
		book = this.upload(book);
		/*1.如果图书本来没有图片则不用删除原来图片
		 *2.如果原来有图片并且修改后的图片不一样则删除原来图片
		 */
		if(imageUrl != null && null != book.getImageUrl() && !imageUrl.equals(book.getImageUrl())){
			MyUtils.delFile(getSession().getServletContext().getRealPath("/")+ imageUrl);
		}
		if(upload != null && MyUtils.isValid(getUploadContentType(), getAllowedTypes().split(",")) && bookService.updateBook(book) ){
			this.jsonString = "{success:true,imageUrl:'" + book.getImageUrl() + "'}";
			getRequest().setAttribute("jsonString", jsonString);
			return SUCCESS;
		}else if(upload == null && bookService.updateBook(book)){
			this.jsonString = "{success:true,imageUrl:'" + imageUrl + "'}";
			getRequest().setAttribute("jsonString", jsonString);
			return SUCCESS;
		}
		this.jsonString = "{success:false,contentTypeIsValid:" + MyUtils.isValid(getUploadContentType(), getAllowedTypes().split(",")) + "}";
		getRequest().setAttribute("jsonString", jsonString);
		return INPUT;
	}
	
	private Book upload(Book book){
		String _imageUrl = null;
		if (upload != null && MyUtils.isValid(getUploadContentType(), getAllowedTypes().split(","))) {
			String rootPath = getSession().getServletContext().getRealPath("/");
			String savePath = rootPath + getSavePath();
			MyUtils.mkDirectory(savePath);
			String newFileName = MyUtils.upload(getUploadFileName(), savePath, getUpload());
			_imageUrl = getSavePath() + newFileName;
			try {
				MyUtils.createMiniPic(new File(savePath + newFileName), maxWidthSize,maxHeightSize);
			} catch (IOException e) {
				e.printStackTrace();
			}
			book.setImageUrl(_imageUrl);
		}
		return book;
	}

	/**
	 * 还书
	 * 
	 * @return
	 * @throws Exception
	 */
	public String returnBook() throws Exception {
		String strBookId = getRequest().getParameter("bookId");
		if (strBookId != null && !"".equals(strBookId)) {
			Book book = new Book();
			book.setBookId(Integer.valueOf(strBookId));
			success = bookService.returnBook(book);
		}
		return SUCCESS;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Integer getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public float getMaxHeightSize() {
		return maxHeightSize;
	}

	public void setMaxHeightSize(float imageMaxSize) {
		this.maxHeightSize = imageMaxSize;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public void setBookService(IBookService bookService) {
		this.bookService = bookService;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getAllowedTypes() {
		return allowedTypes;
	}

	public void setAllowedTypes(String allowedTypes) {
		this.allowedTypes = allowedTypes;
	}

	public float getMaxWidthSize() {
		return maxWidthSize;
	}

	public void setMaxWidthSize(float maxWidthSize) {
		this.maxWidthSize = maxWidthSize;
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

	public String getAuthorDesc() {
		return authorDesc;
	}

	public void setAuthorDesc(String authorDesc) {
		this.authorDesc = authorDesc;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEditionNo() {
		return editionNo;
	}

	public void setEditionNo(String editionNo) {
		this.editionNo = editionNo;
	}

	public String getEditorRecommend() {
		return editorRecommend;
	}

	public void setEditorRecommend(String editorRecommend) {
		this.editorRecommend = editorRecommend;
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

	public String getPageCount() {
		return pageCount;
	}

	public void setPageCount(String pageCount) {
		this.pageCount = pageCount;
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


	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getWordCount() {
		return wordCount;
	}

	public void setWordCount(String wordCount) {
		this.wordCount = wordCount;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

}
