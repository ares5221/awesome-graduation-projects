<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="checkfinaler.jsp"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.lynews.news.*"%>
<%@ include file="../conn/conn.jsp"%>
<%
int id = Integer.parseInt((String)request.getParameter("id"));
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from sjxx where id="+id);
rs.next();

String sql="delete from sjxx where id="+id;
stmt.executeUpdate(sql);


if(Integer.parseInt((String)rs.getString("main"))==1){
String fileName = "../sj/html/"+rs.getString("fileName");
String pathName = application.getRealPath(fileName) ;
boolean del = DelHtml.del(pathName);
}


String sql3="delete from Favorit where sjid="+id;
stmt.executeUpdate(sql3);




response.sendRedirect("glsj.jsp");

%>