<%@ include file="checkfinaler.jsp"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%int id = Integer.parseInt(request.getParameter("id"));
String sql3="delete from unionbar where id="+id;
stmt.executeUpdate(sql3);
stmt.close(); 
con.close();
%>
<script language=JavaScript>{window.location.href='glunion.jsp'}</script>