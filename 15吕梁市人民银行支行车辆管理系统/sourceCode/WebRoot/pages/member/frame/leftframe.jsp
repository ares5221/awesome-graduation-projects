<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.0 transitional//EN">
<html>
	<head>
		<title>车辆调度系统</title>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<link href="../../../css/style.css" rel="stylesheet" type="text/css">
		<style>
			body{ background:#dae9f3;}
		</style>
	</head>
	<body>
		<table cellspacing="0" cellpadding="0" width="90%" align="right"
			style="margin-top:20px;">
			<tr>
				<td style="padding-top:0px;" class="menutabOut">
					<b>&nbsp;&nbsp;基础档案</b>
				</td>
			</tr>
			<tr>
				<td>
					<table width="95%" align="right" cellpadding="0" cellspacing="0"
						id="tab">
						<tr>
							<td class="menutabOut" onclick="ClickMenu(this,'PostInfo.htm')">
								<a href="../../../findAllUser.do" class="textlink01" target="rightframe">&nbsp;&nbsp;&nbsp;权限管理</a>
							</td>
						</tr>
						<tr>
							<td class="menutabOut" onclick="ClickMenu(this,'Flowlist.htm')">
								<a href="../addemployee.jsp" class="textlink01" target="rightframe">&nbsp;&nbsp;&nbsp;人员登记</a>
							</td>
						</tr>
						<tr>
							<td class="menutabOut" onclick="ClickMenu(this,'Flowlist.htm')">
								<a href="../../car/addcar.jsp" class="textlink01" target="rightframe">&nbsp;&nbsp;&nbsp;车辆登记</a>
							</td>
						</tr>

					</table>
				</td>
			</tr>
			<tr>
				<td style="padding-top:30px;" class="menutabOut">
					<b>&nbsp;&nbsp;车辆状态</b>
				</td>
			</tr>
			<tr>
				<td>
					<table width="95%" align="right" cellpadding="0" cellspacing="0"
						id="tab02">
						<tr>
							<td class="menutabOut" >
								<a href="../../../findAllCar.do" class="textlink01" target="rightframe">&nbsp;&nbsp;&nbsp;&nbsp;状态查询</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="padding-top:30px;" class="menutabOut">
					<b>&nbsp;&nbsp;车辆调度</b>
				</td>
			</tr>
			<tr>
				<td>
					<table width="95%" align="right" cellpadding="0" cellspacing="0"
						id="tab02">
						<tr>
							<td class="menutabOut" >
								<a href="../../car/application.jsp" class="textlink01" target="rightframe">&nbsp;&nbsp;&nbsp;&nbsp;用车申请</a>
							</td>
						</tr>
						<tr>
							<td class="menutabOut">
								<a href="../../../findAppRecord.do" class="textlink01" target="rightframe">&nbsp;&nbsp;&nbsp;&nbsp;调度审批</a>
							</td>
						</tr>
						<tr>
							<td class="menutabOut" >
								<a href="../../../findCheckApp.do" class="textlink01" target="rightframe">&nbsp;&nbsp;&nbsp;&nbsp;出车登记</a>
							</td>
						</tr>
						<tr>
							<td class="menutabOut" >
								<a href="../../../findOutCar.do" class="textlink01" target="rightframe">&nbsp;&nbsp;&nbsp;&nbsp;回车登记</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="padding-top:30px;" class="menutabOut">
					<b>&nbsp;&nbsp;报表统计</b>
				</td>
			</tr>
			<tr>
				<td>
					<table width="95%" align="right" cellpadding="0" cellspacing="0"
						id="tab03">
						<tr>
							<td class="menutabOut" >
								<a href="../../../findAllEmployees.do" class="textlink01" target="rightframe">&nbsp;&nbsp;&nbsp;&nbsp;员工信息</a>
							</td>
						</tr>
						<tr>
							<td class="menutabOut" >
								<a href="../../../findAllCar.do" class="textlink01" target="rightframe">&nbsp;&nbsp;&nbsp;&nbsp;车辆信息</a>
							</td>
						</tr>
						<tr>
							<td class="menutabOut" >
								<a href="../../../findAllOutRecord.do" class="textlink01" target="rightframe">&nbsp;&nbsp;&nbsp;&nbsp;出车明细</a>
							</td>
						</tr>
						<tr>
							<td class="menutabOut" >
								<a href="../../../findBackRecordList.do" class="textlink01" target="rightframe">&nbsp;&nbsp;&nbsp;&nbsp;返车明细</a>
							</td>
						</tr>

					</table>
				</td>
			</tr>
			
		</table>
	</body>
</html>
