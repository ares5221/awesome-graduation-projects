<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    <base href="<%=basePath%>">
    
		

		<title>关怀修改</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" >  
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<LINK href="resource/css/admin.css" type=text/css
			rel=stylesheet>
		<script type="text/javascript" src="resource/js/CheckForm.js"></script>
		
		<script type="text/javascript" src = "/Estate/js/jquery-1.8.2.js"></script>
		<script type="text/javascript">
		var cc;
			$(function(){
				//获取索要编辑的关怀信息
				$.ajax({
					url:"servlet/CustomerCareServlet?method=findById&care_id=${param.care_id}",
					type:"get",
					dateType:"text",
					async: false,
					success:function(result){
						
						 cc = JSON.parse(result);
						$("#careTheme").val(cc.careTheme);
						$("#careTime").val(cc.careTime);
						$("#careNexttime").val(cc.careNexttime);
						$("#carePeople").val(cc.carePeople);
						$("#careRemark").html(cc.careRemark);
						
						$("#careId").val(cc.careId);
					},
					error:function(){
						alert("加载客户信息失败");
					}
					
				});
				
				
				
			
				//ajax请求所有客户信息用于填充下拉列表,当相等时选着
				$.ajax({
				
					url:"servlet/CustomerCareServlet?method=findAllCustomer",
					type:"get",
					dateType:"text",
					success:function(result){
						
						var cusarr = JSON.parse(result);
						var str = "";
						for(var i = 0;i<cusarr.length;i++){
							if(cusarr[i].customer_id==cc.customerId){
								str+="<option value='"+cusarr[i].customer_id+"' selected='selected'>"+cusarr[i].customer_name+"</option>"
							}else{
								str+="<option value='"+cusarr[i].customer_id+"'>"+cusarr[i].customer_name+"</option>"
							}
							
							
						}
						$("#customer").html(str);
					},
					error:function(){
						alert("加载客户信息失败");
					}
				});
			});
			function goback(){
				window.location.href="servlet/CustomerCareServlet?method=find";
			}
		</script>
		
		
		
		<style type="text/css">
			.auto-style1 {
				margin-left: 0px;
			}
		</style>

	</head>

	<body>
		<form action="servlet/CustomerCareServlet?method=update"
			method="post" name="form1" onsubmit="return checkForm('form1');">
			
			<table class=editTable cellSpacing=1 cellPadding=0 width="100%"
				align=center border=0>
				<tr class=editHeaderTr>
					<td class=editHeaderTd colSpan=7 style="height: 49px">
						请输入详细信息
						<input type="hidden" name="careId" id = "careId"
							readonly="readonly">
					</td>


				</tr>

				<tr>
					<td width="21%" bgcolor="#FFFDF0" style="width: 9%">
						<div align="center">
							关怀主题：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style="width: 145px"  maxlength="20" name="careTheme" id = "careTheme" check_str="关怀主题"
							 />
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0" style="width: 13%">
						<div align="center">
							关怀对象：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<select name="customerId" id = "customer" style="width: 145px">
						</select>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFDF0" style="width: 13%">
						<div align="center">
							关怀时间：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text"  style="width: 145px"  disabled="disabled" name="careTime" id = "careTime"		>
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0" style="width: 13%">
						<div align="center">
							下次关怀时间：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text"  style="width: 145px" name="careNexttime" id="careNexttime"
							check_str="下次关怀时间"
							readonly="readonly" id="careNexttime"
							onclick="WdatePicker({el:careNexttime,dateFmt:'yyyy-MM-dd HH:mm:ss '})">
						&nbsp;
					</td>
				</tr>

				<tr>
					<td bgcolor="#FFFDF0" style="width: 13%">
						<div align="center">
							是谁关怀的：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text"  style="width: 145px"  maxlength="20" name="carePeople" id="carePeople"
							>
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0" style="width: 13%">
						<div align="center">
							关怀方式：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<select name="careWay" value="送礼品"
							style="width: 145px">
							<option >
								发短信
							</option>
							<option 
								selected="selected" >
								送礼品
							</option>
							<option >
								电话问候
							</option>
							<option >
								上门拜访
							</option>
							<option >

								其他
							</option>
						</select>
						&nbsp;
					</td>
				</tr>

				<tr>
					<td bgcolor="#FFFDF0" style="width: 13%">
						<div align="center">
							关怀备注：
						</div>
					</td>
					<td colspan="7" bgcolor="#FFFFFF">
						<textarea name="careRemark" id = "careRemark" style="width: 100%; resize: none;"
							rows="10"></textarea>
					</td>
				</tr>
			</table>
			<table class=editTable cellSpacing=1 cellPadding=0 width="100%"
				align=center border=0>
				<tr bgcolor="#ECF3FD">
					<td width="40%"></td>
					<td width="10%"><input type="submit" name="submit"  value="提交"></td>
					<td width="5%"><input type="button" name="button"  onClick="goback() "  value="返回"></td>
					<td width="40%"></td>
				</tr>
			</table>

		</form>
		${success }
		${error }
	</body>
</html>
