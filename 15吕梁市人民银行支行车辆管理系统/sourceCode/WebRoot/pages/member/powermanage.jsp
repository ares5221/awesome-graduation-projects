<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.0 transitional//EN">
<html>
	<head>
		<title>权限管理</title>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<link href="../../css/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<c:if test="${!empty message}" >
			<script type="text/javascript">
				alert('<c:out value="${message}"/>');
			</script>
			<c:remove var="message" scope="session"/>
		</c:if>
			<table width="760" border="0" style="margin-top:20px;" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="3">
						<table cellpadding="0" cellspacing="0" width="100%" height="62">
							<tr>
								<td background="../../images/tab01.gif" width="309" valign="top">
									<div class="tabhead">
										权限管理
									</div>
								</td>
								<td valign="bottom">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tr>
											<td background="../../images/topcenter.gif" width="100%"
												valign="top" align="right" style='padding:6px 0 0 0px;'>
											</td>
											<td><img src="../../images/topright.gif"></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td background="../../images/centerleft.gif"></td>
					<td width="100%">
						<table width="100%" border="0" cellspacing="1" cellpadding="3"
							align="center" style="font-size:14px;">
							<tr class="fontblue">
								<td width="15%" align="center" >
									<b>用户名</b>
								</td>
								<td width="15%" align="center">
									<b>姓名</b>
								</td>
								<td width="30%" align="center"> 
									<b>身份证号</b>
								</td>
								<td width="20%" align="center">
									<b>当前权限</b>
								</td>
								<td width="20%" align="center">
									<b>操作</b>
								</td>
							</tr>
							<tr>
								<td bgcolor="#cccccc" colspan="6" height="2"></td>
							</tr>
							<c:forEach var="use" items="${userlist}">
								<form action="../../changePower.do" method="post">
								
										<tr bgcolor="#e6ffd6">
										<input type="hidden" name="nickname" value="${use.nickname}"/>
											<td width="10%" align="left" >
												${use.nickname}
											</td>
											<td width="20%" align="left">
												${use.name}
											</td>
											<td width="20%" align="left">${use.identitycard}</td>
											<td width="30%"align="center">
												<select name="power">
											<option value="${use.power}" selected="selected">
											<c:if test="${use.power eq 0}">游客</c:if>
											<c:if test="${use.power eq 1}">调度员</c:if>
											<c:if test="${use.power eq 2}">管理员</c:if>
											</option>
											<option value="0">游客</option>
                    						<option value="1">调度员</option>
			                   				<option value="2">管理员</option>
											</select>
											</td>
											<td align="center" class="fontorange">
												<input type="submit" value="修改"/>
											</td>
										</tr>
								</form>
							<tr>
								<td bgcolor="#cccccc" colspan="6" height="2"></td>
							</tr>
							</c:forEach>
						</table>				
					</td>
					<td background="../../images/centeright.gif"></td>
				</tr>
				<tr>
					<td>
						<img src="../../images/bottomleft.gif">
					</td>
					<td background="../../images/bottomcenter.gif"></td>
					<td>
						<img src="../../images/bottomright.gif">
					</td>
				</tr>
			</table>
	</body>
</html>
