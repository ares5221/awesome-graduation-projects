<%@ include file="checksession.jsp"%>
<%String fbtime=(String) session.getAttribute("time");%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../conn/ubb.jsp"%>

<%@ page import="com.lynews.news.*"%>

<%checkData cData = new checkData("");%>
<%
String content=request.getParameter("content");
cData.setS(content);
content = cData.formatHtml(true);
String lei=request.getParameter("lei");
String topic=request.getParameter("topic");
String myname=request.getParameter("myname");
String tel=request.getParameter("tel");
String fax=request.getParameter("fax");
String email=request.getParameter("email");
String fbmemcompany=request.getParameter("fbmemcompany");
String jobaddress=request.getParameter("jobaddress");
String fbmemid=request.getParameter("fbmemid");
String jobnum=request.getParameter("jobnum");
String fbmem=request.getParameter("fbmem");
String address=request.getParameter("address");



String userid2=(String) session.getAttribute("userid");
String sql9="update grade set fen=(fen+3) where memid='"+userid2+"'";
stmt.executeUpdate(sql9);


String sql="insert into job(lei,topic,fbtime,content,myname,tel,fax,email,fbmemcompany,jobaddress,fbmemid,jobnum,fbmem,address) values('"+lei+"','"+topic+"','"+fbtime+"','"+content+"','"+myname+"','"+tel+"','"+fax+"','"+email+"','"+fbmemcompany+"','"+jobaddress+"','"+fbmemid+"','"+jobnum+"','"+fbmem+"','"+address+"')";
stmt.executeUpdate(sql);

%>
<script language=JavaScript>{window.alert('成功发布!此次操作为您带来3点积分!');window.location.href='gljob.jsp'}</script>
<%
stmt.close(); 
con.close();
%>
