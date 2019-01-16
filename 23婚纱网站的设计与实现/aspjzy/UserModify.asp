<!--#include file="inc/conn.asp"-->
<%

Call QuanXian(Register_B)
UserID=Request("UserID")
IF UserID=Empty Then 
	TwScript("对不起，参数有误")
End IF
Set RsUser=Conn.execute("select * from [mebmer] where ID="&UserID&"")
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
<script>
function useradd(formname)
{
	if(formname.UserName.value=="")
	{
		alert("请输入用户名")
		formname.UserName.focus()
		return false;
	}

	
	if(formname.PwdConfirm.value!=formname.Password.value)
	{
		alert("两次密码输入不一致")
		formname.PwdConfirm.focus()
		return false;
	}
}
</script>
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
            <td height='40' width='29%' align='right'>推荐人:　</td>
            <td height='40' width='79%'>&nbsp;
<%Tw(RsUser("tuijianren"))%></td>
          </tr>
			<tr>
              <td width='29%' height='40' align='right' bgcolor="#E4EDF9">用户名:　</td>
              <td width='79%' height='40' bgcolor="#E4EDF9">&nbsp;
              <%Tw(RsUser("UserName"))%></td>
            </tr>
            <tr>
              <td width='29%' height='40' align='right' bgcolor="#E4EDF9">密码:　</td>
              <td width='79%' height='40' bgcolor="#E4EDF9">&nbsp;
                <%Tw(RsUser("password"))%></td>
            </tr>
            <tr>
              <td width='29%' height='40' align='right' bgcolor="#E4EDF9">银行开户姓名：　</td>
              <td width='79%' height='40' bgcolor="#E4EDF9">&nbsp;
                <%Tw(RsUser("Realname"))%></td>
            </tr>
            <tr>
              <td width='29%' height='40' align='right' bgcolor="#E4EDF9">开户银行：　</td>
              <td width='79%' height='40' bgcolor="#E4EDF9">&nbsp;
                <%Tw(RsUser("bank"))%></td>
            </tr>
            <tr>
              <td width='29%' height='40' align='right' bgcolor="#E4EDF9">银行卡号:　</td>
              <td width='79%' height='40' bgcolor="#E4EDF9">&nbsp;
                <%Tw(RsUser("card"))%></td>
            </tr>
            <tr>
              <td width='29%' height='40' align='right' bgcolor="#E4EDF9">QQ号码:　</td>
              <td width='79%' height='40' bgcolor="#E4EDF9">&nbsp;
                <%Tw(RsUser("qq"))%></td>
            </tr>
            <tr>
              <td width='29%' height='40' align='right' bgcolor="#E4EDF9">联系电话：　</td>
              <td width='79%' height='40' bgcolor="#E4EDF9">&nbsp;
                <%Tw(RsUser("tel"))%></td>
            </tr>
            <tr>
              <td width='29%' height='40' align='right' bgcolor="#E4EDF9">&nbsp;电子邮件:　</td>
              <td width='79%' height='40' bgcolor="#E4EDF9">&nbsp;
                <%Tw(RsUser("email"))%></td>
            </tr>
            <tr>
              <td width='29%' height='40' align='right' bgcolor="#E4EDF9">&nbsp;所在城市:　</td>
              <td width='79%' height='40' bgcolor="#E4EDF9">&nbsp;
<%
set rsp=server.CreateObject("adodb.recordset")
rsp.open"select * from [SMT_ypaddone] where SMT_addone_id="&int(RsUser("addone_id"))&"",conn,1,3
if not rsp.eof then
ProvinceName=rsp("SMT_addone")
end if
rsp.close

set rsc=server.CreateObject("adodb.recordset")
rsc.open"select * from [SMT_ypaddtwo] where SMT_addtwo_ID="&RsUser("addtwo_id")&"",conn,1,3
if not rsc.eof then
CityName=rsc("SMT_addtwo")
end if
rsc.close
%>
                <%=ProvinceName%>-<%=CityName%></td>
            </tr>
            <tr>
              <td width='29%' height='40' align='right' bgcolor="#E4EDF9">找回密码提示问题:　</td>
              <td width='79%' height='40' bgcolor="#E4EDF9">&nbsp;
                <%Tw(RsUser("userquestion"))%></td>
            </tr>
            <tr>
              <td width='29%' height='40' align='right' bgcolor="#E4EDF9">提示问题答案:</td>
              <td width='79%' height='40' bgcolor="#E4EDF9">&nbsp;
                <%Tw(RsUser("useranswer"))%></td>
          </TR>
          <TR class="table_bg_n" ><input type="Hidden" name="ID" value="<%Tw(RsUser("ID"))%>">
            <TD height="25" colspan="2" align="center">
            <input type="reset" name="Submit" value="返回" onclick='javascript:window.location.href("Usermanages.asp")'></TD>
          </TR>
      </TABLE></td>
    </tr>
  </table>
</form>
</body>
</html>
