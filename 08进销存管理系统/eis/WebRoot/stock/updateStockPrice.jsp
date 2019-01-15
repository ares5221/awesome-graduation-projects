<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <base href="<%=basePath%>"></base>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link rel="stylesheet" rev="stylesheet" href="css/style.css" type="text/css" media="all" />

		<script language="JavaScript" type="text/javascript">
			
			function tishi() {
				var a = confirm('');
				if (a != true) return false;
				window.open("冲突页.htm", "", "depended=0,alwaysRaised=1,width=800,height=400,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
			}

			function check() {
				document.getElementById("aa").style.display = "";
			}
			
			function back() {
				parent.layer.closeAll('iframe');
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
		<form action="servlet/KuCunServlet?method=updateStock" name="fom" id="fom" method="post">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">

				<tr>
					<td height="30">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="62" class="style10">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table id="subtree1" style="DISPLAY: ;" width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr><td height="40" class="font42">
							
				<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
					<tr>
						<td class="CPanel">
							<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
								<TR>
									<TD width="100%">
										<fieldset style="height:100%;">
										
											<table border="0" cellpadding="2" cellspacing="1" style="width:100%">						
													<tr>
														<td style="height:30px;font-size: medium;"><span style="color:red;">*</span>库存编号:</td>
														<td>
															<input class="text" name="id" style="width:500px;height:30px;font-size: medium;" value="${kuCun.id}" readonly="readonly" />
														</td>
													</tr>
													<tr>
														<td style="height:30px;font-size: medium;"><span style="color:red;">*</span>商品名称:</td>
														<td>
															<input class="text" name="spName" style="width:500px;height:30px;font-size: medium;" value="${kuCun.spName}" readonly="readonly" />
														</td>
													</tr>
													
													<tr>
													<td style="height:30px;font-size: medium;"><span style="color:red;">*</span>简称:</td>
														<td>
															<input class="text" name='jc' style="width:500px;height:30px;font-size: medium;" value="${kuCun.jc}" readonly="readonly"/>
														</td>
													</tr>
	
													<tr>
														<td style="height:30px;font-size: medium;"><span style="color:red;">*</span>产地:</td>
														<td>
															<input class="text" name="cd" style="width:500px;height:30px;font-size: medium;" value="${kuCun.cd}" readonly="readonly" /> 
														</td>
													</tr>
													<tr>
														<td style="height:30px;font-size: medium;"><span style="color:red;">*</span>规格:</td>
														<td>
															<input class="text" name='gg' style="width:500px;height:30px;font-size: medium;" value="${kuCun.gg}" readonly="readonly" />
														</td>
													</tr>
												<tr>
													<td style="height:30px;font-size: medium;"><span style="color:red;">*</span>单位:</td>
													<td>
														<input class="text" name='dw' style="width:500px;height:30px;font-size: medium;" value="${kuCun.dw}" readonly="readonly"/>
													</td>
												</tr>	
												
												<tr>
													<td style="height:30px;font-size: medium;"><span style="color:red;">*</span>单价:</td>
													<td>
														<input class="text" name='dj' style="width:500px;height:30px;font-size: medium;" value="${kuCun.dj}" readonly="readonly"/>
													</td>
												</tr>
												
												<tr>
													<td style="height:30px;font-size: medium;"><span style="color:red;">*</span>库存数量:</td>
													<td>
														<input class="text" name='kcsl' style="width:500px;height:30px;font-size: medium;color:blue;" value="${kuCun.kcsl}" />
													</td>
												</tr>
									
												<tr>
													<td style="height:30px;font-size: medium;"><span style="color:red;">*</span>商品编号:</td>
													<td>
														<input class="text" name='spId' style="width:500px;height:30px;font-size: medium;" value="${kuCun.spId}" readonly="readonly"/>
													</td>
												</tr>
												
												<tr>
													<td style="height:30px;font-size: medium;"><span style="color:red;">*</span>销售价格:</td>
													<td>
														<input class="text" name='xsjg' style="width:500px;height:30px;font-size: medium;color:blue;" value="${kuCun.xsjg }" />
													</td>
												</tr>
												
											</table>
											<br />
										</fieldset>
									</TD>

								</TR>

							</TABLE>

						</td>
					</tr>

					<TR>
						<TD colspan="2" align="center" height="50px">
							<input type="submit" name="Submit" value="确定" class="btn btn-primary radius" />
							<input type="button" name="Submit" value="返回" class="btn btn-primary radius" onclick="back()" />
						</TD>
					</TR>
				</TABLE>
									</td>
									</tr>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>

</html>