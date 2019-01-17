<%@ page language="java" import="com.bjsxt.shopping.category.*" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>

<%
request.setCharacterEncoding("GBK");
int pid = Integer.parseInt(request.getParameter("pid"));
int grade = Integer.parseInt(request.getParameter("grade"));

if(grade >= Category.MAX_GRADE) {
	out.println("不能在该节点下面添加，层数超出了限制");
	return;
}

String action = request.getParameter("action");

if(action != null && action.trim().equals("add")) {
	String name = request.getParameter("name");
	String descr = request.getParameter("descr");
	Category c = new Category();
	c.setPid(pid);
	c.setName(name);
	c.setDescr(descr);
	c.setGrade(grade + 1);
	CategoryService service = CategoryService.getInstance();
	service.add(c);
	out.println("类别添加成功!恭喜!");
	return;
}
%>

<html><head><title>金尚商城添加子类别</title>

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
    <td style="border-top: 0px none; border-right: 1px none; font-size: 9pt; font-family: Tahoma,Verdana; color: rgb(0, 0, 0);" width="100%"><br></td>
    </tr></tbody></table>
<table style="table-layout: fixed;" align="center" border="0" cellpadding="0" cellspacing="0" width="97%"> 
<tbody><tr><td class="nav" align="left" nowrap="nowrap" width="90%">&nbsp;金尚商城 &raquo; <br></td>
<td align="right" width="10%">&nbsp;<a href="#bottom"><img src="images/arrow_dw.gif" align="absmiddle" border="0"></a></td>        
</tr></tbody></table><br>
<form method="post" name="register" action="CategoryAddChild.jsp" onSubmit="this.regsubmit.disabled=true;">
<input type="hidden" name="action" value="add"/>
<input type="hidden" name="pid" value="<%=pid %>"/>
<input type="hidden" name="grade" value="<%=grade %>"/>
<table class="tableborder" align="center" cellpadding="4" cellspacing="1" width="97%">
<tbody><tr>
<td colspan="2" class="header">添加类别 - 必填内容</td>
</tr>
<tr>
<td class="altbg1" width="21%">类别名称:</td>
<td class="altbg2"><input name="name" size="25" maxlength="25" type="text"> 
</tr>

<tr>
<td class="altbg1" valign="top">类别描述:</td>
<td class="altbg2"><textarea name="descr" cols="60" rows="5" id="descr"></textarea></td>
</tr>
</tbody></table>
<br>
<center><input name="regsubmit" value="提 &nbsp; 交" type="submit"></center>
</form>


</body></html>