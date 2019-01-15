<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%-- 转发到登录页面方法 --%>
<jsp:forward page="servlet/StudentServlet?method=toLoginPage"></jsp:forward>
