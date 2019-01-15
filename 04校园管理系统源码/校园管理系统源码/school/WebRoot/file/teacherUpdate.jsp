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
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="editor/kindeditor.js"></script>
<link rel="stylesheet" rev="stylesheet" href="css2/style.css"
	type="text/css" media="all" />
<title></title>
<script language="JavaScript" type="text/javascript">
	function check() {
		document.getElementById("aa").style.display = "";
	}

	KE.show({
		id : 'jobDesc'
	});
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
	<form action="servlet/TeacherServlet?method=update&tno=${teacher.tno }" name="fom"
		id="fom" method="post">
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
													<th class="tablestyle_title">教师信息修改</th>
												</tr>

												<tr>
													<td class="font42">
														<table border="0" cellpadding="0" cellspacing="0"
															style="width:100%">
															<TR>
																<TD width="100%">
																	<fieldset style="height:100%;">
																		<legend>教师信息</legend>
																		<table border="0" cellpadding="2" cellspacing="1"
																			style="width:100%">
																			<tr>
																				<td>教师姓名：</td>
																				<td><input name="tname" id="tname" type="text"
																					class="text" style="width:154px" value="${teacher.tname }" /></td>
																			</tr>
																			<tr>
																				<td>教师年龄:</td>
																				<td><input class="text" name='age'
																					style="width:154px" value="${teacher.age }" /></td>
																			</tr>
																			<tr>
																				<td>教师性别:</td>
																				<td>
																					<c:if test="${teacher.sex==0 }">
																						<input type="radio" name="sex" value="0" checked="checked" />男
																					</c:if>
																					<c:if test="${teacher.sex!=0 }">
																						<input type="radio" name="sex" value="0" />男
																					</c:if>
																					<c:if test="${teacher.sex==1 }">
																						<input type="radio" name="sex" value="1" checked="checked" />女
																					</c:if>
																					<c:if test="${teacher.sex!=1 }">
																						<input type="radio" name="sex" value="1" />女
																					</c:if>
																				</td>
																			</tr>
																			<tr>
																				<td>婚否:</td>
																				<td>
																					<c:if test="${teacher.marital==0 }">
																						<input type="radio" name="marital" value="0" checked="checked" />未婚
																					</c:if>
																					<c:if test="${teacher.marital!=0 }">
																						<input type="radio" name="marital" value="0" />未婚
																					</c:if>
																					<c:if test="${teacher.marital==1 }">
																						<input type="radio" name="marital" value="1" checked="checked" />已婚
																					</c:if>
																					<c:if test="${teacher.marital!=1 }">
																						<input type="radio" name="marital" value="1" />已婚
																					</c:if>
																				</td>
																			</tr>
																			<tr>
																				<td>政治面貌:</td>
																				<td>
																					<c:if test="${teacher.politics==0 }">
																						<input type="radio" name="politics" value="0" checked="checked" />党员
																					</c:if>
																					<c:if test="${teacher.politics!=0 }">
																						<input type="radio" name="politics" value="0" />党员
																					</c:if>
																					<c:if test="${teacher.politics==1 }">
																						<input type="radio" name="politics" value="1" checked="checked" />群众
																					</c:if>
																					<c:if test="${teacher.politics!=1 }">
																						<input type="radio" name="politics" value="1" />群众
																					</c:if>
																				</td>
																			</tr>
																			<tr>
																				<td>民族:</td>
																				<td><input type="text" name="nation"
																					style="width:154px" class="text"  value="${teacher.nation }"/></td>
																			</tr>
																			<tr>
																				<td>学历:</td>
																				<td><input type="text" name="education"
																					style="width:154px" class="text" value="${teacher.education }" /></td>
																			</tr>
																			<tr>
																				<td>出生日期:</td>
																				<td><input type="text" name="birth"
																					style="width:154px" class="text"
																					onfocus="WdatePicker()" value="${teacher.birth }"/></td>
																			</tr>
																			<tr>
																				<td>身份证号:</td>
																				<td><input type="text" name="idCard"
																					style="width:154px" class="text" value="${teacher.idCard }" /></td>
																			</tr>
																			<tr>
																				<td>联系电话:</td>
																				<td><input type="text" name="phone"
																					style="width:154px" class="text" value="${teacher.phone }"/></td>
																			</tr>
																			<tr>
																				<td>工作日期:</td>
																				<td><input type="text" name="workDate"
																					style="width:154px" class="text"
																					onfocus="WdatePicker()" value="${teacher.workDate }" /></td>
																			</tr>
																			<tr>
																				<td>授课专业:</td>
																				<td>
																					<select name="mno">
																						<option value="0">--请选择授课专业--</option>
																						<c:forEach items="${majorList }" var="major">
																							<c:if test="${major.mno==teacher.mno }">
																								<option value="${major.mno }" selected="selected">${major.mname }</option>
																							</c:if>
																							<c:if test="${major.mno!=teacher.mno }">
																								<option value="${major.mno }">${major.mname }</option>
																							</c:if>
																						</c:forEach>
																					</select>
																				</td>
																			</tr>
																			<tr>
																				<td>工作简介:</td>
																				<td><textarea rows="10" cols="50"
																						name="jobDesc" id="jobDesc">${teacher.jobDesc }</textarea></td>
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
