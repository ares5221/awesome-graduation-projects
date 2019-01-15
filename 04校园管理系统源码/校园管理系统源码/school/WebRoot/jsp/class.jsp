<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'class.jsp' starting page</title>

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
	<form action="servlet/MajorServlet?method=getclass" name="fom" id="fom"
		method="post">
		<table>

			<select name="mNo" value="mNo">
				<option>--请选择专业名称--</option>
				<c:forEach items="${majorList }" var="ma">
					<option value="${ma.mno }">${ma.mname}</option>
				</c:forEach>
			</select>
			<select name="gradeNo" value="gradeName">
				<option>--请选择年级名称--</option>
				<c:forEach items="${gradeList }" var="gr">
					<option value="${gr.gradeNo }">${gr.gradeName}</option>
				</c:forEach>
			</select>
			<tr>
				<td>班级编号： <br />
				</td>
				<td><input name="classId" type="text" size="30" /></td>
			</tr>
			<tr>
				<td class=>班级名称 <br />
				</td>
				<td><input name="className" type="text" size="30" /></td>
			</tr>
			<tr>
				<td height="35">&nbsp;</td>
				<td><input name="Submit2" type="reset" class="button"
					value="重置" /> <input name="Submit232" type="submit" class="button"
					value="提交" /></td>
			</tr>
		</table>
		<table>
			<td width="10%">班级编号</td>
			<td width="10%">专业名称</td>
			<td width="10%">年级名称</td>
			<td width="10%">班级名称</td>
			<td>用户操作</td>
			<c:forEach items="${classList}" var="class1">
				<tr>

					<td width="10%">${class1.classId}</td>
					<td width="10%">${class1.mno}</td>
					<td width="10%">${class1.gradeNo}</td>
					<td width="10%">${class1.className}</td>
					<td><a
						href="servlet/MajorServlet?method=delectClass&classId=${class1.classId}">删除&nbsp;&nbsp;</a>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>
