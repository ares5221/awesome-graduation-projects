<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%String memid = (String)request.getParameter("id");
rs=stmt.executeQuery("SELECT * from qyml where id='"+memid+"'");
rs.next();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<title><%=rs.getString("qymc")%></title>

<%
stmt = con.createStatement() ;
String sql2="SELECT * from web where memid='"+memid+"'";
ResultSet rs2=stmt.executeQuery(sql2) ;
rs2.next();
%>

<frameset framespacing="0" border="0" rows="0,*" frameborder="0">
<frame name="header" scrolling="no" noresize target="main" src="title.htm">
<frame name="main" src="<%=rs2.getString("css")%>/index.jsp?id=<%=rs2.getString("memid")%>" scrolling="auto">
<noframes>
<body>
<p>此网页使用了框架，但您的浏览器不支持框架。</p>
</body>
</noframes>
</frameset>
</html>