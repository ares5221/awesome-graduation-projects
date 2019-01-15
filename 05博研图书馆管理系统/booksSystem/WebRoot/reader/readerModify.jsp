<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

	<head>
    <base href="<%=basePath%>">
		<title>图书馆管理系统</title>
		<link href="CSS/style.css" rel="stylesheet">
		<link href="CSS/top.css" rel="stylesheet">
		<script type="text/javascript" src="editor/kindeditor.js"></script>
		<script type="text/javascript">KE.show({id : 'remark'});</script>
		<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
	</head>

	<body onLoad="clockon(bgclock)">

	
		<table width="778" border="0" cellspacing="0" cellpadding="0" align="center">
			<tr>
				<td valign="top" bgcolor="#FFFFFF">
					<table width="99%" height="510" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
						<tr>
							<td height="510" valign="top" style="padding:10px;">
								<table width="98%" height="487" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td height="22" valign="top" class="word_orange">当前位置：读者管理 &gt; 读者类型管理 &gt;&gt;&gt;添加读者&gt;&gt;&gt;</td>
									</tr>
									<tr>
										<td align="center" valign="top">
											<table width="91%" border="0" spacing="0" cellspacing="0" cellpadding="0" style="height: 63px; ">
												<tr>
													<td align="center" style="color:#B0690B;font-weight:600;font-size: x-large;">读者信息更新</td>
												</tr>
											</table>
											<form name="form1" method="post" action="servlet/ReaderServlet?method=readerModify">

												<table width="70%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF" style="width: 390px; ">
		
													<tr align="center">
														<td width="24%" align="left" style="padding:5px; width: 124px">姓名：</td>
														<td width="76%" align="left">
															<input name="name" type="text" id="cost" value="${reader.name }" size="30">
														</td>
													</tr>
													<tr align="center">
														<td width="24%" align="left" style="padding:5px;">性别：</td>
														<td width="76%" align="left">
															<input name="sex" type="text" id="cost" value="${reader.sex }" size="30">
														</td>
													</tr>
													<tr align="center">
														<td width="24%" align="left" style="padding:5px;">类型：</td>
														<td width="76%" align="left">
															<select name="id">
																<c:forEach items="${readerTypeList}" var="type">
																	<c:if test="${type.id==reader.id}">
																	<option value="${type.id}" selected="selected">${type.name}</option>
																	</c:if>
																	<c:if test="${type.id!=reader.id}">
																	<option value="${type.id}" >${type.name}</option>
																	</c:if>
																</c:forEach>
															</select>
														</td>
													<tr>
													<tr align="center">
														<td width="24%" align="left" style="padding:5px;">条形码：</td>
														<td width="76%" align="left">
															<input name="barcode" type="text" id="cost" value="${reader.barcode}" size="30">
														</td>
													<tr>
													<tr align="center">
														<td width="13%" align="left" style="padding:5px;">职业：</td>
														<td width="70%" align="left">
															<input name="vocation" type="text" id="cost" value="${reader.vocation}" size="30">
														</td>
													<tr>
													<tr align="center">
														<td width="24%" align="left" style="padding:5px;">出生日期：</td>
														<td width="76%" align="left">
															<input name="birthday" type="text" id="cost" value="${reader.birthday}" size="30" onfocus="WdatePicker()">
														</td>
													<tr>
													<tr align="center">
														<td width="24%" align="left" style="padding:5px;">证件类型：</td>
														<td width="76%" align="left">
															<input name="paperType" type="text" id="cost" value="${reader.paperType}" size="30">
														</td>
													<tr>
													<tr align="center">
														<td width="24%" align="left" style="padding:5px;">证件号码：</td>
														<td width="76%" align="left">
															<input name="paperNo" type="text" id="cost" value="${reader.paperNo}" size="30">
														</td>
													<tr>
													<tr align="center">
														<td width="24%" align="left" style="padding:5px;">电话：</td>
														<td width="76%" align="left">
															<input name="tel" type="text" id="cost" value="${reader.tel}" size="30">
														</td>
													<tr>
													<tr align="center">
														<td width="24%" align="left" style="padding:5px;">操作者：</td>
														<td width="76%" align="left">
															<input name="manager" type="text" id="cost" value="${reader.operator}" size="30">
														</td>
													<tr align="center">
														<td width="24%" align="left" style="padding:5px;">创建日期：</td>
														<td width="76%" align="left">
															<input name="createDate" type="text" id="cost" value="${reader.createDate}" size="30" onfocus="WdatePicker()">
														</td>
													<tr align="center">
														<td width="24%" align="left" style="padding:5px;">截止日期：</td>
														<td width="76%" align="left">
															<input name="endDate" type="text" id="cost" value="${reader.endDate}" size="30" onfocus="WdatePicker()">
														</td>
													<tr>
															<td align="left" style="padding:5px;">邮箱：</td>
															<td align="left"><input name="email" type="text" id="validity" size="30" value="${reader.email}">
															</td>
													<tr align="center">
														<td width="30%" align="left" style="padding:5px; width: 111px">简介：</td>
														<td width="76%" align="left">
														<textarea rows="1" cols="1" id="remark" name="remark" >${reader.remark}</textarea>
														</td>
														</tr>
														<tr>
															<td height="65" align="left" style="padding:5px;">&nbsp;</td>
															<td><input name="Submit" type="submit" class="btn_grey" value="保存"> &nbsp;
																<input name="Submit2" type="button" class="btn_grey" value="取消" onclick="history.back()">${error}</td>
														</tr>
												</table>
											</form>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					
				</td>
			</tr>
		</table>
	</body>

</html>