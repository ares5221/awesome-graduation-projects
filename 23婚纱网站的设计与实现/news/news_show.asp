<!--#include file="../inc/conn.asp"-->
<html>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {font-weight: bold}
-->
</style>
<head>
<title><%= Web_Name %></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="title" content="Charles">
<META content="原古设计 网页制作 软件开发 网络推广 域名注册 domain domain domain domain homepage homepage homepage homepage web hosting web hosting web hosting" name=keywords>
<META content=原古设计,提供国际国内域名注册，包括中文域名的注册；虚拟主机，空间的租用，以及设计制作主页等服务 name=description>
</head>

<body bgcolor="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<% 
		type_Class=75
		if request("id")="" then
		set rsContent=conn.execute("select top 1 ID,N_Content,N_title,N_Time,N_Hits from News order by N_X Desc")
		else
		set rsContent=conn.execute("select ID,N_Content,N_title,N_Time,N_Hits from News Where ID="&request("id")&"")
		end if
		if rsContent.eof then
			Response.Write("<br><br><br><Center></Center>")
		Else
		Conn.execute("update News set N_Hits="&rsContent("N_Hits")+1&" Where ID="&rsContent("ID")&"")
%>
<TABLE id=table14 cellSpacing=0 cellPadding=0 width=400 align=center border=0> 
 
<TR> 
<TD><IMG height=57 src="../images/news_01.gif" width=400></TD></TR> 
<TR> 
<TD vAlign=top background=../images/news_02.gif height=380> 
  <TABLE id=table15 cellSpacing=0 cellPadding=3 width="92%" align=center border=0> 
 
<TR> 
<TD height=30> 
<DIV class=menu align=center><FONT style="FONT-WEIGHT: 700; FONT-SIZE: 11pt" color=#000000><%= rsContent("N_title") %></FONT></DIV></TD></TR> 
<TR> 
<TD><IMG height=2 src="../images/news_04.gif" width=360></TD> 
</TR> 
<TR> 
<TD> 
<DIV class=b8 align=center>添加时间：<%= rsContent("N_Time") %>　</DIV></TD></TR> 
<TR> 
<TD valign="middle"> 
<DIV align=center><IMG height=2 src="../images/news_04.gif" width=360></DIV></TD></TR> 
<TR> 
<TD><FONT face=Verdana><%=rsContent("N_Content")%></FONT> </TD></TR> 
<TR> 
<TD><IMG height=2 src="../images/news_04.gif" width=360></TD></TR> 
<TR> 
<TD> 
&nbsp;
浏览次数：<%=rsContent("N_Hits")%>&nbsp;</TD>
</TR><TR> 
<TD><div align="center">【<A href="javascript:window.close()" style="color:#737173">关闭窗口</A>】</div></TD>
</TR></TABLE></TD></TR> 
<TR> 
<TD><IMG height=20 src="../images/news_03.gif" width=400></TD> 
</TR></TABLE>
		<% End If %>
</body>
</html>
