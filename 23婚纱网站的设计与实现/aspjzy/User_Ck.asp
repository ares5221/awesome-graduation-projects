<!--#include file="inc/conn.asp"-->
<%
Call QuanXian(Register_B)
UserID=Request("UserID")
IF UserID=Empty Then 
	TwScript("对不起，参数有误")
End IF
Set RsUser=Conn.execute("select * from [User] where UserID="&UserID&"")
IF RsUser.Eof Then
	TwScript("对不起，没有此会员")
End IF
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.b_t {padding-left:10px;padding-right:10px;}
.style1 {color: #FF0000}
-->
</style>
</head>

<body>
<form name="form1" method="post" action="User_Sava.asp?action=Modify" onSubmit="return useradd(this)">
  <table width="85%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="table_border">
    <tr bgcolor="#DBE6FF">
      <td colspan="2" class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
          <tr>
            <td align="center" class="table_bg_size"> 修改会员 </td>
          </tr>
      </table></td>
    </tr>
    <tr bgcolor="#DBE6FF">
      <td colspan="2"><table width=100% border=0 align="center" cellpadding=0 cellspacing=1 bordercolor="#FFFFFF" bgcolor="#FFFFFF" style="border-collapse: collapse">
          <TR class="table_bg_n" >
            <TD width="29%" height="23" align="center">用户名</TD>
            <TD width="71%" class="padding-left-10"><%Tw(RsUser("UserName"))%></TD>
          </TR>
          <TR class="table_bg_n" >
            <TD width="29%" height="23" align="center">性别<BR>
            </TD>
            <TD width="71%" class="padding-left-10"><%
			IF RsUser("UserName")="1" Then 
			Tw("男") 
			Else
			Tw("女")
			End IF%></TD>
          </TR>
          <TR class="table_bg_n" >
            <TD width="29%" height="23" align="center">Email地址<BR>
            </TD>
            <TD width="71%" class="padding-left-10"><%Tw(RsUser("Email"))%></TD>
          </TR>
          <TR class="table_bg_n" >
            <TD height="23" align="center">公司网址</TD>
            <TD width="71%" class="padding-left-10"><%Tw(RsUser("homepage"))%></TD>
          </TR>
          <TR class="table_bg_n" >
            <TD width="29%" height="23" align="center">公司名称</TD>
            <TD width="71%" class="padding-left-10"><%Tw(RsUser("Comane"))%></TD>
          </TR>
          <TR class="table_bg_n" >
            <TD width="29%" height="23" align="center"><p>联系地址</p></TD>
            <TD width="71%" class="padding-left-10"><%Tw(RsUser("Add"))%></TD>
          </TR>
          <TR class="table_bg_n" >
            <TD height="23" align="center">联系人</TD>
            <TD width="71%" class="padding-left-10"><%Tw(RsUser("Somane"))%></TD>
          </TR>
          <TR class="table_bg_n" >
            <TD height="23" align="center">邮政编码</TD>
            <TD width="71%" class="padding-left-10"><%Tw(RsUser("Zip"))%>
            </TD>
          </TR>
          <TR class="table_bg_n" >
            <TD height="23" align="center">联系电话</TD>
            <TD width="71%" class="padding-left-10"><%Tw(RsUser("Phone"))%>
            </TD>
          </TR>
          <TR class="table_bg_n" >
            <TD height="23" align="center">传 真</TD>
            <TD class="padding-left-10"><%Tw(RsUser("Fox"))%></TD>
          </TR>
          <TR bgcolor="#DAE2F5" >
            <TD width="29%" height="23" align="center">审&nbsp;核</TD>
            <TD width="71%" class="padding-left-10">
			<%
				IF RsUser("LockUser")=True Then 
				Tw("通过审核") 
				Else
				Tw("未审核") 
				End IF
			%>
            </TD>
          </TR>
          <TR class="table_bg_n" >
            <TD height="25" colspan="2" align="center"><INPUT   type=button value="←返回上一页" name=Submit onClick="javascript:history.back();"></TD>
          </TR>
      </TABLE></td>
    </tr>
  </table>
</form>
</body>
</html>
