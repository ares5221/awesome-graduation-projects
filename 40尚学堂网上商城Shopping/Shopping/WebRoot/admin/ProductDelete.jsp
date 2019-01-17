<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.product.*"%>

<%
int id = Integer.parseInt(request.getParameter("id"));

ProductMgr.getInstance().delete(id);
%>

<html>
	<head>
		<title>删除产品</title>
	</head>
	<center>
		删除成功！
	</center>
	<body>
		<script type="text/javascript">	
			parent.main.location.reload();
		</script>
	</body>
</html>