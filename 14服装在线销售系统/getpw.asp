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
    <td align="left" valign="middle"><!--#include file="top.asp"--></td>
  </tr>
  <tr>
    <td align="center" valign="top" background="images/t1.gif">
	<br><br>
	<table width="680" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="220" height="30" align="left" valign="top"><!--#include file="login.asp"--><!--#include file="left.asp"--></td>
        <td width="460" height="410" align="left" valign="top">
		<div class="title">
		  <div class="text">找回密码</div>
		</div><br /><br />
		<form action="getpw.asp" method="post"><%
		dim uname,mw,md
		uname=Trim(Request.Form("uname"))
		md=Trim(Request.Form("da"))
		if(uname="") then
		%><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="28%" height="30" align="right" valign="middle">用户名：</td>
            <td width="72%" align="left" valign="middle"><input name="uname" type="text" class="input" id="uname" /></td>
          </tr>
          <tr>
            <td height="30" colspan="2" align="center" valign="middle"><label>
              <input type="submit" name="Submit" value="提交" />
            </label></td>
            </tr>
		  </table>
		  <%
		  else
		  sql="select * from userinfo where username='"&uname&"'"
		  rs.open sql,conn,1,1
		  if(not rs.eof) then
		  if(rs("mibaowt")="" or rs("mibaoda")="" or isnull(rs("mibaowt")) or isnull(rs("mibaoda"))) then
		  	Response.Write("没有申请密码保护")
		  else
		  if(md="") then
		  %><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="28%" height="30" align="right" valign="middle">密保问题：</td>
            <td width="72%" align="left" valign="middle"><%=rs("mibaowt")%>
              <input name="uname" type="hidden" id="uname" value="<%=uname%>" /></td>
          </tr>
          <tr>
            <td height="30" align="right" valign="middle">密保答案：</td>
            <td align="left" valign="middle"><input name="da" type="text" class="input" id="da" /></td>
          </tr>
          <tr>
            <td height="30" colspan="2" align="center" valign="middle"><label>
              <input type="submit" name="Submit" value="提交" />
            </label></td>
            </tr>
		  </table>
		  <%
		  else
		  	Response.Write("您的密码为："&rs("userpass"))
		  end if
		  end if
		  else
		  	Response.Write("没有找到用户。")
		  end if
		  rs.close
		  end if
		  
		  %>
    </form>
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
