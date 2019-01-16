<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="checksession.jsp"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../conn/conn.jsp"%>


<%@ page import="com.lynews.news.*"%>


<%
int id = Integer.parseInt((String)request.getParameter("id"));
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from photo where id="+id);
rs.next();


int  userid=Integer.parseInt((String) session.getAttribute("userid"));
if (userid==Integer.parseInt((String) rs.getString("memid"))){
String sql="delete from photo where id="+id;
stmt.executeUpdate(sql);



String picName = rs.getString("photoname");
String phototext = rs.getString("phototext");
String pathName = application.getRealPath(picName) ;
boolean del = DelHtml.del(pathName);


String sql2="delete from showbar where showphoto='"+picName+"'";
stmt.executeUpdate(sql2);



response.sendRedirect("photo.jsp");}else{%>
<script language=JavaScript>{window.alert('ÎÞÈ¨²Ù×÷!');window.location.href='photo.jsp'}</script>
<%
}
%>