<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../../conn/conn.jsp"%>
<%@ include file="../../config.jsp"%>
<%String memid = (String)request.getParameter("id");
rs=stmt.executeQuery("SELECT * from qyml where id='"+memid+"'");
rs.next();
%>
<HTML xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns="http://www.w3.org/TR/REC-html40"><HEAD>
<TITLE><%=rs.getString("qymc")%></TITLE>
<META content=zh-cn http-equiv=Content-Language>
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<META content="Microsoft FrontPage 5.0" name=GENERATOR>
<script language="JavaScript">
<!--
function MM_preloadImages() { //v3.0
var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function MM_findObj(n, d) { //v4.01
var p,i,x; if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
if(!x && d.getElementById) x=d.getElementById(n); return x;
}
function MM_nbGroup(event, grpName) { //v3.0
var i,img,nbArr,args=MM_nbGroup.arguments;
if (event =="init" && args.length > 2) {
if ((img = MM_findObj(args[2])) != null && !img.MM_init) {
img.MM_init = true; img.MM_up = args[3]; img.MM_dn = img.src;
if ((nbArr = document[grpName]) == null) nbArr = document[grpName] = new Array();
nbArr[nbArr.length] = img;
for (i=4; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
if (!img.MM_up) img.MM_up = img.src;
img.src = img.MM_dn = args[i+1];
nbArr[nbArr.length] = img;
} }
} else if (event =="over") {
document.MM_nbOver = nbArr = new Array();
for (i=1; i < args.length-1; i+=3) if ((img = MM_findObj(args[i])) != null) {
if (!img.MM_up) img.MM_up = img.src;
img.src = (img.MM_dn && args[i+2]) ? args[i+2] : args[i+1];
nbArr[nbArr.length] = img;
}
} else if (event =="out" ) {
for (i=0; i < document.MM_nbOver.length; i++) {
img = document.MM_nbOver[i]; img.src = (img.MM_dn) ? img.MM_dn : img.MM_up; }
} else if (event =="down") {
if ((nbArr = document[grpName]) != null)
for (i=0; i < nbArr.length; i++) { img=nbArr[i]; img.src = img.MM_up; img.MM_dn = 0; }
document[grpName] = nbArr = new Array();
for (i=2; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
if (!img.MM_up) img.MM_up = img.src;
img.src = img.MM_dn = args[i+1];
nbArr[nbArr.length] = img;
} }
}
//-->
</script>
<script language="JavaScript">
<!--
function MM_reloadPage(init) { //reloads the window if Nav4 resized
if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->
</script>
<STYLE type=text/css>TD {
FONT-FAMILY: "宋体"; FONT-SIZE: 9pt; LETTER-SPACING: 0pt; LINE-HEIGHT: 14pt
}
A:link {
COLOR: #ffffff
}
</STYLE>
<LINK href="../../conn/laba.css" rel=stylesheet type=text/css>
<META content="Microsoft FrontPage 4.0" name=GENERATOR>
<link rel="File-List" href="">
</HEAD>
<BODY bgColor=#ffffff leftMargin=0 scroll=no text=#000000 topMargin=0 >
<div id="Layer2" style="position:absolute; left:240; top:100; width:24537; height:96; z-index:2"> 
<table width="195%" border="0" height="30">
<tr> 
<td height="59">
<table border="0" cellspacing="1" style="border-collapse: collapse" bordercolor="#111111" width="440" id="AutoNumber8" height="50" cellpadding="2">
<tr>
<td width="100%" valign="top" height="34" style="font-family: 宋体; font-size:20pt; line-height: 20pt; letter-spacing: 1pt">
<p align="center">
<font style='width=100%; position: relative; filter: glow(color=#000000, strength=4); font-size:18pt; ' color="#FFFFFF" face="隶书"><%=rs.getString("qymc")%></font></td>
</tr>
</table>
</td>
</tr>
</table>
<p>　</p>
</div>
<div id="Layer3" style="position:absolute; left:97px; top:274px; width:364px; height:140px; z-index:3"> 
<table width="100%" border="0" height="139">
<tr>
<td>
&nbsp;
<script src="../../in.js"></script>
<script>showImg("<%=rs.getString("username")%>")</script>
</td>
</tr>
<tr>
<td><br></td>
</tr>
</table>
</div>
<div id=Layer1 
style="HEIGHT: 181px; LEFT: 278px; POSITION: absolute; TOP: 36px; WIDTH: 250px; Z-INDEX: 1"> 
<object classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 
codebase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0 
height=181 width=250>
<param name="movie" value="images/back1.swf">
<param name="quality" value="high">
<param name="menu" value="false">
<param name="wmode" value="transparent">
<embed src="images/back1.swf" quality=high 
pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" 
type="application/x-shockwave-flash" width="250" height="181">
</embed></object></div>
<DIV align=center>
<CENTER>
<TABLE border=0 borderColor=#111111 cellPadding=0 cellSpacing=0 height=366 
style="BORDER-COLLAPSE: collapse" width=800>
<TBODY>
<TR>
<TD align=left height=364 vAlign=top>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber3">
<tr>
<td width="100%"> 
<TABLE WIDTH=800 BORDER=0 CELLPADDING=0 CELLSPACING=0>
<TR>
<TD bgcolor="#004477">
<IMG SRC="images/spacer.gif" WIDTH=9 HEIGHT=1></TD>
<TD bgcolor="#004477">
<IMG SRC="images/spacer.gif" WIDTH=81 HEIGHT=1></TD>
<TD bgcolor="#004477">
<IMG SRC="images/spacer.gif" WIDTH=193 HEIGHT=1></TD>
<TD bgcolor="#004477">
<IMG SRC="images/spacer.gif" WIDTH=92 HEIGHT=1></TD>
<TD bgcolor="#004477">
<IMG SRC="images/spacer.gif"></TD>
<TD bgcolor="#004477">
<IMG SRC="images/spacer.gif" WIDTH=83 HEIGHT=1></TD>
<TD bgcolor="#004477">
<IMG SRC="images/spacer.gif" WIDTH=187 HEIGHT=1></TD>
<TD bgcolor="#004477">
<IMG SRC="images/spacer.gif"></TD>
<TD bgcolor="#004477">
<IMG SRC="images/spacer.gif" WIDTH=42 HEIGHT=1></TD>
<TD bgcolor="#004477">
<IMG SRC="images/spacer.gif" WIDTH=111 HEIGHT=1></TD>
<TD bgcolor="#004477"></TD>
</TR>
<TR>
<TD COLSPAN=10 bgcolor="#004477">
　</TD>
<TD>
<IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=12></TD>
</TR>
<TR>
<TD ROWSPAN=16>
<img border="0" src="images/md1-1.gif"></TD>
<TD ROWSPAN=5>
<IMG SRC="images/md_03.gif"></TD>
<TD COLSPAN=2 ROWSPAN=13> <img src="images/md_04.gif"></TD>
<TD ROWSPAN=10>
<IMG SRC="images/md_05.gif"></TD>
<TD ROWSPAN=3>
<IMG SRC="images/md_06.gif"></TD>
<TD COLSPAN=2 bgcolor="#004477">
　</TD>
<TD COLSPAN=2 bgcolor=004477><a href=<%=WebUrl%> target="_blank"><img border="0" src="images/zyoklogo12.gif"></a></TD>
<TD>
<IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=47></TD>
</TR>
<TR>
<TD ROWSPAN=2>
<IMG SRC="images/md_09.gif"></TD>
<TD COLSPAN=3 bgcolor="#004477">
　</TD>
<TD>
<IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=76></TD>
</TR>
<TR>
<TD>
<IMG SRC="images/md_11.gif"></TD>
<TD COLSPAN=2 ROWSPAN=2>
<IMG SRC="images/md_12.gif"></TD>
<TD>
<IMG SRC="images/spacer.gif"></TD>
</TR>
<TR>
<TD COLSPAN=2 ROWSPAN=5>
<IMG SRC="images/md_13.gif"></TD>
<TD>
<IMG SRC="images/md_14.gif"></TD>
<TD>
<IMG SRC="images/spacer.gif"></TD>
</TR>
<TR>
<TD COLSPAN=3 ROWSPAN=2>
<IMG SRC="images/md_15.gif"></TD>
<TD>
<IMG SRC="images/spacer.gif"></TD>
</TR>
<TR>
<TD ROWSPAN=7>
<IMG SRC="images/md_16.gif"></TD>
<TD>
<IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=7></TD>
</TR>
<TR>
<TD COLSPAN=2>
<IMG SRC="images/md_17.gif"></TD>
<TD>
　</TD>
<TD>
<IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=53></TD>
</TR>
<TR>
<TD COLSPAN=2 ROWSPAN=9>
<IMG SRC="images/md_19.gif"></TD>
<TD ROWSPAN=9>
<IMG SRC="images/md_20.gif"></TD>
<TD>
<IMG SRC="images/spacer.gif"></TD>
</TR>
<TR>
<TD COLSPAN=2 background="images/md_21.gif">
<div align="right">
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="45%" id="AutoNumber4">
<tr>
<td width="100%">
<a onClick="MM_nbGroup('down','group1','dd1','images/dd1.gif',1)" onMouseOut="MM_nbGroup('out')" onMouseOver="MM_nbGroup('over','dd1','images/dd11.gif','images/dd11.gif',1)" href="corporation_web.jsp?id=<%=rs.getString("id")%>"> 
<img border="0" src="images/dd1.gif" name="dd1"></a></td>
</tr>
</table>
</div>
</TD>
<TD>
<IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=20></TD>
</TR>
<TR>
<TD COLSPAN=2 background="images/md_22.gif">
<div align="right">
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="55%" id="AutoNumber5" height="20">
<tr>
<td width="100%" height="20" valign="bottom"> <a href="spzs.jsp?id=<%=rs.getString("id")%>" onClick="MM_nbGroup('down','group1','dd21','images/dd21.gif',1)" onMouseOut="MM_nbGroup('out')" onMouseOver="MM_nbGroup('over','dd21','images/dd22.gif','images/dd22.gif',1)"><img border="0" src="images/dd21.gif" name="dd21"></a></td>
</tr>
</table>
</div>
</TD>
<TD>
<IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=24></TD>
</TR>
<TR>
<TD COLSPAN=3>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="271" id="AutoNumber6" background="images/md_23.gif" height="22">
<tr>
<td width="100%">
<div align="right">
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="63%" id="AutoNumber7" height="21">
<tr>
<td width="100%" height="21" valign="bottom"> 
<a href="syjh.jsp?id=<%=rs.getString("id")%>" onClick="MM_nbGroup('down','group1','dd31','images/dd31.gif',1)" onMouseOut="MM_nbGroup('out')" onMouseOver="MM_nbGroup('over','dd31','images/dd32.gif','images/dd32.gif',1)"><img border="0" src="images/dd31.gif" name="dd31"></a></td>
</tr>
</table>
</div>
</td>
</tr>
</table>
</TD>
<TD>
<IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=22></TD>
</TR>
<TR>
<TD COLSPAN=3 ROWSPAN=3 background="images/md_24.gif" valign="top">
<div align="right">
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="73%" id="AutoNumber8" height="21">
<tr>
<td width="100%" valign="bottom" height="21"> 
<a onClick="MM_nbGroup('down','group1','dd41','images/dd42.gif',1)" onMouseOut="MM_nbGroup('out')" onMouseOver="MM_nbGroup('over','dd41','images/dd42.gif','images/dd42.gif',1)" href="job.jsp?id=<%=rs.getString("id")%>"><img border="0" src="images/dd41.gif" name="dd41"></a></td>
</tr>
</table>
</div>
</TD>
<TD>
<IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=7></TD>
</TR>
<TR>
<TD ROWSPAN=4>
　</TD>
<TD>
<IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=2></TD>
</TR>
<TR>
<TD ROWSPAN=2>
<IMG SRC="images/md_26.gif"></TD>
<TD ROWSPAN=3>
<IMG SRC="images/md_27.gif"></TD>
<TD>
<IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=16></TD>
</TR>
<TR>
<TD ROWSPAN=2>
<IMG SRC="images/md_28.gif"></TD>
<TD COLSPAN=2 ROWSPAN=2 background="images/md_29.gif" valign="top">
<div align="right">
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="81%" id="AutoNumber9" height="20">
<tr>
<td width="100%" height="20" valign="bottom"> <a href="contact.jsp?id=<%=rs.getString("id")%>" onClick="MM_nbGroup('down','group1','dd51','images/dd51.gif',1)" onMouseOut="MM_nbGroup('out')" onMouseOver="MM_nbGroup('over','dd51','images/dd52.gif','images/dd52.gif',1)"><img border="0" src="images/dd51.gif" name="dd51"></a></td>
</tr>
</table>
</div>
</TD>
<TD>
<IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=10></TD>
</TR>
<TR>
<TD>
<IMG SRC="images/md_30.gif"></TD>
<TD>
<IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=13></TD>
</TR>
<TR>
<TD COLSPAN=10 valign="bottom">
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber10">
<tr>
<td width="33%">　</td>
<td width="12%">
<p align="right"></td>
<td width="9%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
<a href="mailto:<%=rs.getString("email")%>">
<img border="0" src="images/mail_comp.gif" width="32" height="32" alt="请与我们联系"></a></td>
</tr>
</table>
</TD>
<TD>
<IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=56></TD>
</TR>
</TABLE>
</td>
</tr>
</table>
</TD></TR>
<TR>
<TD background=images/bj2.gif height=2 
vAlign=top>　</TD></TR></TBODY></TABLE></CENTER></DIV>
<DIV align=center>
<CENTER>
<TABLE bgColor=#004477 border=0 borderColor=#111111 cellPadding=0 cellSpacing=0 
height=121 id=AutoNumber2 style="BORDER-COLLAPSE: collapse" width=800>
<TBODY>
<TR>
<TD height=121 vAlign=top width=823>
<P align=center><font color="#FFFFFF"><%=rs.getString("qymc")%></font><SPAN style="FONT-SIZE: 12px"><FONT 
color=#ffffff> </FONT></SPAN><SPAN style="FONT-SIZE: 12px"><FONT 
color=#ffffff>-<%=rs.getString("address")%></FONT></SPAN><SPAN style="FONT-SIZE: 12px"><FONT 
color=#ffffff><BR>客户服务:</FONT></SPAN><a href="mailto:<%=rs.getString("email")%>"><font color="#FFFFFF"><%=rs.getString("email")%></a></font><SPAN style="FONT-SIZE: 12px"><FONT 
color=#ffffff>&nbsp; 联系电话:</FONT></SPAN><font face="Arial" color="#FFFFFF"><%=rs.getString("tel")%></font></P></TD></TR></TBODY></TABLE></CENTER></DIV></BODY></HTML>  
