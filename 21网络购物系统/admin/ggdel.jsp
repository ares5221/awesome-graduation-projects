<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="conn.jsp"%>
<%
if(session.getAttribute("admin_name")==null){
	;}else{
			String ID=request.getParameter("id");
	int id=Cint(ID);
   sql="delete from pub where id="+id+"";
   mdb.executeDelete(sql);
   mdb.Close();
   response.sendRedirect("gg.jsp");
	}
%>