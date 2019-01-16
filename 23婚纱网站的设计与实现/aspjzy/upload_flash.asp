<%
uppath=request("uppath")&"/"		'文件上传路径
filelx=request("filelx")				'文件上传类型
formName=request("formName")			'回传到上页面编辑框所在Form的Name
EditName=request("EditName")			'回传到上页面编辑框的Name
Big_file="400*300"
Small_file="156*117"
%>
<html>
<head>
<title>图片上传</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
td{font-size:12px}
a{color:#000000;text-decoration: none}
a:hover{text-decoration: underline}
.tx{height:16px;width:30px;border-color:black black #000000;border-top-width:0px;border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px; font-size: 12px; background-color: #eeeeee; color: #0000FF}
.button{font-size:12px;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;border-left-width: 0px; height: 16px; width: 80px; background-color: #eeeeee; cursor: hand}
.tx1{height:20px;width:30px;font-size:12px;border:1px solid;border-color:black black #000000;color: #0000FF}
-->
</style>
<script language="javascript">
<!--
function mysub()
{
		esave.style.visibility="visible";
}
-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="upfile_flash.asp" enctype="multipart/form-data" >
  <div id="esave" style="position:absolute; top:18px; left:40px; z-index:10; visibility:hidden"> 
    <TABLE WIDTH=340 BORDER=0 CELLSPACING=0 CELLPADDING=0>
      <TR><td width=20%></td>
	<TD bgcolor=#104A7B width="60%"> 
	<TABLE WIDTH=100% height=120 BORDER=0 CELLSPACING=1 CELLPADDING=0>
	<TR> 
	          <td bgcolor=#eeeeee align=center><font color=red>正在上传文件，请稍候...</font></td>
	</tr>
	</table>
	</td><td width=20%></td>
	</tr></table></div>
  <table width="400" border="1" cellspacing="0" cellpadding="3" align="center" bordercolordark="#FFCC00" bordercolorlight="#FFCC00">
    <tr bgcolor="#FFCC00"> 
      <td height="22" align="left" valign="middle" bgcolor="#FFE479" width="400">&nbsp;图片上传 
        <input type="hidden" name="filepath" value="<%=uppath%>">
        <input type="hidden" name="filelx" value="<%=filelx%>">
        <input type="hidden" name="EditName" value="<%=EditName%>">
        <input type="hidden" name="FormName" value="<%=formName%>">
        <input type="hidden" name="act" value="uploadfile">
      </td>
    </tr>
    <tr align="center" valign="middle"> 
      <td align="left" id="upid" height="80" width="400"> 选择文件: 
        <input type="file" name="file1" style="width:300'" class="tx1" value="">
        <br>
        <br></td>
    </tr>
    <tr align="center" valign="middle" bgcolor="#eeeeee"> 
      <td bgcolor="#FFE479" height="24" width="400"> 
        <input type="submit" name="Submit" value="· 开始上传 ·" class="button" onClick="javascript:mysub()">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
