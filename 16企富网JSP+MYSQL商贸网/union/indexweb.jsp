<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>

<TABLE class=main cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
<TBODY>


<%int i=1;
rs=stmt.executeQuery("select * from unionbar where ok=1 order by id desc");
while(rs.next()&i<14){
i++ ;%>


<TR>
<TD vAlign=center width=33>&nbsp;<IMG src="../images/icon_jia.gif"></TD>
<TD vAlign=center width=370 height=18>
&nbsp;<a class='nl' title='<%=rs.getString("webname")%>' href='url.jsp?id=<%=rs.getString("id")%>' target='_blank'><%=rs.getString("webname")%></font></a></TD></TR>

<%}%>
</TBODY></TABLE>
