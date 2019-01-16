<!--#include file="inc/conn.asp"-->
<%
'Call QuanXian(About_B)
title=Request("title")
content=Request("content")
content=replace(content,"'","''")
content=replace(content,"%","‰")
Content_en=Request("Content_en")
Content_en=replace(Content_en,"'","''")
Content_en=replace(Content_en,"%","‰")
IF Request("no")="eshop" Then
	conn.execute("update Content set Content='"&Content&"',Content_en='"&Content_en&"' Where title='"&title&"' ")
	Tw("<script>alert('修改成功');window.location='Content.asp?title="&title&"'</script>")
	Response.End
End IF

Set rs=conn.execute("select * from Content where title='"&title&"'")
IF rs.eof then
	Twscript("参数有误")
End if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.b_t {padding-left:10px;padding-right:10px;}
.p {padding-left:10px;}
.style1 {color: #FF0000}
-->
</style>

</head>

<body>
<form name="form1" method="post" action="?no=eshop" onSubmit="return useradd(this)">
  <table  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="table_border">
    <tr >
      <td colspan="2" class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
          <tr>
            <td align="center" class="table_bg_size"><%Tw(rs("title"))%></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td colspan="2"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
   <%IF banben_China="True" Then%>
	    <tr class="table_bg_n">
          <td height="25"><textarea name="content" style="display:none"><%Tw(rs("Content"))%></textarea>
          <IFRAME ID="eWebEditor" SRC="../WebEditor/eWebEditor.asp?id=content&style=s_coolblue&originalfilename=d_originalfilename&savefilename=d_savefilename&savepathfilename=d_savepathfilename" FRAMEBORDER="0" SCROLLING="no" WIDTH="700" HEIGHT="550"></IFRAME></td>
          </tr>
	<%IF banben_En="True" Then%>
        <tr class="table_bg_n">
          <td height="25"><div align="center"><%Tw("<strong>(中文版)</strong>")%></div></td>
	</tr>
	<%
	End IF
	End IF
	IF banben_En="True" Then
	%>
        <tr class="table_bg_n">
          <td height="25"><textarea name="content_en" style="display:none"><%Tw(rs("Content_en"))%></textarea>
          <IFRAME ID="eWebEditor1" SRC="eWebEditor.asp?id=content_en&style=s_coolblue&originalfilename=d_originalfilename&savefilename=d_savefilename&savepathfilename=d_savepathfilename" FRAMEBORDER="0" SCROLLING="no" WIDTH="550" HEIGHT="450"></IFRAME></td>
        </tr>
	<%IF banben_China="True" Then%>
        <tr class="table_bg_n">
          <td height="25" align="center"><%Tw("<strong>(English)</strong>")%></td>
        </tr>
	<%
	End IF
	End IF
	%>
        <tr class="table_bg_n"><input type="Hidden" value="<%Tw(rs("title"))%>" name="title">
          <td height="25" align="center"><input type="submit" value="发布信息"></td>
        </tr>
      </table></td>
    </tr>
  </table>
</form>
</body>
</html>
