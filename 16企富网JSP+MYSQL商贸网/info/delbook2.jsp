<%@ include file="checkadmin.jsp"%>
<%@ include file="checksession.jsp"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%int id = Integer.parseInt(request.getParameter("id"));
rs=stmt.executeQuery("SELECT * from book where id="+id);
rs.next();
int numm=Integer.parseInt((String)rs.getString("topicid"));
String sql3="delete from book where id="+id;
stmt.executeUpdate(sql3);
String sql2="update book set replynum=(replynum-1) where id="+numm;
stmt.executeUpdate(sql2);
stmt.close(); 
con.close();
%>
<script language=JavaScript>{window.location.href='../book'}</script>