<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>

<TABLE class=main cellSpacing=0 cellPadding=0 width="100%" align=center border=0 bgcolor=f7fce9>
<TBODY>


<%int i=1;
rs=stmt.executeQuery("select * from qyml   order by id desc");
while(rs.next()&i<14){
i++ ;%>


<TR>
<TD vAlign=center width=33>&nbsp;<IMG src="../images/icon_jia.gif"></TD>
<TD vAlign=center width=370 height=18>
&nbsp;<a class='nl' title='<%=rs.getString("qymc")%>' href='../web/index.jsp?id=<%=rs.getString("id")%>' target='_blank'><%=rs.getString("qymc")%></font></a></TD></TR>

<%}%>
</TBODY></TABLE>
