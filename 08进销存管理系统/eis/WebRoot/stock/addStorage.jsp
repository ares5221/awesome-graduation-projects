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
	<script type="text/javascript" src="/eis/js/jquery-1.8.2.js"></script>
	<script type="text/javascript">
		$(function(){
			$.ajax({
				url:"servlet/CGServlet?method=showAll",
				type:"post",
				dataType:"text",
				success:function(data){
					//json字符串转json对象
					eval("var pojoArr="+ data);
					//alert(data);
					//写入对应的表单
					//获取所有采购单号
					var str = "";
					for(var i = 0; i<pojoArr.length; i++) {
						str += "<option value='"+pojoArr[i].cg.id+"'>"+pojoArr[i].cg.id+"</option>"
						//alert(str);
						//$("#spName").val(pojoArr[i].spInfo.spName);
					}
					$("#cgid").append(str);
				}
			});
		});
		function getInfo() {
			//获取采购id
			var cgid = $("#cgid").val();
			//alert(cgid)
			$.ajax({
				url:"servlet/CGServlet?method=showById",
				type:"get",
				data:"id="+cgid,
				dataType:"text",
				success:function(data) {
					//json字符串转json对象
					eval("var pojoArr=" +data);
					//alert(data)
					$("#gysName").val(pojoArr[0].gys.name);
					$("#spName").val(pojoArr[0].spInfo.spName);
					$("#spId").val(pojoArr[0].spInfo.spId);
					$("#dj").val(pojoArr[0].cg.dj);
					$("#je").val(pojoArr[0].cg.je);
				},
			});
		};
		
		function submitForm() {
			//获取各个表单项的值
			var cgid = $("#cgid").val();
			//alert(cgid);
			var spid = $("#spId").val();
			var wf = $("#wf").val();
			var sf = $("#sf").val();
			var jsfs = $("#jsfs").val();
			//var rkdate = $("#rkdate").val();
			var czy = $("#czy").val();
			var jsr = $("#jsr").val();
			var gysName = $("#gysName").val();
			
			//通过ajax发送请求提交表单数据
			$.ajax({
				url:"servlet/RKServlet?method=toInbound",
				type:"post",
				data:{id:cgid,spid:spid,wf:wf,sf:sf,jsfs:jsfs,czy:czy,jsr:jsr,gysname:gysName},
				dataType:"text",
				success:function(data){
					alert(data);
					window.parent.location.reload();
					parent.layer.closeAll('iframe');

				},
				error:function(xhr){
					alert(xhr.status)
				}
			});
		};
		
	
	</script>
		<style type="text/css">
			<!-- .atten {
				font-size: 12px;
				font-weight: normal;
				color: #F00;
			}
			-->
		</style>
		<!--<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>  -->
	</head>

	<body>

		<form name="fom" id="fom" method="post" >
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
<!-- 					</tr>
						<th style="font-size: medium;font-family: 微软雅黑;color: gray;">商品入库信息添加</th>
					<tr> -->
						<td class="CPanel">
							<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
								<TR>
									<TD width="100%">
										<fieldset style="height:100%;">
											
											<table border="0" cellpadding="2" cellspacing="1" style="width:100%">

												<tr>
													<td style="height:30px;font-size: 15px;"><span style="color:red;">*</span>采购单编号:</td>
													<td>
														<select name="cgid" class="text" id="cgid" onchange="getInfo()" style="width:500px;height:30px;font-size: 15px;">
															<option selected="selected"></option>
														</select>
													</td>
												</tr>
												
												<tr>
													<td style="height:30px;font-size: 15px;"><span style="color:red;">*</span>供应商名称:</td>
													<td>
														<input class="text" type="text" name="gysName" style="width:500px;height:30px;font-size: 15px;" id="gysName" readonly="readonly" />
													</td>
												</tr>
												<tr>
												
													<td style="height:30px;font-size: 15px;"><span style="color:red;">*</span>商品编号:</td>
													<td>
														<input class="text" type="text" name="spId" style="width:500px;height:30px;font-size: 15px;" id="spId" readonly="readonly" />
													</td>
												</tr>
								
													<tr>
														<td style="height:30px;font-size: 15px;"><span style="color:red;">*</span>商品名称:</td>
														<td>
															<input class="text" type="text" name="spName" style="width:500px;height:30px;font-size: 15px;" id="spName" readonly="readonly" />
														</td>
													</tr>

													<tr>
														<td style="height:30px;font-size: 15px;"><span style="color:red;">*</span>单价:</td>
														<td>
															<input class="text" name='dj' style="width:500px;height:30px;font-size: 15px;" id="dj" readonly="readonly" />
														</td>
													</tr>
													
													<tr>
														<td style="height:30px;font-size: 15px;"><span style="color:red;">*</span>金额:</td>
														<td>
															<input class="text" name="je" style="width:500px;height:30px;font-size: 15px;" id="je" readonly="readonly" /> </td>
													</tr>
												
												<tr>
													<td style="height:30px;font-size: 15px;"><span style="color:red;">*</span>实付:</td>
													<td>
														<input class="text" name='sf' id="sf" style="width:500px;height:30px;font-size: 15px;" value="" />
													</td>
												</tr>
												<tr>
													<td style="height:30px;font-size: 15px;"><span style="color:red;">*</span>未付:</td>
													<td>
														<input class="text" name='wf' id="wf" style="width:500px;height:30px;font-size: 15px;" value="" />
													</td>
												</tr>
												<tr>
													<td style="height:30px;font-size: 15px;"><span style="color:red;">*</span>结算方式:</td>
													<td>
														<input class="text" name='jsfs' id="jsfs" style="width:500px;height:30px;font-size: 15px;" value="" />	
													</td>
												</tr>
<!-- 												<tr>
													<td style="height:30px;font-size: 15px;"><span style="color:red;">*</span>入库时间:</td>
													<td>
														<input class="text" name='rkdate' id="rkdate" style="width:500px;height:30px;font-size: 15px;" value="" />
													</td>
												</tr> -->
												<tr>
													<td style="height:30px;font-size: 15px;"><span style="color:red;">*</span>操作员:</td>
													<td>
														<input class="text" name='czy' id="czy" style="width:500px;height:30px;font-size: 15px;" value="${user.userName }" readonly="readonly" />
													</td>
												</tr>
												<tr>
													<td style="height:30px;font-size: 15px;"><span style="color:red;">*</span>经手人:</td>
													<td>
														<input class="text" name='jsr' id="jsr" style="width:500px;height:30px;font-size: 15px;" value="" />
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
							<input type="button" name="Submit" value="确定" class="btn btn-primary radius" onclick="submitForm()"/>&nbsp;
							&nbsp;<input type="button" name="Submit" value="返回" class="btn btn-primary radius" onclick="back()" />
						</TD>
					</TR>
				</TABLE>
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