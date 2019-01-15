
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
    <base href="<%=basePath%>"></base>
    
    <title>My JSP 'studentList.jsp' starting page</title>
    

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<style type="text/css">
			<!-- body {
				margin-left: 0px;
				margin-top: 0px;
				margin-right: 0px;
				margin-bottom: 0px;
			}
			.tabfont01 {
				font-family: "宋体";
				font-size: 9px;
				color: #555555;
				text-decoration: none;
				text-align: center;
			}
			.font051 {
				font-family: "宋体";
				font-size: 12px;
				color: #333333;
				text-decoration: none;
				line-height: 20px;
			}
			.font201 {
				font-family: "宋体";
				font-size: 12px;
				color: #FF0000;
				text-decoration: none;
			}
			.button {
				font-family: "宋体";
				font-size: 14px;
				height: 37px;
			}
			html {
				overflow-x: auto;
				overflow-y: auto;
				border: 0;
			}
			-->
		</style>

		<link href="css/css.css" rel="stylesheet" type="text/css" />
		<script type="text/JavaScript">

		</script>
		<link href="css/style1.css" rel="stylesheet" type="text/css" />
	</head>
	<SCRIPT language=JavaScript>
		function sousuo() {
			window.open("gaojisousuo.htm", "", "depended=0,alwaysRaised=1,width=800,height=510,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
		}

		function selectAll() {
			var obj = document.fom.elements;
			for (var i = 0; i < obj.length; i++) {
				if (obj[i].name == "delid") {
					obj[i].checked = true;
				}
			}
		}

		function unselectAll() {
			var obj = document.fom.elements;
			for (var i = 0; i < obj.length; i++) {
				if (obj[i].name == "delid") {
					if (obj[i].checked == true) obj[i].checked = false;
					else obj[i].checked = true;
				}
			}
		}

		function link() {
			document.getElementById("fom").action = "yuangong.htm";
			document.getElementById("fom").submit();
		}
		
		function clearInput(){
			document.getElementById("userId1").value="";
			document.getElementById("userName1").value="";
			//document.forms[0].submit();
		}	
		function clearForm(){
			document.getElementById("userId1").value="";
			document.getElementById("userName1").value="";
		}
	</SCRIPT>
	<body>
	
		<form action="servlet/UserServlet?method=findAll"  name="fom" id="fom" method="post">
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="30">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="62" background="images/nav04.gif">
									<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td width="24"><img src="images/ico07.gif" width="20" height="18" /></td>
											<td>
												<span class="newfont06">用户编号 : </span><input name="userId" id="userId1" type="text"  value="${userId1}" size="12" />
												<span class="newfont06">用户姓名 : </span><input name="userName" id="userName1" type="text"  value="${userName1}" size="12" />
												<input name="Submit" type="submit" class="right-button02" value="查 询" />
												<input name="Submit" type="button" class="right-button02" value="清空" onclick="clearForm()"/>
												
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td height="40" class="font42">												
												<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

													<tr>
														<td height="20" colspan="15" align="center" bgcolor="#EEEEEE" class="tablestyle_title" style="text-align: center;"> 用户列表 </td>
													</tr>
													<tr>
														
														<td width="9%" height="20" align="center" bgcolor="#EEEEEE">用户编号</td>
														<td width="9%" align="center" bgcolor="#EEEEEE">用户姓名</td>
														<td width="9%" align="center" bgcolor="#EEEEEE">用户密码</td>									
														<td width="9%" align="center" bgcolor="#EEEEEE">操作</td>
														
														
													</tr>	
													<c:forEach items="${userList }" var="user">
													<tr>
														
														<td width="9%" height="20" align="center" bgcolor="#EEEEEE">${user.userId }</td>
														<td width="9%" align="center" bgcolor="#EEEEEE">${user.userName }</td>
														<td width="9%" align="center" bgcolor="#EEEEEE">${user.password }</td>
														<td width="9%" align="center" bgcolor="#EEEEEE"><a href="servlet/UserServlet?method=deleteUser&userId=${user.userId }">删除</a>
															
															</td>
													</tr>	
													</c:forEach>
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