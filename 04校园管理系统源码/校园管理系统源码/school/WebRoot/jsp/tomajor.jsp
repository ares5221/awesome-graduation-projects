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
				var mNo = $("#mNo").val();
				$.ajax({
					url:"servlet/MajorServlet?method=findMajor&mNo="+mNo,
					success:function(result){
						eval("var major ="+result);
						$("#mName").val(major.mname);
					},
					error:function(){
						alert("请求失败");
					}
				});
			});	
		</script>

  </head>
  
  <body>
    <form action="servlet/MajorServlet?method=updateMajor" name="fom" id="fom" method="post">
		<table >
 			
    	
			<tr>
			<td>专业编号:</td>
				<td>
					<input value=<%=request.getParameter("mNo")%> id="mNo" name="mNo" type="text" class="text" style="width:154px"  readonly="readonly"  />
				</td>
				</tr>
				<tr>
				<td>专业名称:</td>
					<td>
					<input value="" name="mName" id="mName" type="text" class="text" style="width:154px" />
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
