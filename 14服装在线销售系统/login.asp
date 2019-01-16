<%
if(session("UserLogin")="") then
%><table width="200" border="0" align="center" cellpadding="0" cellspacing="0" class="login">
        <tr> 
          <td valign="top"> 
            <table border="0" width="100%" cellspacing="0" cellpadding="0" height="18">
              
              <tr> 
                <td width="100%" height="18"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse" bordercolor="#111111">
                    <tr> 
                      <td width="86%" align="center" height="30" class="title"><b>用户登陆</b></td>
                    </tr>
                    <form method="POST" action="checklogin.asp">
                      <tr> 
                        <td height="50">
						<div align="center">
                        <center>
 <%if session("user_name")<>"" then
						response.write "欢迎您，"&session("user_name")
						else%>
                          <table width="95%" border="0" align="center" cellpadding="0" cellspacing="5">
                            <tr> 
                              <td width="32%"> 
                                <div align="center">客户：</div>                              </td>
                              <td align="left" valign="middle">
                              <input name="uname" type="text" class=input id="uname" style="FONT-SIZE: 12px; WIDTH: 60px" size="10" maxlength="18">                              </td>
                              <td rowspan="2" align="left" valign="middle"><label>
                                <input type="image" name="imageField" src="images/login.jpg" />
                              </label></td>
                            </tr>
                            <tr> 
                              <td> 
                                <div align="center">密码：</div>                              </td>
                              <td align="left" valign="middle">
                                  <input style="FONT-SIZE: 12px; WIDTH: 60px" type="password" name="upass" size="10" class=input maxlength="18">                              </td>
                            </tr>
                          </table>
                          <table width="90%" border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse" bordercolor="#111111">
                            <tr> 
                              <td width="80" align="center" valign="middle"><a href="reg.asp" target="_blank"><img src="images/reg.gif" width="81" height="25" border="0" /></a></td>
                              <td height="30" align="center" valign="middle"><a href="getpw.asp" target="_blank"><img src="images/getpw.gif" width="81" height="25" border="0" /></a></td>
                            </tr>
                          </table>
                          </center>
                          </div><%end if%>
					    </td>
                      </tr>
                    </form>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5"></td>
                    </tr>
                  </table>
                  
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table><br />

<%
else
%>
<table width="200" border="0" cellpadding="0" cellspacing="0" class="login">
  <tr>
    <td height="30" class="title">欢迎您登陆</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/aa1.gif">
        
        <tr>
          <td height="30" align="center" valign="middle"><a href="modinfo.asp">用户资料修改</a></td>
        </tr>
        <tr>
          <td height="30" align="center" valign="middle"><a href="ddcx.asp">订单查询</a></td>
        </tr><%if(session("UserLogin")="admin") then%>
		<tr>
          <td height="30" align="center" valign="middle"><a href="admin/main.asp">后台管理</a></td>
        </tr><%end if%>
        <tr>
          <td height="30" align="center" valign="middle"><a href="quitlogin.asp">退出登陆</a></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<%
end if
%>