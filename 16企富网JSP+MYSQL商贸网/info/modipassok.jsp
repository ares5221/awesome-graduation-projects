<%@ include file="checksession.jsp"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%
String oldpass=request.getParameter("oldpass");
String pass=request.getParameter("pass");
String loginname=(String) session.getAttribute("loginname");


rs=stmt.executeQuery("SELECT * from qyml where username='"+loginname+"'");
rs.next();
if(rs.getString("pass").compareTo(oldpass)==0)
{


String sql2="update qyml set pass='"+pass+"' where username='"+loginname+"'";
stmt.executeUpdate(sql2);

%>
<script language=JavaScript>{window.alert('密码修改成功!');window.location.href='index.jsp'}</script>

<%}else{%><script language=JavaScript>{window.alert('旧密码认证失败');window.location.href='modipass.jsp'}</script><%}%>