<link href="../conn/laba.css" rel="stylesheet" type="text/css">
<body bgcolor=fffff7>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%int i=1;
String lei=request.getParameter("lei");
String dfl=request.getParameter("dfl");
%>



<%if(lei==null){

rs=stmt.executeQuery("select * from shyfl where dfl='"+dfl+"'");
while(rs.next()&i<6){
i++ ;%>
<a href=../sj/search2.jsp?lei=0&dfl=<%=dfl%>&sfl=<%=rs.getString("sfl")%> class=s  target=_parent><%=rs.getString("sfl")%></a>&nbsp;
<%}%>
<a href=../sj/sjindex2.jsp?dfl=<%=dfl%>&lei=<%=lei%> class=s  target=_parent><b>>>更多</b></a>

<%}

else{
rs=stmt.executeQuery("select * from shyfl where dfl='"+dfl+"'");
while(rs.next()&i<4){
i++ ;%>
<a href=../sj/search2.jsp?lei=<%=lei%>&dfl=<%=dfl%>&sfl=<%=rs.getString("sfl")%> class=s  target=_parent><%=rs.getString("sfl")%></a>&nbsp;
<%}%>
<a href=../sj/sjindex2.jsp?dfl=<%=dfl%>&lei=<%=lei%> class=s  target=_parent><b>>>更多</b></a>

<%}%>



