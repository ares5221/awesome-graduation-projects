<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
  <body>
   <form action="servlet/CourseServlet?method=add" method="post">
   <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
		<tr>
			<th class="tablestyle_title">学生成绩录入</th>
		</tr>
		<tr>
			<td class="CPanel">
			<table align="center" border="0" cellpadding="0" cellspacing="0" style="width:60%">
			<TR>
			<TD width="60%">
				<fieldset style="height:100%;">
					<legend>成绩录入</legend>
				   	<table align="center">
				   		<tr>
				  			<td width="150px">学生编号：</td>
				  			<td width="280px">
				  				<input type="text" id="sno" name="sno">
				  			</td>
				  		</tr>
				  		<tr>
				  			<td  width="150px">学生姓名：</td>
				  			<td><input type="text" name="sname" id="sname">
				  			</td>
				  		</tr>
				   		<tr>
				  			<td width="150px">考试类别：</td>
				  			<td width="280px">
				  				<input type="text" name="examType" id="examType">
				  			</td>
				  		</tr>
				  		<tr>
				  			<td  width="150px">考试日期：</td>
				  			<td>
				  				<input type="text" name="examDate" id="examDate" onfocus="WdatePicker()">
				  			</td>
				  		</tr>
				   		<tr>
				   			<td width="150px">操 作 员：</td>
				  			<td width="280px">
				  				<input type="text" name="operator" id="operator" value=${user.userName } readonly="readonly">
				  			</td>
				  		</tr>
				  		<tr>
				  			<td width="150px">课程编号：</td>
				  			<td width="150px">
				  				<input type="text" name="courseno" id="courseno">
				  			</td>
				   		</tr>
				   		<tr>
				  			<td width="150px">分&nbsp;&nbsp;数：</td>
				  			<td width="150px">
				  				<input type="text" name="score" id="score">
				  			</td>
				   		</tr>
				   	</table>
				   	<br>
				   	<table align="center">
					   	<tr>
					   		<td>
						   	<input type="submit" value="提交" >&nbsp;&nbsp;
						  	<input type="reset" value="重置" >
						  	</td>
					  	</tr>
				  	</table>
  				</fieldset>
			</TD>
		</TR>
		</table>
   </form>
  </body>
</html>
