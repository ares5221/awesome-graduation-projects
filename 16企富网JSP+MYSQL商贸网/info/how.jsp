<%@ include file="checksession.jsp"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../conn/time.jsp"%>
<%String fbtime=(String) session.getAttribute("time");%>
<link href="../conn/laba.css" rel="stylesheet" type="text/css">
<BODY leftMargin=0 marginwidth="0"  topMargin=0 bgcolor=ffffd6>

<%
int i=0 ,k=0, Results=0 ,s;

stmt = con.createStatement() ;
String userid=(String) session.getAttribute("userid");
rs=stmt.executeQuery("SELECT count(*) from dingzhisj  where memid='"+userid+"' order by id desc");
while(rs.next()) k = rs.getInt(1) ;

stmt = con.createStatement() ;
String sql1="SELECT * from dingzhisj where memid='"+userid+"' order by id desc";
ResultSet rs1=stmt.executeQuery(sql1) ;
while(rs1.next()&i<k){
i++ ;

s=0;
String gjz=rs1.getString("gjz");
String lei=rs1.getString("lei");
String dq=rs1.getString("dq");

stmt = con.createStatement() ;
String sql2="SELECT count(*) from sjxx  where (topic like '%"+gjz+"%' or content like '%"+gjz+"%') and  fbtime='"+fbtime+"'  and  lei='"+lei+"' order by id desc";
ResultSet rs2=stmt.executeQuery(sql2) ;
while(rs2.next()) s = rs2.getInt(1) ;

Results = Results + s;

}
%>

<center><A href=mysj.jsp class=C   target="_blank"><font color=red><%=Results%></font></a></center>