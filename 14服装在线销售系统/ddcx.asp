<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="include/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
</style>
</head>
<body>
<table width="780" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><!--#include file="top.asp"--></td>
  </tr>
    <tr>
    <td align="center" valign="top" background="images/t1.gif">
	<br><br>
	<table width="680" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="220" height="30" align="left" valign="top"><!--#include file="login.asp"--><!--#include file="left.asp"--></td>
        <td width="460" height="410" align="left" valign="top">
		<div class="title"><div class="text">订单查询</div></div><br />
         <table width="100%" border="1" cellpadding="0" cellspacing="1" bordercolor="#89613D">
  <tr>
    <td width="120" height="30" align="center" valign="middle" bgcolor="#89613D"><span class="STYLE1">订单号</span></td>
    <td height="30" align="center" valign="middle" bgcolor="#89613D"><span class="STYLE1">物品名称</span></td>
    <td width="100" height="30" align="center" valign="middle" bgcolor="#89613D"><span class="STYLE1">物品数量</span></td>
    <td width="60" align="center" valign="middle" bgcolor="#89613D">&nbsp;</td>
  </tr><%
dim sword
dim j,names,jiage,pic,id
dim counts,allcounts,pages,maxpages,i
		counts=20
		sql="select * from dingdan where name='"&session("UserLogin")&"' and flags=0 order by jointime desc"
		rs.open sql,conn,1,1
		
		if(not rs.eof) then
		while not rs.eof
		%>
  <tr>
    <td height="25" align="center" valign="middle"><%=rs("dingdanid")%></td>
    <td align="left" valign="middle"><a href="pinfo.asp?id=<%=rs("productid")%>">
      <%
	sql="select * from products where id="&rs("productid")
	rs2.open sql,conn,1,1
	
	if(not rs.eof) then
		Response.Write(rs2("title"))
	end if
	rs2.close
	%></a></td>
    <td align="center" valign="middle"><form action="ddmod.asp" method="post" style="display:inline;"><input name="num" type="text" value="<%=rs("productnum")%>" size="4" />　
	<input name="id" type="hidden" value="<%=rs("id")%>" />
    <input name="提交" type="submit" value="修改" />
    </form></td>
    <td align="center" valign="middle"><a href="deldd.asp?id=<%=rs("id")%>">删除</a></td>
  </tr>  <%
	  rs.movenext
 	  wend
	  else
	  	Response.Write("<tr><td colspan='4' bgcolor='#ffffff' align='center' valign='middle' height='25'>没有找到订单</td></tr>")
	  end if
	  rs.close
		%>
  <tr>
    <td height="40" colspan="4" align="center" valign="middle"><a href="tjdd.asp">提交订单</a></td>
    </tr>

</table>
		<div class="title"><div class="text">历史订单</div></div><br />
         <table width="460" border="1" cellpadding="0" cellspacing="1" bordercolor="#9A7958">
  <tr>
    <td width="120" height="30" align="center" valign="middle" bgcolor="#9A7958">订单号</td>
    <td height="30" align="center" valign="middle" bgcolor="#9A7958">物品名称</td>
    <td width="80" height="30" align="center" valign="middle" bgcolor="#9A7958">物品数量</td>
    <td width="100" align="center" valign="middle" bgcolor="#9A7958">状态</td>
  </tr><%
		counts=20
		sql="select * from dingdan where name='"&session("UserLogin")&"' and flags=1 order by jointime desc"
		rs.open sql,conn,1,1
		
		if(not rs.eof) then
		while not rs.eof
		%>
  <tr>
    <td height="25" align="center" valign="middle"><%=rs("dingdanid")%></td>
    <td align="left" valign="middle"><a href="pinfo.asp?id=<%=rs("productid")%>">
      <%
	sql="select * from products where id="&rs("productid")
	rs2.open sql,conn,1,1
	
	if(not rs.eof) then
		Response.Write(rs2("title"))
	end if
	rs2.close
	%></a></td>
    <td align="center" valign="middle"><%=rs("productnum")%></td>
    <td align="center" valign="middle"><%
	if(rs("flags2")=1) then
		Response.Write("已发货")
	else
		Response.Write("等待发货")
	end if
	%></td>
  </tr>  <%
	  rs.movenext
 	  wend
	  end if
	  rs.close
		%>
</table>
		</td>
		</tr>
	</table>
	</td>
  </tr>
  <tr>
    <td align="center" valign="top" background="images/t2.gif"></td>
  </tr>
  <tr>
    <td align="center" valign="top"><img src="images/t3.gif"></td>
  </tr>
  <tr>
    <td><!--#include file="bottom.asp"--></td>
  </tr>
</table>
</body>
</html>

