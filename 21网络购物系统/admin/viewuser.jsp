<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%
if(session.getAttribute("admin_name")==null){
	;}else{

%>
<%@ include file="conn.jsp"%>
<%
if(request.getParameter("action").equals("deluser")){
	int user_id=Integer.parseInt(request.getParameter("user_id"));
    sql="select * from member where user_id="+user_id+"";
    rs=mdb.executeQuery(sql);
    if(!rs.next())
        out.print("<center>用户信息已删除!");
    else{
        sql="delete from member where user_id="+user_id+"";
		mdb.executeDelete(sql);
        out.print("<center>用户信息已删除!");
    }
} 
	mdb.Close();}
	%>