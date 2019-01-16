<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="include/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><!--#include file="top.asp"--></td>
  </tr>
  <tr>
    <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="200" align="left" valign="top"><!--#include file="login.asp"--><!--#include file="fenlei.asp"--></td>
        <td align="left" valign="top"><div class="title">联系我们</div>
          <%
			sql="select * from aboutus"
			rs.open sql,conn,1,1
			
			if(not rs.eof) then
				if(not isnull(rs("links"))) then
					Response.Write(replace(rs("links"),vbcrlf,"<br>"))
				end if
			end if
			rs.close
			%>
		</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><!--#include file="bottom.asp"--></td>
  </tr>
</table>
</body>
</html>

