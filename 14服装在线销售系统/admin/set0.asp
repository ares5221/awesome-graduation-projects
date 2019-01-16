<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body><%
dim links
sql="select * from aboutus"
rs.open sql,conn,1,1

if(not rs.eof) then
	links=rs("links")
else
	links=""
end if
rs.close
%><form action="set0-1.asp" method="post">
<table width="670" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" align="left" valign="middle">联系我们：</td>
  </tr>
  
  <tr>
    <td height="30" align="left" valign="middle"><textarea name="links" cols="80" rows="15" id="links"><%=links%></textarea></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30" align="center" valign="middle"><input type="submit" name="Submit" value="提交" /></td>
  </tr>
</table>
</form>
</body>
</html>
