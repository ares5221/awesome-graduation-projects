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
        <td width="460" height="410" align="left" valign="top">
		
		<form action="guestadd.asp" method="post"><%
		dim uname,qq,email
		uname=session("UserLogin")
		if(uname<>"") then
			sql="select * from userinfo where username='"&uname&"'"
			rs.open sql,conn,1,1
			if(not rs.eof) then
				qq=rs("tel")
				email=rs("email")
			end if
			rs.close
		end if
		
		%>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="25" colspan="2" align="left" valign="middle"><div class="title"><div class="text">客户留言</div></div></td>
            </tr>
          <tr>
            <td height="11" colspan="2"></td>
            </tr>
          <tr>
            <td height="25" align="right" valign="middle">姓名：</td>
            <td align="left" valign="middle"><input name="name" type="text" id="name" value="<%=uname%>" /></td>
          </tr>
          <tr>
            <td height="25" align="right" valign="middle">TEL：</td>
            <td align="left" valign="middle"><input name="qq" type="text" id="qq" value="<%=qq%>" /></td>
          </tr>
          <tr>
            <td height="25" align="right" valign="middle">E-Mail：</td>
            <td align="left" valign="middle"><input name="email" type="text" id="email" value="<%=email%>" /></td>
          </tr>
          <tr>
            <td height="25" align="right" valign="middle">标题：</td>
            <td align="left" valign="middle"><input name="title" type="text" id="title" size="40" /></td>
          </tr>
          <tr>
            <td height="25" align="right" valign="middle">留言内容：</td>
            <td align="left" valign="middle"><textarea name="content" cols="40" rows="6" id="content"></textarea></td>
          </tr>
          <tr>
            <td height="25" colspan="2" align="center" valign="middle"><input type="submit" name="Submit" value="提交" />
              　
              <input type="reset" name="Submit2" value="重置" /></td>
            </tr>
          <tr>
            <td height="25">&nbsp;</td>
            <td height="120"><a href="guest2.asp"><img src="images/seebook.gif" width="218" height="95" border="0" /></a></td>
          </tr>
        </table>
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
<script language="javascript">
function gotopages(num)
{
	document.getElementById("pages").value=num;
	form1.submit();
}
function seeliuyan(id)
{
	var url="seeliuyan.asp?id=";
	url=url+id;
	window.showModalDialog(url);
}
</script>
</body>
</html>

