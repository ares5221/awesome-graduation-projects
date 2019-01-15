<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
		<script type="text/javascript">
			$(function(){
				var courseNo = $("#courseNo").val();
				$.ajax({
					url:"servlet/MajorServlet?method=findCourse&courseNo="+courseNo,
					success:function(result){
						eval("var course ="+result);
						$("#courseName").val(course.coursename);
					},
					error:function(){
						alert("请求失败");
					}
				});
			});	
		</script>

  </head>
  
  <body>
    <form action="servlet/MajorServlet?method=updateCourse" name="fom" id="fom" method="post">
		<table >
 			
    	
			<tr>
			<td>学科编号:</td>
				<td>
					<input value=<%=request.getParameter("courseNo")%> name="courseNo" id="courseNo" type="text" class="text" style="width:154px"  readonly="readonly"  />
				</td>
				</tr>
				<tr>
				<td>学科名称:</td>
					<td>
					<input value="" name="courseName" id="courseName" type="text" class="text" style="width:154px" />
					</td>
				</tr>
				<TR>
						<TD colspan="2" align="center" height="50px">
							<input type="submit" name="Submit" value="保存" class="button"/>
						</TD>
					</TR>
			
			</table>
		</form>
  </body>
</html>
