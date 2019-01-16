<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.0 transitional//EN">
<html>
	<head>
		<title>车辆详细信息</title>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<link href="../../css/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<center>
		<table width="760" border="0" style="margin:20px 0;" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="3">
						<table cellpadding="0" cellspacing="0" width="100%" height="62">
							<tr>
								<td background="../../images/tab01.gif" width="309" valign="top">
									<div class="tabhead">
										车辆详细信息
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
							<tr bgcolor="#e6ffd6" height="25"><td align="right">车辆编号：</td><td>${car.id }</td>
							<td align="right">车牌号码：</td><td>${car.carnumber}</td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="5"></td>
							</tr>
							<tr bgcolor="#e6ffd6" height="25"><td align="right">车辆类型：</td><td>${car.cartype}</td>
							<td align="right">最大载量：</td><td>${car.capacity}</td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="5"></td>
							</tr>
							<tr bgcolor="#e6ffd6" height="25"><td align="right">司机姓名：</td><td>${car.driver.name}</td>
							<td align="right">登记日期：</td><td>${car.registerdate}</td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="5"></td>
							</tr>
							<tr bgcolor="#e6ffd6" height="25"><td align="right">车辆状态：</td><td>${car.status}</td>
							<td align="right">&nbsp;</td><td>&nbsp;</td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="5"></td>
							</tr>
							
							<tr bgcolor="#e6ffd6"><td align="right">备注：</td><td colspan="3"  rowspan="3">
									${car.descripe}
								</td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="5"></td>
							</tr>
						</table>
						<br><center><input type="button" value="返回" onclick="window.location='../../findAllCar.do'"/></center></td>
					<td background="../../images/centeright.gif">&quot;</td>
				</tr>
				<tr>
					<td>
						<img src="../../images/bottomleft.gif">
					</td>
					<td background="../../images/bottomcenter.gif">&quot;</td>
					<td>
						<img src="../../images/bottomright.gif">
					</td>
				</tr>
			</table>
			</center>
	</body>
</html>
