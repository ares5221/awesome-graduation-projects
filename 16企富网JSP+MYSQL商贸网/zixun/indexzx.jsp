<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>

<TABLE class=main cellSpacing=0 cellPadding=0 width="100%" align=center border=0 background=../images/c_cnco_bj.gif>
<TBODY>

<%int i=1;
String lei=request.getParameter("lei");
rs=stmt.executeQuery("select * from zixun where lei='"+lei+"' order by id desc");
while(rs.next()&i<60){
i++ ;%>


<TR>
<TD vAlign=center width=33>¡¤</TD>
<TD vAlign=center width=370 height=18>
<A href="../zixun/list.jsp?id=<%=rs.getString("id")%>" target=_blank><%=rs.getString("topic")%></A></FONT> </TD></TR>

<%}%>
</TBODY></TABLE>




