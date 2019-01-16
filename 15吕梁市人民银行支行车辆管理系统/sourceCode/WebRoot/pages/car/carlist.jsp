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
										车辆详细信息
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
						<form action="../pages/messenger/matchFriends.do" method="post" name="matchFriendForm">
						<table width="100%" border="0" cellspacing="1" cellpadding="3"
							align="center">
							<tr>
								<td bgcolor="#cccccc"  height="3" colspan="5"></td>
							</tr>
							<tr>
								<td bgcolor="#e6ffd6" align="left" height="35" colspan="5">
									<li>
										<b>您可以按条件查询车辆信息</b>
									</li>
								</td>
							</tr>
							<tr>
								<td bgcolor="#cccccc"  height="3" colspan="4"></td>
							</tr>
							<tr bgcolor="#fff5d6">
           						<td align="center" width="40%">最大载量：
                					<select name="capacity">
                  						<option value="1">1-5吨</option>
                  						<option value="2">5-10吨</option>
                  						<option value="3">10吨以上</option>
                  						<option value="unlimited" selected="selected">不限</option>
                    				</select>
                				</td>
                				<td align="center" width="40%">车型类型
                					<select name="cartype">
                    					<option value="1">微型货车</option>
                    					<option value="2">小型货车</option>
                    					<option value="3">中型货车</option>
                    					<option value="4">大型货车</option>
                    					<option selected="selected" value="unlimited">不限</option>
                    				</select> 
                    			</td>

                    			<td align="center" width="20%">
            						<input type="submit" name="Submit" value="查询" />                 
          						</td>
         					</tr>
         					<tr>
								<td bgcolor="#cccccc"  height="3" colspan="4"></td>
							</tr>
						</table>
						</form>
						<table width="100%" border="0" cellspacing="1" cellpadding="3"
							align="center">
								<tr>
								<td bgcolor="#cccccc"  height="3" colspan="5"></td>
							</tr>
							<tr bgcolor="92bff2" height="25"><th>车牌号码</th><th>车辆类型</th><th>最大载量</th><th>驾驶员</th><th>操作</th></tr>
							
							<c:forEach var="car" items="${carlist}">
							<tr>
								<td bgcolor="#cccccc"  height="3" colspan="5"></td>
							</tr>
								<tr bgcolor="92bff2" height="25">
									<td width="20%" align="center">${car.carnumber}</td>
										<td width="20%" align="center">
										${car.cartype}
									</td>
									<td width="20%" align="center">${car.capacity}</td>
									<td width="20%" align="center">
									${car.driver.name }
									</td>
									<td width="20%" align="center">
										<a href="../pages/messenger/createMessage.do?receiver=briup2">详细信息</a>
									</td>
								</tr>
								</c:forEach>
								
						
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
