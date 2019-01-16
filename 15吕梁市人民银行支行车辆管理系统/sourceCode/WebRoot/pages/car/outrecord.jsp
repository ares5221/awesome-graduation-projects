<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.0 transitional//EN">
<html>
	<head>
		<title>出车登记</title>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<link href="../../css/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<c:if test="${!empty message}">
	<script type="text/javascript">
		var msg="${message}";
		alert(msg);
	</script>
	<c:remove var="message"/>
</c:if>
	<center>
		<form method="post" action="../../addOutRecord.do">
		<table width="760" border="0" style="margin:20px 0;" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="3">
						<table cellpadding="0" cellspacing="0" width="100%" height="62">
							<tr>
								<td background="../../images/tab01.gif" width="309" valign="top">
									<div class="tabhead">
										出车登记
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
						<table width="95%" border="0" cellspacing="1" cellpadding="3"
							align="center">
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="3"></td>
							</tr>
							<tr bgcolor="#e6ffd6"><td align="right">申请单号：</td><td>
							<input type="text" name="appid" value="${apprecord.id}"/></td>
							<td align="right">调度员：</td><td>
							<input type="text" name="user" value="${user.name}"/></td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="3"></td>
							</tr>
							<tr bgcolor="#e6ffd6"><td align="right">货源地：</td>
							<td><input type="text" name="res_address" value="${apprecord.resAddress }"/></td>
							<td align="right">目的地：</td><td>
							<input type="text" name="des_address" value="${apprecord.desAddress }"/></td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="3"></td>
							</tr>
							<tr bgcolor="#e6ffd6"><td align="right">货物重量：</td><td>
							<input type="text" name="capacity" value="${apprecord.capacity}"/></td>
							<td align="right">用车人：</td><td>
							<input type="text" name="customer" value="${apprecord.customer}"/></td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="3"></td>
							</tr>
							<tr bgcolor="#e6ffd6"><td align="right">电话：</td><td>
									<input type="text" name="phone" value="${apprecord.phone}"/>
								</td><td align="right">申请时间：</td>
								<td><input type="text" name="date" value="${apprecord.appdate}"/></td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="3"></td>
							</tr>
							<tr bgcolor="#e6ffd6"><td align="right">派车时间：</td><td>
							<input type="text" name="outdate" value="<fmt:formatDate value='<%=new Date()%>' pattern='yyyy/MM/dd'/>"/>
								</td><td align="right">车牌号码：</td><td><input type="text" name="carnumber" value="${motorcar.carnumber}"/></td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="3"></td>
							</tr>
							<tr bgcolor="#e6ffd6"><td align="right">驾驶员：</td><td>
							<input type="text" name="drviername" value="${motorcar.driver.name }"/>
								</td><td align="right">&nbsp;</td><td>&nbsp;</td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="3"></td>
							</tr>
						</table><c:remove var="apprecord" scope="session"/>
									<c:remove var="motorcar" scope="session"/>
						<br><center>
						<input type="submit" value="提交"/>
						<input type="reset" value="重置"/>
					</center></td>
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
			</form></center>
	</body>
</html>

