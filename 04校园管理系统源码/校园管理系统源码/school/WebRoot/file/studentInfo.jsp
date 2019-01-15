<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title></title>
<link rel="stylesheet" rev="stylesheet" href="css2/style.css"
	type="text/css" media="all" />
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
function check() {
	document.getElementById("aa").style.display = "";
}

KE.show({id:'remark'});
</script>
<style type="text/css">
<!--
.atten {
	font-size: 12px;
	font-weight: normal;
	color: #F00;
}
-->
</style>
</head>

<body>
	<form action="servlet/StudentServlet?method=register" name="fom" id="fom"
		method="post">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="30">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="62" background="images/nav04.gif" class="style10">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table id="subtree1" style="DISPLAY: " width="100%" border="0"
						cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<table width="95%" border="0" align="center" cellpadding="0"
									cellspacing="0">
									<tr>
										<td height="40" class="font42">
											<table width="100%" border="0" cellpadding="4"
												cellspacing="1" class="CContent">
												<tr>
													<th class="tablestyle_title">学生信息录入</th>
												</tr>

												<tr>
													<td class="font42">
														<table border="0" cellpadding="0" cellspacing="0"
															style="width:100%">
															<TR>
																<TD width="100%">
																	<fieldset style="height:100%;">
																		<legend>学生信息</legend>
																		<table border="0" cellpadding="2" cellspacing="1"
																			style="width:100%">
																			<tr>
																				<td width="100px">学生编号 :</td>
																				<td><input name="sid" type="text" class="text"
																					style="width:154px" value="" /></td>
																			</tr>
																			<tr>
																				<td>学生姓名 :</td>
																				<td><input name="sname" type="text"
																					class="text" style="width:154px" value="" /></td>
																			</tr>
																			<tr>
																				<td>学生性别:</td>
																				<td><input type="radio" name="sex" value="0" />男
																					<input type="radio" name="sex" value="1" />女</td>
																			</tr>

																			<tr>
																				<td>学生年龄:</td>
																				<td><input class="text" name='age'
																					style="width:154px" value="" /></td>
																			</tr>
																			<tr>
																				<td>身份证号:</td>
																				<td><input class="text" name='idCard'
																					style="width:154px" value="" /></td>
																			</tr>
																			<tr>
																				<td>出生日期:</td>
																				<td><input class="text" name="birth"
																					style="width:154px" value="" onfocus="WdatePicker()" readonly="readonly" /></td>
																			</tr>
																			<tr>
																				<td>家庭地址:</td>
																				<td><input type="text" name="address"
																					class="text" style="width:154px" value="" /></td>
																			</tr>
																			<tr>
																				<td>家庭电话:</td>
																				<td><input type="text" name="phone"
																					class="text" style="width:154px" value="" /></td>
																			</tr>
																			<tr>
																				<td>政治面貌</td>
																				<td><input type="radio" name="politics"
																					value="0" />党员 <input type="radio" name="politics"
																					value="1" />团员 <input type="radio" name="politics"
																					value="2" />群众</td>
																			</tr>
																			<tr>
																				<td>健康状况</td>
																				<td><input type="radio" name="health" value="0" />优
																					<input type="radio" name="health" value="1" />良</td>
																			</tr>

																		</table>
																		<br />
																	</fieldset>
																</TD>

															</TR>

														</table>
													</td>
												<TR>
													<TD colspan="2" align="center" height="50px"><input
														type="submit" name="Submit" value="保存" class="button" />
													</TD>
												</TR>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
