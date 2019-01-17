<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.user.*"%>

<%
int id = Integer.parseInt(request.getParameter("id"));
String url = request.getParameter("from");
User.delete(id);
%>

<html>
	<head>
		<title>删除用户</title>
	</head>
	<body>
		<center>
			恭喜您, 删除成功!
			<br>
			<span id="delay" style="background:red">3</span>秒钟后跳转到上一页面, 或者请点击下面的链接 自己跳转
			<br>
			<a href="<%=url%>"><%=url%></a>
		</center>
		<script type="text/javascript">	
			
			//var delay = 3;
			//function goBack() {
			//	document.getElementById("delay").innerHTML=delay;
			//	delay --;
			//	if(delay == 0) 
			//		document.location.href='<%=url%>';
			//	else 
			//		setTimeout(goBack, 1000);
			//}
			//goBack();
			
			parent.main.location.reload();
			
		</script>
	</body>
</html>