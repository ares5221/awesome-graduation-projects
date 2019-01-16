<%if ((String) session.getAttribute("login")==null){response.sendRedirect("../info/");}%>
<%@ page import="com.ntsky.file.*,java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="phototime.jsp"%>

<%
String phototime=(String) session.getAttribute("time");
String pname=(String) session.getAttribute("loginname")+phototime;%>


<%
	FILE file = new FileHandle();
	// jsp调用初始化
	file.initialize(pageContext);

	/**
	 * 文件参数对象
	 */
	FileParam param = new FileParam();
	// 文件目录
	param.setFileDir("uploadphoto");
	// 文件名
	param.setFileName(pname);
	// 这里的1000代表 1M
	param.setFileSize(100000);
	
	// 允许上传的文件总大小
	param.setFileTotalSize(1000000);
	// 文件格式
	param.setFileType("jpg,gif,bmp");

	// 该目录允许上传的文件总数 
	param.setFileNum(20);
	// 图片上传
	/*
	// 设置允许上传图片
	param.setPic(true);

	// 设置图片属性
	JPEG jpeg = new JPEG();
	// 图片高度
	jpeg.setPicHeight(300);
	// 图片宽度
	jpeg.setPicWidth(200);
	
	// 缩略图片的路径
	jpeg.setPicPath("smallPic");
	// 缩略图片的文件名
	//jpeg.setPicName("sl");
	// 是否删除原来的图片
	//jpeg.setDelSourcePic(true);

	param.setJpeg(jpeg);*/
	//添加参数
	file.setFileParam(param);
	// 执行上传
	out.print(file.service(request)+"<br/>");
	
	out.println("text1 = " + file.getContent("text1")+"<br/>");
%>






<%
String  photoname=file.getContent("text1");
String  memid=(String) session.getAttribute("userid");
String phototext=pname;
String sql="insert into photo(photoname,phototext,phototime,memid) values('"+photoname+"','"+phototext+"','"+phototime+"','"+memid+"')";
stmt.executeUpdate(sql);
response.sendRedirect("photo.jsp");
%>











