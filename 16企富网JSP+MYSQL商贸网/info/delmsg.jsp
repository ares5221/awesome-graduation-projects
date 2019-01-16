<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="checksession.jsp"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.lynews.news.*"%>
<%@ include file="../conn/conn.jsp"%>
<%
int id = Integer.parseInt((String)request.getParameter("id"));
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from message where id="+id);
rs.next();
int  userid=Integer.parseInt((String) session.getAttribute("userid"));
if (userid==Integer.parseInt((String) rs.getString("recemem"))){

String sql3="delete from message where id="+id;
stmt.executeUpdate(sql3);


response.sendRedirect("mymessage.jsp");}else{%>
<script language=JavaScript>{window.alert('ÎÞÈ¨²Ù×÷!');window.location.href='glsj.jsp'}</script>
<%
}
%>