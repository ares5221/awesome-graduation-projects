<%@ include file="checkadmin.jsp"%>
<%@ include file="checksession.jsp"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%int id = Integer.parseInt(request.getParameter("id"));
String sql="delete from book where topicid="+id;
stmt.executeUpdate(sql);
String sql3="delete from book where id="+id;
stmt.executeUpdate(sql3);
stmt.close(); 
con.close();
%>
<script language=JavaScript>{window.location.href='../book'}</script>