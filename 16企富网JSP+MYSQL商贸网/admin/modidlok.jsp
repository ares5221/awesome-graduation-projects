<%@ include file="checkfinaler.jsp"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%
String id=request.getParameter("id");
String sf=request.getParameter("sf");
String dldq=request.getParameter("dldq");
String dlname=request.getParameter("dlname");
String password=request.getParameter("password");
String letname=request.getParameter("letname");
String address=request.getParameter("address");
String post=request.getParameter("post");
String tel=request.getParameter("tel");
String email=request.getParameter("email");
String QQ=request.getParameter("qq");
String domain=request.getParameter("domain");

String sql="update dl set sf='"+sf+"',dldq='"+dldq+"',dlname='"+dlname+"',password='"+password+"',letname='"+letname+"',address='"+address+"',post='"+post+"',tel='"+tel+"',email='"+email+"',QQ='"+QQ+"',domain='"+domain+"',flag=1,new=1 where id='"+id+"'";
stmt.executeUpdate(sql);

%>
<script language=JavaScript>{window.alert('代理设置成功!');window.location.href='finaler.jsp'}</script>
<%
stmt.close(); 
con.close();
%>