<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.0 transitional//EN">
<html>
	<head>
		<title>车辆出车详细信息</title>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<link href="../../css/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<center>
		<form method="post" action="../../findAllOutRecord.do">
		<table width="760" border="0" style="margin:20px 0;" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="3">
						<table cellpadding="0" cellspacing="0" width="100%" height="62">
							<tr>
								<td background="../../images/tab01.gif" width="309" valign="top">
									<div class="tabhead">
										车辆出车详细信息
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
								<td bgcolor="#cccccc" colspan="4" height="5"></td>
							</tr>
							<tr bgcolor="#e6ffd6" height="25"><td align="right">出车单号：</td><td>${record.id}</td>
							<td align="right">调度员：</td><td>${record.user.name }</td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="5"></td>
							</tr>
							<tr bgcolor="#e6ffd6" height="25"><td align="right">申请单号：</td><td>${record.apprecord.id }
							</td>
							<td align="right">车牌号码：</td><td>${record.motorcar.carnumber }</td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="5"></td>
							</tr>
							<tr bgcolor="#e6ffd6" height="25"><td align="right">车辆类型：</td><td>${record.motorcar.cartype }</td>
							<td align="right">驾驶人员：</td><td>${record.motorcar.driver.name }</td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="5"></td>
							</tr>
							<tr bgcolor="#e6ffd6" height="25"><td align="right">出车时间：</td><td>${record.outdate}</td>
							<td align="right">&nbsp;</td><td>&nbsp;</td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="5"></td>
							</tr>
						</table>
						<br><center>
						<input type="submit" value="返回"/>
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
