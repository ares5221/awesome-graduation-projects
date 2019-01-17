<%@ page contentType="text/html;charset=gb2312" import="com.v246.*"%>
<html>
<head>
<title>
</title>
</head>
<body>
ok
<%
	Class_addClass classes=(Class_addClass)request.getAttribute("classes");
%>
parentID:<%=classes.getParentID()%><br>
className:<%=classes.getClassName()%><br>
classDir:<%=classes.getClassDir()%><br>
maxPerPage:<%=classes.getMaxPerPage()%><br>
<br>
<br>
<br>
<br>
<br>
</body>
</html>