<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'tomajor.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
		<script type="text/javascript">
			$(function(){
				var gradeNo = $("#gradeNo").val();
				$.ajax({
					url:"servlet/MajorServlet?method=findGrade&gradeNo="+gradeNo,
					success:function(result){
						eval("var grade ="+result);
						$("#gradeName").val(grade.gradeName);
					},
					error:function(){
						alert("请求失败");
					}
				});
			});	
		</script>

</head>

<body>
	<form action="servlet/MajorServlet?method=updateGrade" name="fom"
		id="fom" method="post">
		<table>


			<tr>
				<td>年级编号:</td>
				<td><input value=<%=request.getParameter("gradeNo")%> id="gradeNo"
					name="gradeNo" type="text" class="text" style="width:154px"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td>年级名称:</td>
				<td><input value="" id="gradeName"
					name="gradeName" type="text" class="text" style="width:154px" /></td>
			</tr>
			<TR>
				<TD colspan="2" align="center" height="50px"><input
					type="submit" name="Submit" value="保存" class="button" /></TD>
			</TR>

		</table>
	</form>
</body>
</html>
