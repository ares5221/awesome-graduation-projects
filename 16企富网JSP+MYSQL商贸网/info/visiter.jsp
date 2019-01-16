<%@ include file="checksession.jsp"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%
String sound=request.getParameter("sound");
if(Integer.parseInt(sound)==1){session.setAttribute("sound",null);}
String css=request.getParameter("css");
String loginname=(String) session.getAttribute("loginname");


String sql="update visiter set sound='"+sound+"',css='"+css+"'  where username='"+loginname+"'";
stmt.executeUpdate(sql);

%>
<script language=JavaScript>{window.alert('秘书设置成功!');window.location.href='index.jsp'}</script>
<%
stmt.close(); 
con.close();
%>