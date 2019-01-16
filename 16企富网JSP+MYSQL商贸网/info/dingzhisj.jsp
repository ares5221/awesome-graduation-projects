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
<td class="zl"><strong><font color="#1F69A0">定制商机</font></strong>
</td>
</tr>
</table></td>
</tr>


<tr> 
<td height="18">

<form action="dingzhisjok.jsp" method="post"  name="Form1" >
商机关键字(如"<font color=red>机械</font>")简短为妙:<INPUT size=13 name=gjz id=gjz>&nbsp;&nbsp;&nbsp;&nbsp;
<select name="lei" id="lei">                 
<OPTION  selected>==选择类型==</OPTION> 
<option value="1">供应信息</option>
<option value="2">求购信息</option>
<option value="3">代理信息</option>
<option value="4">合作信息</option>
</select>&nbsp;&nbsp;&nbsp;&nbsp;



<input type="button"  value="定制"  style="left: auto;clip:  rect(auto 1px auto auto);border: 1 double #ff0000;"  onclick="check()"></form>
</td>
</tr>


                                                            <tr> 
                                                              <td height="18" valign="top"> 

                                                               
						
                                                                  <table width="521" border="0" cellpadding="3" cellspacing="1" bgcolor="A8A8A9"><font color=red>以下是您已定制的商机类型</font>








 <tr bgcolor="#FFFFFF"> 
                                                                      <td height="30" colspan="7" bgcolor="#FFFFFF" class="zl"> 
                                                                        <div align="center">
                                                                          <table width="500" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr> 
                                                                                
                                                                              <td width="100%"><div align="right" class=C>
                                                                                  
<A href=mysj.jsp  target="_blank">今日共有<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=how.jsp topmargin=0 width=40 height=13></iframe>条符合您的商机</a>
                                                                                </div></td>
                                                                            </tr>
                                                                          </table>
                                                                        </div></td>
                                                                    </tr>







































                                                                    <tr bgcolor="EAECED" class="zl"> 
                                                           
                                                                      <td width="60" bgcolor="EAECED"><div align="center"><strong><font color="#333333">定制类型</font></strong></div></td>         
                                                                      <td width="100"><div align="center"><strong><font color="#333333">定制信息关键字</font></strong></div></td>
                                                                      
                                                                      <td width="51" bgcolor="EAECED"><div align="center"><strong><font color="#333333">操作</font></strong></div></td>
</tr>





<%
String userid=(String) session.getAttribute("userid");
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from dingzhisj where memid='"+userid+"' order by id desc");
String pages = request.getParameter("page") ;
int pageInt =  1 ,i=0 ;
if(pages==null){}else{pageInt = Integer.parseInt(pages);}
while(i<20*(pageInt-1)&&rs.next()){i++ ;}
i=0;
while(rs.next()&i<20){
i++ ;
%>







                                                                    <tr bgcolor="#FFFFFF"> 
                                                                 
                                                                      <td height="30" bgcolor="#FFFFFF" class="zl"><div align="center"><font color="#CC3300">


<%if (rs.getString("lei").compareTo("1")==0){out.print("供应");}%>
<%if (rs.getString("lei").compareTo("2")==0){out.print("求购");}%>
<%if (rs.getString("lei").compareTo("3")==0){out.print("代理");}%>
<%if (rs.getString("lei").compareTo("4")==0){out.print("合作");}%>


</font></div></td>
                                                                      <td class="zl"> 
                                                                        <div align="center"><font color="red">


<%=rs.getString("gjz")%>
                                                                          

                                                                          </font></a></div></td>
                                                                 
                                                                      <td class="zl"> 
                                                                        <div align="center"><a href="deldingzhi.jsp?id=<%=rs.getString("id")%>" class="zllink"><font color="#333333">删除</font></a></div></td>
                                                                    </tr>
                                                                






                               
<%
}
%>
   









                                                                    <tr bgcolor="#FFFFFF"> 
                                                                      <td height="30" colspan="7" bgcolor="#FFFFFF" class="zl"> 
                                                                        <div align="center">
                                                                          <table width="500" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr> 
                                                                                
                                                                              <td width="100%"><div align="right">
                                                                                  
                                                                                </div></td>
                                                                            </tr>
                                                                          </table>
                                                                        </div></td>
                                                                    </tr>


<%
rs=stmt.executeQuery("SELECT count(*) from dingzhisj  where memid='"+userid+"' order by id desc");
while(rs.next()) i = rs.getInt(1) ;
%>





                                                                    <tr bgcolor="#FFFFFF">
                                                                      <td height="30" colspan="7" bgcolor="#FFFFFF" class="zl"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                          <tr> 
                                                                            <td width="100%" align=right><font size="2">

<font color="#000000">总共</font><font color="#FF0000"><%=i%></font><font color="#000000">条信息</font> 
共<font color="#000000"><%=(i+20)/20%>页</font>&nbsp;&nbsp;当前为<font color="#000000">第</font><font color="#FF0000"><%=pageInt%></font><font color="#000000">页</font> &nbsp;&nbsp;转到第&nbsp;<%for(int j=1;j<(i+40)/20;j++){%><a href="dingzhisj.jsp?page=<%=j%>"><font color=red><%=j%></font></a>&nbsp;<%}%>页
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
















<script LANGUAGE="JavaScript">
function check()
{

 if (document.Form1.gjz.value == "")        
  {        
    alert("请输入商机关键字(如:机械)");        
    document.Form1.gjz.focus();        
    return (false);        
  } 

  if (document.Form1.lei.value == "")        
  {        
    alert("请选择商机类型");        
    document.Form1.lei.focus();        
    return (false);        
  } 
    document.Form1.submit()
}
</script>




</TD></TR></TBODY></TABLE><IMG 
height=10 src="images/bottom.gif" width=778><BR>

<%@ include file="end.jsp"%>
</BODY></HTML>