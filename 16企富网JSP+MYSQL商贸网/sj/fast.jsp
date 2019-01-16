<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
<%int i=1,k=1;
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from sjxx where fast=1 and ok=1 and lei=2 order by id desc");
while(rs.next()&i<12){
i++ ;%>

<td width=50%>&nbsp;<img src=../images/aer1.gif>&nbsp;<a href=sjxx.jsp?id=<%=rs.getString("id")%> target="_blank"><%=rs.getString("topic")%></a>[<%=rs.getString("fbtime")%>]
<%if (k==2){k-- ;%></tr><tr><%}else{%></tr><tr><%k++ ;}%>

<%}%>
</tr></table>