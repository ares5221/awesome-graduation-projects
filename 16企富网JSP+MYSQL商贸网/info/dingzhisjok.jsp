<%@ include file="checksession.jsp"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>

<%
String lei=request.getParameter("lei");
String gjz=request.getParameter("gjz");
String memid=(String) session.getAttribute("userid");

stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from dingzhisj where memid='"+memid+"' and gjz='"+gjz+"' and lei='"+lei+"'  order by id desc");
if(!rs.next()){


String sql="insert into dingzhisj (lei,gjz,memid) values('"+lei+"','"+gjz+"','"+memid+"')";
stmt.executeUpdate(sql);
%>
<script language=JavaScript>{window.location.href='dingzhisj.jsp'}</script>
<%
stmt.close(); 
con.close();



}
else
{%>
<script language=JavaScript>{window.alert('对不起！不要重复定制相同的商机!');window.history.go(-1);}</script>
<%}
%>