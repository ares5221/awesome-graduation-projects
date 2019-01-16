package com.umt.lab.vo;

import java.sql.Date;

public class labVo {
	//分组实验记录
	private int id;
	private String lore;
	private String labclass;
	private String labname;
	private Date labDate;
	private int  kts;
	private int team;
	private String teacher;
	
	//最新实验通知
	private String labtype;
	
	
	
	
	//物品借还管理
	private  Date borrowdate;
	private String borrowname;
	private String articlename;
	private String model;
	private int borrowlist;
	private Date returndate;
	private int returnlist;
	private String returnpeople;
	private int returnno;
	private String returns;
	private String returnstate;
	
	//用户管理与成绩查询
	private int studentno;
	private String studentname;
	private String sax;
	private Date borndate;
	private int age;
	private String classname;
	private String username;
	private String userpwd;
	private int fraction;
	
	
	
	
	
	
	
	//添加的构造
	public labVo( int studentno, String studentname, String sax,
			Date borndate, int age, String classname, String username,
			String userpwd,String labname, int fraction) {
		super();
		this.labname = labname;
		this.studentno = studentno;
		this.studentname = studentname;
		this.sax = sax;
		this.borndate = borndate;
		this.age = age;
		this.classname = classname;
		this.username = username;
		this.userpwd = userpwd;
		this.fraction = fraction;
	}


	//查询的构造
	public labVo( int studentno, String studentname, String sax,
			Date borndate, int age, String classname,String labname, int fraction) {
		super();
		this.labname = labname;
		this.studentno = studentno;
		this.studentname = studentname;
		this.sax = sax;
		this.borndate = borndate;
		this.age = age;
		this.classname = classname;
		this.fraction = fraction;
	}


	public labVo(int id, Date borrowdate, String borrowname,
			String articlename, String model, int borrowlist, Date returndate,
			int returnlist, String returnpeople, int returnno) {
		super();
		this.id = id;
		this.borrowdate = borrowdate;
		this.borrowname = borrowname;
		this.articlename = articlename;
		this.model = model;
		this.borrowlist = borrowlist;
		this.returndate = returndate;
		this.returnlist = returnlist;
		this.returnpeople = returnpeople;
		this.returnno=returnno;
		
	}

	
	public labVo(int id, Date borrowdate, String borrowname,
			String articlename, String model, int borrowlist, Date returndate,
			int returnlist, String returnpeople, String returnstate) {
		super();
		this.id = id;
		this.borrowdate = borrowdate;
		this.borrowname = borrowname;
		this.articlename = articlename;
		this.model = model;
		this.borrowlist = borrowlist;
		this.returndate = returndate;
		this.returnlist = returnlist;
		this.returnpeople = returnpeople;
		this.returnstate=returnstate;
		
	}

	
	
	public labVo(int id, Date borrowdate, String borrowname,
			String articlename, String model, int borrowlist, Date returndate,
			int returnlist, String returnpeople, int returnno, String returns) {
		super();
		this.id = id;
		this.borrowdate = borrowdate;
		this.borrowname = borrowname;
		this.articlename = articlename;
		this.model = model;
		this.borrowlist = borrowlist;
		this.returndate = returndate;
		this.returnlist = returnlist;
		this.returnpeople = returnpeople;
		this.returnno = returnno;
		this.returns = returns;
	}


	public labVo(int id,String teacher,String lore, String labclass, String labname, Date labDate
			 ) {
		super();
		this.id=id;
		this.lore = lore;
		this.labclass = labclass;
		this.labname = labname;
		this.labDate = labDate;
		this.teacher = teacher;
	}


	public labVo(int id,String labname, String labtype ,int team,Date labDate, int kts,
			String labclass, String teacher) {
		super();
		this.id=id;
		this.labclass = labclass;
		this.labname = labname;
		this.labDate = labDate;
		this.kts = kts;
		this.team = team;
		this.teacher = teacher;
		this.labtype = labtype;

	
	}
	//实验通知
	public labVo(String labname, String labtype ,int team,Date labDate, int kts,
			String labclass, String teacher) {
		super();
		this.labclass = labclass;
		this.labname = labname;
		this.labDate = labDate;
		this.kts = kts;
		this.team = team;
		this.teacher = teacher;
		this.labtype = labtype;
	}
	
	public String getLabtype() {
		return labtype;
	}
	public void setLabtype(String labtype) {
		this.labtype = labtype;
	}
	public labVo(String lore, String labclass, String labname, Date labDate,
			int kts, int team, String teacher) {
		super();
		this.lore = lore;
		this.labclass = labclass;
		this.labname = labname;
		this.labDate = labDate;
		this.kts = kts;
		this.team = team;
		this.teacher = teacher;
	}
	public labVo(int id, String lore, String labclass, String labname,
			Date labDate, int kts, int team, String teacher) {
		super();
		this.id = id;
		this.lore = lore;
		this.labclass = labclass;
		this.labname = labname;
		this.labDate = labDate;
		this.kts = kts;
		this.team = team;
		this.teacher = teacher;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLore() {
		return lore;
	}
	public void setLore(String lore) {
		this.lore = lore;
	}
	public String getLabclass() {
		return labclass;
	}
	public void setLabclass(String labclass) {
		this.labclass = labclass;
	}
	public String getLabname() {
		return labname;
	}
	public void setLabname(String labname) {
		this.labname = labname;
	}
	public Date getLabDate() {
		return labDate;
	}
	public void setLabDate(Date labDate) {
		this.labDate = labDate;
	}
	public int getKts() {
		return kts;
	}
	public void setKts(int kts) {
		this.kts = kts;
	}
	public int getTeam() {
		return team;
	}
	public void setTeam(int team) {
		this.team = team;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

  //物品借还
	public labVo(Date borrowdate, String borrowname, String articlename,
			String model, int borrowlist, Date returndate, int returnlist,
			String returnpeople, int returnno,String returns) {
		super();
		this.borrowdate = borrowdate;
		this.borrowname = borrowname;
		this.articlename = articlename;
		this.model = model;
		this.borrowlist = borrowlist;
		this.returndate = returndate;
		this.returnlist = returnlist;
		this.returnpeople = returnpeople;
		this.returnno = returnno;
		this.returns=returns;
	}


	public Date getBorrowdate() {
		return borrowdate;
	}


	public void setBorrowdate(Date borrowdate) {
		this.borrowdate = borrowdate;
	}


	public String getBorrowname() {
		return borrowname;
	}


	public void setBorrowname(String borrowname) {
		this.borrowname = borrowname;
	}


	public String getArticlename() {
		return articlename;
	}


	public void setArticlename(String articlename) {
		this.articlename = articlename;
	}


	public String getModel() {
		return model;
	}


	public void setModel(String model) {
		this.model = model;
	}


	public int getBorrowlist() {
		return borrowlist;
	}


	public void setBorrowlist(int borrowlist) {
		this.borrowlist = borrowlist;
	}


	public Date getReturndate() {
		return returndate;
	}


	public void setReturndate(Date returndate) {
		this.returndate = returndate;
	}


	public int getReturnlist() {
		return returnlist;
	}


	public void setReturnlist(int returnlist) {
		this.returnlist = returnlist;
	}


	public String getReturnpeople() {
		return returnpeople;
	}


	public void setReturnpeople(String returnpeople) {
		this.returnpeople = returnpeople;
	}


	public int getReturnno() {
		return returnno;
	}


	public void setReturnno(int returnno) {
		this.returnno = returnno;
	}


	public String getReturns() {
		return returns;
	}


	public void setReturns(String returns) {
		this.returns = returns;
	}



	public String getReturnstate() {
		return returnstate;
	}



	public void setReturnstate(String returnstate) {
		this.returnstate = returnstate;
	}


	public int getStudentno() {
		return studentno;
	}


	public void setStudentno(int studentno) {
		this.studentno = studentno;
	}


	public String getStudentname() {
		return studentname;
	}


	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}


	public String getSax() {
		return sax;
	}


	public void setSax(String sax) {
		this.sax = sax;
	}


	public Date getBorndate() {
		return borndate;
	}


	public void setBorndate(Date borndate) {
		this.borndate = borndate;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public String getClassname() {
		return classname;
	}


	public void setClassname(String classname) {
		this.classname = classname;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getUserpwd() {
		return userpwd;
	}


	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}


	public int getFraction() {
		return fraction;
	}


	public void setFraction(int fraction) {
		this.fraction = fraction;
	}
	
	
}