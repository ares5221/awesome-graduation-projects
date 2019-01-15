<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'scoreList.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="/school/js/jquery-1.8.2.js"></script>
  </head>
  <script type="text/javascript">
  	function clearForm(){
			document.getElementById("select").value="sno";
			document.getElementById("text1").value="";
		}
	$(function(){
		showSco();
	});
	
	function showSco(){
		var select=$("#select").val();
		var text1=$("#text1").val();
		//alert(text1);
		$.ajax({
				url:"servlet/CourseServlet?method=show&select="+select+"&text1="+text1,
				dataType:"text",
				type:"get",
				success:function(result){
					eval("var stuArr="+result);
						var str="";
						for(var i=0;i<stuArr.length;i++){
							str+="<tr height='30'>";
							str+="<td align='center' >"+stuArr[i].examType+"</td>";
							str+="<td align='center' >"+stuArr[i].course.coursename+"</td>";
							//alert(stuArr[i].coursename);
							str+="<td align='center' >"+stuArr[i].sno+"</td>";
							str+="<td align='center' >"+stuArr[i].sname+"</td>";
							str+="<td align='center' >"+stuArr[i].score+"</td>";
							str+="</tr>";
						}
						$("#tbody").html(str);
				},
				error:function(){
					alert("ajax请求失败");
				}
		});
	}
  </script>
  <body>
    <form  name="fom" id="fom" method="post" >
			<table width="100%" border="0" cellspacing="0" cellpadding="0">

				<tr>
					<td height="30">
						<table width="80%" border="0" cellspacing="0" cellpadding="0" align="center">
							<tr>
								<td height="62" background="images/nav04.gif">

									<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td width="24"><img src="images/ico07.gif" width="20" height="18" /></td>
											<td>
												请输入查询条件：<select name="select" id="select">
																<option value="sno" >学生编号</option>
																<option value="sname" >学生姓名</option>
																<option value="coursename" >科目名称</option>
															</select>&emsp;
												<input name="text1" type="text" size="12" id="text1" />
												<input name="submit" id="submit" onclick="showSco()" type="button" value="查 询" />
												<input name="Submit" type="button" class="right-button02" value="清空" onclick="clearForm()"/>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td height="40" class="font42">
												<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

													<tr>
														<td height="20" colspan="15" align="center" bgcolor="#FFFF00" class="tablestyle_title" style="text-align: center;">成绩查询 </td>
													</tr>
													<tr>
														<td width="20%" align="center" bgcolor="#00FF7F" id="examType">考试类型</td>
														<td width="20%" align="center" bgcolor="#00FF7F" id="coursename">科目名称</td>
														<td width="20%" align="center" bgcolor="#00FF7F" id="sno">学生编号</td>
														<td width="20%" align="center" bgcolor="#00FF7F" id="sname">学生姓名</td>
														<td width="20%" align="center" bgcolor="#00FF7F" id="score">成绩</td>
													</tr>
												<tbody id="tbody" bgcolor="#00FFFF"></tbody>
													
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
  </body>
</html>
