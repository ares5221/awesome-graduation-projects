<table border="0" width="180" cellspacing="0" cellpadding="0" height="18">
 <%
//是否登陆
if((String)session.getValue("user_name")!=null) 
               {
		String name=(String)session.getAttribute("user_name");
		sql="select * from member where user_name='"+name+"'";
        rs=mdb.executeQuery(sql);
		if(rs.next()){
		%>
               
                <tr> 
                  <td width="100%" height="18"> <table width="100%" border="0" cellspacing="1" cellpadding="0">
                      <tr> 
                        <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ECECEC" style="border-collapse: collapse" bordercolor="#111111">
                            <tr> 
                              <td> <img border="0" src="img/promo_list_top.gif" width="100%" height="4"></td>
                            </tr>
                            <tr> 
                              <td width="86%" height="20" bgcolor="#989DA5"> <div align="center"><b>用户信息:</b></div></td>
                            </tr>
                            <tr> 
                              <td> <table border="0" width="100%" cellspacing="0" bgcolor="#ECECEC" style="border-collapse: collapse" bordercolor="#111111" cellpadding="0">
                                  <tr> 
                                    <td width="100%" colspan="2" bgcolor="#FFFFFF"> 
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td height="25" bgcolor="#ECECEC" > 
                                      <img src="img/pics/main_head_menu002.gif" width="13" height="13" align="absmiddle"> 
                                      用户名:</td>
                                    <td height="25" bgcolor="#ECECEC"><%=rs.getString("user_name")%></td>
                                  </tr>
                               
                                  <tr> 
                                    <td height="25" bgcolor="#ECECEC" ><img src="img/pics/main_head_menu004.gif" width="13" height="13" align="absmiddle"> 
                                      地址:</td>
                                    <td height="25" bgcolor="#ECECEC"><%=rs.getString("user_adds")%></td>
                                  </tr>
                                  <tr> 
                                    <td height="25" bgcolor="#ECECEC" ><img src="img/pics/main_head_menu001.gif" width="13" height="13" align="absmiddle"> 
                                      E-mail:</td>
                                    <td height="25" bgcolor="#ECECEC"><%=rs.getString("user_mail")%></td>
                                  </tr>
                                  <tr> 
                                    <td height="25" bgcolor="#ECECEC"><img src="img/pics/main_head_menu005.gif" width="13" height="13" align="absmiddle"> 
                                      电话:</td>
                                    <td height="25" bgcolor="#ECECEC"><%=rs.getString("user_tel")%></td>
                                  </tr>
                                </table></td>
                            </tr>
                          </table></td>
                      </tr>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="5"></td>
                      </tr>
                    </table></td>
                </tr>
 <%
		}

 }else
 //没有登陆
 {
 %>
                <tr> 
                  <td width="100%" height="18"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> </tr>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ECECEC" style="border-collapse: collapse" bordercolor="#111111">
                      <tr> 
                        <td align="center"> <img border="0" src="img/promo_list_top.gif" width="100%" height="4"></td>
                      </tr>
                      <tr> 
                        <td width="86%" align="center" height="20" bgcolor="#989DA5"><b>用户登陆</b></td>
                      </tr>
                      <form method="POST" action="login.jsp">
                        <tr> 
                          <td height="110" bgcolor="#ECECEC"> <table width="95%" border="0" align="center" cellpadding="0" cellspacing="5">
                              <tr> 
                                <td width="32%" bgcolor="#ECECEC"> <div align="center">客户：</div></td>
                                <td width="68%" bgcolor="#ECECEC"> <div align="center"> 
                                    <input name="user_name" type="text" class=input id="user_name" style="FONT-SIZE: 12px; WIDTH: 110px" size="10" maxlength="18">
                                  </div></td>
                              </tr>
                              <tr> 
                                <td bgcolor="#ECECEC"> <div align="center">密码：</div></td>
                                <td bgcolor="#ECECEC"> <div align="center"> 
                                    <input style="FONT-SIZE: 12px; WIDTH: 110px" type="password" name="user_pass" size="10" class=input maxlength="18">
                                  </div></td>
                              </tr>
                            </table>
                            <div align="center"></div>
                            <div align="center"> 
                              <center>
                                <table width="90%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ECECEC" style="border-collapse: collapse" bordercolor="#111111">
                                  <tr> 
                                    <td width="80"><a href="reg.jsp" target="_blank"><img src="img/pics/reg.gif" width="81" height="25" border="0"></a></td>
                                    <td> <div align="center"> 
                                        <input 
     爀?? align=absMiddle alt=进入 cache name=submit2 
      src="img/pics/login.gif" type=image tppabs="" width="56" height="25">
                                      </div></td>
                                  </tr>
                                </table>
                              </center>
                            </div></td>
                        </tr>
                      </form>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="5"></td>
                      </tr>
                    </table>
                    <%
}//判断登陆结束
%>
                  </td>
                </tr>
              </table>