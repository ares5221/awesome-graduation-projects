<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
    <base href="<%=basePath%>"></base>
    

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link rel="stylesheet" rev="stylesheet" href="css/style.css" type="text/css" media="all" />
		
		<script language="JavaScript" type="text/javascript">
			function tishi() {
				var a = confirm('数据库中保存有该人员基本信息，您可以修改或保留该信息。');
				if (a != true) return false;
				window.open("冲突页.htm", "", "depended=0,alwaysRaised=1,width=800,height=400,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
			}

			function check() {
				document.getElementById("aa").style.display = "";
			}
		</script>
		<style type="text/css">
			<!-- .atten {
				font-size: 12px;
				font-weight: normal;
				color: #F00;
			}
			-->
		</style>
	</head>

	<body>

	<form action="servlet/UserServlet?method=addUser" name="fom" id="fom" method="post">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">

				<!-- <tr>
					<td height="30">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="62" background="images/nav04.gif" class="style10">
								</td>
							</tr>
						</table>
					</td>
				</tr> -->
				<tr>
					<td>
						<table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td height="40" class="font42">
						<table width="100%" border="0" cellpadding="4" cellspacing="1" class="CContent">
										<!-- <tr>
											<th  style="font-size: 18px;text-align: left; font-family: 宋体；">操作员信息录入</th>
										</tr> -->

										<tr>
											<td class="font42">
											<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
												<TR>
													<TD width="100%">
														<fieldset style="height:100%;">
															<legend style="font-size: 15px">操作员信息录入</legend>
															<table border="0" cellpadding="2" cellspacing="1" style="width:100%">

																<tr>
																	<td style="font-size: medium;font-family: 隶书">操作员名称 :</td>
																	<td>
																		<input name="name" type="text" class="text" style="width:250px;height:25px" value="" />
																	</td>
																</tr>

																<tr>
																	<td style="font-size: medium;font-family: 隶书">操作员姓名:</td>
																	<td>
																		<input class="text" type="text" name="userName" style="width:250px;height:25px" value="" />
																	</td>
																</tr>
																<tr>
																	<td style="font-size: medium;font-family: 隶书">密码:</td>
																	<td>
																		<input class="text" type="password" name='pass' style="width:250px;height:25px" value="" />
																	</td>
																</tr>
																<tr>
																	<td style="font-size:medium;font-family: 隶书">手机号:</td>
																	<td>
																	
																		<input class="text" name='phone' style="width:250px;height:25px" value="" />
																	</td>
																</tr>
																<tr>
																	<td style="font-size: medium;font-family: 隶书">角色:</td>
																	<td>
																		<select class="select" name="quan" size="1" style="width:150px;height:25px;font-size: 15px">
																		   <option value="0">系统操作员</option>
																		   <option value="1">普通操作员</option>
																		</select>
																		
																	</td>
																</tr>
																<tr>
																	<td style="font-size: medium;font-family: 隶书">状态:</td>
																	<td>
																	   <select class="select" name="status" size="1" style="width:150px;height:25px;font-size: 15px">
																	     <option value="0">启用</option>
																	     <option value="1">停用</option>
																	   </select>
																  </tr>
																
															</table>
															<br />
														</fieldset>
													</TD>

												</TR>

											</table>
									</td>
							<TR>
								<TD colspan="2" align="center" height="50px">
									<input class="btn btn-primary radius" type="submit" name="Submit" value="&nbsp;&nbsp;保存&nbsp;&nbsp;" class="button" />
								</TD>
							</TR>
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