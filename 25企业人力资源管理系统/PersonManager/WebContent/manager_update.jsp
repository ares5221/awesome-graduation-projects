<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>措滹人力资源管理系统--系统管理</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<script language="JavaScript">
function updatePasswordManager(){
if(document.managerForm.oldPassword1.value==""){
window.alert("请输入旧密码");
return false;
}
if(document.managerForm.oldPassword1.value!=document.managerForm.oldPassword2.value){
window.alert("您输入的密码与原来的密码不一致");
return false;
}
if(document.managerForm.password.value==""){
window.alert("请输入新密码");
return false;
}
if(document.managerForm.newPassword.value==""){
window.alert("请输入确认密码");
return false;
}
if(document.managerForm.password.value!=document.managerForm.newPassword.value){
window.alert("您输入的新密码与密码确认不一致");
return false;
}
return true;
}
</script>


<body>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
    
      <jsp:include page="top.jsp" flush="true" />   
	  
	     <table width="801" height="48" border="0" cellpadding="0" cellspacing="0" background="images/center1.jpg">
        <tr>
          <td valign="top"><table width="494">
            <tr>
              <td width="45" height="25">&nbsp;</td>
              <td width="437" valign="bottom"><font color="#FF0000">用户修改</font></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
        <tr>
          <td height="243" valign="top" align="center">
		 <html:form action="manager.do?method=updateManager" onsubmit="return updatePasswordManager()">
		  <table width="400" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="66583D">
            <tr>
              <th width="100" height="30"><span class="word_white">账&nbsp;&nbsp;号：</span></th>
              <td width="287" bgcolor="#FFFFFF">${sessionScope.managerform.account}<html:hidden property="account" value="${sessionScope.managerform.account}"/></td>
            </tr>
            <tr>
              <th height="30"><span class="word_white">旧密码：</span></th>
              <td bgcolor="#FFFFFF"><input name="oldPassword1" type="password" size="30"><input name="oldPassword2" type="hidden" value="${sessionScope.managerform.password}"></td>
            </tr>
            <tr>
              <th height="30"><span class="word_white">新密码：</span></th>
              <td bgcolor="#FFFFFF"><html:password property="password" size="30"/><html:hidden property="id" value="${sessionScope.managerform.id}"/></td>
            </tr>
		    <tr>
              <th height="30"><span class="word_white">确认密码：</span></th>
              <td bgcolor="#FFFFFF"><input name="newPassword" type="password" size="30"><html:hidden property="managerLevel" value="${sessionScope.managerform.managerLevel}"/></td>
            </tr>
          </table>
		  <br>           
              <input type="submit" name="Submit2" value="保存">
              &nbsp;&nbsp;
              <input type="reset" name="Submit" value="重置">
          </html:form>
            <br> 
          ${requestScope.result}
          
            
		  </td>
        </tr>
      </table>
	  <jsp:include page="down.jsp" flush="true" />
    </td>
  </tr>
</table>
</body>
</html:html>
