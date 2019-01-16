<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.0 transitional//EN">
<html>
<head>
		<title>回车记录</title>
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
		<form method="post" action="../../addBackRecord.do">
		<table width="760" border="0" style="margin:20px 0;" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="3">
						<table cellpadding="0" cellspacing="0" width="100%" height="62">
							<tr>
								<td background="../../images/tab01.gif" width="309" valign="top">
									<div class="tabhead">
										回车记录
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
							<tr bgcolor="#e6ffd6"><td align="right">派车单号：</td>
							<td><input type="text" name="id" value="${outrecord.id }"/></td>
							<td align="right">驾驶员：</td><td>
							<input type="text" name="drivername" value="${outrecord.motorcar.driver.name}"/></td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="3"></td>
							</tr>
							<tr bgcolor="#e6ffd6">
							<td align="right">车牌号码：</td>
							<td><input type="text" name="carnumber" value="${outrecord.motorcar.carnumber}"/></td>
							<td align="right">车辆类型：</td><td><select name="cartype" >
							<option value="${outrecord.motorcar.cartype}">${outrecord.motorcar.cartype }</option>
							<option value="微型货车">微型货车</option>
							<option value="小型货车">小型货车</option>
							<option value="中型货车">中型货车</option>
							<option value="大型货车">大型货车</option>
							</select></td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="3"></td>
							</tr>
							<tr bgcolor="#e6ffd6"><td align="right">货源地：</td>
							<td><input type="text" name="res_address" value="${outrecord.apprecord.resAddress}"/></td>
							<td align="right">目的地：</td><td>
							<input type="text" name="des_address" value="${outrecord.apprecord.desAddress}"/></td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="3"></td>
							</tr>
							<tr bgcolor="#e6ffd6"><td align="right">出车时间：</td>
							<td><input type="text" name="outdate" value="${outrecord.outdate}"/></td>
							<td align="right">出车天数：</td><td><input type="text" name="day"/></td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="3"></td>
							</tr>
							<tr bgcolor="#e6ffd6"><td align="right">回车时间：</td><td>
							<input type="text" name="backdate" value="<fmt:formatDate value='<%=new Date()%>' pattern='yyyy/MM/dd'/>"/></td>
							<td align="right">费用总额：</td><td><input type="text" name="cost"/></td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="3"></td>
							</tr>
							
						</table>
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

