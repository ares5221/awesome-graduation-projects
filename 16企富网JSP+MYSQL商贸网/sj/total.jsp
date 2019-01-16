<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<body bgcolor=fffff7>
<%int i=1;
String lei=request.getParameter("lei");
String dfl=request.getParameter("dfl");
if(Integer.parseInt((String)lei)==0){
rs=stmt.executeQuery("select count(*) from sjxx where dfl='"+dfl+"'");
}
else{
rs=stmt.executeQuery("select count(*) from sjxx where dfl='"+dfl+"' and lei='"+lei+"'");
}
while(rs.next()) i = rs.getInt(1) ;%>
(<%=i%>)