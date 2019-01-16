<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../conn/time.jsp"%>
<%String regtime=(String) session.getAttribute("time");%>
<body bgcolor=fffff7>
<%int i=1;
rs=stmt.executeQuery("select count(*) from dl");
while(rs.next()) i = rs.getInt(1) ;%>
<font color=red><%=i%></font>