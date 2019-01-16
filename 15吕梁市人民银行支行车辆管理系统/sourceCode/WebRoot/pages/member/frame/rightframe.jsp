<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.0 transitional//EN">
<html>
	<head>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<link href="../../../css/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<c:if test="${!empty message}" >
			<script type="text/javascript">
				alert('<c:out value="${message}"/>');
			</script>
			<c:remove var="message" scope="session"/>
		</c:if>
		<table width="80%" border="0" style="margin-top:10px;" align="center"
			cellpadding="0" cellspacing="0" height="400">
			<tr height="40">
				<td width="100%">
					<table width="90%" border="1" style="margin-top:20px;" align="center"
					cellpadding="0" cellspacing="0" >
						<tr height="35">
    						<td bgcolor="0954ab" colspan="3" align="center">
								<font color="#FFFFFF" size="3">
									&nbsp;&nbsp;=====个人基本信息=====
								</font>
							</td>
  						</tr>
						 <tr height="50">
    						<td rowspan="3" width="25%" align="center" bgcolor="#e6ffd6"><img alt="相片" src="${user.icon}" width="120" height="90"/></td>
    						<td bgcolor="#e6ffd6">&nbsp;&nbsp;&nbsp;&nbsp;员工编号：&nbsp;&nbsp;${user.id}</td>
    						<td bgcolor="#e6ffd6">&nbsp;&nbsp;&nbsp;&nbsp;登录昵称：&nbsp;&nbsp;${user.nickname}</td>
 						</tr>
  						<tr height="50">
    						<td bgcolor="#e6ffd6">&nbsp;&nbsp;&nbsp;&nbsp;真实姓名：&nbsp;&nbsp;${user.name}</td>
    						<td bgcolor="#e6ffd6">&nbsp;&nbsp;&nbsp;&nbsp;姓别：&nbsp;&nbsp;
    						<c:if test="${user.gender eq '0'}">男</c:if>
    						<c:if test="${user.gender eq '1'}">女</c:if></td>
  						</tr>
  						<tr height="50">
    						<td bgcolor="#e6ffd6">&nbsp;&nbsp;&nbsp;&nbsp;年龄：&nbsp;&nbsp;${user.age}</td>
    						<td bgcolor="#e6ffd6">&nbsp;&nbsp;&nbsp;&nbsp;登录身份：&nbsp;&nbsp;
    						<c:if test="${user.power eq 0}">游客</c:if>
    						<c:if test="${user.power eq 1}">调度员</c:if>
    						<c:if test="${user.power eq 2}">管理员</c:if></td>
  						</tr>
  						<tr height="50">
    						<td colspan="2" bgcolor="#e6ffd6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;身份证号：&nbsp;&nbsp;${user.identitycard}
    						</td><td bgcolor="#e6ffd6">&nbsp;&nbsp;&nbsp;&nbsp;电话：&nbsp;&nbsp;${user.phone}</td>
    						
  						</tr>
  						<tr height="50">
    						<td colspan="2" bgcolor="#e6ffd6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;详细住址：&nbsp;&nbsp;${user.address}</td>
    						<td bgcolor="#e6ffd6">&nbsp;&nbsp;&nbsp;&nbsp;<a href="../modify.jsp">个人信息修改</a></td>
  						</tr>
  						<tr height="50">
    						<td  colspan="3" bgcolor="#e6ffd6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户IP所在地：&nbsp;&nbsp;${ip}</td>
  						</tr>
					</table>	
				</td>
			</tr>
		</table>
	</body>
</html>

