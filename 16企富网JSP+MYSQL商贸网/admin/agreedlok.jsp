<%@ include file="checkfinaler.jsp"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%
String id=request.getParameter("id");
String sf=request.getParameter("sf");
String dldq=request.getParameter("dldq");
String domain=request.getParameter("domain");


String sql="update dl set sf='"+sf+"',dldq='"+dldq+"',domain='"+domain+"',flag=1,new=1 where id='"+id+"'";
stmt.executeUpdate(sql);

%>
<script language=JavaScript>{window.alert('代理设置成功!');window.location.href='finaler.jsp'}</script>
<%
stmt.close(); 
con.close();
%>