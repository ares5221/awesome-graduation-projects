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
String topic=request.getParameter("topic");
String fbmemid=(String)rs.getString("id");
String fbmem=rs.getString("username");
String fbmemcompany=rs.getString("qymc");
String replymem=rs.getString("username");
String topicid=request.getParameter("topicid");
String ForR="1";



String sql2="update book set replymem='"+fbmem+"',fbtime='"+fbtime+"',pxtime='"+pxtime+"',replynum=(replynum+1) where id='"+topicid+"'";
stmt.executeUpdate(sql2);


String sql="insert into book(topic,content,fbmemid,fbmem,fbtime,fbmemcompany,ForR,topicid) values('"+topic+"','"+content+"','"+fbmemid+"','"+fbmem+"','"+fbtime+"','"+fbmemcompany+"','"+ForR+"','"+topicid+"')";
stmt.executeUpdate(sql);






%>
<script language=JavaScript>{window.location.href='../book/read.jsp?id=<%=topicid%>'}</script>
<%
stmt.close(); 
con.close();
%>
