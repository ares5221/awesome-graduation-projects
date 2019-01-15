<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

		<title>修改员工信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<LINK href="resource/css/admin.css" type=text/css
			rel=stylesheet>
			<script type="text/javascript"
			src="resource/js/CheckForm.js"></script>
		<script type="text/javascript"
			src="resource/js/My97DatePicker/WdatePicker.js"></script>
			<script language="JavaScript" type="text/javascript" src="resource/js/FormValid.js"></script>
	
	<script type="text/javascript" src = "/Estate/js/jquery-1.8.2.js"></script>
	<script type="text/javascript">
			$(function(){
			
				//加载员工信息
			
				//页面加载成功发送ajax请求
				$.ajax({
					url:"servlet/AdminServlet?method=to_getAllDept",
					type:"get",
					dataType:"text",
					success:function(result){
						var deptarr = JSON.parse(result);
						var str = "";
						for(var i = 0;i<deptarr.length;i++){
							str+="<option value='"+deptarr[i].department_id+"'>"+deptarr[i].department_name+"</option>";
						}
						$("#department_id").html(str);
					},
					error:function(){
						alert("获取部门信息失败");
					}
				});
				
				$.ajax({
					url:"servlet/AdminServlet?method=to_getAllRole",
					type:"get",
					dataType:"text",
					success:function(result){
							var rolearr = JSON.parse(result);
						var str = "";
						for(var i = 0;i<rolearr.length;i++){
							str+="<option value='"+rolearr[i].role_id+"'>"+rolearr[i].role_name+"</option>";
						}
						$("#role_id").html(str);
					},
					error:function(){
						alert("获取角色信息失败");
					}
				});
				
				
			});
		</script>
	
	
	
	</head>

	<body>
		<form action="servlet/EmployeeServlet?method=upDate" method="post" name="form2" onsubmit="return validator(this)" 
>
			
			<table class=editTable cellSpacing=1 cellPadding=0 width="100%"
				align=center border=0>
				<tr class=editHeaderTr>
					<td class=editHeaderTd colSpan=7>
						请修改用户的详细信息
						<input type="hidden" name="user_id" 
							>
					</td>
				</tr>

				<tr>
					<td bgcolor="#FFFDF0">
						<div align="center">
							姓名：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style="width: 145px" name="user_name"  value="${requestScope.ui.user_name }"
							>
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							年龄：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text"  style="width: 145px" name="user_age" maxlength="2"  valid="required|isNumber"  errmsg="员工年龄不能为空!|请输入正确的年龄!" value="${requestScope.ui.user_age }">
						&nbsp;
					</td>
				</tr>

				<tr>
					<td bgcolor="#FFFDF0" style="height: 21px">
						<div align="center">
							性别：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF" style="height: 21px">
						<input type="radio" name="user_sex"
							 checked="checked"
							 value="男" />
						男
						<input type="radio" name="user_sex"
							 value="女" />
						女
						<br />
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							民族：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text"  style="width: 145px" name="user_nation"
							value="${requestScope.ui.user_nation }">
						&nbsp;
					</td>
				</tr>

				<tr>
					<td bgcolor="#FFFDF0">
						<div align="center">
							学历：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<select name="user_diploma" style="width: 145px">
							<option >
								初中
							</option>
							>
							<option>
								高中
							</option>
							<option 
								selected="selected" >
								本科
							</option>
							<option >
								博士
							</option>
							<option >
								硕士
							</option>
						</select>
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							婚姻：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<select name="is_married" style="width: 145px">
							<option 
								selected="selected" >
								已婚
							</option>
							<option >
								未婚
							</option>
							<option >
								离异
							</option>
						</select>
						&nbsp;
					</td>
				</tr>


				<tr>
					<td bgcolor="#FFFDF0">
						<div align="center">
							部门：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<select name="department_id" style="width: 145px">
							
							<option value="1"
								
								selected="selected" >财务部</option>
							
							<option value="3"
								>销售部</option>
							
						</select>
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							角色：
						</div>
					</td>

					<td colspan="3" bgcolor="#FFFFFF">
						<select name="role_id"   style="width: 145px">

							
							<option value="1"
								
								selected="selected" >管理员</option>
							
							<option value="2"
								>员工</option>
							
							<option value="3"
								>老板</option>
							
						</select>
					</td>

	
				<tr>
					<td bgcolor="#FFFDF0">
						<div align="center">
							座机：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text"  style="width: 145px"     valid="is_phone"   errmsg="请输入正确的座机号码!" name="userTel" value="${requestScope.ui.user_tel }">
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							爱好：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text"  style="width: 145px"  maxlength="50"  name="user_intest"
							value="${requestScope.ui.user_intest }">
						&nbsp;
					</td>
				</tr>
			
				<tr>
					<td bgcolor="#FFFDF0">
						<div align="center">
							工资卡号：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style="width: 145px"  valid="isNumber"   errmsg="请输入正确的工资卡号!"  maxlength="20"   name="user_bankcard"
							value="${requestScope.ui.user_bankcard }">
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							手机：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text"  style="width: 145px" valid="regexp"  regexp="^1[3|4|5|8][0-9]\d{8}$"   errmsg="请输入正确的手机号码!" name="user_mobile"
							value="${requestScope.ui.user_mobile }">
						&nbsp;
					</td>

				</tr>

				<tr>
					<td bgcolor="#FFFDF0">
						<div align="center">
							身份证：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text"  style="width: 145px"  valid="isIdCard"   errmsg="请输入正确的身份证号码!" name="user_idnum" value="${requestScope.ui.user_idnum }">
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							添加时间：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text"  style="width: 145px" name="user_addtime"
							 value="${requestScope.ui.user_addtime }">
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFDF0">
						<div align="center">
							添加人：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text"  style="width: 145px"  maxlength="10" name="user_addman"
							 value="${requestScope.ui.user_addman }">
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							修改人：
						</div>
						<input type="hidden"   value="2017-06-15 11:33:59" name="userChangeTime">
					
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" name="user_changeman"
							style="width: 145px"    maxlength="20"value="${requestScope.ui.user_changeman }">
						&nbsp;
					</td>
				</tr>

				<tr>

					<td bgcolor="#FFFDF0">
						<div align="center">
							E_mail：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style="width: 145px"  maxlength="50" name="user_email" value="${requestScope.ui.user_email }">
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							地址：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style="width: 145px"  maxlength="50"  name="user_address"
							value="${requestScope.ui.user_address }">
						&nbsp;
					</td>
				</tr>

			</table>
			<table class=editTable cellSpacing=1 cellPadding=0 width="100%"
				align=center border=0>
				<tr bgcolor="#ECF3FD">
					<td width="36%"></td>
					<td width="17%"><input type="submit" name="submit"  value="提交"></td>
					<td width="4%"><input type="button" name="button"  onClick="history.back() "  value="返回"></td>
					<td width="43%"></td>
				</tr>
			</table>
			${error }
		</form>

	</body>
</html>
