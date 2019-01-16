<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*"  %>
<%@ page autoFlush="true" errorPage="error.html"%>
<html>
<%@ include file="top.jsp"%>
<link href="css.css" rel="stylesheet" type="text/css">
<%
sql="select * from system";
rs=mdb.executeQuery(sql);
if(rs.next()){
%>
<div align="center">
  <center>
<table width="500" style="border-collapse: collapse" bordercolor="#111111" cellpadding="0" cellspacing="0"> 
  <tr> 
    <td bgcolor=#989DA5 height=20><a name=1></a>网 上 订 购 方 式</td>
  </tr>
  <tr> 
    <td>您可以通过浏览我们的<%=rs.getString("sitename")%>(<%=rs.getString("web")%> ) 来在线购买商品。<p align="center">
    <img height=241 src="img/liucheng.gif"  width=186>
    </td>
  </tr>
  <tr> 
    <td bgcolor=#989DA5 height=20><a name=2></a>电 话 订 购 方 式</td>
  </tr>
  <tr> 
    <td height=30>您可以通过拨打我们的订货热线:<%=rs.getString("tel")%> 联系人: <%=rs.getString("name")%>进行商品咨询或订货。商品咨询服务OICQ号码:<%=rs.getString("oicq")%>
    </td>
  </tr>
  <tr> 
    <td bgcolor=#989DA5 height=20><a name=4></a>传 真 订 购 方 式</td>
  </tr>
  <tr> 
    <td>传真：<%=rs.getString("fax")%></td>
  </tr>
</table>
  </center>
</div>
<%
}
%>
<%@ include file="copy.jsp"%>