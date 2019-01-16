<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>

<TABLE class=main cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
<TBODY>

<%int i=1;
rs=stmt.executeQuery("select * from sjxx where ok=1 order by id desc");
while(rs.next()&i<14){
i++ ;%>

<TR>
<TD vAlign=center width=33>&nbsp;<IMG src="../images/ring01.gif"></TD>
<TD vAlign=center width=370 height=18>
&nbsp;<A  href="sjxx.jsp?id=<%=rs.getString("id")%>" target="_blank"><%=rs.getString("topic")%></A></TD></TR>

<%}%>
</TBODY></TABLE>




