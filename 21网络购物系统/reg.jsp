
<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="top.jsp"%>
   <link href="css.css" rel="stylesheet" type="text/css">
   <div align="center">
     <center>
   <table width="600" border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse">
                <tr> 
                  <td width="100%" height="25">　</td>
                </tr>
                <tr> 
                  <td width="100%" height="25" bgcolor="#989DA5"><div align="center"><b>用户注册</b></div></td>
                </tr>
                <tr> 
                  <td height="2" bgcolor="#ECECEC"> <table width="100%" border="0" cellspacing="1" cellpadding="0" height="100%">
                      <tr> 
                        <td align="center"> <form action="regsave.jsp" method="post" name="" id="">(为避免引起不必要的纠纷，以下信息请如实添写，如以下信息有变动，应当立刻通知本站)<br>
                            <table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" style="margin-bottom: 6">
                              <tr> 
                                <td width="29%" height="25"><div align="right">用 
                                    户 名： </div></td>
                                <td width="71%"><div align="center"> 
                                    <input style="FONT-SIZE: 12px; WIDTH: 210px" type="text" name="user_name" size="20" class=input>
                                  </div></td>
                              </tr>
                              <tr> 
                                <td height="25"><div align="right">密&nbsp;&nbsp;&nbsp; 
                                    码：</div></td>
                                <td height="25"><div align="center"> 
                                    <input style="FONT-SIZE: 12px; WIDTH: 210px" type="password" name="user_pass" size="20" class=input>
                                  </div></td>
                              </tr>
                              <tr> 
                                <td height="25"><div align="right">密码确认：</div></td>
                                <td height="25"><div align="center"> 
                                    <input style="FONT-SIZE: 12px; WIDTH: 210px" type="password" name="user_pass2" size="20" class=input>
                                  </div></td>
                              </tr>
                              <tr> 
                                <td height="25"><div align="right">E - mail ：</div></td>
                                <td height="25"><div align="center"> 
                                    <input style="FONT-SIZE: 12px; WIDTH: 210px" type="text" name="user_mail" size="20" class=input>
                                  </div></td>
                              </tr>
                              <tr> 
                                <td height="25"><div align="right">地&nbsp;&nbsp;&nbsp; 
                                    址：</div></td>
                                <td height="25"><div align="center"> 
                                    <input style="FONT-SIZE: 12px; WIDTH: 210px" type="text" name="user_adds" size="20" class=input>
                                  </div></td>
                              </tr>
                              <tr> 
                                <td height="25"><div align="right">电&nbsp;&nbsp;&nbsp; 
                                    话：</div></td>
                                <td height="25"><div align="center"> 
                                    <input style="FONT-SIZE: 12px; WIDTH: 210px" type="text" name="user_tel" size="20" class=input>
                                  </div></td>
                              </tr>
                              <tr> 
                                <td height="25"><div align="right">邮&nbsp;&nbsp;&nbsp; 
                                    编：</div></td>
                                <td height="25"><div align="center"> 
                                    <input style="FONT-SIZE: 12px; WIDTH: 210px" type="text" name="user_postcode" size="20" class=input>
                                  </div></td>
                              </tr>
                              <tr> 
                                <td height="25"><div align="right">真实姓名：</div></td>
                                <td height="25"><div align="center"> 
                                    <input style="FONT-SIZE: 12px; WIDTH: 210px" type="text" name="user_namec" size="20" class=input>
                                  </div></td>
                              </tr>
                              <tr> 
                                <td height="35" colspan="2"><div align="center"> 
                                    <table width="40%" border="0" align="center" cellpadding="0" cellspacing="0">
                                      <tr> 
                                        <td><div align="center"> 
                                            <input 
      align=absMiddle alt=确认 cache name="B13" 
      src="img/pics/ok.gif" type=image tppabs="" width="45" height="20">
                                          </div></td>
                                        <td><div align="center"> 
                                            <input type="reset" value="清除" name="B22" class=input>
                                          </div></td>
                                      </tr>
                                    </table>
                                  </div></td>
                              </tr>
                            </table>
                          </form>
                         </td>
                      </tr>
                    </table></td>
                </tr>
              </table>
     </center>
</div>
<%@ include file="copy.jsp"%>