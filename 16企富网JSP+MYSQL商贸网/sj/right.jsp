<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>

<TABLE class=main cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
<TBODY>

<%int i=1;
String lei=request.getParameter("lei");
if(lei==null){
rs=stmt.executeQuery("select * from sjxx where ok=1  order by id desc");
}else{
rs=stmt.executeQuery("select * from sjxx where lei='"+lei+"' and ok=1  order by id desc");
}
while(rs.next()&i<60){
i++ ;%>


<TR>
<TD vAlign=center width=33>&nbsp;&nbsp;<IMG src="../images/ring02.gif"><BR></TD>
<TD vAlign=center width=370 height=18>
<A  href="sjxx.jsp?id=<%=rs.getString("id")%>" target="_blank"><%=rs.getString("topic")%>...</A> 
<FONT color=#999999>[<%=rs.getString("fbtime")%>]</FONT> </TD></TR>

<%}%>
</TBODY></TABLE>




