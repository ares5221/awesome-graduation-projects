<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script language="JavaScript" type="text/javascript" src="auto.js"></script>
<style type="text/css">
body{
	margin:0px;
	font-size: 12px;
	color: #000000;
}
</style>
</head>

<body>
<table width="670" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#900000">
  <form action="set5-1.asp" method="post"><tr>
    <td width="60" height="30" align="center" valign="middle">ID</td>
    <td width="482" height="30" align="center" valign="middle">订单内容</td>
    <td width="120" height="30" align="center" valign="middle">发货设置</td>
  </tr><%
  dim pages,maxpages,counts,allcounts,i
  dim starts,ends
  starts=Trim(Request.Form("start"))
  ends=Trim(Request.Form("end"))
  sql="select * from dingdan where jointime between #"&starts&"# and #"&ends&"# order by jointime desc"
  rs.open sql,conn,1,1

'  Response.Write(sql)
  while not rs.eof
  %>
  <tr>
    <td height="20" align="center" valign="middle"><%=rs("id")%></td>
    <td height="20" align="left" valign="middle"> <%
	Response.Write("订单号："&rs("dingdanid")&"　")
	if(rs("flags2")=1) then
		Response.Write("[已交货]")
	end if
	sql="select * from products where id="&rs("productid")
	rs2.open sql,conn,1,1
	if(not rs.eof) then
		Response.Write(rs2("title"))
	end if
	rs2.close
	Response.Write("数量："&rs("productnum"))
	%></td>
    <td height="20" align="center" valign="middle"><input name="id" type="checkbox" value="<%=rs("id")%>" <%if(rs("flags2")=1) then Response.Write("checked='checked'")%> /></td>
  </tr><%
  rs.movenext
	wend
  rs.close
  %>

  <tr>
    <td height="40" colspan="3" align="center" valign="middle"><input type="submit" name="Submit" value="设置选中项为已发货" /><a href="set5-1.asp">
    </a></td>
  </tr></form><form action="set5-2.asp" method="post">
  <tr>
    <td height="40" colspan="3" align="center" valign="middle">起始时间
      <input name="start" type="text" id="start" value="2000-1-1" />　
      结束时间:
      <input name="end" type="text" id="end" value="<%=date()%>" />
      <input type="submit" name="Submit2" value="提交" /></td>
  </tr></form>
</table>

</body>
</html>
