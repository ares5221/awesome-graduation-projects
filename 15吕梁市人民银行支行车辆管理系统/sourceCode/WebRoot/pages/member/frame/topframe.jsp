<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
	<head>
		<title>车辆调度系统</title>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<link href="../../../css/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<table cellspacing="0" cellpadding="0" background="../../../images/top_bg.gif" width="100%" align="center">
			<tr>
				<td><img src="../../../images/logo.gif"></td>
				<td><img height="1"></td>
    			<td background="../../../images/top.gif" width="459" valign="top">
    				<div style="padding:1px 0 0 280px;">
						<table class="fontwhite" cellspacing="0"style="color:#ffffff">
							<tr>
								<td><a href="#" style="color:#ffffff;text-decoration: none;">收藏</a></td>
								<td style="padding:0 7px 4px;font-size:12px;">|</td>
								<td><a href="../../../logout.do" target="_parent" style="color:#ffffff;text-decoration: none;" >注销</a></td>
							</tr>
						</table>
					<div>
				</td>
			</tr>
			<tr>
				<td style="border-top:1px solid #0a87ce;" bgcolor="#63b0ff" height="2" colspan="3"><img height="1"></td>
			</tr>
			<tr>
				<td background="../../../images/bg01.gif" colspan="3" height="26" style="padding:2px 0 0 20px;" class="fontblue">
				&nbsp;&nbsp;<fmt:formatDate value="<%=new Date()%>" pattern="zzzz yyyy年MM月dd EEEE"/>&nbsp;&nbsp;欢迎：<a href="rightframe.jsp" target="rightframe">${user.nickname}</a>登录本系统，希望本系统能为你提供方便、快捷的服务！
				<a href="rightframe.jsp" target="rightframe">返回系统首页</a></td>
			</tr>
		</table>
	</body>
</html>

