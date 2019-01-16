<!--#include file="inc/conn.asp"-->
<%
Call QuanXian(Products_B)
ID=Request("ID")
Set P_Modify=Conn.execute("select * from Products Where ID="&ID&"")
IF P_Modify.Eof Then
	TwScript("参数有误")
End IF
%>
<%
dim rs
dim sql
dim count
set rs=server.createobject("adodb.recordset")
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.p {padding-left:10px;}
.style1 {color: #990000}
-->
</style>
<script>
function cek(formname)
{

	if(formname.P_Item.value=="")
	{
	alert("货号必须填写")
	formname.P_Item.focus()
	return false;
	}
	
	if(formname.smpic.value=="" | formname.smpic.value.length<4)
	{
	alert("小图片不能为空或地址有误")
	formname.smpic.focus()
	return false;
	}
	
	if(formname.bigpic.value=="" | formname.bigpic.value.length<4)
	{
	alert("大图片不能为空或地址有误")
	formname.bigpic.focus()
	return false;
	}
}
</script>
</head>

<body style="padding-bottom:10px;">
<form name="myform" method="post" action="p_Sava2.asp?action=Modify" onSubmit="return cek(this)">
  <table width="85%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="table_border">
    <tr bgcolor="#DBE6FF">
      <td colspan="2" class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
          <tr>
            <td align="center" class="table_bg_size"> 修改摄影师</td>
          </tr>
      </table></td>
    </tr>
    <tr bgcolor="#DBE6FF">
      <td colspan="2"><table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
		  <tr class="table_bg_n">
            <td width="30%" height="25" align="center">姓名</td>
            <td width="70%" class="padding-left-10"><input name="P_Name" type="text" id="P_Name" value="<%Tw(P_Modify("P_Name"))%>" size="40">
			<input type="hidden" name="BigClassName" value="71">
              <span class="style1">*(带*必填)</span></td>
          </tr>
		  		  <tr class="table_bg_n">
            <td height="25" align="center"> 摄影时间</td>
		    <td class="padding-left-10"><input name="P_Item" type="text" id="P_Item" value="<%Tw(P_Modify("P_Item"))%>" size="40">
                <span class="style1"></span></td>
	      </tr>
		  <tr class="table_bg_n">
            <td height="25" align="center">摄影类型</td>
            <td class="padding-left-10"><input name="P_Other1_Name" type="text" id="P_Other1_Name" value="<%Tw(P_Modify("P_Other1_Name"))%>" size="40">
			<input type="hidden" name="smpic" value="../products_pic/no.gif">			</td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center">照片</td>
            <td class="padding-left-10"><input name="bigpic" type="text" id="bigpic" value="<%Tw(P_Modify("P_Bigpic"))%>" size="41" maxlength="120">
              <input type="button" name="Submit2" value="上 传" onClick="window.open('upload_flash.asp?formname=myform&editname=bigpic&uppath=../products_pic&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')">
              <span class="style1">*</span></td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center"> 添加日期</td>
            <td class="padding-left-10"><input name="P_Time" type="text" id="P_Time" value="<%Tw(P_Modify("P_Time"))%>" maxlength="50" style="background-color:#EFEFEF">
              <span class="style1">日期正确格式为2006-12-12</span></td>
          </tr>
          <tr class="table_bg_n"><input name="ID" type="hidden"  id="ID" value="<%Tw(P_Modify("ID"))%>">
            <td height="25" colspan="2" align="center"><input type="submit" name="Submit" value="修改摄影师">
            &nbsp;&nbsp;
            <input type="reset" name="Submit" value="重新填写"></td>
          </tr>
      </table></td>
    </tr>
  </table>
</form>
</body>
</html>
