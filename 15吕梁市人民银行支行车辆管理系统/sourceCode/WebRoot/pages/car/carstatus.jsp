<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.0 transitional//EN">
<html>
	<head>
		<link href="../../css/style.css" rel="stylesheet" type="text/css">
	</head>
	<body >
			<table width="760" border="0" style="margin:20px 0;" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="3">
						<table cellpadding="0" cellspacing="0" width="100%" height="62">
							<tr>
								<td background="../../images/tab01.gif" width="309" valign="top">
									<div class="tabhead">
										车辆信息查询
									</div>
								</td>
								<td valign="bottom">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tr>
											<td background="../../images/topcenter.gif" width="100%"></td>
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
						<form action="../../findCarsByCondition.do" method="post">
						<table width="100%" border="0" cellspacing="1" cellpadding="3"
							align="center">
							<tr>
								<td bgcolor="#cccccc"  height="3" colspan="5"></td>
							</tr>
							<tr>
								<td bgcolor="#92bff2" align="left" height="35" colspan="5">
									<li>
										<b>您可以按条件查询车辆详细信息</b>
									</li>
								</td>
							</tr>
							<tr>
								<td bgcolor="#cccccc"  height="3" colspan="5"></td>
							</tr>
							<tr bgcolor="#e6ffd6">
                				<td align="center" width="40%">车辆类型
                					<select name="cartype">
                    					<option value="微型货车">微型货车</option>
                    					<option value="小型货车">小型货车</option>
                    					<option value="中型货车">中型货车</option>
                    					<option value="大型货车">大型货车</option>
                    					<option selected="selected" value="unlimited">不限</option>
                    				</select> 
                    			</td>
                    			<td align="center" width="40%">车辆状态
                					<select name="status">
                    					<option value="待命">待命  </option>
                    					<option value="出车">出车  </option>
                    					<option selected="selected" value="unlimited">不限</option>
                    				</select> 
                    			</td>
                    			<td align="center" width="20%" colspan="3">
            						<input type="submit" name="Submit" value="查询" />                 
          						</td>
         					</tr>
         					<tr>
								<td bgcolor="#cccccc"  height="3" colspan="5"></td>
							</tr>
						</table>
						</form>
						<table width="100%" border="0" cellspacing="1" cellpadding="3"
							align="center">
							<tr>
								<td bgcolor="#cccccc"  height="3" colspan="5"></td>
							</tr>
							<tr bgcolor="#fff5d6" align="center" height="25"><td>车牌号码</td><td>驾驶员</td>
							<td>车辆类型</td><td>车辆状态</td><td>操作</td>
							</tr>
							<c:forEach var="car" items="${carlist}">
							<tr>
								<td bgcolor="#cccccc"  height="3" colspan="5"></td>
							</tr>
								<tr bgcolor="#e6ffd6" height="25">
									<td width="20%" align="center">${car.carnumber}</td>
										<td width="20%" align="center">
										${car.driver.name}
									</td>
									<td width="20%" align="center">${car.cartype}</td>
									<td width="20%" align="center">
									${car.status}
									</td>
									<td width="20%" align="center">
										<a href="../../findOneCar.do?id=${car.id}">详细信息</a>
									</td>
								</tr></c:forEach><c:remove var="carlist" scope="session"/>
								<tr>
								<td bgcolor="#cccccc"  height="3" colspan="5"></td>
							</tr>
						</table>
					</td>
					<td background="../../images/centeright.gif"></td>
				</tr>
				<tr>
					<td>
						<img src="../../images/bottomleft.gif" />
					</td>
					<td background="../../images/bottomcenter.gif"></td>
					<td>
						<img src="../../images/bottomright.gif" />
					</td>
				</tr>
			</table>
	</body>
</html>
