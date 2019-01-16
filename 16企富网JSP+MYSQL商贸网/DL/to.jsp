<%@ include file="checkdl.jsp"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../config.jsp"%>
<%@ include file="../conn/conn.jsp"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
int  yue =Integer.parseInt(request.getParameter("yue"));
int  comeon =Integer.parseInt(request.getParameter("comeon"));
int  frocen =Integer.parseInt(request.getParameter("frocen"));
int  vip =Integer.parseInt(request.getParameter("vip"));


stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from qyml where id='"+id+"'");
rs.next();

int  dlid=Integer.parseInt((String) session.getAttribute("dlid"));
if (dlid==Integer.parseInt((String) rs.getString("dlid"))){


String sql="update qyml set yue='"+yue+"',comeon='"+comeon+"',frocen='"+frocen+"',vip='"+vip+"' where id="+id;
stmt.executeUpdate(sql);

if(vip==1){

String sql2="update grade set fen=10000 where id="+id;
stmt.executeUpdate(sql2);
}else{

String sql2="update grade set fen=100  where id="+id;
stmt.executeUpdate(sql2);
}



}else{%>
<script language=JavaScript>{window.alert('ÎÞÈ¨²Ù×÷!');window.location.href='indexdl.jsp'}</script>
<%
}
%>

<script language=JavaScript>{window.location.href='indexdl.jsp'}</script>