<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0098)http://localhost:8090/RunCommunity_new/pages/login.jsp;jsessionid=35031DFEED1BE46F27529976EFEB5B7F -->
<HTML><HEAD><TITLE>车辆调度首页</TITLE>
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
<TABLE height=120 cellSpacing=0 cellPadding=0 width=776 border=0>
  <TBODY>
  <TR>
    <TD align=left height=30>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD bgColor=#75a8e3>&nbsp;系统首页 ——&gt;<STRONG>用户登陆</STRONG> 
        </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=500 border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=right width=500 background="" height=298>
      <TABLE style="MARGIN-TOP: 20px" cellSpacing=0 cellPadding=0 width=500 
      align=center border=0>
        <TBODY>
        <TR>
          <TD colSpan=3>
            <TABLE height=62 cellSpacing=0 cellPadding=0 width="100%">
              <TBODY>
              <TR>
                <TD vAlign=top width=309 background=../images/tab01.gif>
                  <DIV class=tabhead>&nbsp;&nbsp;用户登录系统 </DIV></TD>
                <TD vAlign=bottom>
                  <TABLE cellSpacing=0 cellPadding=0 width="100%">
                    <TBODY>
                    <TR>
                      <TD 
                      style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; PADDING-TOP: 6px" 
                      vAlign=top align=right width="100%" 
                      background=../images/topcenter.gif></TD>
                      <TD><IMG 
                  src="../images/topright.gif"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD background=../images/centerleft.gif></TD>
          <TD width="100%" bgColor=#e9e9de>
            <FORM onsubmit="return checkLoginForm(this);" action="../loginAction.do" 
            method=post>
            <TABLE style="MARGIN: 5px 0px" cellPadding=5 align="center" 
              border="0"><TBODY>
              <TR align="center">
                <TD align="right" width="30%">用户账号： </TD>
                <TD align="left" width="70%"><INPUT name="userName"/> </TD></TR>
              <TR align="center">
                <TD align=right width="30%">用户密码： </TD>
                <TD align=left width="70%"><INPUT type="password" name="passwd"> 
                </TD></TR>
              <TR align="center">
                <TD align="right" width="30%">
                  <DIV><INPUT type=checkbox value=true name=autoLogin> </DIV></TD>
                <TD align="left" width="70%">记住我，下次访问自动登陆！ </TD></TR>
              <TR>
                <TD align="center" colSpan=2><INPUT style="CURSOR: hand" type="submit" value=登录 name=Login>&nbsp;&nbsp; 
<INPUT style="CURSOR: hand" type=reset value=重置 name=reset> 
              </TD></TR></TBODY></TABLE></FORM></TD>
          <TD background=../images/centeright.gif></TD></TR>
        <TR>
          <TD><IMG src="../images/bottomleft.gif"> </TD>
          <TD background=../images/bottomcenter.gif></TD>
          <TD><IMG src="../images/bottomright.gif"> 
  </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<TABLE height=110 cellSpacing=0 cellPadding=0 width=776 border=0>
  <TBODY>
  <TR>
    <TD align=middle>[<A 
      href="register.jsp">注册新用户</A>]&nbsp;&nbsp;[<A 
      href="passwd_missing.jsp">忘记密码？</A>] 
    </TD></TR></TBODY></TABLE>
<TABLE height=100 cellSpacing=0 cellPadding=0 width=776 border=0>
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
