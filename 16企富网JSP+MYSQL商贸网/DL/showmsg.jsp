<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="top.jsp"%>


<%
int id = Integer.parseInt((String)request.getParameter("id"));
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from dlmsg where id="+id);
rs.next();
%>

<%
int  dlid=Integer.parseInt((String) session.getAttribute("dlid"));
if (dlid==Integer.parseInt((String) rs.getString("dlid"))){%>







<TABLE cellSpacing=0 cellPadding=0 width=778 border=0>
<TBODY>
<TR>
<TD vAlign=top align=middle width=150  background=images/leftmanu_bg.gif>
<%@ include file="left.jsp"%>
</TD>


<TD style="BACKGROUND-POSITION: right 50%; BACKGROUND-IMAGE: url(images/bg1.gif); BACKGROUND-REPEAT: repeat-y; BACKGROUND-COLOR: #ffffff"  vAlign=top align=middle width=628>     













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
                                                      <td>
<div align=center>




<table width="522" border="0" cellspacing="0" cellpadding="0">
                                                                 



<tr> 
<td height="24" bgcolor="E4E6E7"><table width="500" border="0" cellspacing="0" cellpadding="0">
<tr> 
<td width="30"><img src="../images/pointi.gif" ></td>
<td class="zl"><strong><font color="#1F69A0">查看消息</font></strong></td><td align=right>发布时间:<%=rs.getString("sendtime")%></td>
</tr>
</table></td>
</tr>
<tr> 
<td height="18">&nbsp;</td>
</tr>

 </form>














                                                            <tr> 
                                                              <td height="18" valign="top"> 

						
                                                                  <table width="521" border="0" cellpadding="3" cellspacing="1" bgcolor="A8A8A9">
                                                                    <tr bgcolor="EAECED" class="zl"> 
                                                                      <td width="60%" height="30" bgcolor="EAECED"> 
<div align="left">[标题]<font color=000000 size=2><%=rs.getString("mtopic")%></font></div></td>
                                                    
</tr>


                                                                    <tr bgcolor="#FFFFFF"> 
                                                                      <td height="30" bgcolor="#FFFFFF" class="zl"> 
                                                                        <div align="left"> 

<%=rs.getString("content")%>


                                                                        </div></td>
                                                                     
                                                                    </tr>
                                                                











                                                                    <tr bgcolor="#FFFFFF"> 
                                                                      <td height="30" colspan="7" bgcolor="#FFFFFF" class="zl"> 
                                                                        <div align="center">
                                                                          <table width="500" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr> 
                                                                              <td width="133" align=left>[发布人]:<%=rs.getString("sendmem")%></td>




                                                                            </tr>
                                                                          </table>
                                                                        </div></td>
                                                                    </tr>



                                                                  </table>
                                                                </td>
                                                            </tr>
                                                       
                                                          </table>

<bR><br>
<a href=indexdl.jsp>返回</a>

<%
String sql="update dlmsg set flag=1 where id="+id;
stmt.executeUpdate(sql);
%>


<%
rs.close();
stmt.close();
con.close();
%>

</td>
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




<%}else{%>
<script language=JavaScript>{window.alert('无权查看!');window.location.href='mymessage.jsp'}</script>
<%
}
%>






</TD></TR></TBODY></TABLE><IMG 
height=10 src="images/bottom.gif" width=778><BR>

<%@ include file="end.jsp"%>
</BODY></HTML>
