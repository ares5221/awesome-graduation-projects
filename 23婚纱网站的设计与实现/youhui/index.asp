<!--#include file="../inc/conn.asp" -->
<!--#include file="../inc/function.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="title" content="Charles">
<META content="原古设计 网页制作 软件开发 网络推广 域名注册 domain domain domain domain homepage homepage homepage homepage web hosting web hosting web hosting" name=keywords>
<META content=原古设计,提供国际国内域名注册，包括中文域名的注册；虚拟主机，空间的租用，以及设计制作主页等服务 name=description>
<title><%= Web_Name %></title>
<link href="../css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style></head>

<body>
<!--#include file="../inc/top.asp" -->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="290"><img src="../images/about_03.jpg" width="290" height="449"></td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="../images/youhui.jpg" width="581" height="128"></td>
        <td><img src="../images/about_06.jpg" width="131" height="128"></td>
      </tr>
    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="86"><img src="../images/about_07.jpg" width="86" height="209"></td>
          <td valign="top" background="../images/about_08.jpg" style="padding:8px; line-height:20px;"><table width="95%" border="0" cellspacing="0" cellpadding="3" align="center">
                                      <%
			type_Class=75
			IF type_Class=Empty Then
			   type_Class=Small_Class_ID
			End IF
			if type_Class="" then
			SQL="select * from News order by N_X Desc"
			else
			SQL="select * from News Where Small_Class="&type_Class&" order by N_X Desc"
			end if
			set Rsn=Server.CreateObject("Adodb.Recordset")
			Rsn.open SQL,Conn,1,1
			dim strFileName,MaxPerPage
			strField=trim(request("Field"))
			if request("page")<>"" then
			currentPage=cint(request("page"))
			else
			currentPage=1
			end if
			ShowSmallClassType=ShowSmallClassType_Default
			MaxPerPage=8
			strFileName="index.asp?type_Class="&type_Class&"&"
			totalput=Rsn.Recordcount
			IF Not Rsn.Eof then
			IF currentPage<>1 then
			Rsn.Move MaxPerPage*(currentPage-1)
			End if
			for T=1 to MaxPerPage
		   %>
                                      <tr height="28">
                                        <td width="77%" height="22"><font color="#AEAEAE">· </font> <a href="#" onClick="window.open('news_show.asp?id=<%= Rsn("ID") %>','','scrollbars=yes,width=420,height=460,left=0,top=0');return false;" style="color:#000000;"><%=LeftT(Rsn("N_title"),80)%></a> </td>
                                      </tr>
                                      <%
		  	Rsn.MoveNext
			IF Rsn.Eof then exit for 
			Next
			End if
			twclose(Rsn)
		    %>
                                      <tr>
                                        <td height="25" align="center" style="padding-right:20px;"><%call showpage(strFileName,totalput,MaxPerPage,true,true,"条")%></td>
                                      </tr>
          </table></td>
          <td width="84"><img src="../images/about_09.jpg" width="84" height="209"></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="../images/about_10.jpg" width="712" height="112"></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="../inc/end.asp" -->
</body>
</html>
 
 
 
 
 
 
 
 
 
 
 






