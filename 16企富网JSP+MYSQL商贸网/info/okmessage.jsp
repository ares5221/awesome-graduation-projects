<%@ include file="checksession.jsp"%>
<%String sendtime=(String) session.getAttribute("time");%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../conn/ubb.jsp"%>
<%checkData cData = new checkData("");%>


<%
String mtext=request.getParameter("mtext");
cData.setS(mtext);
mtext = cData.formatHtml(true);
String sendmem=request.getParameter("sendmem");
String recemem=request.getParameter("recemem");
String flag="0";
String mtopic=request.getParameter("mtopic");




String userid=(String) session.getAttribute("userid");
String sql9="update grade set fen=(fen+1) where memid='"+userid+"'";
stmt.executeUpdate(sql9);





String sql="insert into message (sendmem,recemem,flag,mtopic,mtext,sendtime) values('"+sendmem+"','"+recemem+"','"+flag+"','"+mtopic+"','"+mtext+"','"+sendtime+"')";
stmt.executeUpdate(sql);
%>
<script language=JavaScript>{window.alert('留言已成功发送到对方留言箱!此次操作为您带来1点积分!');window.location.href='index.jsp'}</script>
<%
stmt.close(); 
con.close();
%>