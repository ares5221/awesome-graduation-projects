<%@ include file="checkfinaler.jsp"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../config.jsp"%>
<%@ include file="../conn/conn.jsp"%>
<%
int id = Integer.parseInt((String)request.getParameter("id"));
stmt = con.createStatement() ;
String sql="update finalermsg set flag=1 where id="+id;
stmt.executeUpdate(sql);
%>

<script language=JavaScript>{window.location.href='mymessage.jsp'}</script>