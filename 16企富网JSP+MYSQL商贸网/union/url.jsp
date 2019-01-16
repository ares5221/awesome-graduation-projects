<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%
stmt = con.createStatement() ;
int id = Integer.parseInt((String)request.getParameter("id"));
rs=stmt.executeQuery("SELECT * from unionbar where id="+id);
while(rs.next())
{%>
<title><%=rs.getString("webname")%></title>

<div aligh=center>



<frameset rows="150,*" cols="*" frameborder="NO" border="0" framespacing="0" width=750 align=center> 
  <frame name="topFrame" scrolling="NO" noresize src="../top.jsp" frameborder="NO" >
    <frame name="mainFrame" src="http://<%=rs.getString("weburl")%>" scrolling="auto" noresize>
  </frameset>


</div>








<%}%>