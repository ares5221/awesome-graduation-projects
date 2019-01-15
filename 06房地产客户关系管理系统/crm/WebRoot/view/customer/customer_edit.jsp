<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    

		<title>修改客户信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<LINK href="http://localhost:9090/crm/resource/css/admin.css" type=text/css
			rel=stylesheet>
		<script type="text/javascript"
			src="http://localhost:9090/crm/resource/js/CheckForm.js"></script>
		<script type="text/javascript"
			src="http://localhost:9090/crm/resource/js/My97DatePicker/WdatePicker.js"></script>
<script language="JavaScript" type="text/javascript" src="http://localhost:9090/crm/resource/js/FormValid.js"></script>
	</head>

	<body>
		<form action="servlet/CustomerServlet?method=updateCus&customer_ID=${cus.customer_ID}"
			method="post" name="form2"  >
			

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
		<td colspan="3" bgcolor="#FFFFFF"><select     name="customer_emp" style=" width: 145px">
			
					
			<option    value="1"selected="selected" >张三</option>
					
			<option    value="2">蒋元征</option>
					
			<option    value="3">黄建新</option>
					
			<option    value="4">王五</option>
					
			<option    value="5">孙悟空</option>
					
			<option    value="6">猪八戒</option>
			
			</select>		</td>
					<td width="12%" bgcolor="#FFFDF0">
						<div align="center">
							客户来源：
						</div>
					</td>
					<td width="37%" colspan="3" bgcolor="#FFFFFF">
						<select name="source_name" style="width: 145px">
							<c:forEach items="${customerList1 }" var="custS">
							<c:if test="${custS.source_name != cus.source_name }">
								<option value="${custS.source_name }">${custS.source_name }</option>
							</c:if>
							<c:if test="${custS.source_name == cus.source_name }">
								<option value="${custS.source_name }" selected="selected">${custS.source_name }</option>
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
						<input type="text" style=" width: 145px"   name="customer_name"
							value="${cus.customer_name }">
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							客户状态：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<select name="customer_state2" style="width: 145px">
							<c:forEach items="${customerList3 }" var="custC">
							<c:if test="${custC.condition_Name != cus.condition_Name }">
								<option value="${custC.condition_Name }">${custC.condition_Name }</option>
							</c:if>
							<c:if test="${custC.condition_Name == cus.condition_Name }">
								<option value="${custC.condition_Name }" selected="selected">${custC.condition_Name }</option>
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
						<c:if test="${cus.customer_gender != '男'}">
						    <input type="radio" name="customer_gender" value="男"/>男
						</c:if>
						<c:if test="${cus.customer_gender == '男'}">
							<input type="radio" name="customer_gender" value="男" checked="checked"/>男
						</c:if>														
						<c:if test="${cus.customer_gender != '女'}">
						    <input type="radio" name="customer_gender" value="女"/>女
						</c:if>
						<c:if test="${cus.customer_gender == '女'}">
							<input type="radio" name="customer_gender" value="女" checked="checked"/>女
						</c:if>					
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							客户类型：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<select name="customerType" style="width: 145px">
							<c:forEach items="${customerList2 }" var="custT">
							<c:if test="${custT.type_name != cus.type_name }">
								<option value="${custT.type_name }">${custT.type_name }</option>
							</c:if>
							<c:if test="${custT.type_name == cus.type_name }">
								<option value="${custT.type_name }" selected="selected">${custT.type_name }</option>
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
						<input type="text"style=" width: 145px" name="customer_date"
							value="${cus.customer_date }"
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
						<input type="text" style=" width: 145px"    valid="regexp"  regexp="^1[3|4|5|8][0-9]\d{8}$"   errmsg="请输入正确的手机号码!"   name="customer_tel"
							value="${cus.customer_tel }">
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
							value="${cus.customer_qq }">
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							客户地址：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style=" width: 145px"  maxlength="50" name="customer_address"
							value="${cus.customer_address }">
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
						<input type="text" style=" width: 145px"  maxlength="50" name="customer_mail"  valid="required|isEmail"  errmsg="Email不能为空|Email格式不对!" value="${cus.customer_mail }">
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							客户职位：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style=" width: 145px"  maxlength="50" name="customer_position"
							value="${cus.customer_position }">
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
							value="${cus.customer_blog }">
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							客户座机：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style=" width: 145px" valid="isPhone"   errmsg="请输入正确的座机号码!" name="customer_mtel"
							value="${cus.customer_mtel }">
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
							value="${cus.customer_msn }">
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							客户公司：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style=" width: 145px"  maxlength="50" name="customer_company"
							value="${cus.customer_company }">
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
						<input type="text" style=" width: 145px" name="customer_createPeople"
							value="${cus.customer_createPeople }">
						<input type="hidden"
							value="2017-06-15 10:10:30"
							name="customerChangeTime">
						<input type="hidden" name="customerAddTime"
							value="2013-05-23 23:08:52.0"
							readonly="readonly" id="customerAddTime">
					</td>
					<td bgcolor="#FFFDF0">
						<div align="center">
							修改人：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style=" width: 145px"  maxlength="50" name="customer_revisePeople"
							value="${cus.customer_revisePeople }">
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
						<textarea rows="10" name="customer_remark" style="width: 100%; resize: none;">${cus.customer_remark }</textarea>
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

