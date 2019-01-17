<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.stat.*, java.util.*"%>

<%
List<ProductStatItem> items = StatService.getProductsBySaleCount(); 
String imgName = (String)request.getAttribute("imgName");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>用户列表</title>
</head>
<body>
<table align="center" border="1">
	<tr>
		<td>name</td>
		<td>count</td>
		
	</tr>
	<%
	for(int i=0; i<items.size(); i++) {
		ProductStatItem p = items.get(i);
		%>
		<tr>
			<td><%=p.getProductName() %></td>
			<td><%=p.getTotalSalesCount() %></td>
			
		</tr>
		<%
	}
	%>
	
</table>

<img src="<%=request.getContextPath()%>/admin/images/stat/<%=imgName%>"></img>
</body>
</html>