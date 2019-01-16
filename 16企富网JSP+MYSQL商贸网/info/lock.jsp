<%@ include file="checkadmin.jsp"%>
<%@ include file="checksession.jsp"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%String id = (String)request.getParameter("id");
String lockop = (String)request.getParameter("lockop");
String sql="update book set lockop='"+lockop+"' where id="+id;
stmt.executeUpdate(sql);
stmt.close(); 
con.close();
%>
<script language=JavaScript>{window.location.href='../book/read.jsp?id=<%=id%>'}</script>
