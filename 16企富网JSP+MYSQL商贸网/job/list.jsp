<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../top.jsp"%>
<%@ include file="../conn/conn.jsp"%>









<BODY text=#000000 leftMargin=0 topMargin=0 
marginheight="0" marginwidth="0">
<div align="center">
<center>
<center>
<table border="0" cellspacing="0" style="border-collapse: collapse" width="750" id="AutoNumber1" cellpadding="0" height="109">
<tr>
<td width="560" valign="top">

<table border="0" width="100%" cellspacing="0" cellpadding="0" style="border-collapse: collapse" bordercolor="#111111"> 
<tr>
<TD style="color: #000; font-family: 宋体; font-size: 12px" width="533">
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="543" id="AutoNumber4" height="25">
<tr>
<td width="543" background="image/zp.gif" height="25">
<p align="right">
</td>
</tr>
</table>
</TD>
</tr>
<tr>
<TD style="color: #000; font-family: 宋体; font-size: 12px" width="533">
<center>
<TABLE cellPadding=4 width="543" 
bgColor=#FFFFFF border=1 style="border-collapse: collapse" bordercolor="#111111" bordercolorlight="#4883BD" bordercolordark="#4883BD" cellspacing="1">
<TBODY>

<TR>
<TD width=100% class="buttoncolor" >
<DIV align=center><span style="letter-spacing: 5"><font color="#ffffff"><b>
招骋信息详情</b></TD></TR>
 </table>

<TABLE cellPadding=4 width="543" 
bgColor=#FFFFFF border=1 style="border-collapse: collapse" bordercolor="#111111" bordercolorlight="#4883BD" bordercolordark="#4883BD" height="56" cellspacing="1">




<%
stmt = con.createStatement() ;
int id = Integer.parseInt((String)request.getParameter("id"));
rs=stmt.executeQuery("SELECT * from job where id="+id);
rs.next();
%>






           


                                                                    <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">招骋主题</font></a>:<FONT color=red size=2>*</FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                 <%=rs.getString("topic")%></td>
                                                                    </tr>
                                                              
                        

                                                                    <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">招骋人数</font></a>:<FONT color=red size=2>*</FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                            <%=rs.getString("jobnum")%>人</td>
                                                                    </tr>
                                                              
                        
                    
        
                                                                    <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">工作地点</font></a>:<FONT color=red size=2>*</FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                                <%=rs.getString("jobaddress")%></td>
                                                                    </tr>




                                                                    <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">招骋对象</font></a>:<FONT color=red size=2>*</FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                                                                        
招骋<%=rs.getString("lei")%></td>
                                                                    </tr>







                                                                    <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">招骋内容</font></a>:<FONT color=red size=2>*</FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                                <%=rs.getString("content")%></td>
                                                                    </tr>


</table>

<TABLE cellPadding=4 width="543" 
bgColor=#FFFFFF border=1 style="border-collapse: collapse" bordercolor="#111111" bordercolorlight="#4883BD" bordercolordark="#4883BD" height="56" cellspacing="1">


                                                                    <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">联系人</font></a>:<FONT color=red size=2></FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                              <%=rs.getString("myname")%> <iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=../info/memgrade.jsp?memid=<%=rs.getString("fbmemid")%> topmargin=0 width=65 height=15></iframe></td>


   <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">联系电话</font></a>:<FONT color=red size=2></FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                  <%=rs.getString("tel")%></td>


                                                                    <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">联系传真</font></a>:</div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                   <%=rs.getString("fax")%></td>
                                                                           <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">电子邮件</font></a>:</div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                  <%=rs.getString("email")%></td>     </tr>







                                                                    <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">联系地址</font></a>:<FONT color=red size=2></FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
<%=rs.getString("address")%>


</td>   <td align=center><a href="javascript:window.print()"><img src="../book/images/printpage.gif" border=0>打印此页</a></td><td><a href="../info/sendmsg.jsp?recemem=<%=rs.getString("fbmemid")%>&memname=<%=rs.getString("fbmem")%>" target="_blank"><img src="../images/sendmsg.gif" border="0" alt="发送留言"></a></td>                                  </tr>        






</TBODY></TABLE></center>
</TD>
</tr>
</table> 

<td width="7" height="109" valign="top" background="image/CreditDynamic_zxqy_03.gif">
　<td width="193" height="109" valign="top">
<div align="center">
<center>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="188" id="AutoNumber2">
<tr>
<TD vAlign=top width="190">


<TABLE border=0 cellPadding=0 cellSpacing=0 width="190" style="border-collapse: collapse; font-size:9pt" bordercolor="#111111">
<TBODY>
<TR>
<TD width="189" height="26" background="image/j11.gif">
&nbsp; <span style="letter-spacing: 1"><font color="#FFFFFF">
<span style="font-size: 10.5pt"><b>创业最新话题</b></span></font></span></TD></TR>
<TR>
<TD 
background=image/CreditDynamic_index_bj11.gif width="189">
<DIV align=center>
<TABLE border=0 cellSpacing=1 width="181" style="border-collapse: collapse; font-size:9pt" bordercolor="#111111" height="37">
<TBODY>

<TR>
<TD class=LL width="68" height="17">
<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=../zixun/indexzx.jsp?lei=2 topmargin=0 width=180 height=210></iframe></TD></TR>
 
<TR>
<TD height=14 width="181" colspan="3">
<DIV align=right><B><a href="../zixun/"><FONT 
color=#ff6600>&gt;&gt;&gt;更多</FONT></a></B><FONT 
color=#ff6600><B>&nbsp;</B></FONT></DIV></TD></TR></TBODY></TABLE></DIV></TD></TR>
<TR>
<TD bgColor=#527dce 
height=1 width="189"></TD></TR></TBODY></TABLE></TD>
</tr>








<TR>
<TD width="189" height="26" >
<img src=image/index_good100.jpg width=190 height=220 ></TD></TR>












</table>
</center>
</div>
<TBODY>
</TBODY></TABLE></center>
</div>
<div align="center">
<center>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="750" id="AutoNumber3">
<tr>
<td width="100%" background="../images/bt1.gif">　</td>
</tr>
</table>
</center>
</div>


















<%@ include file="../end.jsp"%>