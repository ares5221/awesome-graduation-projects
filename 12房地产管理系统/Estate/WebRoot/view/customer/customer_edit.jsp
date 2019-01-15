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

		<title>修改客户信息</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" >  
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
	</head>

	<body>
		<form action="servlet/CustomerServlet?method=update&customer_id=${ customer.customer_id}"
			method="post" name="form2" onsubmit="return validator(this)" >
			

			<table class=editTable cellSpacing=1 cellPadding=0 width="100%"
				align=center border=0>
				<tr class=editHeaderTr>
					<td class=editHeaderTd colSpan=7>
						请修改客户信息
						<input type="hidden" name="customerId"
							value="3" />
					</td>
				</tr>
				<tr>
					<td width="12%" bgcolor="#FFFDF0"><div align="center">负责员工：</div></td>
				<td colspan="3" bgcolor="#FFFFFF">
					<select  name="user_id" style=" width: 145px">
						<c:forEach  items="${userList }" var="user">
							<c:if test="${user.user_id==customer.userInfo.user_id }">
								<option  value="${user.user_id }" selected="selected" >${user.user_name }</option>
							</c:if>
							<c:if test="${user.user_id!=customer.userInfo.user_id }">
								<option  value="${user.user_id }" >${user.user_name }</option>
							</c:if>
						</c:forEach>
					</select>		
				</td>
					<td width="12%" bgcolor="#FFFDF0">
						<div align="center">
							客户来源：
						</div>
					</td>
					<td width="37%" colspan="3" bgcolor="#FFFFFF">
						<select name="source_id" style="width: 145px">
							<c:forEach  items="${cusSouList }" var="sourse">
								<c:if test="${sourse.source_id==customer.customerSource.source_id }">
									<option  value="${sourse.source_id }" selected="selected" >${sourse.source_name }</option>
								</c:if>
								<c:if test="${sourse.source_id!=customer.customerSource.source_id }">
									<option  value="${sourse.source_id }" >${sourse.source_name }</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFDF0">
						<div align="center">
							客户姓名：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style=" width: 145px" disabled="disabled"   name="customer_name"
							value=${customer.customer_name }>
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							客户状态：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<select name="condition_id" style="width: 145px">
							<c:forEach  items="${cusConList }" var="condition">
								<c:if test="${condition.condition_id==customer.customerCondition.condition_id }">
									<option  value="${condition.condition_id }" selected="selected" >${condition.condition_name }</option>
								</c:if>
								<c:if test="${condition.condition_id!=customer.customerCondition.condition_id }">
									<option  value="${condition.condition_id }" >${condition.condition_name }</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFDF0">
						<div align="center">
							客户性别：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<c:if test="${customer.customer_sex=='男'}">
							<input class="text" name="customer_sex" type="radio" value="男" checked/>男&nbsp;&nbsp;&nbsp;&nbsp;
							<input class="text" name="customer_sex" type="radio" value="女" />女
						</c:if>
						<c:if test="${customer.customer_sex=='女'}">
							<input class="text" name="customer_sex" type="radio" value="男" />男&nbsp;&nbsp;&nbsp;&nbsp;
							<input class="text" name="customer_sex" type="radio" value="女" checked/>女
						</c:if>
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							客户类型：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<select name="type_id" style="width: 145px">
							<c:forEach  items="${cusTypeList }" var="type">
								<c:if test="${type.typeId==customer.customerType.typeId }">
									<option  value="${type.typeId }" selected="selected" >${type.typeName }</option>
								</c:if>
								<c:if test="${type.typeId!=customer.customerType.typeId }">
									<option  value="${type.typeId }" >${type.typeName }</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>

				<tr>
					<td bgcolor="#FFFDF0">
						<div align="center">
							出生日期：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text"style=" width: 145px"  disabled="disabled" name="birth_day"
							value="${customer.birth_day }"
							readonly="readonly" id="customerBirthday"
							onclick="WdatePicker({el:customerBirthday,dateFmt:'yyyy-MM-dd HH:mm:ss '})">
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							客户手机：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style=" width: 145px"    valid="regexp"  regexp="^1[3|4|5|8][0-9]\d{8}$"   errmsg="请输入正确的手机号码!"   name="customer_mobile"
							value="${customer.customer_mobile }">
						&nbsp;
					</td>
				</tr>

				<tr>
					<td bgcolor="#FFFDF0">
						<div align="center">
							客户QQ：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style=" width: 145px"   valid="isQQ"   errmsg="请输入正确的QQ号码!"  name="customer_qq"
							value="${customer.customer_qq }">
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							客户地址：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style=" width: 145px"  maxlength="50" name="customer_address"
							value="${customer.customer_address }">
						&nbsp;
					</td>
				</tr>

				<tr>
					<td bgcolor="#FFFDF0">
						<div align="center">
							客户邮箱：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style=" width: 145px"  maxlength="50" name="customer_email"  valid="required|isEmail"  errmsg="Email不能为空|Email格式不对!" value="${customer.customer_email}">
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							客户职位：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style=" width: 145px"  maxlength="50" name="customer_job"
							value="${customer.customer_job }">
						&nbsp;
					</td>
				</tr>

				<tr>
					<td bgcolor="#FFFDF0">
						<div align="center">
							客户微博：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style=" width: 145px" maxlength="50"  name="customer_blog"
							value="${customer.customer_blog }">
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							客户座机：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style=" width: 145px" errmsg="请输入正确的座机号码!" name="customer_tel"
							value="${customer.customer_tel }">
						&nbsp;
					</td>
				</tr>

				<tr>
					<td bgcolor="#FFFDF0">
						<div align="center">
							客户MSN：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style=" width: 145px" maxlength="50"  name="customer_msn"
							value="${customer.customer_msn }">
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							客户公司：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style=" width: 145px"  maxlength="50" name="customer_company"
							value="${customer.customer_company }">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFDF0">
						<div align="center">
							创建人：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style=" width: 145px" disabled="disabled" name="customerAddMan"
							value="${customer.customer_addman }">
						<input type="hidden"
							value="${customer.customer_changetime }"
							name="customerChangeTime">
						<input type="hidden" name="customerAddTime"
							value="${customer.customer_addtime }"
							readonly="readonly" id="customerAddTime">
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							修改人：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style=" width: 145px"  maxlength="50" name="change_man"
							value="${customer.change_man }">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFDF0">
						<div align="center">
							备注：
						</div>
					</td>
					<td colspan="6" bgcolor="#FFFFFF">
						<textarea rows="10" name="customer_remark"
							style="width: 100%; resize: none;">
						${customer.customer_remark }
		
		</textarea>
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
		</form>
	</body>
</html>    
