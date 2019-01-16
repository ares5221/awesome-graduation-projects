<%@ include file="checksession.jsp"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../conn/time.jsp"%>

<%String friendtime=(String) session.getAttribute("time");%>

<%
String friendid=request.getParameter("friendid");
String friendname=request.getParameter("friendname");
String friendcompany=request.getParameter("friendcompany");
String memid=(String) session.getAttribute("userid");


String sql9="update grade set fen=(fen+3) where memid='"+memid+"'";
stmt.executeUpdate(sql9);


String sql="insert into friend (friendid,friendname,friendcompany,memid,friendtime) values('"+friendid+"','"+friendname+"','"+friendcompany+"','"+memid+"','"+friendtime+"')";
stmt.executeUpdate(sql);
%>
<script language=JavaScript>{window.alert('已成功将对方加为您的商友!此次操作为您带来3点积分!');window.location.href='friend.jsp'}</script>
<%
stmt.close(); 
con.close();
%>