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
</head><%
dim names,email,title,nope,reply,id

id=Trim(Request.QueryString("id"))
	names=""
	email=""
	title=""
	nope=""
	reply=""
if(isnumeric(id)) then
	sql="select * from guest where id="&id
	rs.open sql,conn,1,1
	if(not rs.eof) then
		names=rs("name")
		email=rs("email")
		title=rs("title")
		nope=rs("content")
		reply=rs("reply")
	end if
	rs.close
end if
%>
<form action="set7-1-1.asp" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" align="right" valign="middle">留言人：</td>
    <td align="left" valign="middle"><input name="name" type="text" id="name" value="<%=names%>" />
      <input name="id" type="hidden" id="id" value="<%=id%>" /></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle">电子邮箱：</td>
    <td align="left" valign="middle"><input name="email" type="text" id="email" value="<%=email%>" size="70" /></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle">留言标题：</td>
    <td align="left" valign="middle"><input name="title" type="text" id="title" value="<%=title%>" size="70" /></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle">留言内容：</td>
    <td align="left" valign="middle"><textarea name="nope" cols="80" rows="8" id="nope"><%=nope%></textarea></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle">回复：</td>
    <td align="left" valign="middle"><textarea name="reply" cols="80" rows="8" id="reply"><%=reply%></textarea></td>
  </tr>
  <tr>
    <td height="40" colspan="2" align="center" valign="middle"><input type="submit" name="Submit" value="提交" /></td>
    </tr>
</table>
</form>
</body>
</html>
