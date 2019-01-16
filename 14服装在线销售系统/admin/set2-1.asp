<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body><%
dim id,title,layer

id=Trim(Request.QueryString("id"))
if(isnumeric(id)) then
	sql="select * from leibie where id="&id
	rs.open sql,conn,1,1
	
	if(not rs.eof) then
		title=rs("title")
	else
		title=""
	end if
	rs.close
else
	title=""
end if


%><form action="set2-1-1.asp" method="post">
<table width="670" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" colspan="2" align="center" valign="middle">&nbsp;</td>
  </tr>
  <tr>
    <td width="237" height="30" align="right" valign="middle">类别名称：</td>
    <td width="433" align="left" valign="middle"><input name="title" type="text" id="title" value="<%=title%>" />
      <input name="id" type="hidden" id="id" value="<%=id%>" /></td>
  </tr>
  <tr>
    <td height="30" colspan="2" align="center" valign="middle"><input type="submit" name="Submit" value="提交" /></td>
  </tr>
</table></form>
</body>
</html>
