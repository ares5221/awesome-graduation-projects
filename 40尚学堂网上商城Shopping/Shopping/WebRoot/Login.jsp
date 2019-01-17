<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.bjsxt.shopping.user.*" %>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");

try {
	User u = User.check(username, password);
	session.setAttribute("user", u);
} catch (UserNotFoundException e) {
	out.println(e.getMessage());
	return;
} catch (PasswordNotCorrectException e) {
	out.println(e.getMessage());
	return;
}

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>自服务系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<center>
  		欢迎您： <%=username %>
  		<br>
  		<a href="UserModify.jsp">修改我的信息</a>
  		<br>
  		<a href="ChangePassword.jsp">修改我的密码</a>
  		<br>
  		<a href="MyOrders.jsp">浏览以往订单</a>
  	</center>
  </body>
</html>
