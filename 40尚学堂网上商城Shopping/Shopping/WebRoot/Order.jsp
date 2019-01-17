<%@ page language="java" contentType="text/html; charset=GB18030"
	import="com.bjsxt.shopping.user.*,com.bjsxt.shopping.client.*,com.bjsxt.shopping.order.*,java.util.*"
	pageEncoding="GB18030"%>


<%
	request.setCharacterEncoding("GBK");

	User u = (User) session.getAttribute("user");
	if (u == null) {
		response.sendRedirect("UserLogin.jsp");
		return;
	}

	Cart c = (Cart) session.getAttribute("cart");
	if (c == null) {
		c = new Cart();
		session.setAttribute("cart", c);
	}

	String addr = request.getParameter("addr");
	u.setAddr(addr);

	int orderId = u.buy(c); 

	session.removeAttribute("cart");
%>

╣╔ряоб! ╨е:
<%=orderId%>
