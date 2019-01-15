<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bookBorrow.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="/school/js/jquery-1.8.2.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#stuId").focus(function(){
				$("#stuError").html("");
			})
			$("#stuId").blur(function(){
				var stuId=$("#stuId").val();
				$.ajax({
						url:"servlet/LibraryServlet?method=stuOnblur&stuId="+stuId,
						dataType:"text",
						type:"get",
						success:function(result){
							var arr=result.split("#");
							eval("var stu="+arr[0]);
							eval("var stuArr="+arr[1]);
							if(stu==null){
								$("#tbody").html("");
								$("#stuName").val("");
								$("#sex0").attr("checked", false);
								$("#sex1").attr("checked", false);
								$("#age").val("");
								$("#birth").val("");
								$("#phone").val("");
								$("#stuError").html("该学号学生不存在");
							
							}else{
								$("#stuName").val(stu.sname);
							
								if(stu.sex==0){
									$("#sex0").attr("checked", true);
								}else{
									$("#sex1").attr("checked", true);
								}
								$("#age").val(stu.age);
								$("#birth").val(stu.birth);
								$("#phone").val(stu.phone);
								var str="";
								for(var i=0;i<stuArr.length;i++){
									str+="<tr height='30'>";
									str+="<td align='center' >"+stu.sid+"</td>";
									str+="<td align='center' >"+stu.sname+"</td>";
									str+="<td align='center' >"+stuArr[i].bookId+"</td>";
									str+="<td align='center' >"+stuArr[i].bookName+"</td>";
									str+="<td align='center' >"+stuArr[i].borrowDate+"</td>";
									str+="<td align='center' ><a href='javascript:bookReturn(\""+stuArr[i].bookId+"\")'>图书归还</a></td>";
									str+="</tr>";
									//str="javascript:bookReturn("/""+stuArr[i].bookId+""/")";
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
		
	
		function bookReturn(bookId){
			var stuId=$("#stuId").val();
			var flag=window.confirm("确认要归还这本书么？");
			if(flag){
				$.ajax({
					url:"servlet/LibraryServlet?method=bookReturn&stuId="+stuId+"&bookId="+bookId,
					dataType:"text",
					type:"get",
					success:function(result){
						var arr=result.split("#");
						eval("var stu="+arr[0]);
						eval("var stuArr="+arr[1]);
						if(stu==null){
							$("#tbody").html("");
							$("#stuName").val("");
							$("#sex0").attr("checked", false);
							$("#sex1").attr("checked", false);
							$("#age").val("");
							$("#birth").val("");
							$("#phone").val("");
							$("#stuError").html("该学号学生不存在");
						
						}else{
							$("#stuName").val(stu.sname);
						
							if(stu.sex==0){
								$("#sex0").attr("checked", true);
							}else{
								$("#sex1").attr("checked", true);
							}
							$("#age").val(stu.age);
							$("#birth").val(stu.birth);
							$("#phone").val(stu.phone);
							var str="";
							for(var i=0;i<stuArr.length;i++){
								str+="<tr height='30'>";
								str+="<td align='center' >"+stu.sid+"</td>";
								str+="<td align='center' >"+stu.sname+"</td>";
								str+="<td align='center' >"+stuArr[i].bookId+"</td>";
								str+="<td align='center' >"+stuArr[i].bookName+"</td>";
								str+="<td align='center' >"+stuArr[i].borrowDate+"</td>";
								str+="<td align='center' ><a href='javascript:bookReturn(\""+stuArr[i].bookId+"\")'>图书归还</a></td>";
								str+="</tr>";
								//str="javascript:bookReturn("/""+stuArr[i].bookId+""/")";
							}
							$("#tbody").html(str);
							alert("还书成功");
						}
						
					},
					error:function(){
					alert("ajax请求失败");
					}
			})
			}else{
				alert("取消还书");
			}
		}
		
		/*
		function bookReturn(bookId){
			var stuId=$("#stuId").val();
			var url="library/bookReturn2.jsp?stuId="+stuId+"&bookId="+bookId;
			var flag=window.confirm("确认要归还这本书么？");
			if(flag){
				window.open(url,"","width=800,height=400,top=100px,left=300px");
			}else{
				alert("取消还书");
			}
		}
		*/
	</script>
	
	<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
  </head>
  <body>
  <form  method="post">
  	<table align="center" style="margin-top: 50px">
  		<tr >
  			
  			<td width="150px">学&nbsp;号：</td>
  			<td width="280px">
  				<input type="text" id="stuId" name="stuId" >
  				<span id="stuError" style="font-size: 10px; color: red;"></span>
  			</td>
  			<td  width="150px">学生姓名：</td>
  			<td><input readonly="readonly" type="text" id="stuName" name="stuName"></td>
  		</tr>
  		<tr>
  			<td>性别:</td>
  			<td >
  				<input type="radio" id="sex0"  name="sex">男
  				<input type="radio" id="sex1" name="sex">女
  			</td>
  			<td>年龄:</td>
  			<td><input readonly="readonly" type="text" id="age" name="age"></td>
  		</tr>
  		<tr>
  			<td>出生日期:</td>
  			<td><input readonly="readonly" type="text" id="birth" name="birth"></td>
  			<td>电话:</td>
  			<td><input readonly="readonly" type="text" id="phone" name="phone"></td>
  		</tr>
  	</table>
  </form>
  
  	<br>
  		<br>
  	<table align="center" border="1" cellpadding="0" cellspacing="0" style="margin-top: 30px">
  		<tr>
			<td width=150px; height="30" align="center" bgcolor="#EEEEEE">学号</td>
			<td width=150px; align="center" bgcolor="#EEEEEE">姓名</td>
			<td width=200px; align="center" bgcolor="#EEEEEE">书号</td>
			<td width=200px; align="center" bgcolor="#EEEEEE">书名</td>
			<td width=180px; align="center" bgcolor="#EEEEEE">借阅日期</td>
			<td width=100px; align="center" bgcolor="#EEEEEE">操作</td>
		</tr>
		<tbody id="tbody"></tbody>
  	</table>
  	
  </body>
</html>
