<%@ page language="java" contentType="text/html;charset=GB2312"%>

<html>
<head>
<title>科技项目申报系统</title>
<style>
<!--
:link {color:#000099}
:visited {color:#000099}
:active {color:#000099}
A:link,A:visited,A:active {text-decoration:none}
//-->
</style>
<script language=JavaScript>
function check(form){
    if (form.adminID.value=="")
    { 
       alert("请输入帐号！");
       form.adminID.focus();
       return false; 
     }
    if (form.password.value=="")
    {
      alert("请输入密码！");
      form.password.focus();
      return false;
     }  
     return true;
}
</Script>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<div align="center">
  <table width="600" border="0" cellspacing="0" cellpadding="0" height="67">
    <tr>
      <td height="139"> 
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td bgColor=#4f71b8 width="100%"></td>
          </tr>
        </table>
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td bgColor=#0010a0 width="100%"></td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="22">&nbsp;</td>
          </tr>
          <tr>
            <td height="22">
              <div align="center"><font color="#ffcc00" face="Wingdings">v</font><font color="#0010a0"><b>欢迎使用项目申报系统</b></font><font color="#ffcc00" face="Wingdings">v</font></div>
            </td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="29">
          <tr> 
            <td> 
              <div align="center">
                <table width="50%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                </table>
				<form name=form method=post action="z_checklogon.jsp" onsubmit="return check(this)">
                <table width="35%" border="0" cellspacing="0" cellpadding="0" height="138">
                  <tr>
                    <td height="175"> 
                      <table width="87%" border="0" cellspacing="1" cellpadding="0" height="154" bgcolor="#4f71b8">
                        <tr> 
                          <td height="100"> 
                              <table width="300" border="0" cellspacing="0" cellpadding="0" height="187" bgcolor="#F0F0F0">
                                <tr> 
                                <td colspan="2" height="20" bgcolor="#4f71b8"> 
                                    <div align="center"><b><img src="../images/zongping1.gif" ></b></div>
                                </td>
                              </tr>
                              <tr> 
                                <td height="22" colspan="2"> 
                                  <div align="center"><b></b></div>
                                </td>
                              </tr>
                              <tr> 
                                <td width="50%"> 
                                    <div align="center"><font color="#000099">管理员代码</font> 
                                    </div>
                                </td>
                                <td width="50%"> 
                                    <input name=adminID 
                  size=12>
                                </td>
                              </tr>
                              <tr> 
                                <td width="50%"> 
                                  <div align="center"><font color="#000099">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码 
                                    </font></div>
                                </td>
                                <td width="50%"> 
                                    <input name=password 
                  size=12 type=password>
                                </td>
                              </tr>
                              <tr> 
                                  <td width="50%" height="5"> 
                                    <div align="center"></div>
                                </td>
                                  <td width="50%">&nbsp; </td>
                              </tr>
                              <tr> 
                                <td height="5" colspan="2"> 
                                  <div align="center">                                     
                                      <input type=image  src="../images/login.gif" width="62" height="22" name="logon">
                                    </div>
                                </td>
                              </tr>
                              <tr>
                                  <td height="20" colspan="2"> 
                                    <div align="center"></div>
                                </td>
                              </tr>
                            </table>
                            
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
                </form>
                <table width="57%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="5">
                        <div align="center"><font color="#ff0000">
                            <%
                                String getmessage=(String)session.getValue("login_message");
                                if(getmessage==null) getmessage="";
                            %>
                            <%=getmessage%>
                        </font></div>
                    </td>
                  </tr>
                  <tr>
                    <td bgColor=#0010a0 width="100%"></td>
                  </tr>
                  <tr>
                    <td height="2">&nbsp;</td>
                  </tr>
                </table>
                <table width="50%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td>
                      <div align="center"><font size="2" color="#000099">IE5.0以上版本浏览器&nbsp;&nbsp; 
                        分辨率800*600</font></div>
                    </td>
                  </tr>
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div>
</body>
</html>
