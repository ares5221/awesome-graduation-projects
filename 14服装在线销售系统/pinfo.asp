<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="include/style.css" rel="stylesheet" type="text/css" />
</head>
<body><%dim i%>
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
        <td width="460" height="410" align="left" valign="top"><br /><br />
		<div class="title"><div class="text">商品信息</div></div><br /><br /><%
		dim id,s
		s=Trim(Request.QueryString("s"))
		id=Trim(Request.QueryString("id"))
		
		sql="select * from products where id="&id
		rs.open sql,conn,1,1
		
		if(not rs.eof) then%>
			<table width="98%" border="0" cellpadding="0" cellspacing="1" bordercolor="#FFCC33">
		  
		  <tr>
			<td height="30" align="center" valign="middle"><a href="<%=rs("bpic")%>"><img src="<%=rs("bpic")%>" width="220" border="0" /></a></td>
			<td width="48%" align="center" valign="middle"><%=rs("title")%><br /><br />
			  商品类别：<%=rs("class1")%><br /><br />
			  商品价格：<%=rs("cpjg")%><br /><br />
			  商品数量：<%=rs("cpsl")%><br /><br />
			  <a href="goumai.asp?id=<%=id%>">购买此商品</a>
			  </td>
		  </tr>
		</table>
			<%
		end if
		%><br /><br /><hr />
		</td>
		</tr>
	</table>
	</td>
  </tr>
  <tr>
    <td align="center" valign="top" background="images/t2.gif">
	<table width="680" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td width="220">&nbsp;</td>
		<td width="460">
		<p style="padding:10px;text-align:left;">
		  <%
		  if(not rs.eof) then
			  Response.Write(replace(rs("nope"),vbcrlf,"<br>"))
		  end if
		  rs.close
		  %>
		</p></td>
	  </tr>
	</table>

	</td>
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

