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
										车队人员信息
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
						<form action="../../findDriverByCondition.do" method="post">
						<table width="100%" border="0" cellspacing="1" cellpadding="3"
							align="center">
							<tr>
								<td bgcolor="#cccccc"  height="3" colspan="5"></td>
							</tr>
							<tr>
								<td bgcolor="#92bff2" align="left" height="35" colspan="5">
									<li>
										<b>您可以按条件查询车队人员信息</b>
									</li>
								</td>
							</tr>
							<tr>
								<td bgcolor="#cccccc"  height="3" colspan="5"></td>
							</tr>
							<tr bgcolor="#e6ffd6">
         						 <td align="center" width="20%">性别：
         						 	<select name="gender">
         						 	<option value=0>男</option>
         						 	<option value=1>女</option>
         						 	<option value="unlimited" selected="selected">不限</option></select>
                    			</td>
           						<td align="center" width="20%">年龄：
                					<select name="age">
                  						<option value="1">20-29岁</option>
                  						<option value="2">30-39岁</option>
                  						<option value="3">40-49岁</option>
                  						<option value="unlimited" selected="selected">不限</option>
                    				</select>
                				</td>
                				<td align="center" width="20%">车型
                					<select name="cartype">
                    					<option value="微型货车">微型货车</option>
                    					<option value="小型货车">小型货车</option>
                    					<option value="中型货车">中型货车</option>
                    					<option value="大型货车">大型货车</option>
                    					<option selected="selected" value="unlimited">不限</option>
                    				</select> 
                    			</td>

                    			<td align="center" width="20%">
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
							<tr bgcolor="#fff5d6" height="25"><th>性名</th><th>性别</th><th>年龄</th><th>准驾车型</th><th>操作</th></tr>
							<c:forEach var="driver" items="${driverlist}">
							<tr>
								<td bgcolor="#cccccc"  height="3" colspan="5"></td>
							</tr>
								<tr bgcolor="#e6ffd6" height="25">
									<td width="20%" align="center">${driver.name}</td>
										<td width="20%" align="center">
										<c:if test="${driver.gender eq 0}">男</c:if>
										<c:if test="${driver.gender eq 1}">女</c:if>
									</td>
									<td width="20%" align="center">${driver.age}</td>
									<td width="20%" align="center">
									${driver.cartype}
									</td>
									<td width="20%" align="center">
										<a href="../../findDriverInfo.do?driverid=${driver.id}">详细信息</a>
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
