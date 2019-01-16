<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="conn.jsp"%>
<%
String options=request.getParameter("options");
int op=0;
if(options.equals("rename"))
op=1;
if(options.equals("del"))
op=2;
if(options.equals("new"))
op=3;
int subject=Integer.parseInt(request.getParameter("subject"));
   switch(op){
     case 1:
       sql= "update Nsort set Nsort_name='"+(request.getParameter("reTitle")).trim()+"',sort_id="+Integer.parseInt(request.getParameter("sort_id"))+" where Nsort_id="+subject+"";
	   mdb.executeUpdate(sql);
         break;
     case 2:
	   
       sql="delete from Nsort where Nsort_id="+subject+"";
       mdb.executeDelete(sql);
	
       sql="delete from hw where Nsort_id="+subject+"";
       mdb.executeDelete(sql);
	   break;

     case 3:
       sql="Insert into Nsort(Nsort_name,sort_id) values('"+getStr(request.getParameter("newTitle"))+"',"+Integer.parseInt(request.getParameter("psubject"))+")";
       mdb.executeInsert(sql);
       break;
   }
     %>
<html>
<head>
<title>修改成功</title>
<meta http-equiv="refresh" content='1; URL=addsort.jsp'>
<link rel="stylesheet" href="css.css">
</head>
<body>
<br><br><p align="center"><b>专题修改成功！</b></p>

<%
 mdb.Close();
%>