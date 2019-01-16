<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="top.jsp"%>


<%
int id = Integer.parseInt((String)request.getParameter("id"));
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from message where id="+id);
rs.next();
%>

<%
int  userid=Integer.parseInt((String) session.getAttribute("userid"));
if (userid==Integer.parseInt((String) rs.getString("recemem"))){%>







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
<td class="zl"><strong><font color="#1F69A0">查看留言</font></strong></td><td align=right>留言时间:<%=rs.getString("sendtime")%></td>
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




<%String mtopic=rs.getString("mtopic");%>







                                                                    <tr bgcolor="#FFFFFF"> 
                                                                      <td height="30" bgcolor="#FFFFFF" class="zl"> 
                                                                        <div align="left"> 

<%=rs.getString("mtext")%>





                                                                        </div></td>
                                                                     
                                                                    </tr>
                                                                











                                                                    <tr bgcolor="#FFFFFF"> 
                                                                      <td height="30" colspan="7" bgcolor="#FFFFFF" class="zl"> 
                                                                        <div align="center">
                                                                          <table width="500" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr> 
                                                                              <td width="133" align=left>[留言人]:<%=rs.getString("sendmem")%></td>

<%String oo=(String)rs.getString("sendmem");
if(oo.equals("管理员")){}else{
rs=stmt.executeQuery("SELECT * from qyml where username='"+oo+"'");
rs.next();
}%>   


<%if(oo.equals("管理员")){%><td><a href="javascript:document.adv.content.focus();"><img src=../images/replymsg.gif border=0></a></td><%}else{%>
 <td width="228"><div align="left"> 
 

<a href=addfriend.jsp?friendid=<%=rs.getString("id")%>&friendname=<%=rs.getString("username")%>&friendcompany=<%=rs.getString("qymc")%>><img src=../images/addfriend.gif border=0></a>


                                                                                </div></td>
                                                                              <td width="39"><div align="right">
<a href=replymsg.jsp?recemem=<%=rs.getString("id")%>&mtopic=<%=mtopic%>><img src=../images/replymsg.gif border=0></a>
                                                                                </div></td>


<%}%>


                                                                            </tr>
                                                                          </table>
                                                                        </div></td>
                                                                    </tr>



                                                                  </table>
                                                                </td>
                                                            </tr>
                                                       
                                                          </table>

<bR><br>
<a href=mymessage.jsp>返回</a>

<%
String sql="update message set flag=1 where id="+id;
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
