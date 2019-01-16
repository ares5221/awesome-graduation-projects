<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="inc/conn.asp"-->
<!--#include file="inc/md5.asp"-->
<!--添加管理员程序开始-->
<%
if Request.Form("action")="添加管理员" then
	'判断管理员的用户名是否已经在在
	sqlstr="select * from admin where admin_user='"&Request.Form("admin_user")&"'"
	set rs1=conn.execute(sqlstr)
	if not rs1.eof then
		Response.Write("管理员用户名不能重复，请重新添加")
		Response.Write("<a href='system_admin.asp'>返回</a>")
		Response.End()
	end if
	
	sqlstr="insert into admin(admin_user,admin_pwd,admin_Name,admin_bumen) values('"&Request.Form("admin_user")&"','"&md5(Request.Form("password"))&"','"&Request.Form("admin_Name")&"','"&Request.Form("admin_bumen")&"')"
	conn.execute(sqlstr)
	Response.Write("<script>alert('管理员"&Request.Form("admin_user")&"添加成功');window.location='system_admin.asp'</script>")
end if
%>
<!--添加管理员程序结束-->


<!--修改管理员密码程序开始-->
<%
if Request.Form("action")="修改密码" then
	IF Request("password")<>Empty Then
		sqlstr="update admin set admin_pwd='"&md5(Request.Form("password"))&"',admin_Name='"&Request.Form("admin_Name")&"',admin_bumen='"&Request.Form("admin_bumen")&"' where id="&Request("id")
	Else
		sqlstr="update admin set admin_Name='"&Request.Form("admin_Name")&"',admin_bumen='"&Request.Form("admin_bumen")&"' where id="&Request("id")
	End IF
	conn.execute(sqlstr)
	Response.Write("<script>alert('管理员"&Request.Form("admin_user")&"密码修改成功');window.location='system_admin.asp'</script>")
end if
%>
<!--修改管理员密码程序结束-->

<!--删除管理员程序开始-->
<%
if Request("action")="del" then
	sqlstr="delete from admin where id="&Request("id")
	conn.execute(sqlstr)
	Response.Write("<script>alert('删除成功');window.location='system_admin.asp'</script>")
end if
%>
<!--删除管理员程序结束-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<script language="javascript">
function chkform(formname){
	if(formname.admin_user.value==""){
		alert("请填写管理员用户名")
		return false
	}
	if(formname.password.value==""){
		alert("请填写密码")
		return false
	}
	if(formname.password.value!=formname.password1.value){
		alert("两次输入的密码不同")
		return false
	}
	if(formname.admin_Name.value==""){
		alert("姓名不能为空")
		return false
	}
}
function chkform2(formname){
	if(formname.password.value!=formname.password1.value){
		alert("两次输入的密码不同")
		return false
	}
	if(formname.admin_Name.value==""){
		alert("姓名不能为空")
		return false
	}
}
</script>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #990000}
-->
</style>
</head>

<body>
<table width="100%" height="500" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top">
<!--修改管理员密码表单开始-->
<%if Request("action")="changpwdform" then
sqlstr="select * from admin where id="&Request("id")
set rs=conn.execute(sqlstr)
%>
<form method="post" action="system_admin.asp" onSubmit="return chkform2(this)">
  <table width="85%" border="0" cellpadding="0" cellspacing="0" class="table_border">
    <tr>
      <td colspan="2" class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
        <tr>
          <td align="center" class="table_bg_size">管理员帐号密码修改</td>
        </tr>
      </table></td>
      </tr>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
        <tr class="table_bg_n">
          <td width="30%" height="25" align="center">用户名</td>
          <td class="padding-left-10"><%=rs("admin_user")%></td>
        </tr>
        <tr class="table_bg_n">
          <td height="25" align="center">密码</td>
          <td class="padding-left-10"><input name="password" type="password" id="password" size="30" maxlength="15">
            <span class="huang style1">(不修改请保留空)</span></td>
        </tr>
        <tr class="table_bg_n">
          <td height="25" align="center">确认密码</td>
          <td class="padding-left-10"><input name="password1" type="password" id="password1" size="30" maxlength="15">
            </td>
        </tr>
        <tr class="table_bg_n">
          <td height="25" align="center">姓名</td>
          <td class="padding-left-10"><input name="admin_Name" type="text" id="admin_Name" value="<%=rs("admin_Name")%>" size="30" maxlength="15">
            <span class="style1">*</span> </td>
        </tr>
        <tr class="table_bg_n">
          <td height="25" align="center">部门</td>
          <td class="padding-left-10"><input name="admin_bumen" type="text" id="admin_bumen" value="<%=rs("admin_bumen")%>" size="30" maxlength="15"></td>
        </tr>
        <tr class="table_bg_n">
          <td height="25" colspan="2" align="center"><input name="action" type="submit" id="action" value="修改密码">
              <input type="hidden" name="id" id="id" value="<%=rs("id")%>"></td>
        </tr>
      </table></td>
    </tr>
  </table>
  </form>
<%end if%>
<!--修改管理员密码表单开始-->
<!--默认页开始-->
<%if Request("action")="" then%>
	<table width="85%" border="0" cellpadding="0" cellspacing="0" style="margin-bottom:25px;">
      <tr>
        <td align="center"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_border">
            <tr>
              <td class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
                  <tr>
                    <td align="center" class="table_bg_size"><strong>修改、删除管理员</strong></td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
                  <tr align="center" class="table_bg_n">
                    <td width="117" height="25"><strong>管理员帐户</strong></td>
                    <td width="171"><strong>姓名</strong></td>
                    <td width="165"><strong>部门</strong></td>
                    <td width="97"><strong>操作一</strong></td>
                    <td width="97"><strong>操作二</strong></td>
                  </tr>
                  <%
			sqlstr="select * from admin"
			Set rs=conn.execute(sqlstr)
			do while not rs.eof
			%>
                  <tr align="center" class="table_bg_n">
                    <td height="22"><%=rs("admin_user")%></td>
                    <td><%=rs("admin_Name")%></td>
                    <td><%=rs("admin_bumen")%></td>
                    <td><a href="system_admin.asp?action=changpwdform&id=<%=rs("id")%>">编辑</a></td>
                    <td><a href="system_admin.asp?action=del&id=<%=rs("id")%>" onClick="if (!confirm('确实要删除管理员吗？')){return false}">删除</a></td>
                  </tr>
                  <%
			rs.movenext
			loop
			%>
              </table></td>
            </tr>
        </table></td>
      </tr>
    </table><table width="85%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_border">
          <tr>
            <td class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
              <tr>
                <td align="center" class="table_bg_size">管理员帐号添加</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td><form method="post" action="system_admin.asp" onSubmit="return chkform(this)" style="margin:0px;">
              <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
                <tr class="table_bg_n">
                  <td width="30%" height="25" align="center">用户名</td>
                  <td class="padding-left-10"><input name="admin_user" type="text" id="admin_user" size="30" maxlength="15">
                    <span class="style1">*(带*必须填写)</span></td>
                </tr>
                <tr class="table_bg_n">
                  <td height="25" align="center">密码</td>
                  <td class="padding-left-10"><input name="password" type="password" id="password" size="30" maxlength="15">
                    <span class="style1">*</span></td>
                </tr>
                <tr class="table_bg_n">
                  <td height="25" align="center">确认密码</td>
                  <td class="padding-left-10"><input name="password1" type="password" id="password1" size="30" maxlength="15">
                    <span class="style1">*</span></td>
                </tr>
                <tr class="table_bg_n">
                  <td height="25" align="center">姓名</td>
                  <td class="padding-left-10"><input name="admin_Name" type="text" id="admin_Name" size="30" maxlength="15">
                    <span class="style1">*</span></td>
                </tr>
                <tr class="table_bg_n">
                  <td height="25" align="center">部门</td>
                  <td class="padding-left-10"><input name="admin_bumen" type="text" id="admin_bumen" size="30" maxlength="15"></td>
                </tr>
                <tr align="center" class="table_bg_n">
                  <td height="25" colspan="2"><input name="action" type="submit" id="action" value="添加管理员">
                    &nbsp;&nbsp;&nbsp;
                    <input type="button" name="Submit" value="重新填写"></td>
                </tr>
              </table>
            </form></td>
          </tr>
        </table></td>
      </tr>
    </table>
      <%end if%>
<!--默认页开始-->
    </td>
  </tr>
</table>
</body>
</html>
