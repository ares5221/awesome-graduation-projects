<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%
stmt = con.createStatement() ;
String dlname=request.getParameter("dlname");
String password=request.getParameter("password");
rs=stmt.executeQuery("SELECT * from dl where dlname='"+dlname+"'");

if(!rs.next())
{
response.sendRedirect("index.jsp");
}else
{

rs.first();
String passDB = rs.getString("password");//拿到数据库中的密码
if(passDB.equals(password)){//与用户填写的密码比较,


if (Integer.parseInt((String)rs.getString("flag"))==1){
String id=rs.getString("id");
String dldq=rs.getString("dldq");
session.setAttribute("dlid",id);
session.setAttribute("dlname",dlname);
session.setAttribute("dldq",dldq);
response.sendRedirect("indexdl.jsp");
}else{%>

<script language=JavaScript>{window.alert('代理权尚在审核中!');window.location.href='../index.jsp'}</script>


<%
}
}
else{
response.sendRedirect("index.jsp");
}
%>



<%
}
stmt.close(); 
con.close();
%>