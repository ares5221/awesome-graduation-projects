<%@ include file="checksession.jsp"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%
String css=request.getParameter("css");
String memid=(String) session.getAttribute("userid");


String sql="update web set css='"+css+"' where memid='"+memid+"'";
stmt.executeUpdate(sql);

%>
<script language=JavaScript>{window.alert('您的网站更新成功!');window.location.href='glweb.jsp'}</script>
<%
stmt.close(); 
con.close();
%>