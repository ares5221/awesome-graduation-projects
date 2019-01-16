<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.b_t {padding-left:10px;padding-right:10px;}
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
	
	if(formname.Password.value=="")
	{
		alert("请输入密码")
		formname.Password.focus()
		return false;
	}
	if(formname.Password.value.length<6)
	{
		alert("密码不能少于6位数")
		formname.Password.focus()
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
<form name="form1" method="post" action="User_Sava.asp?action=add" onSubmit="return useradd(this)">
  <table width="85%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="table_border">
    <tr bgcolor="#DBE6FF">
      <td colspan="2" class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
          <tr>
            <td align="center" class="table_bg_size"> 添加会员 </td>
          </tr>
      </table></td>
    </tr>
    <tr bgcolor="#DBE6FF">
      <td colspan="2"><table width=100% border=0 align="center" cellpadding=0 cellspacing=1 bordercolor="#FFFFFF" bgcolor="#FFFFFF" style="border-collapse: collapse">
          <TR class="table_bg_n" >
            <TD width="29%" height="23" align="center">用户名</TD>
            <TD width="71%" class="padding-left-10"><INPUT   maxLength=14 size=20 name=UserName>
                <font color="#FF0000">*(字符数不限)</font></TD>
          </TR>
          <TR class="table_bg_n" >
            <TD width="29%" height="23" align="center">密码<BR>
            </TD>
            <TD width="71%" class="padding-left-10"><INPUT  type=password maxLength=12 size=30 name=Password>
                <font color="#FF0000">*(密码6位以上)</font></TD>
          </TR>
          <TR class="table_bg_n" >
            <TD width="29%" height="23" align="center">确认密码</TD>
            <TD width="71%" class="padding-left-10"><INPUT   type=password maxLength=12 size=30 name=PwdConfirm>
                <font color="#FF0000">*</font> </TD>
          </TR>
          <TR class="table_bg_n" >
            <TD width="29%" height="23" align="center">密码问题</TD>
            <TD width="71%" class="padding-left-10"><INPUT   type=text maxLength=50 size=30 name="Question">
            </TD>
          </TR>
          <TR class="table_bg_n" >
            <TD width="29%" height="23" align="center">问题答案</TD>
            <TD width="71%" class="padding-left-10"><INPUT   type=text maxLength=20 size=30 name="Answer">
            </TD>
          </TR>
          <TR class="table_bg_n" >
            <TD width="29%" height="23" align="center">性别<BR>
            </TD>
            <TD width="71%" class="padding-left-10"><INPUT type=radio CHECKED value="1" name=sex>
            男 &nbsp;&nbsp;
            <INPUT type=radio value="0" name=sex>
            女</TD>
          </TR>
          <TR class="table_bg_n" >
            <TD width="29%" height="23" align="center">Email地址<BR>
            </TD>
            <TD width="71%" class="padding-left-10"><INPUT   maxLength=50 size=40 name=Email>
            </TD>
          </TR>
          <TR class="table_bg_n" >
            <TD height="23" align="center">公司网址</TD>
            <TD width="71%" class="padding-left-10"><INPUT name=homepage id="homepage" value="http://" size=40   maxLength=50></TD>
          </TR>
          <TR class="table_bg_n" >
            <TD width="29%" height="23" align="center">公司名称</TD>
            <TD width="71%" class="padding-left-10"><INPUT name=Comane id="Comane" size=40   maxLength=100></TD>
          </TR>
          <TR class="table_bg_n" >
            <TD width="29%" height="23" align="center"><p>联系地址</p></TD>
            <TD width="71%" class="padding-left-10"><input name=Add id="Add" size=40 maxlength=20>
            </TD>
          </TR>
          <TR class="table_bg_n" >
            <TD height="23" align="center">联系人</TD>
            <TD width="71%" class="padding-left-10"><input name=Somane id="Somane" size=20 maxlength=20></TD>
          </TR>
          <TR class="table_bg_n" >
            <TD height="23" align="center">邮政编码</TD>
            <TD width="71%" class="padding-left-10"><input name=Zip id="Zip" size=20 maxlength=20>
            </TD>
          </TR>
          <TR class="table_bg_n" >
            <TD height="23" align="center">联系电话</TD>
            <TD width="71%" class="padding-left-10"><input name=Phone id="Phone" value="+86" size=40 maxlength=20>
            </TD>
          </TR>
          <TR class="table_bg_n" >
            <TD height="23" align="center">传 真</TD>
            <TD class="padding-left-10"><INPUT name=Fox id="Fox" size=40 maxLength=50></TD>
          </TR>
          <TR bgcolor="#DAE2F5" >
            <TD width="29%" height="23" align="center">审&nbsp;核</TD>
            <TD width="71%" class="padding-left-10"><input name="LockUser" type="checkbox" id="LockUser" value="True" checked>
            通过审核</TD>
          </TR>
          <TR class="table_bg_n" >
            <TD height="25" colspan="2" align="center"><INPUT   type=submit value="添 加 会 员" name=Submit>
&nbsp;&nbsp;
            <input type="reset" name="Submit" value="重置"></TD>
          </TR>
      </TABLE></td>
    </tr>
  </table>
</form>
</body>
</html>
