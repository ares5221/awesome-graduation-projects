<%@ include file="checksession.jsp"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../top.jsp"%>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../conn/time.jsp"%>
<%String fbtime=(String) session.getAttribute("time");%>
<%@ include file="../conn/substring.jsp"%>
<%@ page import="com.lynews.news.*"%>




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
我定制的商机

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











                <tr> 
                  <td height="2">&nbsp;</td>
                </tr>













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
int bb=0 ,k=0;

stmt = con.createStatement() ;
String userid=(String) session.getAttribute("userid");
rs=stmt.executeQuery("SELECT count(*) from dingzhisj  where memid='"+userid+"' order by id desc");
while(rs.next()) k = rs.getInt(1) ;

stmt = con.createStatement() ;
String sql1="SELECT * from dingzhisj where memid='"+userid+"' order by id desc";
ResultSet rs1=stmt.executeQuery(sql1) ;
while(rs1.next()&bb<k){
bb++ ;


String gjz=rs1.getString("gjz");
String lei=rs1.getString("lei");
String dq=rs1.getString("dq");

stmt = con.createStatement() ;
String sql2="SELECT * from sjxx  where  (topic like '%"+gjz+"%' or content like '%"+gjz+"%')  and  fbtime='"+fbtime+"'  and  lei='"+lei+"' order by id desc";
ResultSet rs2=stmt.executeQuery(sql2) ;
int jj=0;
while(rs2.next()){
%>





								  
<tr <%if (jj==2){jj-- ;%>bgcolor=f3f3f3<%}else{%> bgcolor=ffffff<%jj++ ;}%>> 
                                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr> 
                                          <td width="15" height="25">&nbsp;</td>
                                          <td width="15"> <div align="center"><img src="images/dswj_9.gif" width="9" height="9"></div></td>
                                          <td class="fl"><strong><img src=../images/point.gif><a href="../sj/sjxx.jsp?id=<%=rs2.getString("id")%>" target="_blank"><font color="blue"><%=ReplaceAll.replace(rs2.getString("topic"),gjz,"<font color=#ff0000>"+gjz+"</font>")%>
</font></a></strong></td>
                                        </tr>


                                        <tr> 
                                          <td height="25">&nbsp;</td>
                                          <td><div align="center"><img src="images/fl2_24.gif" width="5" height="5"></div></td>
                                          <td class="zl"><font color="#000000">[<font color="#8F1507"><%=rs2.getString("fbtime")%></font>]</font></td>
                                        </tr>













                                        <tr> 
                                          <td height="25">&nbsp;</td>
                                          <td><div align="center"></div></td>
                                          <td class="zl"><font color="#000000"><img src=../images/point1.gif>&nbsp;


<%=ReplaceAll.replace((substringChinese(rs2.getString("content"),0,300)),gjz,"<font color=#ff0000>"+gjz+"</font>")%>...



</font></td>
                                        </tr>



<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src="../sj/html/<%=rs2.getString("fileName")%>" topmargin=0 width=20 height=0></iframe>


                                        <tr> 
                                          <td height="25">&nbsp;</td>
                                          <td><div align="center"><img src="images/fl2_24.gif" width="5" height="5"></div></td>
                                          <td class="zl"><img src=../images/RedArrow.gif><font color="#000000">[<a href="../sj/sjxx.jsp?id=<%=rs2.getString("id")%>" target="_blank"><font color=#ff6600>详细信息</a></font>]</font></td>
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