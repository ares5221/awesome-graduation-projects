<!--#include file="inc/conn.asp"-->
<%
'Call QuanXian(Netant_admin_B)
IF Request("action")="Modify" Then
Set rsN=Server.CreateObject("adodb.recordset")
SQL="select * from Netant_Admin "
rsN.open SQL,Conn,1,3
	banben_China=Request("banben_China")
	banben_En=Request("banben_En")
	P_Register_B=Request("P_Register_B")
	P_Index_B=Request("P_Index_B")
	P_Content_B=Request("P_Content_B")
	P_Name_B=Request("P_Name_B")
	P_Other1_Name_B=Request("P_Other1_Name_B")
	P_Other2_Name_B=Request("P_Other2_Name_B")
	P_Other3_Name_B=Request("P_Other3_Name_B")
	P_Other1_Name=Request("P_Other1_Name")
	P_Other2_Name=Request("P_Other2_Name")
	P_Other3_Name=Request("P_Other3_Name")
	P_Other1_Name_En=Request("P_Other1_Name_En")
	P_Other2_Name_En=Request("P_Other2_Name_En")
	P_Other3_Name_En=Request("P_Other3_Name_En")
	
	About_B=Request("About_B")
	Products_R_B=Request("Products_R_B")
	Products_B=Request("Products_B")
	News_B=Request("News_B")
	Register_B=Request("Register_B")
	Job_B=Request("Job_B")
	GuestBook_B=Request("GuestBook_B")
	Vote_B=Request("Vote_B")
	Link_B=Request("Link_B")
	Netant_admin_B=Request("Netant_admin_B")

	Netant_G=Request("Netant_G")
	
	IF About_B="True" Then
		RsN("About_B")=About_B
	Else
		RsN("About_B")=False
	End IF
	
	IF banben_China="True" Then
		RsN("banben_China")=banben_China
	Else
		RsN("banben_China")=False
	End IF
	
	IF banben_En="True" Then
		RsN("banben_En")=banben_En
	Else
		RsN("banben_En")=False
	End IF
	
	IF P_Name_B="True" Then
		RsN("P_Name_B")=P_Name_B
	Else
		RsN("P_Name_B")=False
	End IF
	
	IF P_Register_B="True" Then
		RsN("P_Register_B")=P_Register_B
	Else
		RsN("P_Register_B")=False
	End IF
	
	IF P_Index_B="True" Then
		RsN("P_Index_B")=P_Index_B
	Else
		RsN("P_Index_B")=False
	End IF
	
	IF P_Content_B="True" Then
		RsN("P_Content_B")=P_Content_B
	Else
		RsN("P_Content_B")=False
	End IF
	
	IF P_Other1_Name_B="True" Then
		RsN("P_Other1_Name_B")=P_Other1_Name_B
	Else
		RsN("P_Other1_Name_B")=False
	End IF
	
	IF P_Other2_Name_B="True" Then
		RsN("P_Other2_Name_B")=P_Other2_Name_B
	Else
		RsN("P_Other2_Name_B")=False
	End IF
	
	IF P_Other3_Name_B="True" Then
		RsN("P_Other3_Name_B")=P_Other3_Name_B
	Else
		RsN("P_Other3_Name_B")=False
	End IF
	
	'*********************************************
	IF About_B="True" Then
		RsN("About_B")=About_B
	Else
		RsN("About_B")=False
	End IF
	
	IF Products_R_B="True" Then
		RsN("Products_R_B")=Products_R_B
	Else
		RsN("Products_R_B")=False
	End IF
	
	IF Products_B="True" Then
		RsN("Products_B")=Products_B
	Else
		RsN("Products_B")=False
	End IF
	
	IF News_B="True" Then
		RsN("News_B")=News_B
	Else
		RsN("News_B")=False
	End IF
	
	IF Register_B="True" Then
		RsN("Register_B")=Register_B
	Else
		RsN("Register_B")=False
	End IF
	
	IF Job_B="True" Then
		RsN("Job_B")=Job_B
	Else
		RsN("Job_B")=False
	End IF
	
	IF GuestBook_B="True" Then
		RsN("GuestBook_B")=GuestBook_B
	Else
		RsN("GuestBook_B")=False
	End IF
	
	IF Vote_B="True" Then
		RsN("Vote_B")=Vote_B
	Else
		RsN("Vote_B")=False
	End IF
	
	IF Link_B="True" Then
		RsN("Link_B")=Link_B
	Else
		RsN("Link_B")=False
	End IF
	
	IF Netant_admin_B="True" Then
		RsN("Netant_admin_B")=Netant_admin_B
	Else
		RsN("Netant_admin_B")=False
	End IF
	'*********************************************
	RsN("P_Other1_Name")=P_Other1_Name
	RsN("P_Other2_Name")=P_Other2_Name
	RsN("P_Other3_Name")=P_Other3_Name
	RsN("P_Other1_Name_En")=P_Other1_Name_En
	RsN("P_Other2_Name_En")=P_Other2_Name_En
	RsN("P_Other3_Name_En")=P_Other3_Name_En
	'*********************************************
	IF Netant_G="True" Then
		RsN("Netant_G")=Netant_G
	Else
		RsN("Netant_G")=False
	End IF
	
RsN.Update
rsN.Close
set rsN=nothing
Tw("<Script>alert('修改成功');parent.location='manage_main.asp';</Script>")
Response.End
End IF
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="style_admin.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #990000}
.style2 {
	color: #330066;
}
-->
</style>
<SCRIPT language=javascript1.2>
function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
}
}
</SCRIPT>
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="26" background="images/admin_bg_1.gif"><table width="250" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="50%" align="center" class="table_bg_size"><a href="netant_admin.asp" style="color:#FFFFFF;">1、后台设置</a></td>
        <td width="50%" align="center" class="table_bg_size"><a href="netant_admin_content.asp" style="color:#FFFFFF;">2、页面栏目设置</a></td>
      </tr>
    </table></td>
  </tr>
</table>
<form name="form1" method="post" action="?action=Modify">
  <table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="table_border">
    <tr>
      <td colspan="2" class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
          <tr>
            <td align="center" class="table_bg_size">后台设置</td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
        <tr bgcolor="#D3E2F5">
          <td height="25" colspan="4" class="padding-left-10"><span class="style1">版本选择</span></td>
          </tr>
          <tr class="table_bg_n">
            <td width="25%" height="25" align="center">中文版</td>
            <td width="25%" class="padding-left-10"><input name="banben_China" type="checkbox" id="banben_China" value="True" <%IF banben_China=True Then Tw("checked") End IF%> onClick="showsubmenu(1)"></td>
            <td width="25%" align="center">英文版</td>
            <td class="padding-left-10"><input name="banben_En" type="checkbox" id="banben_En" value="True" <%IF banben_En=True Then Tw("checked") End IF%> onClick="showsubmenu(2)"></td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" colspan="4" align="center" class="style1">(注：选中为使用版要本,至少要选中一个版本)</td>
          </tr>
          <tr bgcolor="#D3E2F5">
            <td height="25" colspan="4" class="padding-left-10 style1">基本栏目管理</td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center">选择</td>
            <td height="25" colspan="3" class="padding-left-10"><input name="About_B" type="checkbox" id="About_B" value="True" <%IF About_B=True Then Tw("checked") End IF%>>
                <span class="style1">(选择为允许被管理)</span></td>
          </tr>
		  <tr bgcolor="#D3E2F5">
            <td height="25" colspan="4" class="padding-left-10 style1">网蚁网络广告</td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center">选择</td>
            <td height="25" colspan="3" class="padding-left-10"><input name="Netant_G" type="checkbox" id="Netant_G" value="True" <%IF Netant_G=True Then Tw("checked") End IF%>>
            <span class="style1">(选择为允许显示广告)</span></td>
          </tr>
          <tr bgcolor="#D3E2F5">
            <td height="25" colspan="4" class="padding-left-10"><span class="style1">功能选择</span></td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center">产品管理</td>
            <td height="25" class="padding-left-10"><input name="Products_B" type="checkbox" id="Products_B" value="True" <%IF Products_B=True Then Tw("checked") End IF%>></td>
            <td height="25" align="center">新闻管理</td>
            <td height="25" class="padding-left-10">              <input name="News_B" type="checkbox" id="News_B" value="True" <%IF News_B=True Then Tw("checked") End IF%>>            </td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center">会员管理</td>
            <td height="25" class="padding-left-10"><input name="Register_B" type="checkbox" id="Register_B" value="True" <%IF Register_B=True Then Tw("checked") End IF%>>            </td>
            <td height="25" align="center">人力资源</td>
            <td height="25" class="padding-left-10"><input name="Job_B" type="checkbox" id="Job_B" value="True" <%IF Job_B=True Then Tw("checked") End IF%>></td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center">在线留言</td>
            <td height="25" class="padding-left-10"><input name="GuestBook_B" type="checkbox" id="GuestBook_B" value="True" <%IF GuestBook_B=True Then Tw("checked") End IF%>>            </td>
            <td height="25" align="center">发布调查</td>
            <td height="25" class="padding-left-10"><input name="Vote_B" type="checkbox" id="Vote_B" value="True" <%IF Vote_B=True Then Tw("checked") End IF%>></td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center">友情链接</td>
            <td height="25" class="padding-left-10"><input name="Link_B" type="checkbox" id="Link_B" value="True" <%IF Link_B=True Then Tw("checked") End IF%>>            </td>
            <td height="25" align="center">后台设置</td>
            <td height="25" class="padding-left-10"><input name="Netant_admin_B" type="checkbox" id="Netant_admin_B" value="True" <%IF Netant_admin_B=True Then Tw("checked") End IF%>></td>
          </tr>
          <tr bgcolor="#D3E2F5">
            <td height="25" colspan="4" class="padding-left-10 style1">选择产品字段</td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center" class="padding_1">批量产品</td>
            <td colspan="3" class="padding-left-10"><input name="Products_R_B" type="checkbox" id="Products_R_B" value="True" <%IF Products_R_B=True Then Tw("checked") End IF%>></td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center" class="padding_1">产品名称</td>
            <td class="padding-left-10"><input name="P_Name_B" type="checkbox" id="P_Name_B" value="True" <%IF P_Name_B=True Then Tw("checked") End IF%>></td>
            <td align="center">是否会员产品</td>
            <td class="padding-left-10"><input name="P_Register_B" type="checkbox" id="P_Register_B" value="True" <%IF P_Register_B=True Then Tw("checked") End IF%>></td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center">备注 </td>
            <td class="padding-left-10"><input name="P_Content_B" type="checkbox" id="P_Content_B" value="True" <%IF P_Content_B=True Then Tw("checked") End IF%>></td>
            <td align="center">是否首页产品</td>
            <td class="padding-left-10"><input name="P_Index_B" type="checkbox" id="P_Index_B" value="True" <%IF P_Index_B=True Then Tw("checked") End IF%>></td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center"><%Tw(P_Other1_Name)%></td>
            <td class="padding-left-10"><input name="P_Other1_Name_B" type="checkbox" id="P_Other1_Name_B" value="True" <%IF P_Other1_Name_B=True Then Tw("checked") End IF%>></td>
            <td align="center"><%Tw(P_Other2_Name)%></td>
            <td class="padding-left-10"><input name="P_Other2_Name_B" type="checkbox" id="P_Other2_Name_B" value="True" <%IF P_Other2_Name_B=True Then Tw("checked") End IF%>></td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center"><%Tw(P_Other3_Name)%></td>
            <td class="padding-left-10"><input name="P_Other3_Name_B" type="checkbox" id="P_Other3_Name_B" value="True" <%IF P_Other3_Name_B=True Then Tw("checked") End IF%>></td>
            <td class="padding-left-10">&nbsp;</td>
            <td class="padding-left-10">&nbsp;</td>
          </tr>
		  <tbody  style="display:<%IF banben_China=False Then Tw("none") End IF%>" id='submenu1'>
          <tr bgcolor="#D3E2F5">
            <td height="25" colspan="4" class="padding-left-10 style1">产品中文字段名修改</td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center"><%Tw(P_Other1_Name)%></td>
            <td class="padding-left-10"><input name="P_Other1_Name" type="text" id="P_Other1_Name" size="17" value="<%=P_Other1_Name%>"></td>
            <td align="center"><%Tw(P_Other2_Name)%></td>
            <td class="padding-left-10"><input name="P_Other2_Name" type="text" id="P_Other2_Name" size="17" value="<%=P_Other2_Name%>"></td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center"><%Tw(P_Other3_Name)%></td>
            <td class="padding-left-10"><input name="P_Other3_Name" type="text" id="P_Other3_Name" size="17" value="<%=P_Other3_Name%>"></td>
            <td class="padding-left-10">&nbsp;</td>
            <td class="padding-left-10">&nbsp;</td>
          </tr>
		  </tbody>
		  <tbody  style="display:<%IF banben_En=False Then Tw("none") End IF%>" id='submenu2'>
          <tr bgcolor="#D3E2F5">
            <td height="25" colspan="4" class="padding-left-10 style1">产品英文字段名修改</td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center"><%Tw(P_Other1_Name_En)%></td>
            <td class="padding-left-10"><input name="P_Other1_Name_En" type="text" id="P_Other1_Name_En" size="17" value="<%=P_Other1_Name_En%>"></td>
            <td align="center"><%Tw(P_Other2_Name_En)%></td>
            <td class="padding-left-10"><input name="P_Other2_Name_En" type="text" id="P_Other2_Name_En" size="17" value="<%=P_Other2_Name_En%>"></td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center"><%Tw(P_Other3_Name_En)%></td>
            <td class="padding-left-10"><input name="P_Other3_Name_En" type="text" id="P_Other3_Name_En" size="17" value="<%=P_Other3_Name_En%>"></td>
            <td class="padding-left-10">&nbsp;</td>
            <td class="padding-left-10">&nbsp;</td>
          </tr>
		  </tbody>
          <tr class="table_bg_n">
            <td height="25" colspan="4" align="center"><input type="submit" name="Submit" value="修改设置">
&nbsp;&nbsp;&nbsp;
<input type="reset" name="Submit" value="重置"></td>
          </tr>
      </table></td>
    </tr>
  </table>
</form>
</body>
</html>