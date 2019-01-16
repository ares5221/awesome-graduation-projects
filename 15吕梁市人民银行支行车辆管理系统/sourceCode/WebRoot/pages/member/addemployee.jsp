<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.0 transitional//EN">
<html>
	<head>
		<title>员工信息录入</title>
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
		<form method="post" action="../../addEmployee.do">
		<table width="760" border="0" style="margin:20px 0;" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="3">
						<table cellpadding="0" cellspacing="0" width="100%" height="62">
							<tr>
								<td background="../../images/tab01.gif" width="309" valign="top">
									<div class="tabhead">
										员工信息录入
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
							<tr bgcolor="#e6ffd6"><td align="right">姓名：</td><td><input type="text" name="name"/></td>
							<td align="right">性别：</td><td><input type="radio" value="0" name="gender"/>男
							<input type="radio" value="1" name="gender"/>女
							</td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="3"></td>
							</tr>
							<tr bgcolor="#e6ffd6"><td align="right">年龄：</td><td><input type="text" name="age"/></td>
							<td align="right">文化程度：</td><td><input type="text" name="educationlevel"/></td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="3"></td>
							</tr>
							<tr bgcolor="#e6ffd6"><td align="right">职务：</td><td><input type="text" name="position"/></td>
							<td align="right">驾驶证号：</td><td><input type="text" name="licensenum"/></td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="3"></td>
							</tr>
							<tr bgcolor="#e6ffd6"><td align="right">准驾车型：</td><td>
								<select name="cartype" >
							<option value="微型货车">微型货车</option>
							<option value="小型货车">小型货车</option>
							<option value="中型货车">中型货车</option>
							<option value="大型货车">大型货车</option>
							</select></td><td align="right">家庭住址：</td><td><input type="text" name="address"/></td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="3"></td>
							</tr>
							<tr bgcolor="#e6ffd6"><td align="right">联系电话：</td><td><input type="text" name="phone"/></td><td></td><td></td></tr>
							<tr>
								<td bgcolor="#cccccc" colspan="4" height="3"></td>
							</tr>
							<tr bgcolor="#e6ffd6"><td align="right">备注：</td><td colspan="3">
									<textarea name="descripe" rows="3" cols="57"></textarea>
								</td></tr>
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
