<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>措滹人力资源管理系统--首页</title>
<link type="text/css" rel="stylesheet" href="css/style.css">

</head>

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
              <td width="437" valign="bottom"><font color="#FF0000">首页面</font></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
        <tr>
          <td height="243"><table width="547" align="center">
            <tr align="center">
              <td width="261" height="100"><a href="employee.do?method=forwardInsertEmployee"><img src="images/addEmployee.gif" width="175" height="33" border="0"></a></td>
              <td width="274"><a href="train_insert.jsp"><img src="images/constituteTrain.gif" width="175" height="33" border="0"></a></td>
            </tr>
            <tr align="center">
              <td height="100"><a href="inviteJob_insert.jsp"><img src="images/addInvite.gif" width="175" height="33" border="0"></a></td>
              <td><a href="cj_insert.jsp"><img src="images/constituteDeal.gif" width="175" height="33" border="0"></a></td>
            </tr>
            <tr align="center">
              <td height="100"><a href="department_insert.jsp"><img src="images/addDepartment.gif" width="175" height="33" border="0"></a></td>
              <td><a href="pay.do?method=forwardInsertPay"><img src="images/constituteCompensation.gif" width="175" height="33" border="0"></a></td>
            </tr>
          </table></td>
        </tr>
      </table>
	  <jsp:include page="down.jsp" flush="true" />
    </td>
  </tr>
</table>

</body>
</html>
