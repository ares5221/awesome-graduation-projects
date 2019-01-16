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
       
       sql= "update sort set sort_name='"+getStr(request.getParameter("reTitle"))+"' where sort_id="+subject+"";
       mdb.executeUpdate(sql);
	
       break;
     case 2:
		 
        sql="delete from sort where sort_id="+subject+"";
        mdb.executeDelete(sql);
	
        sql="delete from Nsort where sort_id="+subject+"";
        mdb.executeDelete(sql);
	
        sql="delete from hw where sort_id="+subject+"";
        mdb.executeDelete(sql);
	 
       break;
     case 3:
       
       sql="Insert into sort(sort_name) values('"+getStr(request.getParameter("newTitle"))+"')";
       mdb.executeInsert(sql);

       break;
   }
     %>
<html>
<head>
<title>修改成功</title>
<meta http-equiv="refresh" content='0; URL=addsort.jsp'>
<link rel="stylesheet" href="css.css">
</head>
<body>
<br><br><p align="center"><b>类别修改成功！</b></p>

<%
mdb.Close();
%>