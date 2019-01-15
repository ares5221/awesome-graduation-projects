<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'borrowSelect.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="/school/js/jquery-1.8.2.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#submit").click(function(){
				var select=$("#select").val();
				var text=$("#text").val();
				$.ajax({
						url:"servlet/LibraryServlet?method=showBorrowBook&select="+select+"&text="+text,
						dataType:"text",
						type:"get",
						success:function(result){
							eval("var stuArr="+result);
							var str="";
							if(stuArr==""){
								alert("该查询条件没有借阅信息");
							}else{
								for(var i=0;i<stuArr.length;i++){
								str+="<tr height='30'>";
								str+="<td align='center' >"+stuArr[i].sId+"</td>";
								str+="<td align='center' >"+stuArr[i].bookId+"</td>";
								str+="<td align='center' >"+stuArr[i].bookName+"</td>";
								str+="<td align='center' >"+stuArr[i].price+"</td>";
								str+="<td align='center' >"+stuArr[i].borrowDate+"</td>";
								str+="<td align='center' >"+stuArr[i].operator+"</td>";
								str+="</tr>";
								}
								$("#tbody").html(str);
							}
						},
						error:function(){
							alert("ajax请求失败");
						}
				})
			
			})
			
			
		})
		function dateFormate(){
			var select=$("#select").val();
			if("borrowDate"==select){
				WdatePicker();
			}
		}
	
	</script>
  </head>
  
  <body>
    <form name="form" id="form" method="post">
		<table  align="center" style="margin-top: 30px">
			<tr>
				<td align="right">请选择查询条件：</td>
				<td>
					<select name="select" id="select">
						<option value="stuId">学号</option>
						<option value="bookId">书号</option>
						<option value="borrowDate" >借阅日期</option>
					</select>&emsp;
				</td>
				<td>
					<input type="text" id="text" onfocus="dateFormate()">&emsp;
				</td>
				<td>
					<input name="submit" id="submit" type="button" value="查 询"/>
				</td>
			</tr>
		</table>
	</form>
	<table align="center" border="1" cellpadding="0" cellspacing="0" style="margin-top: 30px">
	  	<tr>
			<td width=130px; height="30" id="sId" align="center" bgcolor="#EEEEEE">学号</td>
			<td width=180px; align="center" id="bookId" bgcolor="#EEEEEE">书号</td>
			<td width=180px; align="center" id="bookName" bgcolor="#EEEEEE">书名</td>
			<td width=180px; align="center" id="price" bgcolor="#EEEEEE">单价</td>
			<td width=160px; align="center" id="borrowDate" bgcolor="#EEEEEE">借阅日期</td>
			<td width=100px; align="center" id="operator" bgcolor="#EEEEEE">操作员</td>
		</tr>
		<tbody id="tbody"></tbody>
  	</table>
  </body>
</html>
