<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    <base href="<%=basePath%>">
		<title>My JSP 'house_list_add.jsp' starting page</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" >  
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<LINK href="resource/css/admin.css" type=text/css  rel=stylesheet>
		<script type="text/javascript" src="resource/js/CheckForm.js"></script>
		<script type="text/javascript" src="/Estate/js/jquery-1.8.2.js"></script>
		<script type="text/javascript">
			$(function(){
				//页面加载去读取房屋类型以及员工
				$.ajax({
    			url:"servlet/EmployeeServlet?method=findAllEmail",
    			type:"get",
    			dataType:"text",
    			success:function(result){
    				var emparr = JSON.parse(result);
    				
    				var s = "";
    				for(var i = 0;i<emparr.length;i++){
    					s+="<option value='"+emparr[i].user_id+"'>"+emparr[i].user_name+"</option>"
    				
    				}
    				
    					$("#user_id").html(s);
    				}
    			});
    			
    			//发送读取房屋类型的ajax
    			$.ajax({
    			url:"servlet/HouseTypeServlet?method=findAllHouseType",
    			type:"get",
    			dataType:"text",
    			success:function(result){
    				var housetype = JSON.parse(result);
    				
    				var s = "";
    				for(var i = 0;i<housetype.length;i++){
    					s+="<option value='"+housetype[i].type_id+"'>"+housetype[i].type_name+"</option>"
    				
    				}
    				
    					$("#type_id").html(s);
    				}
    			});
    			
		});
		
		</script>
		
		
	</head>

	<body>
		<form action="servlet/HouseInfoServlet?method=add"  name="form2" onsubmit="return checkForm('form2');" method="post" >
			<table class=editTable cellSpacing=1 cellPadding=0 width="100%"
				align=center border=0>
				<tr class=editHeaderTr>
					<td class=editHeaderTd colSpan=7>
						请输入房屋信息
					</td>
				</tr>
				<tr>
					<td width="19%" bgcolor="#FFFDF0">
						<div align="center">
							户型：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<select id = "type_id" name = "type_id">
						
						</select>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td width="19%" bgcolor="#FFFDF0">
						<div align="center">
							管理员工：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<select id = "user_id" name = "user_id">
							
						</select>
					</td>
				</tr>
				<tr>
					<td width="19%" bgcolor="#FFFDF0">
						<div align="center">
							房屋地址：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text"  maxlength="20" name="house_address"  check_str="房屋地址" >
						&nbsp;
					</td>
				</tr>
				<tr>
					<td width="19%" bgcolor="#FFFDF0">
						<div align="center">
							房屋价格(平米)：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text"  maxlength="20" name="house_price"  check_str="房屋价格(平米)" >
						&nbsp;
					</td>
				</tr>
				<tr>
					<td width="19%" bgcolor="#FFFDF0">
						<div align="center">
							房屋环境：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text"  maxlength="20" name="house_ambient"  check_str="房屋环境" >
						&nbsp;
					</td>
				</tr>
				

			</table>
			<table class=editTable cellSpacing=1 cellPadding=0 width="100%"
				align=center border=0>
				<tr bgcolor="#ECF3FD">
					<td width="10%"></td>
					<td width="10%"><input type="submit" name="submit"  value="提交"></td>
					<td width="5%"><input type="button" name="button"  onClick="history.back() "  value="返回"></td>
					<td width="75%"></td>
				</tr>
			</table>

		</form>
	</body>
</html>
