package com.bjsxt.entity;

public class BookBaseInfo {
	private int bid; // 图书id
	private String ISBN; // ISBN
	private int lid;// 图书馆编号
	private int tid;// 图书类型编号
	private int bcid;// 书架编号
	private String barcode;// 条形码
	private String bname;// 书名
	private String author;// 作者
	private int count;// 馆藏数量
	private int borrowcount;// 节约次数
	private String typeName;// 类型名
	private BookCase bookCase;// 书架
	private Publishing publishing;// 出版社
	private BookType bookType;// 图书类型
	private Library library;// 图书馆
	private BookInfo bookInfo;// 图书详细信息

	public BookBaseInfo(String iSBN, int bcid) {
		super();
		ISBN = iSBN;
		this.bcid = bcid;
	}

	public BookBaseInfo(int bid, String iSBN, int lid, int tid, int bcid,
			String barcode, String bname, String author, int count,
			int borrowcount, String typeName, BookCase bookCase,
			Publishing publishing, BookType bookType, Library library,
			BookInfo bookInfo) {
		super();
		this.bid = bid;
		ISBN = iSBN;
		this.lid = lid;
		this.tid = tid;
		this.bcid = bcid;
		this.barcode = barcode;
		this.bname = bname;
		this.author = author;
		this.count = count;
		this.borrowcount = borrowcount;
		this.typeName = typeName;
		this.bookCase = bookCase;
		this.publishing = publishing;
		this.bookType = bookType;
		this.library = library;
		this.bookInfo = bookInfo;
	}

	public BookBaseInfo() {
		super();
	}

	public BookBaseInfo(int bid, String iSBN, int tid, int bcid,
			String barcode, String bname) {
		super();
		this.bid = bid;
		ISBN = iSBN;
		this.tid = tid;
		this.bcid = bcid;
		this.barcode = barcode;
		this.bname = bname;
	}

	public BookBaseInfo(String ISBN, int tid, int bcid, String barcode,
			String bname, Publishing publishing) {
		super();
		this.ISBN = ISBN;
		this.tid = tid;
		this.bcid = bcid;
		this.barcode = barcode;
		this.bname = bname;
		this.publishing = publishing;
	}

	public BookBaseInfo(int bid, String ISBN, int lid, int tid, int bcid,
			String barcode, String bname, String author, int count,
			int borrowcount) {
		super();
		this.bid = bid;
		this.ISBN = ISBN;
		this.lid = lid;
		this.tid = tid;
		this.bcid = bcid;
		this.barcode = barcode;
		this.bname = bname;
		this.author = author;
		this.count = count;
		this.borrowcount = borrowcount;
	}

	public BookType getBookType() {
		return bookType;
	}

	public void setBookType(BookType bookType) {
		this.bookType = bookType;
	}

	public Library getLibrary() {
		return library;
	}

	public void setLibrary(Library library) {
		this.library = library;
	}

	public BookInfo getBookInfo() {
		return bookInfo;
	}

	public void setBookInfo(BookInfo bookInfo) {
		this.bookInfo = bookInfo;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Publishing getPublishing() {
		return publishing;
	}

	public void setPublishing(Publishing publishing) {
		this.publishing = publishing;
	}

	public BookCase getBookCase() {
		return bookCase;
	}

	public void setBookCase(BookCase bookCase) {
		this.bookCase = bookCase;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	public int getLid() {
		return lid;
	}

	public void setLib(int lid) {
		this.lid = lid;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public int getBcid() {
		return bcid;
	}

	public void setBcid(int bcid) {
		this.bcid = bcid;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getBorrowcount() {
		return borrowcount;
	}

	public void setBorrowcount(int borrowcount) {
		this.borrowcount = borrowcount;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ISBN == null) ? 0 : ISBN.hashCode());
		result = prime * result + ((author == null) ? 0 : author.hashCode());
		result = prime * result + ((barcode == null) ? 0 : barcode.hashCode());
		result = prime * result + bcid;
		result = prime * result + bid;
		result = prime * result + ((bname == null) ? 0 : bname.hashCode());
		result = prime * result + borrowcount;
		result = prime * result + count;
		result = prime * result + lid;
		result = prime * result + tid;
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
		BookBaseInfo other = (BookBaseInfo) obj;
		if (ISBN == null) {
			if (other.ISBN != null)
				return false;
		} else if (!ISBN.equals(other.ISBN))
			return false;
		if (author == null) {
			if (other.author != null)
				return false;
		} else if (!author.equals(other.author))
			return false;
		if (barcode == null) {
			if (other.barcode != null)
				return false;
		} else if (!barcode.equals(other.barcode))
			return false;
		if (bcid != other.bcid)
			return false;
		if (bid != other.bid)
			return false;
		if (bname == null) {
			if (other.bname != null)
				return false;
		} else if (!bname.equals(other.bname))
			return false;
		if (borrowcount != other.borrowcount)
			return false;
		if (count != other.count)
			return false;
		if (lid != other.lid)
			return false;
		if (tid != other.tid)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "BookBaseInfo [bid=" + bid + ", ISBN=" + ISBN + ", lid=" + lid
				+ ", tid=" + tid + ", bcid=" + bcid + ", barcode=" + barcode
				+ ", bname=" + bname + ", author=" + author + ", count="
				+ count + ", borrowcount=" + borrowcount + "]";
	}
}
