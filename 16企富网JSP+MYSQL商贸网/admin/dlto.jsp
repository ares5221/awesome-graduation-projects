<%@ include file="checkfinaler.jsp"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%
String id=request.getParameter("id");
String sql="update dl set new=1 where id='"+id+"'";
stmt.executeUpdate(sql);

%>
<script language=JavaScript>{window.location.href='finaler.jsp'}</script>
<%
stmt.close(); 
con.close();
%>