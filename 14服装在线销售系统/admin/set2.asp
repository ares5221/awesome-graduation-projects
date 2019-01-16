<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script language="JavaScript" type="text/javascript" src="auto.js"></script>
<style type="text/css">
body{
	font-size: 12px;
	color: #000000;
}
</style>
</head>

<body>
<table width="670" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" align="left" valign="middle">产品类别管理：</td>
  </tr>
  <tr>
    <td height="30" align="center" valign="middle" bgcolor="#dddddd"><a href="set2-1.asp?layer=1">添加类别</a><br></td>
  </tr><%sql="select * from leibie order by id asc"
	rs.open sql,conn,1,1
	
	while not rs.eof%>
  <tr>
    <td height="30" style="border-bottom:#CCCCCC solid 1px;"><%
	
		Response.Write("<a href='set2-1.asp?id="&rs("id")&"'>"&rs("title")&"</a><br>")
		
	%></td>
  </tr><%
  rs.movenext
	wend
	rs.close%>
</table>
</body>
</html>
