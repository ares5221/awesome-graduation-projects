<%@ include file="checksession.jsp"%>
<%String fbtime=(String) session.getAttribute("time");%>
<%String pxtime=(String) session.getAttribute("pxtime");%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../conn/ubb.jsp"%>
<%
int memid = Integer.parseInt((String)request.getParameter("memid"));
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from qyml where id="+memid);
rs.next();%>

<%@ page import="com.lynews.news.*"%>

<%checkData cData = new checkData("");%>
<%
String content=request.getParameter("content");
cData.setS(content);
content = cData.formatHtml(true);
String lei=request.getParameter("lei");
String topic=request.getParameter("topic");
String fbmemid=(String)rs.getString("id");
String fbmem=rs.getString("username");
String fbmemcompany=rs.getString("qymc");
String replymem=rs.getString("username");



String sql9="update grade set fen=(fen+5) where memid='"+memid+"'";
stmt.executeUpdate(sql9);






String sql="insert into book(lei,topic,content,fbmemid,fbmem,replymem,fbtime,fbmemcompany,pxtime) values('"+lei+"','"+topic+"','"+content+"','"+fbmemid+"','"+fbmem+"','"+replymem+"','"+fbtime+"','"+fbmemcompany+"','"+pxtime+"')";
stmt.executeUpdate(sql);

%>
<script language=JavaScript>{window.alert('成功发布!此次操作为您带来5点积分!');window.location.href='../book'}</script>
<%
stmt.close(); 
con.close();
%>
