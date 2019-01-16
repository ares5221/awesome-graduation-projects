<%@ page contentType="text/html;charset=gb2312" %><%
String Did=request.getParameter("Did");
session.setAttribute("Did",Did);%>
<%@ include file="../config.jsp"%>
<%@ include file="../conn/conn.jsp"%>
<%
rs=stmt.executeQuery("SELECT * from dl where id='"+Did+"'");
rs.next();
if (Integer.parseInt((String)rs.getString("flag"))==1){
session.setAttribute("dldq",rs.getString("dldq"));
}else{
session.setAttribute("Did",null);
}
response.sendRedirect("../index.jsp");
%>
