<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../top.jsp"%>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../conn/substring.jsp"%>
<%@ page import="com.lynews.news.*"%>

<%
	String lei = request.getParameter("lei");
	String dfl = request.getParameter("dfl");
	String sfl = request.getParameter("sfl");
%> 



<TABLE cellSpacing=0 cellPadding=0 width="750" align=center border=0>
        <TBODY>
        <TR>
          <TD><IMG 
             src="../images/online_768.gif" width=750 border=0></TD></TR>
</TBODY></TABLE>


<TABLE cellSpacing=0 cellPadding=0 width="750" align=center border=0>
  <TBODY>
  <TR>
    <TD bgColor=#ffffff>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=left 
      bgColor=#ff5d00 border=0>
        <TBODY>
        <TR>
          <TD bgColor=#cccccc height=6></TD></TR>
        <TR>
          <TD height=30>
            <TABLE height=30 cellSpacing=0 cellPadding=0 width=750 align=left 
            border=0>
              <TBODY>
              <TR>
                <TD align=middle align=left><strong>
            <DIV align=left><img src=../images/icon_point.gif><font color=ffffff size=3>
<a href=sjindex2.jsp?dfl=<%=dfl%>&lei=0><font color=ffffff><%=dfl%></font></a>===><%=sfl%>==><%if(Integer.parseInt((String)lei)==0){%>所有<%}%><%if(Integer.parseInt((String)lei)==1){%>供应<%}%><%if(Integer.parseInt((String)lei)==2){%>求购<%}%><%if(Integer.parseInt((String)lei)==3){%>代理<%}%><%if(Integer.parseInt((String)lei)==4){%>合作<%}%>信息

</font></strong></TD></TR></TBODY></TABLE></DIV></TD></TR>
        <TR>
          <TD background=index.files/bg_navline.gif 
      height=5></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>












<body leftmargin="0" topmargin="0">
<div align="center">
  <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 

          <tr> 
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0"  bgcolor=ffffff>

                <tr> 









<table width="100%" border="0" cellpadding="0" cellspacing="0"   class="blackbordernobottom">
<tr> 
<td <%if(Integer.parseInt((String)lei)==0){%> class="buttoncolor" <%}%> class="norightbuttonborder"><a href="search2.jsp?&lei=0&dfl=<%=dfl%>&sfl=<%=sfl%>">所有信息</a></td>
<td <%if(Integer.parseInt((String)lei)==1){%> class="buttoncolor" <%}%> class="norightbuttonborder"><a href="search2.jsp?dfl=<%=dfl%>&lei=1&sfl=<%=sfl%>">供应信息</a></td>
<td <%if(Integer.parseInt((String)lei)==2){%> class="buttoncolor" <%}%>  class="norightbuttonborder"><a href="search2.jsp?dfl=<%=dfl%>&lei=2&sfl=<%=sfl%>">求购信息</a></td>
<td <%if(Integer.parseInt((String)lei)==3){%> class="buttoncolor" <%}%>  class="norightbuttonborder"><a href="search2.jsp?dfl=<%=dfl%>&lei=3&sfl=<%=sfl%>">代理信息</a></td>
<td <%if(Integer.parseInt((String)lei)==4){%> class="buttoncolor" <%}%>  class="norightbuttonborder"><a href="search2.jsp?dfl=<%=dfl%>&lei=4&sfl=<%=sfl%>">合作信息</a></td>
</tr>
</table>







                <tr> 
                  <td height="10">&nbsp;</td>
                </tr>
                <tr> 
                  <td background="images/fl2_21.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                 
                                  





<%
stmt = con.createStatement() ;
if(Integer.parseInt((String)lei)==0){
rs=stmt.executeQuery("SELECT * from sjxx where dfl='"+dfl+"' and sfl='"+sfl+"'  and ok=1 order by id desc");
}else{
rs=stmt.executeQuery("SELECT * from sjxx where dfl='"+dfl+"' and sfl='"+sfl+"'    and lei='"+lei+"' and ok=1 order by id desc");
}
String pages = request.getParameter("page") ;
int pageInt =  1 ,i=0 ;
if(pages==null){}else{pageInt = Integer.parseInt(pages);}
while(i<20*(pageInt-1)&&rs.next()){i++ ;}
i=0;
int k =  1;
k++ ;
while(rs.next()&i<20){
i++ ;
%>



								  
<tr <%if (k==2){k-- ;%>bgcolor=f3f3f3<%}else{%> bgcolor=ffffff<%k++ ;}%>> 
                                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr> 
                                          <td width="15" height="25">&nbsp;</td>
                                          <td width="15"> <div align="center"><img src="images/dswj_9.gif" width="9" height="9"></div></td>
                                          <td class="fl"><strong><img src=../images/point.gif><a href="sjxx.jsp?id=<%=rs.getString("id")%>" target="_blank"><font color="blue"><%=rs.getString("topic")%>
</font></a></strong></td>
                                        </tr>


                                        <tr> 
                                          <td height="25">&nbsp;</td>
                                          <td><div align="center"><img src="images/fl2_24.gif" width="5" height="5"></div></td>
                                          <td class="zl"><font color="#000000">[<font color="#8F1507"><%=rs.getString("fbtime")%></font>]</font></td>
                                        </tr>













                                        <tr> 
                                          <td height="25">&nbsp;</td>
                                          <td><div align="center"></div></td>
                                          <td class="zl"><font color="#000000"><img src=../images/point1.gif>&nbsp;<%=substringChinese(rs.getString("content"),0,300)%>.....</font></td>
                                        </tr>



<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src="html/<%=rs.getString("fileName")%>" topmargin=0 width=20 height=0></iframe>


                                        <tr> 
                                          <td height="25">&nbsp;</td>
                                          <td><div align="center"><img src="images/fl2_24.gif" width="5" height="5"></div></td>
                                          <td class="zl"><img src=../images/RedArrow.gif><font color="#000000">[<a href="sjxx.jsp?id=<%=rs.getString("id")%>" target="_blank"><font color=#ff6600>详细信息</a></font>]</font></td>
                                        </tr>


<tr> 
                                          <td height="25">&nbsp;</td>
                                          <td><div align="center"><img src="images/fl2_24.gif" width="5" height="5"></div></td>
                                          <td class="zl"><br></td>
                                        </tr>




                                      </table></td>
                                  </tr>
                                  

                                  
<%
}
%>
                




                                  <tr> 
                                    <td height="25"><img src="images/fl2_23.gif" width="573" height="6"></td>
                                  </tr>
                                </table></td>
                            </tr>
                            <tr> 
                              <td height="60"><div align="right"> 
                                  <table width="98%" height="33" border="0" cellpadding="0" cellspacing="0" align=right>
                                    <tr> 
          <td bgcolor="F1F1F1"><table width="100%" border="0" cellspacing="0" cellpadding="0" align=right>
                                         



<%
if(Integer.parseInt((String)lei)==0){
rs=stmt.executeQuery("SELECT count(*) from sjxx where dfl='"+dfl+"' and sfl='"+sfl+"'  and ok=1 order by id desc");
}else{
rs=stmt.executeQuery("SELECT count(*) from sjxx where dfl='"+dfl+"' and sfl='"+sfl+"'    and lei='"+lei+"' and ok=1 order by id desc");
}
while(rs.next()) i = rs.getInt(1) ;
%>








 <tr> 
                                            <td width="10">&nbsp;</td>
                                            <td width="220" class="zl"><font color="#000000">总共</font><font color="#FF0000"><%=i%></font><font color="#000000">条信息</font> 
                                             分<font color="#000000"><%=(i+20)/20%>页</font>　当前为<font color="#000000">第</font><font color="#FF0000"><%=pageInt%></font><font color="#000000">页</font> 
                                            </td>
                                            <td width="10">&nbsp;</td>
                                            <td>
转到第<%for(int j=1;j<(i+40)/20;j++){%>&nbsp;<a href="search2.jsp?page=<%=j%>&dfl=<%=dfl%>&sfl=<%=sfl%>&lei=<%=lei%>"><font color=red><%=j%></font></a>&nbsp;<%}%>页
</td>

<td>
<%if (pageInt>1){%><a href=search2.jsp?page=<%=pageInt-1%>&dfl=<%=dfl%>&sfl=<%=sfl%>&lei=<%=lei%>><%}%>[上一页]</a>
<%int bb=(i+20)/20;%><%if (pageInt<bb){%><a href=search2.jsp?page=<%=pageInt+1%>&dfl=<%=dfl%>&sfl=<%=sfl%>&lei=<%=lei%>><%}%>[下一页]</a></td>
     


<%
rs.close();
stmt.close();
con.close();
%>








                                      
                                            <td width="10">&nbsp;</td>
                                          </tr>
                                        </table></td>
                                    </tr>
                                  </table>
                                </div></td>
                            </tr>
                          </table></td>
                        <td width="188" valign="top"> <div align="center"> 
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr> 
                                <td><div align="center"><img src=../images/fl2_12.gif></div></td>
                              </tr>
                              <tr> 
                                <td height="30"> <div align="center"></div></td>
                              </tr>
                              <tr> 
                                <td><div align="center"><img src=../images/fl2_12.gif></div></td>
                              </tr>
                              <tr> 
                                <td height="30"> <div align="center"></div></td>
                              </tr>
                              <tr> 
                                <td><div align="center"><img src=../images/fl2_12.gif></div></td>
                              </tr>
                              <tr> 
                                <td height="30"> <div align="center"></div></td>
                              </tr>
                              <tr> 
                                <td><div align="center"><img src=../images/fl2_12.gif></div></td>
                              </tr>
                              <tr> 
                                <td><div align="center"></div></td>
                              </tr>
                             
                              <tr> 
                                <td><div align="center"></div></td>
                              </tr>
                              <tr> 
                                <td><div align="center"></div></td>
                              </tr>
                            </table>
                          </div></td>
                      </tr>
                    </table></td>
                </tr>
               
              </table></td>
          </tr>
         
          <tr> 
            <td height="84"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td height="2" bgcolor="dddddd"><img src="images/spacer.gif" width="1" height="1"></td>
                </tr>
                <tr> 
                  <td height="82" valign="top" bgcolor="F1F1F1"> <div align="center"> 
                      


<%@ include file="../end.jsp"%>





 </div></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
</body>
</html>