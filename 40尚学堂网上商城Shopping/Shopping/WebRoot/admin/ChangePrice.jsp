<%@ page language="java" import="com.bjsxt.shopping.product.*, java.util.*" %>
<%
int id = Integer.parseInt(request.getParameter("id"));
double normalPrice = Double.parseDouble(request.getParameter("normalprice"));

System.out.println(id);
//update the database
Product p = ProductMgr.getInstance().loadById(id);
p.setNormalPrice(normalPrice);
ProductMgr.getInstance().update(p);

response.setContentType("text/html;charset=gbk");
response.setHeader("Cache-Control", "no-store"); //HTTP1.1
response.setHeader("Pragma", "no-cache"); //HTTP1.0
response.setDateHeader("Expires", 0); //prevents catching at proxy server
%>
