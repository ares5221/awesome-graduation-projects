<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="top.jsp"%>



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








<table width="521" border="0" cellspacing="0" cellpadding="0">
                                                                 


<tr> 
<td height="24" bgcolor="E4E6E7"><table width="521" border="0" cellspacing="0" cellpadding="0">
<tr> 
<td width="30"><img src="../images/pointi.gif" ></td>
<td class="zl"><strong><font color="#1F69A0">正常营业分站</font></strong>
</td>
</tr>
</table></td>
</tr>
<tr> 
<td height="18">&nbsp;</td>
</tr>
















                                                            <tr> 
                                                              <td height="18" valign="top"> 

                                                                <form name="form1" method="post" action="cfsj.jsp">
						
                                                                  <table width="521" border="0" cellpadding="3" cellspacing="1" bgcolor="A8A8A9">
                                                                    <tr bgcolor="EAECED" class="zl"> 
                                                                      <td width="80"><div align="center"><strong><font color="#333333">代理地区</font></strong></div></td>
                                                                      <td width="80"><div align="center"><strong><font color="#333333">代理帐号</font></strong></div></td>
                                                                      <td width="60" bgcolor="EAECED"> 
                                                                        <div align="center"><strong><font color="#333333">营业时间</font></strong></div></td>
<td width="40" bgcolor="EAECED"><div align="center"><strong><font color="#333333">修改</font></strong></div></td>
<td width="40" bgcolor="EAECED"><div align="center"><strong><font color="#333333">无权</font></strong></div></td>
<td width="80" bgcolor="EAECED"><div align="center"><strong><font color="#333333">其下会员</font></strong></div></td>
</tr>





<%
String userid=(String) session.getAttribute("userid");
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from dl where flag=1 order by id desc");
String pages = request.getParameter("page") ;
int pageInt =  1 ,i=0 ;
if(pages==null){}else{pageInt = Integer.parseInt(pages);}
while(i<20*(pageInt-1)&&rs.next()){i++ ;}
i=0;
while(rs.next()&i<20){
i++ ;
%>







                                                                    <tr bgcolor="#FFFFFF"> 
                                                                        
                                                                      <td class="zl"> 
                                                                        <div align="center"><font color="#333333">
<a href=../www/index.jsp?Did=<%=rs.getString("id")%> target=_blank><%=rs.getString("dldq")%></a>
</font></div></td>
                                                                      <td class="zl"> 
                                                                        <div align="center"><a href="../www/law.jsp?id=<%=rs.getString("id")%>" target="_blank" class="zllink"><font color="#333333">
<%=rs.getString("dlname")%>
</font></a></div></td>
                                                                      <td class="zl"> 
                                                                        <div align="center"><font color="#333333"><%=rs.getString("regtime")%></font></div></td>
                                                                      <td class="zl"><div align="center"><a href="modidl.jsp?id=<%=rs.getString("id")%>" class="zllink"><font color="#333333">操作</font></a></div></td>
                                                                      <td class="zl"><div align="center"><a href="stopdl.jsp?id=<%=rs.getString("id")%>" class="zllink"><font color="#333333">操作</font></a></div></td>
                                                                      <td class="zl"><div align="center"><a href="thedlmem.jsp?dlid=<%=rs.getString("id")%>" class="zllink"><font color="#333333">查看</font></a></div></td>
                                                                    </tr>
                                                                






                               
<%
}
%>
   









                                                                    <tr bgcolor="#FFFFFF"> 
                                                                      <td height="30" colspan="7" bgcolor="#FFFFFF" class="zl"> 
                                                                        <div align="center">
                                                                          <table width="500" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr> 
                                                                            
                                                                              <td width="39"><div align="right">
                                                                                  
                                                                                </div></td>
                                                                            </tr>
                                                                          </table>
                                                                        </div></td>
                                                                    </tr>


<%
rs=stmt.executeQuery("SELECT count(*) from dl where flag=1 order by id desc");
while(rs.next()) i = rs.getInt(1) ;
%>





                                                                    <tr bgcolor="#FFFFFF">
                                                                      <td height="30" colspan="7" bgcolor="#FFFFFF" class="zl"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                          <tr> 
                                                                            <td width="100%" align=right><font size="2">

<font color="#000000">总共</font><font color="#FF0000"><%=i%></font><font color="#000000">条信息</font> 
共<font color="#000000"><%=(i+20)/20%>页</font>&nbsp;&nbsp;当前为<font color="#000000">第</font><font color="#FF0000"><%=pageInt%></font><font color="#000000">页</font> &nbsp;&nbsp;转到第&nbsp;<%for(int j=1;j<(i+40)/20;j++){%><a href="yesdl.jsp?page=<%=j%>"><font color=red><%=j%></font></a>&nbsp;<%}%>页
                                                                                </font></div></td>
                                                                          </tr>
                                                                        </table></td>
                                                                    </tr>
                                                                  </table> </td>
                                                            </tr>
                                                       
                                                          </table>



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


</TD></TR></TBODY></TABLE><IMG 
height=10 src="images/bottom.gif" width=778><BR>

<%@ include file="end.jsp"%>
</BODY></HTML>
