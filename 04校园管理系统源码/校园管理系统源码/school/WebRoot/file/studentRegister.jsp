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

<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	var flag;
	$(function() {
		//获取所有的班级列表信息并写入下拉列表
		$.ajax({
			url : "servlet/ClazzServlet?method=findAllClazz",
			type : "get",
			dataType : "text",
			success : function(result) {
				eval("var clazzArr=" + result);
				var str = "";
				for (var i = 0; i < clazzArr.length; i++) {
					str += "<option value='"+clazzArr[i].classId+"'>"
							+ clazzArr[i].className + "</option>";
				}
				$("#classId").append(str);
			},
			error : function() {
				alert("Ajax请求失败");
			}
		});
	});

	function checkStudent() {
		//根据学生编号查询系统中是否存在该学生 如果有写入姓名
		var sid = $("#sid").val();
		$.ajax({
			url : "servlet/StudentServlet?method=findById&sid=" + sid,
			type : "get",
			dataType : "text",
			success : function(result) {
				eval("var stu=" + result);
				if (stu != null) {
					findStudent(sid);
					if (flag) {
						$("#sname").val(stu.sname);
						return;
					} else {
						alert("该学生入学信息已经录入系统中了！");
					}
				} else {
					alert("不存在该学生，重新输入！");
				}
			},
			error : function() {
				alert("Ajax请求失败");
			}
		});
	}

	function findStudent(sid) {
		$.ajax({
			async : false,
			url : "servlet/StudentServlet?method=findCheckedById&sid=" + sid,
			type : "get",
			dataType : "text",
			success : function(result) {
				eval("var stu=" + result);
				if (stu == null) {
					//未进行入学登记
					flag = true;
					//alert(flag);
				} else {
					//进行了入学登记
					flag = false;
					//alert(flag);
				}
			},
			error : function() {
				alert("Ajax请求失败");
			}
		});
	}

	function checkClass() {
		var classId = $("#classId").val();
		//检查班级编号
		if (classId != 0) {
			//根据班级编号查询专业名称 直接写入表单中
			$.ajax({
				url : "servlet/ClazzServlet?method=findMajorByClazzId&classId="
						+ classId,
				type : "get",
				dataType : "text",
				success : function(result) {
					eval("var majorName=" + result);
					$("#majorName").val(majorName);
				},
				error : function() {
					alert("Ajax请求失败");
				}
			});
		} else {
			alert("请选择课程！");
		}
	}
	
	function check() {
		document.getElementById("aa").style.display = "";
	}
	
	function checkScore(){
		var enterScore = $("#enterScore").val().trim();
		if(isNaN(enterScore)||enterScore>100){
			alert("请输入合法的分数!");
		}
	}
	
	KE.show({id:'remark'});
</script>
<link rel="stylesheet" rev="stylesheet" href="css2/style.css"
	type="text/css" media="all" />
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
	<form action="servlet/StudentServlet?method=checkIn" name="fom"
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
													<th class="tablestyle_title">学生入学信息录入</th>
												</tr>

												<tr>
													<td class="font42">
														<table border="0" cellpadding="0" cellspacing="0"
															style="width:100%">
															<TR>
																<TD width="100%">
																	<fieldset style="height:100%;">
																		<legend>学生入学信息</legend>
																		<table border="0" cellpadding="2" cellspacing="1"
																			style="width:100%">
																			<tr>
																				<td width="100px">学生编号 :</td>
																				<td><input name="sid" type="text" class="text"
																					style="width:154px" value="" id="sid"
																					onblur="checkStudent();" /></td>
																			</tr>
																			<tr>
																				<td>学生姓名 :</td>
																				<td><input name="sname" id="sname"
																					readonly="readonly" type="text" class="text"
																					style="width:154px" /></td>
																			</tr>
																			<tr>
																				<td>学生班级</td>
																				<td><select name="classId" id="classId"
																					onblur="checkClass();">
																						<option value="0">--请选择班级--</option>
																				</select></td>
																			</tr>

																			<tr>
																			<tr>
																				<td>专业名称</td>
																				<td><input type="text" class="text"
																					name="majorName" id="majorName" readonly="readonly"
																					style="width:154px" /></td>
																			</tr>
																			<tr>
																				<td>入学日期</td>
																				<td><input type="text" class="text"
																					name="checkDate" id="checkDate" readonly="readonly"
																					style="width:154px" onfocus="WdatePicker()" /></td>
																			</tr>
																			<tr>
																				<td>入学分数</td>
																				<td><input type="text" style="width:154px" class="text" name="enterScore" id="enterScore" onblur="checkScore();" /></td>
																			</tr>
																			<tr>
																				<td>经办人</td>
																				<td><input type="text" style="width:154px" class="text" name="operator" id="operator" value=${user.userName } readonly="readonly" /></td>
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
