<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../conn/time.jsp"%>
<%String regtime=(String) session.getAttribute("time");%>
<body bgcolor=fffff7>
<%int i=1;
String dlid=(String) session.getAttribute("dlid");
rs=stmt.executeQuery("select count(*) from qyml where regtime='"+regtime+"' and dlid='"+dlid+"' and comeon=1");
while(rs.next()) i = rs.getInt(1) ;%>
<font color=red><%=i%></font>