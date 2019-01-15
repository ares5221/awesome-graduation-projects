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
		
	</head>

	<body>

	<form action="servlet/UserServlet?method=addUser" name="fom" id="fom" method="post">
			<table  border="0" cellspacing="0" cellpadding="0" align="center">
				<tr >
					<td colspan="2" align="center" height="50px"><h2>管理员信息录入</h2></td>
				</tr>
				<tr>
					<td width="100px" height="50px">用户编号 :</td>
					<td>
						<input name="userId" type="text" style="width:154px" value="" />
					</td>
				</tr>
				<tr>
					<td width="150px" height="50px">用户姓名 :</td>
					<td>
						<input name="userName" type="text" style="width:154px" value="" />
					</td>
				</tr>
				<tr>
					<td width="100px" height="50px">用户密码 :</td>
					<td>
						<input  type="password" name="password" style="width:154px" value="" />
					</td>
				</tr>
				<TR>
					<TD colspan="2" align="center" height="50px">
						<input type="submit" name="Submit" value="保存" class="button"  />
					</TD>
				</TR>
			</table>
			${error }|${requestScope.error }
		</form>				
	</body>

</html>