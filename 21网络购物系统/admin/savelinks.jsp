<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="conn.jsp"%>
<%
if(session.getAttribute("admin_name")==null){
	;}else{

String action=request.getParameter("action");
int ac=0;
if(action.equals("add"))
ac=1;
if(action.equals("edit"))
ac=2;
if(action.equals("del"))
ac=3;

int link_id=Cint(request.getParameter("id"));
int bs=Cint(request.getParameter("bs"));

switch(ac){
case 1:
sql="Insert into ad(wordlink,url,bs) values('"+getStr(request.getParameter("wordlink"))+"','"+getStr(request.getParameter("url"))+"',"+bs+")";
mdb.executeInsert(sql);
response.sendRedirect("links.jsp");
break;
//----------------------------------------
case 2:

sql="update ad set wordlink='"+getStr(request.getParameter("wordlink"))+"',url='"+getStr(request.getParameter("url"))+"',bs="+bs+" where id="+link_id+"";
mdb.executeUpdate(sql);
response.sendRedirect("links.jsp");
break;
//--------------------------------

case 3:
	sql="delete from ad where id="+link_id+"";
mdb.executeDelete(sql);
response.sendRedirect("links.jsp");

break;
}

	}%>