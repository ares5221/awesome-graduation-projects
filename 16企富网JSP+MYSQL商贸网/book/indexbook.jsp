<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>

<TABLE class=main cellSpacing=0 cellPadding=0 width="100%" align=center border=0 background=../images/c_cnco_bj.gif>
<TBODY>

<%int i=1;
int status=Integer.parseInt((String)request.getParameter("status"));
if(status==1){
rs=stmt.executeQuery("select * from book where status=1 and ForR=0 order by status desc,pxtime desc");
}else{
rs=stmt.executeQuery("select * from book where status=0 and ForR=0 order by status desc,pxtime desc");
}
while(rs.next()&i<10){
i++ ;%>

<TR>
<TD vAlign=center width=33>¡¤</TD>
<TD vAlign=center width=370 height=18>
<A href="../book/read.jsp?id=<%=rs.getString("id")%>" target=_blank><%=rs.getString("topic")%></A></FONT> </TD></TR>

<%}%>
</TBODY></TABLE>
