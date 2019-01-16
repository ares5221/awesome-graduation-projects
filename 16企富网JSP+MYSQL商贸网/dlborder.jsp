<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../conn/substring.jsp"%>
<%@ include file="../conn/conn.jsp"%>
<%String dlid=(String) session.getAttribute("Did");
rs=stmt.executeQuery("SELECT * from dqjie where dlid='"+dlid+"'");
rs.next();%>

<link href="../conn/laba.css" rel="stylesheet" type="text/css">
<table width="750" border="0" cellpadding="0" cellspacing="0" class="dlborder" height=100>
<tr>
<td class="dlsearchbar" height=40px>


<table width="750" border="0" cellpadding="0" cellspacing="0"  height=80>
<tr>

<td width="250">
<table width="100%" border="0" style="border-style: ridge; border-width: 1px">
<tr>
<td width="10" bgcolor="#FF8000">
<div align="center">
<font color="#FFFFFF">地方介绍</font></div>
</td>
<td width="80">
<div align="center">

<%if (rs.getString("photoname").compareTo("0")==0){%><img src=../images/top_s_1.jpg widt=70 height=70><%}else{%>

<img src=../<%=rs.getString("photoname")%> width=70 height=70 border=0></a>
<%}%>                



</div>
</td>
<td><a href=www/jie.jsp?id=<%=rs.getString("id")%> target="_blank"  style="text-decoration: none; font-size: 9pt" >·<%=substringChinese(rs.getString("jietext"),0,60)%></a></td>
</tr>
</table>

</td>

<td width="250" >
<table width="100%" border="0" style="border-style: ridge; border-width: 1px">
<tr>
<td width="20" bgcolor="#006ACA">
<div align="center">
<font color="#FFFFFF">地方资讯</font></div>
</td>
<td width="80">
<div align="center">
<img border="0" src="images/top_s_2.gif" width="70" height="70"></div>
</td>
<td>

<%int i=1;
rs=stmt.executeQuery("SELECT * from dqzixun where dlid='"+dlid+"' and lei=0");
while(rs.next()&i<5){
i++ ;%>
·<a href=www/zixun.jsp?id=<%=rs.getString("id")%> target="_blank"  style="text-decoration: none; font-size: 9pt" ><%=substringChinese(rs.getString("topic"),0,10)%></a><br>
<%}%>

</td>
</tr>
</table>
</td>

<td width="250">
<table width="100%" border="0" style="border-style: ridge; border-width: 1px">
<tr>
<td width="80">
<div align="center">
<img border="1" src="images/top_s_3.jpg" width="70" height="70"></div>
</td>
<td>

<%i=1;
rs=stmt.executeQuery("SELECT * from dqzixun where dlid='"+dlid+"' and lei=1");
while(rs.next()&i<5){
i++ ;%>
·<a href=<%=rs.getString("url")%> target="_blank" title='<%=rs.getString("content")%>' style="text-decoration: none; font-size: 9pt" ><%=substringChinese(rs.getString("topic"),0,10)%></a><br>
<%}%>





</td>
</tr>
</table>
</td>







</td></tr></table>