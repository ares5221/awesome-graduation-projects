<%@ page contentType="text/html;charset=gb2312" import="com.v246.User"%>
<%@ taglib uri="/struts-logic" prefix="logic"%>
<%@ taglib uri="/struts-bean" prefix="bean"%>
<%@ taglib uri="/struts-html" prefix="html"%>
<html:html locale="true">
<head>
<html:base/>
<title>
</title>
</head>
<body>
<%
	User user=(User)request.getAttribute("User");
%>
已经创建了用户:
Name:<%=user.getUserName()%><br>
password:xxxxxxx
</body>
</html:html>