<!--#include file="inc/conn.asp"-->
<%
Call QuanXian(GuestBook_B)
ID=Request("ID")
Sava=Request("Sava")
Sava1=Request("Sava1")
'******************************************************************************************
IF Sava1="modify" Then
	sh=Request.Form("sh")
	huifu=Request.Form("huifu")
	IF sh=Empty Then
			sh="False"
		End IF
	IF Sava="sh" Then
		Conn.execute("update Gbook set sh="&sh&" Where ID="&ID&"")
		Tw("<Script>alert('审核属性修改成功');window.location='Gbook.asp'</Script>")
	ElseIF Sava="huifu" Then
		Conn.execute("update Gbook set replay='"&huifu&"' Where ID="&ID&"")
		Tw("<Script>alert('回复成功');window.location='Gbook.asp'</Script>")
	ElseIF Sava="Q" Then
		Conn.execute("update Gbook set replay='"&huifu&"',sh="&sh&" Where ID="&ID&"")
		Tw("<Script>alert('修改成功');window.location='Gbook.asp'</Script>")
	End IF
	Response.End
End IF

'******************************************************************************************
SQL="select * from Gbook Where ID="&ID&" "
set Rs=Server.CreateObject("Adodb.Recordset")
Rs.open SQL,Conn,1,1
IF Rs.Eof Then
	Tw("参数有误")
	Response.End
End IF
'*******************************************************************************************
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.p {padding-left:10px;}
.style2 {color: #990000}
-->
</style>
</head>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="192"><table width="85%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="table_border">
      <tr >
        <td colspan="2" class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
            <tr>
              <td align="center" class="table_bg_size">留言管理</td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td colspan="2"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
            <tr class="table_bg_n">
              <td width="12%" height="25" class="padding-left-10">姓名：</td>
              <td width="44%" class="padding-left-10"><%=rs("username")%></td>
              <td width="14%" align="center">性别：</td>
              <td width="30%" class="padding-left-10"><%
		  IF rs("sex")="0" Then
		  Tw("先生")
		  Else
		  Tw("女士")
		  End IF%></td>
            </tr>
            <tr class="table_bg_n">
              <td height="25" class="padding-left-10">E-Mail：</td>
              <td class="padding-left-10"><a href="mailto:<%=rs("email")%>"><%=rs("email")%></a></td>
              <td align="center">主页：</td>
              <td class="padding-left-10"><%=rs("homepage")%></td>
            </tr>
            <tr class="table_bg_n">
              <td height="25" class="padding-left-10 style2">标题：</td>
              <td height="25" colspan="3" class="padding-left-10 style2"><%=rs("title")%></td>
            </tr>
            <tr class="table_bg_n">
              <td height="25" class="padding-left-10 style2">内容：</td>
              <td height="25" colspan="3" class="padding-left-10 style2"><%=rs("content")%></td>
            </tr>
            <tr class="table_bg_n">
              <td height="25" class="padding-left-10">QQ：</td>
              <td height="25" class="padding-left-10"><%=rs("qq")%></td>
              <td align="center">留言时间：</td>
              <td class="padding-left-10"><%=rs("addtime")%></td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="191"><table width="85%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="table_border">
      <tr >
        <td colspan="2" class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
            <tr>
              <td align="center" class="table_bg_size">留言回复</td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td colspan="2"><form name="form1" method="post" action="?Sava1=modify&Sava=<%=Sava%>" style="margin:0px;">
          <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
           <%IF Sava="sh" Or Sava="Q" Then%>
			<tr class="table_bg_n">
              <td width="26%" height="25" align="center">审核</td>
              <td width="74%" class="padding-left-10"><input name="sh" type="checkbox" id="sh" value="True" <%IF rs("sh")=True Then Tw("checked") End IF%>>
                通过</td>
            </tr>
			<%
			End IF
			IF Sava="huifu" Or Sava="Q" Then
			%>
            <tr class="table_bg_n">
              <td width="26%" height="90" align="center">回复</td>
              <td class="padding-left-10"><textarea name="huifu" cols="45" rows="5" id="huifu"><%=rs("replay")%></textarea></td>
            </tr>
			<%
			End IF
			%>
            <tr class="table_bg_n"><input name="ID" type="Hidden" id="ID" value="<%=ID%>">
              <td height="25" colspan="2" align="center"><input type="submit" name="Submit" value="提交"></td>
              </tr>
          </table>
        </form></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
