<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<body bgcolor=ffffff>
<%int i=1;
String lei=request.getParameter("lei");
String sfl=request.getParameter("sfl");
if(Integer.parseInt((String)lei)==0){
rs=stmt.executeQuery("select count(*) from sjxx where sfl='"+sfl+"'");
}
else{
rs=stmt.executeQuery("select count(*) from sjxx where sfl='"+sfl+"' and lei='"+lei+"'");
}
while(rs.next()) i = rs.getInt(1) ;%>
(<%=i%>)