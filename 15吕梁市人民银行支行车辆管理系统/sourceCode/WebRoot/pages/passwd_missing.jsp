<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0060)http://localhost:8090/RunCommunity_new/pages/forgetPasswd.do -->
<HTML><HEAD><TITLE>找回密码</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8"><LINK 
href="../css/style1.css" type=text/css rel=stylesheet><LINK 
href="../css/style.css" type=text/css rel=stylesheet>
<SCRIPT src="../js/base.js" type=text/javascript></SCRIPT>

<META content="MSHTML 6.00.6000.16481" name=GENERATOR></HEAD>
<BODY>
<c:if test="${!empty message}">
	<script type="text/javascript">
		var msg="${message}";
		alert(msg);
	</script>
	<c:remove var="message"/>
</c:if>

<CENTER>
<TABLE cellSpacing=0 cellPadding=0 width=776 border=0>
  <TBODY>
  <TR>
    <TD></TD></TR>
  <TR>
    <TD align=left height=67>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD bgColor=#75a8e3>&nbsp;系统首页 ——&gt;<STRONG>找回密码</STRONG> 
        </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<P>
<P>
<P>
<TABLE style="MARGIN-TOP: 20px" cellSpacing=0 cellPadding=0 width=500 
align=center border=0>
  <TBODY>
  <TR>
    <TD colSpan=3>
      <TABLE height=62 cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
        <TR>
          <TD vAlign=top width=309 background=../images/tab01.gif>
            <DIV class=tabhead>输入下面信息，系统会帮你找回密码！</DIV></TD>
          <TD vAlign=bottom>
            <TABLE cellSpacing=0 cellPadding=0 width="100%">
              <TBODY>
              <TR>
                <TD width="100%" background=../images/topcenter.gif></TD>
                <TD><IMG 
        src="../images/topright.gif"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD background=../images/centerleft.gif></TD>
    <TD width="100%" bgColor=#e9e9de>
      <TABLE style="MARGIN: 5px 0px" cellSpacing=0 cellPadding=0 width="100%" 
      align=center border=0>
        <TBODY>
        <TR>
          <TD style="PADDING-TOP: 0px" vAlign=top align=middle width=24 
          rowSpan=3><IMG height=16 src="../images/icon03.gif" width=16></TD>
          <TD class=fontgreen style="PADDING-TOP: 2px" width=556><B>系统提醒</B> 
          </TD></TR>
        <TR>
          <TD class=fontgray style="PADDING-TOP: 2px" colSpan=2>
            <OL>
              <LI><FONT color=#ff0000>请确保您输入的用户名存在</FONT> 
              <LI><FONT color=#ff0000>密码提示问题和答案完全正确，方可找回密码</FONT> 
        </LI></OL></TD></TR></TBODY></TABLE>
      <FORM onsubmit="return checkGetPasswdForm(this);" action="../findMissingPassword.do" 
      method="post">
      <TABLE width="100%" align=center border=0>
        <TBODY>
        <TR>
          <TD align=right width="40%">用户名：</TD>
          <TD align=left width="60%"><INPUT class=input1 name=userName> </TD></TR>
        <TR>
          <TD align=right width="40%">密码提示问题：</TD>
          <TD align=left width="60%"><INPUT class=input1 name=passwdQuestion> 
          </TD></TR>
        <TR>
          <TD align=right width="40%">密码提示答案：</TD>
          <TD align=left width="60%"><INPUT class=input1 name=passwdAnswer> 
        </TD></TR>
        <TR>
          <TD colSpan=2>
            <DIV align=center><INPUT style="CURSOR: hand" type=submit value=提交> 
            &nbsp;&nbsp; <INPUT style="CURSOR: hand" type=reset value=重置> 
          </DIV></TD></TR></TBODY></TABLE></FORM></TD>
    <TD background=../images/centeright.gif></TD></TR>
  <TR>
    <TD><IMG src="../images/bottomleft.gif"></TD>
    <TD background=../images/bottomcenter.gif></TD>
    <TD><IMG src="../images/bottomright.gif"></TD></TR></TBODY></TABLE>
<P>
<P>
<P>
<TABLE height=110 cellSpacing=0 cellPadding=0 width=776 border=0>
  <TBODY>
  <TR>
    <TD height=8></TD></TR>
  <TR>
    <TD bgColor=#cccccc height=1></TD></TR>
  <TR>
    <TD align=middle>
      <TABLE cellSpacing=0 cellPadding=3 width="100%" border=0>
        <TBODY>
        <TR>
          <TD align=middle>|<A class=blue12 href="http://www.briup.com/" 
            target=_blank> 公司首页</A> | 使用帮助 |网站导航 | 联系我们 | 客服邮箱 | 法律声明 | 友情链接 | 
            <BR>杰普软件科技有限公司 版权所有 地址:上海市杨浦区国泰路88号 TEL:021-55660810 FAX:55660802 
            ZIP:200433 <BR>Copyright © 2003 Briup Technology Inc,.(Shanghai) All 
            rights reserved. </TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD bgColor=#fcab3f height=3></TD></TR>
  <TR>
    <TD height=12></TD></TR></TBODY></TABLE></CENTER></BODY></HTML>
