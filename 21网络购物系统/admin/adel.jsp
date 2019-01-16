
<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*,java.util.Date" errorPage="" %>
<%@ include file="conn.jsp"%>
<%
if(session.getAttribute("admin_name")!=null){
//--------------------------------------logged------------------------------------------------------------------
  String admin_ids=request.getParameter("admin_id");
  if(admin_ids!=null){
    int admin_id=Cint(admin_ids);
   sql="delete * from admin where admin_id="+admin_id;
   mdb.executeDelete(sql);
   response.sendRedirect("ac.jsp");
   }
 }
%>