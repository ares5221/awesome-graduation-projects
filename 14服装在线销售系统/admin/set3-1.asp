<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script language="JavaScript" type="text/javascript" src="auto.js"></script>
<style type="text/css">
body{margin:0px auto;}
</style>
</head>
<body><%
dim id,title,nope
id=Trim(Request.QueryString("id"))

if(isnumeric(id)) then
	id=int(id)
	sql="select * from news where id="&id
	rs.open sql,conn,1,1
	
	if(not rs.eof) then
		title=rs("title")
		nope=rs("nope")
	end if
	rs.close
else
	title=""
	nope=""
end if

%><form action="set3-1-1.asp" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30%" height="49" align="right" valign="middle">标题：</td>
    <td width="70%" align="left" valign="middle"><input name="title" type="text" id="title" value="<%=title%>" size="50" />
      <input name="id" type="hidden" id="id" value="<%=id%>" /></td>
  </tr>
  <tr>
    <td width="30%" height="25" align="right" valign="middle">内容：</td>
    <td width="70%" align="left" valign="middle"><textarea name="nope" cols="50" rows="10" id="nope"><%=nope%></textarea></td>
  </tr>
  <tr>
    <td height="40" colspan="2" align="center" valign="middle"><input type="submit" name="Submit" value="提交" /></td>
  </tr>
</table></form>
</body>
</html>
