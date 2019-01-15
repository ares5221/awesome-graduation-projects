<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    

    <title>增加客户信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<LINK href="resource/css/admin.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="resource/js/CheckForm.js"></script>
	<script type="text/javascript" src="resource/js/My97DatePicker/WdatePicker.js"></script>
	<script language="JavaScript" type="text/javascript" src="resource/js/FormValid.js"></script>


  </head>
  
  <body>
<form action="servlet/CustomerServlet?method=addCus"  name="form1" onsubmit="return validator(this)" method="post" >
<table class=editTable cellSpacing=1 cellPadding=0 width="100%" align=center border=0>
	<tr class=editHeaderTr>
		<td class=editHeaderTd colSpan=7>  请输入客户信息</td>
	</tr>  
    <tr>
	  
	  	<td bgcolor="#FFFDF0"><div align="center">客户姓名：</div></td>
		<td colspan="3" bgcolor="#FFFFFF"><input type="text"   maxlength="10"  style=" width: 145px" valid="required"  errmsg="客户姓名不能为空!" name="customer_name"></td>
	 	 <td width="13%" bgcolor="#FFFDF0"><div align="center">客户来源：</div></td>
		<td width="33%" colspan="3" bgcolor="#FFFFFF">
			<select name="source_name" style=" width: 145px">
				<option selected="selected" value="0">==请选择==</option>
				  <c:forEach items="${customerList1 }" var="custS">
					<option value="${custS.source_name }">${custS.source_name }</option>
				</c:forEach>
			</select>	  
		</td>
    </tr>
	
    <tr>
		<td bgcolor="#FFFDF0"><div align="center">客户职位：</div></td>
		<td colspan="3" bgcolor="#FFFFFF"><input type="text"   maxlength="20" style=" width: 145px" name="customer_position"></td>
		<td bgcolor="#FFFDF0"><div align="center">客户类型：</div></td>
		<td colspan="3" bgcolor="#FFFFFF">
			<select name="type_name" style=" width: 145px">
				<option selected="selected" value="0">==请选择==</option>
				  <c:forEach items="${customerList2 }" var="custT">
					<option value="${custT.type_name }">${custT.type_name }</option>
				</c:forEach>
			</select>		
		</td>
    </tr>
	<tr>
		<td bgcolor="#FFFDF0"><div align="center">客户性别：</div></td>
		<td colspan="3" bgcolor="#FFFFFF">
			<input type="radio" name="customer_gender" value="男"  checked="checked" />男&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="customer_gender" value="女"  />女<br/>		</td>
		<td bgcolor="#FFFDF0"><div align="center">Email：</div></td>
		<td colspan="3" bgcolor="#FFFFFF"><input style=" width: 145px"  maxlength="50"  type="text" name="customer_mail"   valid="required|isEmail"  errmsg="Email不能为空|Email格式不对!"></td>
    </tr>
	
	<tr>
		<td bgcolor="#FFFDF0"><div align="center">出生日期：</div></td>
		<td colspan="3" bgcolor="#FFFFFF"><input type="text" name="customer_date"  style=" width: 145px"    valid="required"  errmsg="出生日期不能为空!" readonly="readonly" id="customerBirthday"  onclick="WdatePicker({el:customerBirthday,dateFmt:'yyyy-MM-dd HH:mm:ss '})"/>		</td>
		<td bgcolor="#FFFDF0"><div align="center">客户状态：</div></td>
		<td colspan="3" bgcolor="#FFFFFF">
			<select name="customer_state2" style=" width: 145px">
				<option selected="selected" value="0">==请选择==</option>
				  <c:forEach items="${customerList3 }" var="custC">
					<option value="${custC.condition_Name }">${custC.condition_Name }</option>
				 </c:forEach>

			</select>		
		</td>
    </tr>
	
    <tr>
		<td bgcolor="#FFFDF0"><div align="center"    >客户手机：</div></td>
		<td colspan="3" bgcolor="#FFFFFF"><input type="text"   valid="regexp"  regexp="^1[3|4|5|8][0-9]\d{8}$"   errmsg="请输入正确的手机号码!"  style=" width: 145px"    name="customer_tel"></td>
		<td bgcolor="#FFFDF0"><div align="center">客户QQ：</div></td>
		<td colspan="3" bgcolor="#FFFFFF"><input type="text"      valid="isQQ"   errmsg="请输入正确的QQ号码!"  style=" width: 145px" name="customer_qq"></td>
    </tr>
  
	<tr>
		<td bgcolor="#FFFDF0"><div align="center">客户地址：</div></td>
		<td colspan="3" bgcolor="#FFFFFF"><input type="text"  maxlength="50"  style=" width: 145px" name="customer_address"></td>
		<td bgcolor="#FFFDF0"><div align="center">修改人：</div></td>
		<td colspan="3" bgcolor="#FFFFFF"><input type="text"  maxlength="10"  style=" width: 145px" name="customer_revisePeople"></td>
    </tr>

    <tr>
		<td bgcolor="#FFFDF0"><div align="center">创建人：</div></td>
		<td colspan="3" bgcolor="#FFFFFF"><input type="text"  maxlength="10"  style=" width: 145px" valid="required"  errmsg="创建人不能为空!"  name="customer_createPeople"></td>
		<td bgcolor="#FFFDF0"><div align="center">客户微博：</div></td>
		<td colspan="3" bgcolor="#FFFFFF"><input type="text"  maxlength="50"  style=" width: 145px"  name="customer_blog"></td>
    </tr>

	<tr>
		<td bgcolor="#FFFDF0"><div align="center">客户座机：</div></td>
		<td colspan="3" bgcolor="#FFFFFF"><input type="text"   valid="isPhone"   errmsg="请输入正确的座机号码!"   style=" width: 145px" name="customer_mtel"></td>
		<td bgcolor="#FFFDF0"><div align="center">客户MSN：</div></td>
		<td colspan="3" bgcolor="#FFFFFF"><input type="text"    maxlength="50" style=" width: 145px" name="customer_msn"></td>
    </tr>
  
	<tr>
		<td bgcolor="#FFFDF0"><div align="center">客户公司：</div></td>
		<td colspan="5" bgcolor="#FFFFFF"><input type="text"  maxlength="50"  style=" width: 145px" name="customer_company">
		<input type="hidden"    value="<%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>"  name="customerAddTime" >
		<input type="hidden"    value="<%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>"  name="customerChangeTime" >		</td>
		
    </tr>
    
	<tr>
		<td bgcolor="#FFFDF0"><div align="center">备注：</div></td>
		<td colspan="5" bgcolor="#FFFFFF"><textarea rows="10" name="customer_remark" style="width:100%; resize:none; "  ></textarea></td>
	</tr>
 </table>

<table class=editTable cellSpacing=1 cellPadding=0 width="100%" align=center border=0>
	<tr bgcolor="#ECF3FD">
					<td width="25%"></td>
					<td width="17%"><input type="submit" name="submit"  value="添加"></td>
					<td width="17%"><input type="reset" name="reset"  value="重置"></td>
					<td width="4%"><input type="button" name="button"  onClick="history.back() "  value="返回"></td>
					<td width="43%"></td>
	</tr>
</table>
</form>
  </body>
</html>
