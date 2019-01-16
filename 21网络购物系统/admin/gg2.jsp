<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="conn.jsp"%>
<%
if(session.getAttribute("admin_name")==null){
	;}else{

String title=getStr(request.getParameter("title"));
String msg=getStr(request.getParameter("msg"));

sql="Insert into pub(title,msg,date) values('"+title+"','"+msg+"',now())";
mdb.executeInsert(sql);

mdb.Close();
response.sendRedirect("gg.jsp");

	}%>