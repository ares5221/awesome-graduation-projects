<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.0 transitional//EN">
<html>
	<head>
		<title>注册用户信息</title>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<link href="../../css/style1.css' />" type=text/css rel=stylesheet>
		<link href="../../css/style.css" type="text/css" rel="stylesheet">
		<script type="text/javascript" src="../../js/common.js"></script>
		<script type="text/javascript" src="../../js/base.js"></script>
	</head>
	<body>
		<c:if test="${!empty message}" >
			<script type="text/javascript">
				alert('<c:out value="${message}"/>');
			</script>
			<c:remove var="message" scope="session"/>
		</c:if>
		<center>	
			<table width="80%" border="0" style="margin-top:20px;" align="center" cellpadding="0" cellspacing="0">
  			<tr>
   				<td colspan="3">
					<table cellpadding="0" cellspacing="0" width="100%" height="62">
					<tr>
						<td background="../../images/tab01.gif" width="309" valign="top">
							<div class="tabhead">注册用户信息</div>
						</td>
						<td valign="bottom">
							<table cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td background="../../images/topcenter.gif" width="100%"></td>
									<td><img src="../../images/topright.gif"></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				</td>
 			</tr>
  			<tr >
				<td background="../../images/centerleft.gif"></td>
				<td width="100%" bgColor="#e9e9de" >
					<html:form onsubmit="return validateModifyForm(this);" action="/modifyUserInfo.do" method="post" enctype="multipart/form-data">
      <TABLE style="MARGIN: 5px 0px" cellSpacing=0 cellPadding=0 width="100%" 
      align=center border=0>
        <TBODY>
        <TR>
          <TD align=middle colSpan=3><FONT size=3>请填写个人资料：（注意带有<FONT 
            color=#ff0000>*</FONT>的项目必须填写）</FONT> </TD></TR>
        <TR>
          <TD width="20%">
            <DIV align=right>用户名： </DIV></TD>
          <TD width="35%"><INPUT type="text" maxLength=14 size=30 name="nickName" disabled="disabled" value="${user.nickname}"> </TD>
          <TD width="45%"></TD></TR>
         
        <TR>
          <TD width="20%">
            <DIV align=right><FONT color=#ff0000>*</FONT> 新密码： </DIV></TD>
          <TD width="35%"><INPUT type="password" maxLength=14 size=30 
            name="newPasswd"> </TD>
          <TD width="45%"><FONT 
            color=#ff0000>密码可使用长度为6-14的任何字符，并区分英文字母大小写</FONT> </TD></TR>
        <TR>
          <TD width="20%">
            <DIV align=right><FONT color=#ff0000>*</FONT>新密码确认： </DIV></TD>
          <TD width="35%"><INPUT type="password" maxLength=14 size=30 
            name="newPasswdre"> </TD>
          <TD width="45%"><FONT color=#ff0000>请再输入一次密码</FONT> </TD></TR>
        <TR>
          <TD width="20%">
            <DIV align=right>真实姓名： </DIV></TD>
          <TD width="35%"><INPUT type="text" maxLength=30 size=30 name="name" disabled="disabled" value="${user.name}"> </TD>
          <TD width="45%"></TD></TR>
          <TR>
          <TD width="20%">
            <DIV align=right>身份证号： </DIV></TD>
          <TD width="35%"><INPUT type="text" size=30 name="identitycar" disabled="disabled" value="${user.identitycard}"> </TD>
          <TD width="45%"></TD></TR>
        <TR>
          <TD width="20%">
            <DIV align=right><FONT color=#ff0000>*</FONT> 密码提示问题： </DIV></TD>
          <TD width="35%"><INPUT type="type" size=30 name="passwdQuestion" value="${user.passwdquestion}"> </TD>
          <TD width="45%"><FONT color=#ff0000>例如：我的最爱的人是谁？</FONT> </TD></TR>
        <TR>
          <TD width="20%">
            <DIV align=right><FONT color=#ff0000>*</FONT> 密码提示答案： </DIV></TD>
          <TD width="35%"><INPUT type="text" size=30 name="passwdAnswer" value="${user.passwdanswer}"> </TD>
          <TD width="45%"><FONT color=#ff0000>注意：密码提示问题答案长度不少于6位</FONT> </TD></TR>
        <TR>
          <TD width="20%">
            <DIV align=right>性别： </DIV></TD>
            <c:if test="${user.gender eq 0}">
          <TD width="35%"><INPUT type="radio" CHECKED value=0 name="gender">男 
            <INPUT type="radio" value="1" name="gender">女 </TD></c:if>
            <c:if test="${user.gender eq 1}"><TD width="35%"><INPUT type=radio value=0 name=gender>男 
            <INPUT type="radio" CHECKED value="1" name="gender">女 </TD></c:if>
          <TD width=45>&nbsp;</TD></TR>
          <TR>
          <TD width="20%">
            <DIV align=right>年龄： </DIV></TD>
          <TD width="35%"><INPUT type="text" size=30 name="age" value="${user.age}"> </TD>
          <TD width="45%"><FONT color=#ff0000>请输入年龄（必须为数字）</FONT> </TD></TR>

        <TR>
          <TD width="20%">
            <DIV align=right><FONT color=#ff0000>*</FONT>联系电话： </DIV></TD>
          <TD width=35><INPUT type="text"size=30 name="phone" value="${user.phone}"> </TD>
          <TD width="45%"><FONT color=#ff0000>请输入区号和真实的电话，以便我们与您联系</FONT> 
        </TD></TR>
        <TR>
          <TD width="20%">
            <DIV align=right><FONT color=#ff0000>*</FONT>详细地址： </DIV></TD>
          <TD width="35%"><INPUT type="text" size=30 name="address" value="${user.address}"> </TD>
          <TD width="45%">&nbsp;</TD></TR>
          <TR>
          <TD width="20%">
            <DIV align=right>相片上传：</DIV></TD>
          <TD width="35%" colspan="2"><html:file property="icon"></html:file>
          </TD>
          </TR>
          <tr><td colspan="3">&nbsp;</td>
          </tr>
        <TR>
          <TD colSpan=3>
            <DIV align=center><INPUT style="CURSOR: hand" type=submit value=提交> 
            &nbsp;&nbsp; <INPUT style="CURSOR: hand" type=reset value=重置> 
          </DIV></TD></TR></TBODY></TABLE></html:form>
				</td>
				<td background="../../images/centeright.gif"></td>
  			</tr>
  			<tr>
				<td><img src="../../images/bottomleft.gif"></td>
				<td background="../../images/bottomcenter.gif"></td>
				<td><img src="../../images/bottomright.gif"></td>
  			</tr>
			</table>
		</center>
	</body>
</html>
