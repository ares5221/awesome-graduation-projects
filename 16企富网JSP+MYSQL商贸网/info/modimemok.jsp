<%@ include file="checksession.jsp"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../conn/ubb.jsp"%>
<%checkData cData = new checkData("");%>
<%
String qyjj=request.getParameter("qyjj");
cData.setS(qyjj);
qyjj = cData.formatHtml(true);
String question=request.getParameter("question");
String answer=request.getParameter("answer");
String myname=request.getParameter("myname");
String address=request.getParameter("address");
String post=request.getParameter("post");
String zw=request.getParameter("zw");
String tel=request.getParameter("tel");
String fax=request.getParameter("fax");
String email=request.getParameter("email");
String web=request.getParameter("web");
String qymc=request.getParameter("qymc");
String loginname=(String) session.getAttribute("loginname");


String sql="update qyml set question='"+question+"',answer='"+answer+"',myname='"+myname+"',address='"+address+"',post='"+post+"',tel='"+tel+"',fax='"+fax+"',email='"+email+"',web='"+web+"',qymc='"+qymc+"',qyjj='"+qyjj+"',zw='"+zw+"'  where username='"+loginname+"'";
stmt.executeUpdate(sql);

%>
<script language=JavaScript>{window.alert('资料修改成功!');window.location.href='index.jsp'}</script>
<%
stmt.close(); 
con.close();
%>