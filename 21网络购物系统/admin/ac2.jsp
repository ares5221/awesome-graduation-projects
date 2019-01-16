<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*,java.util.Date" errorPage="" %>
<%@ include file="conn.jsp"%>
<%
if(session.getAttribute("admin_name")!=null){
//--------------------------------------logged------------------------------------------------------------------

String  admin_name=getStr(request.getParameter("admin_name"));
String  admin_pass=getStr(request.getParameter("admin_pass"));
sql="select * from admin where admin_name='"+admin_name+"'";
rs=mdb.executeQuery(sql);
if(rs.next()){
  out.print("此管理员已经存在!");
  rs.close();
}else
{
sql="insert into admin (admin_name,admin_pass) values('"+admin_name+"','"+admin_pass+"')";
mdb.executeInsert(sql);
response.sendRedirect("ac.jsp");

}

}
mdb.Close();
%>