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
	var stuArr;
		$(function(){
		
			var now=new Date();
			var nowString=now.toLocaleDateString();
			var arr=nowString.split("/");
			var time="";
			for(var i=0;i<arr.length;i++){
				if(i==0){
				time=arr[i];
				}else{
				time=time+"-"+arr[i];
				}
			}
			$("#borrowDate").val(time);
		
		
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
							eval("stuArr="+arr[1]);
							if(stu==null){
								$("#tbody").html("");
								$("#stuName").val("");
								$("#stuError").html("该学号学生不存在");
							
							}else{
								$("#stuName").val(stu.sname);
								var str="";
								for(var i=0;i<stuArr.length;i++){
									str+="<tr height='30'>";
									str+="<td align='center' >"+stu.sid+"</td>";
									str+="<td align='center' >"+stu.sname+"</td>";
									str+="<td align='center' >"+stuArr[i].bookId+"</td>";
									str+="<td align='center' >"+stuArr[i].bookName+"</td>";
									str+="<td align='center' >"+stuArr[i].borrowDate+"</td>";
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
			$("#bookId").focus(function(){
				$("#bookError").html("");
			})
			$("#bookId").blur(function(){
				var bookId=$("#bookId").val();
				$.ajax({
						url:"servlet/LibraryServlet?method=bookOnblur&bookId="+bookId,
						dataType:"text",
						type:"get",
						success:function(result){
							eval("var book="+result);
							if(book==null){
								$("#bookName").val("");
								$("#writer").val("");
								$("#bookType").val("");
								$("#count").val("");
								$("#price").val("");
								$("#remark").html("");
								$("#bookError").html("该书号图书不存在");
							}else{
								$("#bookName").val(book.bookName);
								$("#writer").val(book.writer);
								$("#bookType").val(book.bookType);
								$("#count").val(book.count);
								$("#price").val(book.price);
								$("#remark").html(book.remark);
								
							}
						},
						error:function(){
						alert("ajax请求失败");
						}
				})
			
			
			})
		})
		
		function clearForm(){
			$("#stuError").html("");
			$("#bookError").html("");
			$("#stuId").val("");
			$("#bookId").val("");
			$("#tbody").html("");
			$("#stuName").val("");
			$("#bookName").val("");
			$("#writer").val("");
			$("#bookType").val("");
			$("#count").val("");
			$("#price").val("");
			$("#remark").html("");
			
		
		}
		function borrowBook(){
			var bookId=$("#bookId").val();
			var bookName=$("#bookName").val();
			var stuId=$("#stuId").val();
			var stuName=$("#stuName").val();
			var borrowDate=$("#borrowDate").val();
			var count=$("#count").val();
			var flag=true;
			if(stuArr.length<5){
				for(var i=0;i<stuArr.length;i++){
					if(bookId==stuArr[i].bookId){
						flag=false;
						break;
					}
				}
				if(flag){
					if(bookName==""||stuName==""||borrowDate==""||bookName==null||stuName==null||borrowDate==null){
						alert("请输入正确信息");
					}else{
						if(count>0){
						location.href="servlet/LibraryServlet?method=borrowBook&bookId="
						+bookId+"&stuId="+stuId+"&borrowDate="+borrowDate;
						}else{
							alert("该书图书馆已经没有库存");
						}
					}
				}else{
					alert("你已经借过该书");
				}
			}else{
				alert("每个学生最多可以借5本书");
			}
		}
		
		
	</script>
	<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
  </head>
  
  <body>
  <form  method="post">
  	<table align="center" style="margin-top: 10px">
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
  			<td >书&nbsp;号：</td>
  			<td >
	  			<input type="text" id="bookId" name="bookId">
	  			<span id="bookError" style="font-size: 10px; color: red;"></span>
  			</td>
  			<td >书&nbsp;名：</td>
  			<td ><input readonly="readonly" type="text" id="bookName"></td>
  		</tr>
  		<tr>
  			<td >作&nbsp;者：</td>
  			<td ><input readonly="readonly" id="writer" type="text"></td>
  			<td >类别名称：</td>
  			<td ><input readonly="readonly" type="text" id="bookType" ></td>
  		</tr>
  		<tr>
  			<td >库存数量：</td>
  			<td ><input readonly="readonly" type="text" id="count" ></td>
  			<td >单&nbsp;价：</td>
  			<td ><input readonly="readonly" type="text" id="price" ></td>
  		</tr>
  		<tr>  
  			<td >操&nbsp;作&nbsp;员：</td>
  			<td ><input readonly="readonly" type="text" value="${user.userName }"></td>
  			<td >借书日期：</td>
  			<td ><input id="borrowDate" type="text" onclick="WdatePicker()"></td>
  		</tr>
  		<tr>
  			<td >图书简介：</td>
  			<td colspan="4" align="left">
  				<textarea readonly="readonly" rows="5" cols="81" name="remark" id="remark"></textarea>
  			</td>
  			
  			
  		</tr>
  		<tr>
  			
  			<td colspan="4" align="center">
  			
  				<input type="button" value="借阅" onclick="borrowBook()">
  				<input type="button" value="重置" onclick="clearForm()">
  			</td>
  		</tr>
  	</table>
  </form>
  	<table align="center" border="1" cellpadding="0" cellspacing="0">
  		<tr>
			<td width=150px; height="30" align="center" bgcolor="#EEEEEE">学号</td>
			<td width=150px; align="center" bgcolor="#EEEEEE">姓名</td>
			<td width=250px; align="center" bgcolor="#EEEEEE">书号</td>
			<td width=250px; align="center" bgcolor="#EEEEEE">书名</td>
			<td width=180px; align="center" bgcolor="#EEEEEE">借阅日期</td>
		</tr>
		<tbody id="tbody"></tbody>
  	</table>
  	
  </body>
</html>
