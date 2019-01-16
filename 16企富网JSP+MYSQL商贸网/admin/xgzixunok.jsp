<%@ include file="checkfinaler.jsp"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../conn/ubb.jsp"%>
<%@ page import="com.lynews.news.*"%>
<%checkData cData = new checkData("");%>
<%
stmt = con.createStatement() ;
int id = Integer.parseInt((String)request.getParameter("id"));
String topic=request.getParameter("topic");
String fbmem=request.getParameter("fbmem");
String text=request.getParameter("text");
String lei=request.getParameter("lei");
cData.setS(text);
text = cData.formatHtml(true);

String sql="update zixun set topic='"+topic+"',fbmem='"+fbmem+"',text='"+text+"',lei='"+lei+"' where id="+id;
stmt.executeUpdate(sql);

%>
<script language=JavaScript>{window.location.href='glzixun.jsp'}</script>
<%
stmt.close(); 
con.close();
%>