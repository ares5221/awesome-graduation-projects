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








<table width="522" border="0" cellspacing="0" cellpadding="0">
                                                                 


<tr> 
<td height="24" bgcolor="E4E6E7"><table width="500" border="0" cellspacing="0" cellpadding="0">
<tr> 
<td width="30"><img src="../images/pointi.gif" ></td>
<td class="zl"><strong><font color="#1F69A0">管理商机</font></strong>
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
                                                             <td width="30" height="30" bgcolor="EAECED"> 
                                                                        <div align="center"><font color=red>全选操作</font></div></td>
                                                                      <td width="45" bgcolor="EAECED"><div align="center"><strong><font color="#333333">类型</font></strong></div></td>         
                                                                      <td width="191"><div align="center"><strong><font color="#333333">信&nbsp;息&nbsp;主&nbsp;题</font></strong></div></td>
                                                                      <td width="70" bgcolor="EAECED"> 
                                                                        <div align="center"><strong><font color="#333333">发布时间</font></strong></div></td>
                                                                      <td width="50" bgcolor="EAECED"><div align="center"><strong><font color="#333333">修改</font></strong></div></td>
                                                                      <td width="51" bgcolor="EAECED"><div align="center"><strong><font color="#333333">操作</font></strong></div></td>
</tr>





<%
String userid=(String) session.getAttribute("userid");
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from sjxx  order by id desc");
String pages = request.getParameter("page") ;
int pageInt =  1 ,i=0 ;
if(pages==null){}else{pageInt = Integer.parseInt(pages);}
while(i<20*(pageInt-1)&&rs.next()){i++ ;}
i=0;
while(rs.next()&i<20){
i++ ;
%>







                                                                    <tr bgcolor="#FFFFFF"> 
                                                                      <td height="30" bgcolor="#FFFFFF" class="zl"> 
                                                                        <div align="center"> 
<input name="id" type="checkbox" id="id" value="<%=rs.getString("id")%>">
                                                                        </div></td>
                                                                      <td height="30" bgcolor="#FFFFFF" class="zl"><div align="center"><font color="#CC3300">


<%if (rs.getString("lei").compareTo("1")==0){out.print("供应");}%>
<%if (rs.getString("lei").compareTo("2")==0){%>求购<%if (rs.getString("fast").compareTo("1")==0){out.print("<font color=red>！</font>");}%><%}%>
<%if (rs.getString("lei").compareTo("3")==0){out.print("代理");}%>
<%if (rs.getString("lei").compareTo("4")==0){out.print("合作");}%>


</font></div></td>
                                                                      <td class="zl"> 
                                                                        <div align="center"><a href="../../sj/sjxx.jsp?id=<%=rs.getString("id")%>" target="_blank" class="zllink"><font color="#333333">


<%=rs.getString("topic")%>
                                                                          

                                                                          </font></a></div></td>
                                                                      <td class="zl"> 
                                                                        <div align="center"><font color="#333333"><%=rs.getString("fbtime")%></font></div></td>
                                                                      <td class="zl"><div align="center"><a href="xgsj.jsp?id=<%=rs.getString("id")%>" class="zllink"><font color="#333333">修改</font></a></div></td>
                                                                      <td class="zl"> 
                                                                        <div align="center"><a href="delsj.jsp?id=<%=rs.getString("id")%>" class="zllink"><font color="#333333">删除</font></a></div></td>
                                                                    </tr>
                                                                






                               
<%
}
%>
   









                                                                    <tr bgcolor="#FFFFFF"> 
                                                                      <td height="30" colspan="7" bgcolor="#FFFFFF" class="zl"> 
                                                                        <div align="center">
                                                                          <table width="500" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr> 
                                                                              <td width="133" align=left><input name="qx" type="checkbox" id="qx" value="checkbox" onClick="vbscript:qqq">全选&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="重发"  style="left: auto;clip:  rect(auto 1px auto auto);border: 1 double #ff0000;" ></form>

</td>
                                                                            
                                                                              <td width="39"><div align="right">
                                                                                  
                                                                                </div></td>
                                                                            </tr>
                                                                          </table>
                                                                        </div></td>
                                                                    </tr>


<%
rs=stmt.executeQuery("SELECT count(*) from sjxx order by id desc");
while(rs.next()) i = rs.getInt(1) ;
%>





                                                                    <tr bgcolor="#FFFFFF">
                                                                      <td height="30" colspan="7" bgcolor="#FFFFFF" class="zl"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                          <tr> 
                                                                            <td width="100%" align=right><font size="2">

<font color="#000000">总共</font><font color="#FF0000"><%=i%></font><font color="#000000">条信息</font> 
共<font color="#000000"><%=(i+20)/20%>页</font>&nbsp;&nbsp;当前为<font color="#000000">第</font><font color="#FF0000"><%=pageInt%></font><font color="#000000">页</font> &nbsp;&nbsp;转到第&nbsp;<%for(int j=1;j<(i+40)/20;j++){%><a href="glsj.jsp?page=<%=j%>"><font color=red><%=j%></font></a>&nbsp;<%}%>页
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


<script language="VBScript">
sub qqq

if document.form1.qx.checked then
for i=0 to document.getelementsbyname ("id" ).length-1
document.getelementsbyname ("id" )(i).checked=document.form1.qx.checked
next
end if

if not document.form1.qx.checked then
for i=0 to document.getelementsbyname ("id" ).length-1
document.getelementsbyname ("id" )(i).checked=document.form1.qx.checked
next
end if

end sub
</script>




</TD></TR></TBODY></TABLE><IMG 
height=10 src="images/bottom.gif" width=778><BR>

<%@ include file="end.jsp"%>
</BODY></HTML>
