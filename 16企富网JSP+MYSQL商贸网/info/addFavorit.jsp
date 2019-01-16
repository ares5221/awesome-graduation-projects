<%@ include file="checksession.jsp"%>
<%@ include file="../conn/time.jsp"%>
<%String sctime=(String) session.getAttribute("time");%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%
int id = Integer.parseInt((String)request.getParameter("id"));
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from sjxx where id="+id);
rs.next();

int  memid=Integer.parseInt((String) session.getAttribute("userid"));
String sjid=(String) rs.getString("id");
String sjlei=(String) rs.getString("lei");
String sjfast=(String) rs.getString("fast");
String sjtopic=(String) rs.getString("topic");

String sql="insert into Favorit (memid,sjid,sctime,sjlei,sjfast,sjtopic) values('"+memid+"','"+sjid+"','"+sctime+"','"+sjlei+"','"+sjfast+"','"+sjtopic+"')";
stmt.executeUpdate(sql);
%>
<script language=JavaScript>{window.alert(' ’≤ÿ≥…π¶!');window.location.href='Favorit.jsp'}</script>
<%
stmt.close(); 
con.close();
%>