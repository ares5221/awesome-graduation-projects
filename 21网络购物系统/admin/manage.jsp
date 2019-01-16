<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>

<%
if(session.getAttribute("admin_name")==null)
   { 
    response.sendRedirect("login.jsp");
}
else{
%>
<html>
<head>
<title>ทฒศหอ๘ย็นบฮ๏ษฬต๊</title>
</head>
<frameset framespacing="0" border="false" cols="180,*" frameborder="0"> 
  <frame name="left"  scrolling="yes" marginwidth="0" marginheight="0" src="left.jsp">
  <frame name="right" scrolling="yes" src="main.html">
</frameset>
<noframes>
</noframes> 
</html>
<%
}
%>