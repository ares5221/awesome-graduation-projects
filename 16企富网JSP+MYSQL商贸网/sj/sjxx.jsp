<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../top.jsp"%>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../info/checksession.jsp"%>
<%
stmt = con.createStatement() ;
int id = Integer.parseInt((String)request.getParameter("id"));
rs=stmt.executeQuery("SELECT * from sjxx where id="+id);
while(rs.next())
{%>


<body bgcolor="#142F7C" leftmargin="0" topmargin="0">


<table width="750" border="0" cellspacing="0" cellpadding="0" align=center>
<tr> 
<td><a href=../let target="_blank"><img border=0 src=../images/time.jpg width=750 height=100></a></td>
</tr>
</table>


<div align="center">
 
                      <table width="750" border="0" cellspacing="0" cellpadding="0">
                        <tr><td width=20></td>
                          <td class="fl" align=center><strong><font color="#000000" size=3><br><img src=../images/fl_26.gif><%=rs.getString("topic")%></font></strong></td><td align=right width=100><a href=../info/addFavorit.jsp?id=<%=rs.getString("id")%> target="_blank"><img src=../images/Favorit.gif border=0></a></td>
                        </tr>
</table>



<table width="750" border="0" cellspacing="0" cellpadding="0" align=center>
                            
                              
                            <tr> <td width=20></td>
                              <td height="34"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td width="20" height="15"><img src="../images/fl3_7.gif" width="9" height="9"></td>
                                    <td class="zl"><strong><font color="#FF0000"> 

                              <%if(Integer.parseInt((String)rs.getString("lei"))==1){%>[供应信息]<%}%>
                              <%if(Integer.parseInt((String)rs.getString("lei"))==2){%>
                               <%if (rs.getString("fast").compareTo("1")==0){%><font color=red>[紧急]</font><%}%>[求购信息]<%}%>
                              <%if(Integer.parseInt((String)rs.getString("lei"))==3){%>[代理信息]<%}%>
                              <%if(Integer.parseInt((String)rs.getString("lei"))==4){%>[合作信息]<%}%>


                                      </font></strong> </td>
                                  </tr>
                                </table></td>
                            </tr>



                            <tr> <td width=20></td>
                              <td height="34"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td width="20" height="15"><img src="../images/fl3_7.gif" width="9" height="9"></td>
                                    <td class="zl"><strong><font color="#000000"> 
                                    发布时间：[<%=rs.getString("fbtime")%>]
                                      </font></strong> </td>
                                  </tr>
                                </table></td>
                            </tr>



                            <tr> <td width=20></td>
                              <td height="34"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td width="20" height="15"><img src="../images/fl3_7.gif" width="9" height="9"></td>
                                    <td class="zl"><strong><font color="#000000"> 
                                    所属行业：[<%=rs.getString("dfl")%>==><%=rs.getString("sfl")%>]
                                      </font></strong> </td>
                                  </tr>
                                </table></td>
                            </tr>









                            <tr> <td width=20></td>
                              <td height="34"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td width="20" height="15" valign="top"><img src="../images/fl3_7.gif" width="9" height="9"></td>
                                    <td valign="top" class="zl"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr> 
                                          <td class="fl3"><%=rs.getString("content")%></td>
                                          <td width="30">&nbsp;</td>
                                        </tr>
                                      </table></td>
                                  </tr>
                                </table></td>
                            </tr>
                          



</table>



               <table width="750" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td valign="top" background="../images/fl3_9.gif"> <div align="center"> 
                            <table width="80%" height="25" border="0" cellpadding="0" cellspacing="0">
                              <tr> 
                                <td valign="bottom"><div align="center"> 
                                    <p class="zl">*本信息真实性未证实，请谨慎采用，风险自负。</p>
                                  </div></td>
                              </tr>
                            </table>
                          </div></td>
                        <td width="182"> <div align="right"><img src="../images/fl3_8.gif" width="182" height="42"></div></td>
                      </tr>
                    </table>
                
                






               <table width="100%" border="0" cellspacing="0" cellpadding="0">






                <tr> 
                  <td height="290"><div align="center"> 
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                       
                        <tr> 
                          <td><div align="center">
                              <table width="522" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td><table width="522" height="25" border="0" cellpadding="0" cellspacing="0">
                                      <tr> 
                                        <td><table width="522" height="25" border="0" cellpadding="0" cellspacing="0">
                                            <tr> 
                                              <td width="27"><img src="../../images/card_1a.gif" width="27" height="25"></td>
                                              <td valign="bottom" background="../../images/card_1b.gif" class="44"><strong><font color="#A94D1B" size="2"> 
                                               联系我
                                                </font></strong></td>
                                              <td width="20"><img src="../../images/card_1c.gif" width="20" height="25"></td>
                                            </tr>
                                          </table></td>

<%if(Integer.parseInt((String)rs.getString("lei"))==2){%>
<%if (rs.getString("fast").compareTo("1")==0){%>
<%if (Integer.parseInt((String) session.getAttribute("vip"))==0){%><font color=cccccc><a href=# ><img src=../images/sendmsg.gif border=0></a></font><%}else{%><a href=../info/sendmsg.jsp?recemem=<%=rs.getString("memid")%>&memname=<%=rs.getString("username")%> target="_blank"><img src=../images/sendmsg.gif border=0></a><%}%><%}%><%}else{%>

<a href=../info/sendmsg.jsp?recemem=<%=rs.getString("memid")%>&memname=<%=rs.getString("username")%> target="_blank"><img src=../images/sendmsg.gif border=0></a>
<%}%>


                                      </tr>
                                    </table></td>
                                </tr>
                                <tr> 
                                  <td valign="top" background="../../images/card_3.gif"> 
                                    <table width="522" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td width="52" valign="bottom"><img src="../../images/card_4.gif" width="52" height="34"></td>
                                        <td valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            
<%if(Integer.parseInt((String)rs.getString("reged"))==1){%>

<tr> 
                                              <td height="21"><div align="center"> 
                                                  <p class="fl"><font size="3">
<%if(Integer.parseInt((String)rs.getString("lei"))==2){%>
<%if (rs.getString("fast").compareTo("1")==0){%>
<%if (Integer.parseInt((String) session.getAttribute("vip"))==0){%><font color=cccccc>此信息为紧急求购信息!企富通会员方有权查看联系资料!</font><%}else{%>
<strong><a href=../web/index.jsp?id=<%=rs.getString("memid")%> target="_blank"><%=rs.getString("company")%></a></strong><%}%><%}%><%}else{%>
<strong><a href=../web/index.jsp?id=<%=rs.getString("memid")%> target="_blank"><%=rs.getString("company")%></a></strong>
<%}%>
</font></p>
                                                </div></td>
                                            </tr>
<%}%>


                                            <tr> 
                                              <td height="30"><div align="center"> 
                                                  <p class="33"><font color="DA5B02" size="3"><%=rs.getString("myname")%>

</font>
<%if(Integer.parseInt((String)rs.getString("reged"))==1){%>
<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=../info/memgrade.jsp?memid=<%=rs.getString("memid")%> topmargin=0 width=65 height=15></iframe>
<%}%></p>
                                                </div></td>
                                            </tr>
                                            <tr> 
                                              <td height="1"><img src="../../images/card_7.gif" width="470" height="1"></td>
                                            </tr>
                                            <tr> 
                                              <td height="17" class="33"><font size="2">地　　址：

<%if(Integer.parseInt((String)rs.getString("lei"))==2){%>
<%if (rs.getString("fast").compareTo("1")==0){%>
<%if (Integer.parseInt((String) session.getAttribute("vip"))==0){%><font color=cccccc>此信息为紧急求购信息!企富通会员方有权查看联系资料!</font><%}else{%><%=rs.getString("address")%><%}%><%}%><%}else{%>


<%=rs.getString("address")%>

<%}%>
</font></td>
   </tr>

<%if(Integer.parseInt((String)rs.getString("reged"))==1){%>

                                            <tr> 
                                              <td height="19" class="33"><font size="2">邮　　编：<%=rs.getString("post")%></font></td>
                                            </tr>

<%}%>


                                            <tr> 
                                              <td height="19" class="33"><font size="2">电　　话：
<%if(Integer.parseInt((String)rs.getString("lei"))==2){%>
<%if (rs.getString("fast").compareTo("1")==0){%>
<%if (Integer.parseInt((String) session.getAttribute("vip"))==0){%><font color=cccccc>此信息为紧急求购信息!企富通会员方有权查看联系资料!</font><%}else{%><%=rs.getString("tel")%><%}%><%}%><%}else{%>
<%=rs.getString("tel")%>
<%}%>
</font></td>
                                            </tr>





<%if(rs.getString("fax")=="null"){}else{%>
                                            <tr>
                                              <td height="19" class="33"><font size="2">传　　真：
<%if(Integer.parseInt((String)rs.getString("lei"))==2){%>
<%if (rs.getString("fast").compareTo("1")==0){%>
<%if (Integer.parseInt((String) session.getAttribute("vip"))==0){%><font color=cccccc>此信息为紧急求购信息!企富通会员方有权查看联系资料!</font><%}else{%><%=rs.getString("fax")%><%}%><%}%><%}else{%>
<%=rs.getString("fax")%>
<%}%>
</font></td>
                                            </tr>
<%}%>                                            
                                            <tr> 
                                              <td><table width="100%" border="0" cellpadding="0" cellspacing="0" background="../../images/card_5.gif">



<%if(Integer.parseInt((String)rs.getString("reged"))==1){%>

                                                  <tr> 
                                                    <td height="19" class="33"><font size="2">公司网址：<font color="454546"> 
                                             
<%if(Integer.parseInt((String)rs.getString("lei"))==2){%>
<%if (rs.getString("fast").compareTo("1")==0){%>
<%if (Integer.parseInt((String) session.getAttribute("vip"))==0){%><font color=cccccc>此信息为紧急求购信息!您无权查看联系资料!</font><%}else{%> <a href="<%=rs.getString("web")%>"><%=rs.getString("web")%></a> <%}%><%}%><%}else{%> 
 
 <a href="<%=rs.getString("web")%>"><%=rs.getString("web")%></a> 

<%}%>
                                                      </font></font></td>
                                                    <td width="130" rowspan="2">
                                                      <div align="right"><font size="2"><img src="../../images/card_6.gif" width="130" height="37"></font></div></td>
                                                  </tr>


<%}%>



<%if(rs.getString("email")=="null"){}else{%>

                                                  <tr> 
                                                    <td class="33"><font size="2">电子邮件：

<%if(Integer.parseInt((String)rs.getString("lei"))==2){%>
<%if (rs.getString("fast").compareTo("1")==0){%>
<%if (Integer.parseInt((String) session.getAttribute("vip"))==0){%><font color=cccccc>此信息为紧急求购信息!您无权查看联系资料!</font><%}else{%><a href="mailto:<%=rs.getString("email")%>" class="44link"><font olor="454546"><%=rs.getString("email")%></font></a><%}%><%}%><%}else{%>
<a href="mailto:<%=rs.getString("email")%>" class="44link"><font olor="454546"><%=rs.getString("email")%></font></a>
<%}%>

&nbsp;&nbsp;&nbsp;&nbsp;
</font></td>
                                                  </tr>

<%}%>

                                                </table></td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                    </table></td>
                                </tr>
                                <tr> 
                                  <td><img src="../../images/card_2.gif" width="522" height="14"></td>
                                </tr>
                              </table>
                            </div></td>
                                                  </tr>
                      </table>





<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src="html/<%=rs.getString("fileName")%>" topmargin=0 width=760 height=1></iframe>




<%}%>


<TABLE cellSpacing=0 cellPadding=0 width="522" align=center border=0>
        <TBODY>
        <TR>
          <TD><embed src="../images/reg.swf" quality=high 
pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" 
type="application/x-shockwave-flash" width=522 height=90></embed></TD></TR>
</TBODY></TABLE>
</div></td>
</tr>
</table>
          



<%@ include file="../end.jsp"%>

</body>
</html>
