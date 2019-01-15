<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Major.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script>
  function openUpdateWin(url){
			//alert(url);""
			window.open(url,"","width=600,height=400");
	}
  
  </script>
  <body>
	<form action="servlet/MajorServlet?method=getCouse" method="post">
		<table>
			<tr>
				<td width="31%" height="35" class="login-text02">学科编号： <br />
				</td>
				<td width="69%"><input name="courseNo" type="text" size="30" /></td>
			</tr>
			<tr>
				<td height="35" class="login-text02">学科名称 <br />
				</td>
				<td><input name="courseName" type="text" size="30" /></td>
			</tr>
			<tr>
				<td height="35">&nbsp;</td>
				<td><input name="Submit2" type="reset" class="button"
					value="重置" /> <input name="Submit232" type="submit" class="button"
					value="提交" /></td>
			</tr>
		</table>
		${error}
	</form>
	<form>
		<table >
 		 <tr>	
  			<td width ="10%">学科代码</td>
			<td width = "10%">学科名称</td>
			<td> 用户操作</td>
			</tr>	
    	<c:forEach items="${courseList}" var="co">
			<tr>
				
				<td width ="10%">
				${co.courseno}
				</td>
				<td width = "10%">
				${co.coursename}
				</td>
				
				<td ><a href="servlet/MajorServlet?method=delectCourse&courseNo=${co.courseno}">删除&nbsp;&nbsp;</a>
				
				<a href="javascript:openUpdateWin('jsp/tocourse.jsp?courseNo=${co.courseno}')">修改</a>
			</tr>
			</c:forEach>
			
			</table>
		</form>			
	

  </body>
</html>
