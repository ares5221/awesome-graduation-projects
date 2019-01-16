<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="top.jsp"%>
<%
int id = Integer.parseInt((String)request.getParameter("id"));%>


<TABLE cellSpacing=0 cellPadding=0 width=778 border=0>
<TBODY>
<TR>
<TD vAlign=top align=middle width=150  background=images/leftmanu_bg.gif>
<%@ include file="left.jsp"%>
</TD>


<TD style="BACKGROUND-POSITION: right 50%; BACKGROUND-IMAGE: url(images/bg1.gif); BACKGROUND-REPEAT: repeat-y; BACKGROUND-COLOR: #ffffff"  vAlign=top align=middle width=628>     










<div align=center>











     <table width="100%" border="0" cellspacing="0" cellpadding="0" align=center>
                              <tr> 
                                <td height="30">&nbsp;</td>
                              </tr>
                              <tr> 
                                <td><div align="center"> 
                                    <table width="610" border="0" cellspacing="0" cellpadding="0" align=center>
                                      <tr> 
                                        <td height="24" background="images/del_6.gif"><table width="285" border="0" cellspacing="0" cellpadding="0">
                                            <tr> 
                                              <td width="102"><div align="center"> 
                                                  <p class="zl"></p>
                                                </div></td>
                                           
                                            </tr>
                                          </table></td>
                                      </tr>
                                      <tr> 
                                        <td><table width="610" border="0" cellpadding="3" cellspacing="1" bgcolor="97C5E4">
                                            <tr> 
                                              <td height="610" valign="top" bgcolor="#FFFFFF"><div align="center"> 
                                                  <table width="610" border="0" cellspacing="0" cellpadding="0">
                                                    <tr> 
                                                      <td height="20">&nbsp;</td>
                                                    </tr>
                                                    <tr> 
                                                      <td><div align="center"> 
                                                          <table width="500" border="0" cellspacing="0" cellpadding="0">
                                                            <tr> 
                                                              <td height="24" bgcolor="E4E6E7"><table width="500" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr> 
                                                                    <td width="30"><img src="../images/pointi.gif" ></td>
                                                                    <td class="zl"><strong><font color="#1F69A0">设定代理资料</font></strong></td>
                                                                  </tr>
                                                                </table></td>
                                                            </tr>
                                                            <tr> 
                                                              <td height="18">&nbsp;</td>
                                                            </tr>
                                                            <tr> 
                                                              <td><form  action="agreedlok.jsp" method="post" name="Form1"  >
                                                                  <table width="500" border="0" cellpadding="3" cellspacing="1" bgcolor="A8A8A9">
                                                                    <tr bgcolor="EAECED"> 
                                                                      <td height="35" colspan="3"> 
                                                                        <div align="center"> 
                                                                          <p class="zl2"><font color="3C3E3F">填写代理资料</font></p>
                                                                        </div></td>
                                                                    </tr>




<%
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from dl where id="+id);
rs.next();%>




                                               


                                               

 <input name=id type="hidden" class="zl" id="id" size="30" value=<%=rs.getString("id")%>>



                                         <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">所属省份</font></a>:<FONT color=red size=2>*</FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 

<select name="sf" id="sf">

                                <option value="<%=rs.getString("sf")%>"> 
                                <%=rs.getString("sf")%>
                                </option>
                                
                                <option value="北京"> 
                                北京
                                </option>
                                
                                <option value="安徽"> 
                                安徽
                                </option>
                                
                                
                                <option value="福建"> 
                                福建
                                </option>
                                
                                <option value="甘肃"> 
                                甘肃
                                </option>
                                
                                <option value="广东"> 
                                广东
                                </option>
                                
                                <option value="广西"> 
                                广西
                                </option>
                                
                                <option value="贵州"> 
                                贵州
                                </option>
                                
                                <option value="海南"> 
                                海南
                                </option>
                                
                                <option value="河北"> 
                                河北
                                </option>
                                
                                <option value="黑龙江"> 
                                黑龙江
                                </option>
                                
                                <option value="河南"> 
                                河南
                                </option>
                                
                                <option value="湖北"> 
                                湖北
                                </option>
                                
                                <option value="湖南"> 
                                湖南
                                </option>
                                
                                <option value="内蒙古"> 
                                内蒙古
                                </option>
                                
                                <option value="江苏"> 
                                江苏
                                </option>
                                
                                <option value="江西"> 
                                江西
                                </option>
                                
                                <option value="吉林"> 
                                吉林
                                </option>
                                
                                <option value="辽宁"> 
                                辽宁
                                </option>
                                
                                <option value="宁夏"> 
                                宁夏
                                </option>
                                
                                <option value="青海"> 
                                青海
                                </option>
                                
                                <option value="山西"> 
                                山西
                                </option>
                                
                                <option value="陕西"> 
                                陕西
                                </option>
                                
                                <option value="山东"> 
                                山东
                                </option>
                                
                                <option value="上海"> 
                                上海
                                </option>
                                
                                <option value="四川"> 
                                四川
                                </option>
                                
                                <option value="天津"> 
                                天津
                                </option>
                                
                                <option value="西藏"> 
                                西藏
                                </option>
                                
                                <option value="新疆"> 
                                新疆
                                </option>
                                
                                <option value="云南"> 
                                云南
                                </option>
                                
                                <option value="浙江"> 
                                浙江
                                </option>
                                
                                <option value="其他"> 
                                其他
                                </option>
                                
                              </select></td>
                                                                    </tr>







                                                                                            <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">代理地区</font></a>:<FONT color=red size=2>*</FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
 <input name=dldq type="text" class="zl" id="dldq" size="30" value=<%=rs.getString("dldq")%>></td>
                                                                    </tr>











                                                                                            <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">分配域名</font></a>:<FONT color=red size=2>*</FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
 http://<input name=domain type="text" class="zl" id="domain" size="30" value=<%=rs.getString("domain")%>>.qifo.com</td>
                                                                    </tr>




                                                                    <tr> 
                                                                      <td width="18%" height="80" bgcolor="#FFFFFF"> 
                                                                        <div align="center"></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF"><div align="center"> 
                                                                          <table width="200" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr> 
                                                                              <td>

<input type="submit" value="设定"></td>
                                                                              <td><input type="reset" name="Submit3" value="重置"></td>
                                                                            </tr>
                                                                          </table>
                                                                        </div></td>
                                                                    </tr>
                                                                  </table>
                                                                </form></td>
                                                            </tr>
                                                          </table>
                                                        </div></td>
                                                    </tr>
                                                    <tr> 
                                                      <td height="25">&nbsp;</td>
                                                    </tr>
                                                  </table>
                                                </div></td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                      <tr> 
                                        <td height="40">&nbsp;</td>
                                      </tr>
                                    </table>








                          </div></td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
</table></td>
    </tr>
  </table>
</div>













</TD></TR></TBODY></TABLE><IMG 
height=10 src="images/bottom.gif" width=778><BR>

<%@ include file="end.jsp"%>
</BODY></HTML>
