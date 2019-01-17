<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.client.*, com.bjsxt.shopping.product.*" %>

<%
Cart c = (Cart)session.getAttribute("cart");
if(c == null) {
	c = new Cart();
	session.setAttribute("cart", c);
}

%>


<%
request.setCharacterEncoding("GBK");
String action = request.getParameter("action");
if(action != null && action.trim().equals("add")) {
	int id = Integer.parseInt(request.getParameter("id"));
	Product p = ProductMgr.getInstance().loadById(id);
	CartItem ci = new CartItem();
	ci.setProduct(p);
	ci.setCount(1);
	c.add(ci);
}

if(action != null && action.trim().equals("delete")) {
	int id = Integer.parseInt(request.getParameter("id"));
	c.deleteItemById(id);
}

if(action != null && action.trim().equals("update")) {
	for(int i=0; i<c.getItems().size(); i++) {
		CartItem ci = c.getItems().get(i);
		int count = Integer.parseInt(request.getParameter("p" + ci.getProduct().getId()));
		ci.setCount(count);
	}
}
 %> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
List<CartItem> items = c.getItems();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>购物车</title>

</head>
<body>


<form action="Buy.jsp" method="get">
<input type="hidden" name="action" value="update"/>
<table align="center" border="1">
	<tr>
		<td>产品ID</td>
		<td>产品名称</td>
		<td>购买数量</td>
		<td>单价</td>
		<td>总价</td>
		<td>处理</td>
	</tr>
	<%
	for(Iterator<CartItem> it = items.iterator(); it.hasNext(); ) {
		CartItem ci = it.next();
		%>
		<tr>
			<td><%=ci.getProduct().getId() %></td>
			<td><%=ci.getProduct().getName() %></td>
			<td>
				<input type="text" size=3 name="<%="p" + ci.getProduct().getId() %>" value="<%=ci.getCount() %>">				
			</td>
			<td><%=ci.getProduct().getNormalPrice() %></td>
			<td><%=ci.getProduct().getNormalPrice()*ci.getCount() %></td>
			<td>
				
				<a href="Buy.jsp?action=delete&id=<%=ci.getProduct().getId() %>">删除</a>
				
			</td>
		</tr>
		<%
	}
	%>
	<tr>
		<td colspan=6>
			<a href="Confirm.jsp">下单</a>
			<a href="javascript:document.forms[0].submit()">修改</a>
			
			
		</td>
	</tr>
</table>
</form>
</body>
</html>
