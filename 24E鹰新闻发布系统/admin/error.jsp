<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/aqu" prefix="aqu" %>
<html>
<body>
<c:choose>
	<c:when test="${param.id==null}">
		你是谁？想干什么？劫财还是劫色，还是想财色兼收？
	</c:when>
	<c:when test="${param.id==1}">
		该标签以经存在!
	</c:when>
	<c:when test="${param.id==10}">
		该栏目以经存在!
	</c:when>
	<c:when test="${param.id==11}">
		该栏目目录以经存在!
	</c:when>
</c:choose>
</body>
</html>