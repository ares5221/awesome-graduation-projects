<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
out.print("<script language=javascript>alert('"+request.getAttribute("result")+"');window.location.href='inviteJob.do?method=queryInviteJob';</script>");


%>