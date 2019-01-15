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
	<form action="servlet/MajorServlet?method=getGrade" method="post">
		<table>
			<tr>
				<td width="31%" height="35" class="login-text02">年级编号： <br />
				</td>
				<td width="69%"><input name="gradeNo" type="text" size="30" /></td>
			</tr>
			<tr>
				<td height="35" class="login-text02">年级名称 <br />
				</td>
				<td><input name="gradeName" type="text" size="30" /></td>
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
  			<td width ="10%">年级代码</td>
			<td width = "10%">年级名称</td>
			<td> 用户操作</td>
			</tr>	
    	<c:forEach items="${gradeList}" var="gr">
			<tr>
				
				<td width ="10%">
				${gr.gradeNo }
				</td>
				<td width = "10%">
				${gr.gradeName }
				</td>
				
				<td ><a href="servlet/MajorServlet?method=delectGrade&gradeNo=${gr.gradeNo}">删除&nbsp;&nbsp;</a>
				
				<a href="javascript:openUpdateWin('jsp/tograde.jsp?gradeNo=${gr.gradeNo}')">修改</a>
			</tr>
			</c:forEach>
			
			</table>
		</form>			
	

  </body>
</html>
