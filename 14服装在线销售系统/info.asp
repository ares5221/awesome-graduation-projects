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
        <td width="460" height="410" align="right" valign="top"><div style="height:410px; overflow-y:auto;overflow-x:hidden;">
		<%
		dim id,s
		s=Trim(Request.QueryString("s"))
		id=Trim(Request.QueryString("id"))
		
		sql="select * from news where id="&id
		rs.open sql,conn,1,3
		
		if(not rs.eof) then
		rs("seenum")=rs("seenum")+1
		rs.update
		%>
			<table width="440" border="0" cellpadding="0" cellspacing="1" bordercolor="#AA6F92">
		  <tr>
			<td><%Response.Write("<div style='line-height:50px;text-align:center;font-size:18px;'>"&rs("title")&"</div>")%></td>
		  </tr>
		  <tr>
			<td height="30" align="center" valign="middle"><%
			Response.Write("<div>"&rs("jointime")&"")
			Response.Write("　　")
			Response.Write("浏览数："&rs("seenum")&"</div>")
			%></td>
		  </tr>
		  <tr>
			<td><p style="padding:10px;text-align:left;">
			  <%Response.Write(replace(rs("nope"),vbcrlf,"<br>"))%>
			</p></td>
		  </tr>
		</table><%
		end if
		rs.close
		%></div>
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

