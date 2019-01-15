<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
 	 <body>
 	 <h1>代码维护功能</h1>
	 <a  href="servlet/MajorServlet?method=showMajor" >专业代码模块</a><br/>
	
    <a href="servlet/MajorServlet?method=showGrade" >年级代码模块</a><br/>
     <a href="servlet/MajorServlet?method=showCourse" >学科课程编码信息<br/>
     <a href="servlet/MajorServlet?method=showClass" >班级信息<br/>
    
     
     
     
  </body>
  
</html>
