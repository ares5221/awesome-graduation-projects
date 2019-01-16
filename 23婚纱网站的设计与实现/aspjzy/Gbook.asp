<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Function.asp"-->
<%
Call QuanXian(GuestBook_B)
IF Request("del")<>Empty AND Request("ID")<>Empty Then
	Conn.execute("delete * from Gbook Where ID="&Request("ID")&"")
	Response.Write("<Script>alert('删除成功');window.location='Gbook.asp'</Script>")
	Response.End
End IF
'***************************************************************************************************
	SQL="select * from Gbook order by id Desc "
	set Rspro=Server.CreateObject("Adodb.Recordset")
	Rspro.open SQL,Conn,1,1
	dim strFileName,MaxPerPage
	strField=trim(request("Field"))
	if request("page")<>"" then
		currentPage=cint(request("page"))
	else
		currentPage=1
	end if
	ShowSmallClassType=ShowSmallClassType_Default
	MaxPerPage=10
	strFileName="?"
	totalput=Rspro.Recordcount
'************************************************************************************************
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.p {padding-left:10px;}
.style1 {color: #330066}
-->
</style>
</head>

<body>
<table width="85%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="table_border">
  <tr >
    <td colspan="2" class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
        <tr>
          <td align="center" class="table_bg_size">留言管理</td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="2">
	
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
        <tr align="center" class="table_bg_n">
          <td width="8%"><strong>排序</strong></td>
          <td width="50%" height="25"><strong>留言内容</strong></td>
          <td width="17%"><strong>留言日期</strong></td>
          <td width="25%"><strong>操作</strong></td>
        </tr>
		<%
		IF Not Rspro.Eof then
			IF currentPage<>1 then
			Rspro.Move MaxPerPage*(currentPage-1)
			End if
		for T=1 to MaxPerPage
	   %>
        <tr class="table_bg_n">
          <td align="center"><%=T%></td>
          <td height="25" class="padding-left-10"><a href="Gbook_ck.asp?ID=<%=Rspro("ID")%>&Sava=Q"><%=Rspro("title")%></a></td>
          <td align="center"><%=Dtime(Rspro("addtime"),1)%></td>
          <td align="center"><%
		  IF Rspro("sh")=True Then 
		 	Tw("<a href='Gbook_ck.asp?ID="&Rspro("ID")&"&Sava=sh'>已审核</a>")
		  Else 
		  	Tw("<a href='Gbook_ck.asp?ID="&Rspro("ID")&"&Sava=sh' style='color:#990000'>未审核</a>")
		  End IF
		  %>/<a href="Gbook_ck.asp?ID=<%=Rspro("ID")%>&Sava=huifu"><%
		  IF Rspro("replay")<>"" Then 
		  	Tw("已回复")
		  Else
			Tw("<font style='Color:#990000'>未回复</font>")
		  End IF%></a>/<a href="?ID=<%=Rspro("ID")%>&Page=<%=currentPage%>&del=del">删除</a></td>
        </tr>
	   <%
		Rspro.MoveNext
		IF Rspro.Eof then exit for 
		Next
		End if
		Call tclose(Rspro)
	  %>
    </table>
	
	</td>
  </tr>
</table>
</body>
</html>
