<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%
stmt = con.createStatement() ;
String username=request.getParameter("user");
rs=stmt.executeQuery("SELECT * from qyml where username='"+username+"'");
if(!rs.next())
{%>
<p align="center">
<font color="#800000">恭喜您！此帐号现无人使用，请继续注册。 <br>
</font>
<br>
<a href="javascript:window.close()">关闭窗口</a></p>
<%}
else
{%>
<p align="center">对不起！此帐号已被人注册，请您另选帐号<br><br>
<a href=../info/renzheng.jsp?id=<%=username%> target="_blank">点击查看该会员信息</a></p>
<%}
stmt.close(); 
con.close();
%>