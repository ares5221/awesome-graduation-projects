<%@ include file="checkadmin.jsp"%>
<%@ include file="checksession.jsp"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%int id = Integer.parseInt(request.getParameter("id"));
String status = (String)request.getParameter("status");
String sql="update book set status='"+status+"' where id="+id;
stmt.executeUpdate(sql);
stmt.close(); 
con.close();
%>
<script language=JavaScript>{window.location.href='../book'}</script>
