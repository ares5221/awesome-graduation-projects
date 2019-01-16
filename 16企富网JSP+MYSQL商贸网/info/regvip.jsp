
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../info/checksession.jsp"%>
<%@ include file="../conn/conn.jsp"%>

<%
String loginname=(String) session.getAttribute("loginname");
String sql2="update qyml set comeon=1 where username='"+loginname+"'";
stmt.executeUpdate(sql2);

%>
<script language=JavaScript>{window.alert('已提交申请!请等待我们与您的联系!');window.location.href='index.jsp'}</script>
