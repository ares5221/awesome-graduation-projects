<%@ page language="java" import="com.bjsxt.shopping.user.*" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>

<%
//检查session，查看用户是否登陆
User u = (User)session.getAttribute("user");
if(u == null) {
	response.sendRedirect("Index.jsp");
	return;
}
 %>

<%

request.setCharacterEncoding("GBK");
String action = request.getParameter("action");

if(action != null && action.trim().equals("modify")) {
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	u.setPhone(phone);
	u.setAddr(addr);
	u.update();
	out.println("更改成功!恭喜!");
	return;
}
 %>

<html><head><title>金尚商城会员注册</title>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="keywords" content="Discuz!,Board,Comsenz,forums,bulletin board,">
<meta name="description" content="醒客论坛专区  - Discuz! Board">
<meta name="generator" content="Discuz! 4.0.0RC4 with Templates 4.0.0">
<meta name="MSSmartTagsPreventParsing" content="TRUE">
<meta http-equiv="MSThemeCompatible" content="Yes">

<style type="text/css"><!--
a			{ text-decoration: none; color: #000000 }
a:hover			{ text-decoration: underline }
body			{ scrollbar-base-color: #F3F6FA; scrollbar-arrow-color: #4D76B3; font-size: 12px; background-color: #ffffff }
table			{ font: 12px Verdana,Tahoma; color: #000000 }
input,select,textarea	{ font: 11px Verdana,Tahoma; color: #000000; font-weight: normal; background-color: #F3F6FA }
select			{ font: 11px Verdana,Tahoma; color: #000000; font-weight: normal; background-color: #F3F6FA }
.nav			{ font: 12px Verdana,Tahoma; color: #000000; font-weight: bold }
.nav a			{ color: #000000 }
.header			{ font: 11px Verdana,Tahoma; color: #FFFFFF; font-weight: bold; background-image: url("images/green/bg01.gif") }
.header a		{ color: #FFFFFF }
.category		{ font: 11px Verdana,Tahoma; color: #000000; background-color: #EFEFEF }
.tableborder		{ background: #4D76B3; border: 0px solid #4D76B3 } 
.singleborder		{ font-size: 0px; line-height: 0px; padding: 0px; background-color: #F3F6FA }
.smalltxt		{ font: 11px Verdana,Tahoma }
.outertxt		{ font: 12px Verdana,Tahoma; color: #000000 }
.outertxt a		{ color: #000000 }
.bold			{ font-weight: bold }
.altbg1			{ background: #F3F6FA }
.altbg2			{ background: #FFFFFF }
--></style><script language="JavaScript" src="images/common.js"></script><style type="text/css" id="defaultPopStyle">.cPopText { font-family: Tahoma, Verdana; background-color: #FFFFCC; border: 1px #000000 solid; font-size: 12px; padding-right: 4px; padding-left: 4px; height: 20px; padding-top: 2px; padding-bottom: 2px; visibility: hidden; filter: Alpha(Opacity=80)}</style></head><body leftmargin="0" rightmargin="0" topmargin="0" onkeydown="if(event.keyCode==27) return false;"><div id="popLayer" style="position: absolute; z-index: 1000;" class="cPopText"></div>


<table id="table1" align="center" border="0" cellpadding="0" cellspacing="0" width="97%">
  <tbody>
  <tr valign="top">
    <td style="border-top: 0px none; border-right: 1px none; font-size: 9pt; font-family: Tahoma,Verdana; color: rgb(0, 0, 0);" width="100%"><table border="0" cellpadding="0" cellspacing="0" width="100%">
      <tbody><tr>
        <td bgcolor="#4d76b3" height="20">&nbsp;</td>
      </tr>
      <tr>
        <td bgcolor="#4e6793" height="2"></td>
      </tr>
      <tr>
        <td background="images/bitmap.gif" height="80" valign="middle"><table align="right" border="0" cellpadding="0" cellspacing="0" width="100%">
          <tbody><tr>
            <td valign="middle" width="5">&nbsp;</td>
            <td valign="middle" width="157"><div align="left"><a href="thinkshop.cn.htm" target="_blank"><br></a></div></td>
            <td valign="middle" width="812"><div align="right">
              <a style="left: 799px ! important; top: 61px ! important;" class="abp-objtab visible" href="http://www.allsmart.com/images/new1.swf"></a><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" height="61" width="460">
                  <param name="movie" value="http://www.allsmart.com/images/new1.swf">
                  <param name="quality" value="high">
                  <embed src="images/new1.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" height="61" width="460">
              </object>
            </div></td>
            <td width="5">&nbsp;</td>
          </tr>
        </tbody></table></td>
      </tr>
      <tr>
        <td><table id="table3" bgcolor="#f3f6fa" cellpadding="3" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td style="border-top: 0px none; border-right: 1px none; font-size: 9pt; font-family: Tahoma,Verdana; color: rgb(0, 0, 0);" bgcolor="#f3f6fa" height="20"><font style="line-height: normal;" color="#000000"><a href="faq.php.htm"><br></a> </font></td>
              <td width="225"><table align="right" border="0" cellpadding="0" cellspacing="0" width="225">
                <tbody><tr>
                  <td width="75"><a href="index.php.htm"><br></a></td>
                  <td width="75"><a href="brandshop.php.htm" target="_blank"><br></a></td>
                  <td width="75"><a href="powered by Discuz!.htm" target="_blank"><br></a></td>
                  </tr>
              </tbody></table>
             </td>
              </tr>
            <tr bgcolor="#4d76b3">
              <td colspan="2" height="1"> </td>
            </tr>
            <tr bgcolor="#ffffff">
              <td colspan="2" height="5"></td>
            </tr>
          </tbody>
        </table></td>
      </tr>
    </tbody></table>
</td>
    </tr></tbody></table>
<table style="table-layout: fixed;" align="center" border="0" cellpadding="0" cellspacing="0" width="97%"> 
<tbody><tr><td class="nav" align="left" nowrap="nowrap" width="90%">&nbsp;&#37329;&#23578;&#21830;&#22478; &#187; 注册</td>
<td align="right" width="10%">&nbsp;<a href="#bottom"><img src="images/arrow_dw.gif" align="absmiddle" border="0"></a></td>        
</tr></tbody></table><br>
<form method="post" name="register" action="UserModify.jsp" onSubmit="this.regsubmit.disabled=true;">
<input type="hidden" name="action" value="modify"/>

<table class="tableborder" align="center" cellpadding="4" cellspacing="1" width="97%">
<tbody><tr>
<td colspan="2" class="header">用户修改 - 必填内容</td>
</tr>
<tr>
<td class="altbg1" width="21%">用户名:</td>
<td class="altbg2"><input name="username" size="25" maxlength="25" type="text" readonly value="<%=u.getUsername()%>"> </td>
</tr>

<tr>
<td class="altbg1">&#30005;&#35805;:</td>
<td class="altbg2"><input name="phone" type="text" id="phone" size="25" value="<%=u.getPhone()%>"></td>
</tr>

<tr>
<td class="altbg1" valign="top">送货地址:</td>
<td class="altbg2"><textarea name="addr" cols="60" rows="5" id="addr"><%=u.getAddr()%></textarea></td>
</tr>
</tbody></table>
<br>
<center><input name="regsubmit" value="提 &nbsp; 交" type="submit"></center>
</form>

<script language="JavaScript">
document.register.username.focus();
</script>

<p align="center">　</p>
<table class="smalltxt" cellpadding="4" cellspacing="0" width="100%">
<tbody><tr class="altbg1"><td>所有时间为 GMT+8, 现在时间是 2007-4-20 11:17</td>
<td align="right"><a href="http://bbs.allsmart.com/member.php?action=clearcookies" class="bold">清除 Cookies</a></td>
<td align="right" width="1">&nbsp;</td>
</tr>
<tr style="padding: 0px; font-size: 0px; line-height: 0px;" images="" green="" bg01.gif="" )=""><td colspan="3">　</td></tr>
</tbody></table>
<p align="center">

<br>
<a name="bottom"></a>

<a target="_blank" href="http://www.thinkpadclub.com.cn/"><u>金尚商城</u></a><br>
服务热线:010-58052712
<!--<br><font color=#ebebeb>
Powered by <a href="http://www.discuz.net" target="_blank"><font color=#ebebeb>Discuz!</font></a> 
<a href="misc.php?action=viewlicense"><b style="color:#ebebeb">4.0.0RC4</b></a>&nbsp;
&copy; 2001-2005 <a href="http://www.comsenz.com" target="_blank"><font color=#ebebeb>Comsenz Technology Ltd</font></a>
<br>Processed in 0.011754 second(s), 5 queries
-->
</p>
</body></html>