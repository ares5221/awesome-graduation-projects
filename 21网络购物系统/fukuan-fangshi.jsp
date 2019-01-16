<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" %>
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


<table style="border-collapse: collapse" bordercolor="#111111" cellpadding="0" cellspacing="0" width="500">
  <tbody> 
  <tr> 
    <td align="center" height="18"> 
      <p>货<a name=1></a> 到 付 款 方 式</p>
    </td>
  </tr>
  <tr style="HEIGHT: 15pt"> 
    <td height="50" bordercolor="#C0C0C0"> 邮<a name=2></a> 政 汇 款</td>
  </tr>
  <tr> 
    <td height="86"> 
       收款地址：<%=rs.getString("ymaddr")%><br><br>  
       收款人： <%=rs.getString("ymname")%><br><br> 
       邮政编码：<%=rs.getString("code")%><br><br>
    </td>
  </tr>
  <tr style="HEIGHT: 15pt"> 
    <td height="52">银<a name=3></a> 行 汇 款</td>
  </tr>
  <tr> 
      <td height="128">银行：<%=rs.getString("maddr")%><br><br>
         帐号：<%=rs.getString("msn")%><br><br>
        户名：<%=rs.getString("mname")%><br><br>
          请选择最适合您的付款方式,汇款后及时通过电话<%=rs.getString("tel")%>（联系人：<%=rs.getString("name")%>）或<a href="mailto:<%=rs.getString("mail")%>">电子邮件</a>通知我们!以便及时发货...</td>
  </tr>
  </tbody>
</table>
  </center>
</div>
<%}
%>
<%@ include file="copy.jsp"%>