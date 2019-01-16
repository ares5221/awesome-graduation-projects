<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../top.jsp"%>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../info/checksession.jsp"%>
<%
stmt = con.createStatement() ;
int id = Integer.parseInt((String)request.getParameter("id"));
rs=stmt.executeQuery("SELECT * from showbar where id="+id);
while(rs.next())
{%>











<body background="images/show_5.gif" leftmargin="0" topmargin="40">
<div align="center">
  <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><table width="750" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/show_1.gif" width="750" height="13"></td>
          </tr>
          <tr>
            <td valign="top"><table width="750" border="0" cellspacing="0" cellpadding="0">
                <tr valign="top"> 
                  <td width="14" background="images/show_2.gif">&nbsp;</td>
                  <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              
                              <td>&nbsp;</td>
                              <td width="366" background="images/show_7.gif"><img src="images/show_6.gif" width="81" height="54"></td>
                              <td width="66">&nbsp;</td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr>
                        <td height="400" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td valign="top"><div align="center">
                                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td height="10">&nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td><div align="center">
                                          <table width="241" height="279" border="0" cellpadding="3" cellspacing="1" bgcolor="CDCDCD">
                                            <tr>
                                              <td bgcolor="#FFFFFF"><div align="center"><a href=../<%=rs.getString("showphoto")%> target="_blank"><img alt="点击查看原始尺寸" src="../<%=rs.getString("showphoto")%>" width="219" height="259" border=0></a></div></td>
                                            </tr>



                                          </table>
                                        </div></td>
                            </tr><tr>
                                      <td height="20" align=center></td></tr>
                                    <tr>
                                      <td height="35" align=center><a href=../info/addfriend.jsp?friendid=<%=rs.getString("memid")%>&friendname=<%=rs.getString("username")%>&friendcompany=<%=rs.getString("company")%> target="_blank"><img src=../images/addfriend.gif border=0></a>&nbsp;&nbsp;&nbsp;<a href=../info/sendmsg.jsp?recemem=<%=rs.getString("memid")%>&memname=<%=rs.getString("username")%> target="_blank"><img src=../images/sendmsg.gif border=0></a></td>
                                    </tr>
                                  </table>
                                </div></td>
                              <td width="373"><table width="373" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td><img src="images/show_8.gif" width="222" height="44"></td>
                                  </tr>
                                  <tr>
                                    <td><table width="373" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td width="6" valign="top" background="images/show_9.gif"><img src="images/show_9.gif" width="6" height="359"></td>
                                          <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                              <tr> 
                                                <td height="20">&nbsp;</td>
                                              </tr>
                                              <tr> 
                                                <td height="18" class="zh"><strong><font color="F05A00">公司名称：</font></strong></td>
                                              </tr>
                                              <tr> 
                                                <td><img src="images/show_10.gif" width="367" height="3"></td>
                                              </tr>
                                              <tr> 
                                                <td height="27"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                      <td width="20">&nbsp;</td>
                                                      <td class="zh"><font color="3E3E3E"><a href=../web/index.jsp?id=<%=rs.getString("memid")%> target="_blank"><%=rs.getString("company")%></a></font>&nbsp;<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=../info/memgrade.jsp?memid=<%=rs.getString("memid")%> topmargin=0 width=65 height=15></iframe></td>
                                                    </tr>
                                                  </table></td>
                                              </tr>
                                              <tr> 
                                                <td><img src="images/show_10.gif" width="367" height="3"></td>
                                              </tr>
                                              <tr> 
                                                <td height="18">&nbsp;</td>
                                              </tr>
                                              <tr> 
                                                <td height="18" class="zh"><strong><font color="F05A00">产品信息：</font></strong></td>
                                              </tr>
                                              <tr> 
                                                <td><img src="images/show_10.gif" width="367" height="3"></td>
                                              </tr>
                                              <tr> 
                                                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                      <td width="20">&nbsp;</td>
                                                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                          <tr> 
                                                            <td height="20" class="zh"><font color="3E3E3E">产品名称：<%=rs.getString("showname")%></font></td>
                                                          </tr>
                                                          <tr> 
                                                            <td height="20" class="zh"><font color="3E3E3E">产品型号：<%=rs.getString("showxing")%></font></td>
                                                          </tr>
                                                          <tr> 
                                                            <td height="20" class="zh"><font color="3E3E3E">产品产地：<%=rs.getString("showaddress")%></font></td>
                                                          </tr>
                                                          </table></td>
                                                    </tr>
                                                  </table></td>
                                              </tr>
                                              <tr> 
                                                <td><img src="images/show_10.gif" width="367" height="3"></td>
                                              </tr>
                                              <tr> 
                                                <td height="18">&nbsp;</td>
                                              </tr>
                                              <tr> 
                                                <td height="18" class="zh"><strong><font color="F05A00">联系方式：</font></strong></td>
                                              </tr>
                                              <tr> 
                                                <td><img src="images/show_10.gif" width="367" height="3"></td>
                                              </tr>
                                              <tr> 
                                                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                      <td width="20">&nbsp;</td>
                                                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                          <tr> 
                                                            <td height="20" class="zh"><font color="3E3E3E">联系人：<%=rs.getString("myname")%></font></td>
                                                          </tr>
<tr> 
                                                            <td height="20" class="zh"><font color="3E3E3E">地址：<%=rs.getString("address")%></font></td>
                                                          </tr>
                                                          <tr> 
                                                            <td height="20" class="zh"><font color="3E3E3E">电话：<%=rs.getString("tel")%></font></td>
                                                          </tr>
                                                          <tr> 
                                                            <td height="20" class="zh"><font color="3E3E3E">邮件：<a href="mailto:<%=rs.getString("email")%>" class="zhlink"><font color="#CC3300"><%=rs.getString("email")%></font></a></font></td>
                                                          </tr>
                                                        </table></td>
                                                    </tr>
                                                  </table></td>
                                              </tr>
                                              <tr> 
                                                <td><img src="images/show_10.gif" width="367" height="3"></td>
                                              </tr>
                                           
                                            </table></td>
                                        </tr>
                                      </table></td>
                                  </tr>
                                </table></td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                  <td width="13" background="images/show_3.gif">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td><img src="images/show_4.gif" width="750" height="13"></td>
          </tr>
        </table></td>
    </tr>
  </table>





<%}%>




<%@ include file="../end.jsp"%>