<%@ include file="checkfinaler.jsp"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../config.jsp"%>
<%@ include file="../conn/conn.jsp"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
int  domainstatus =Integer.parseInt(request.getParameter("domainstatus"));

String sql="update dl set domainstatus='"+domainstatus+"'where id="+id;
stmt.executeUpdate(sql);
%>

<script language=JavaScript>{window.location.href='alldomain.jsp'}</script>