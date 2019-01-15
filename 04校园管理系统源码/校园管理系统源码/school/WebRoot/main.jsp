<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"></base>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>校园管理系统界面</title>
</head>
<frameset rows="88,*,31" cols="*" frameborder="no" border="0"
	framespacing="0">
	<frame src="frame/top.jsp" name="topFrame" scrolling="no" noresize="noresize"
		id="topFrame" title="topFrame" />
	<frameset cols="187,*" frameborder="no" border="0" framespacing="0">
		<frame src="frame/left.jsp" name="leftFrame" scrolling="no"
			noresize="noresize" id="leftFrame" title="leftFrame" />
		<frame src="frame/index.jsp" name="rightFrame" id="rightFrame"
			title="rightFrame" />
	</frameset>
	<frame src="frame/footer.jsp" name="bottomFrame" scrolling="no"
		noresize="noresize" id="bottomFrame" title="bottomFrame" />
</frameset>
<noframes>
	<body>
	</body>
</noframes>
</html>

