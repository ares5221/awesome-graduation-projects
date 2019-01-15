<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    <base href="<%=basePath%>">
		<title>My JSP 'notice_list_add.jsp' starting page</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" >  
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<LINK href="resource/css/admin.css" type=text/css  rel=stylesheet>
		<script type="text/javascript" src="resource/js/CheckForm.js"></script>
		
		<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="/Estate/js/jquery-1.8.2.js"></script>
		<script type="text/javascript">
		
			$(function(){
    		//页面加载完成后请求数据获取所有的员工信息加载早下拉列表中
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
    				
    				$("#userselect").html(s);
    			}
    		});
    	});
		
		</script>
		
	</head>

	<body>
		<form action="servlet/NoticeServlet?method=addNotice"  name="form2" onsubmit="return checkForm('form2');" method="post" >
			<table class=editTable cellSpacing=1 cellPadding=0 width="100%"
				align=center border=0>
				<tr class=editHeaderTr>
					<td class=editHeaderTd colSpan=7>
						请输入公告信息
					</td>
				</tr>
				<tr>
					<td width="19%" bgcolor="#FFFDF0">
						<div align="center">
							公告人：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<select name = "user_id" id = "userselect">
						
						
						</select>
						<!-- <input type="text"  maxlength="20" name="user_id"  check_str="公告人" >
						&nbsp; -->
					</td>
				</tr>
				<tr>
					<td width="19%" bgcolor="#FFFDF0">
						<div align="center">
							公告主题：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text"  maxlength="20" name="notice_item"  check_str="公告主题" >
						&nbsp;
					</td>
				</tr>
				<tr>
					<td width="19%" bgcolor="#FFFDF0">
						<div align="center">
							公告内容：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text"  maxlength="20" name="notice_content"  check_str="公告内容" >
						&nbsp;
					</td>
				</tr>
				<tr>
					<td width="19%" bgcolor="#FFFDF0">
						<div align="center">
							公告时间：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text"  maxlength="20" name="notice_time" onfocus = "WdatePicker()"  check_str="公告时间" >
						&nbsp;
					</td>
				</tr>
				<tr>
					<td width="19%" bgcolor="#FFFDF0">
						<div align="center">
							公告截止时间：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text"  maxlength="20" name="notice_endtime" onfocus = "WdatePicker()"  check_str="公告截止时间" >
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
			${success}
			${failed}
		</form>
	</body>
</html>
