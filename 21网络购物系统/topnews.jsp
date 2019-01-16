<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <!--DWLayoutTable-->
                                <tr> 
                                  <td width="107" height="74">&nbsp;</td>
                                  <td width="165" align="center" valign="top"> 
                                    <table width="165" border="0" cellspacing="0" cellpadding="0">
                                      <!--DWLayoutTable-->
                                      <tr> 
                                        <td valign="top" align="center" bgcolor="#FFFFFF"> 
                                          　</td>
                                      </tr>
                                      <tr> 
                                        <td valign="top" align="center"> <img border="0" src="img/promo_list_top.gif" width="100%" height="4"></td>
                                      </tr>
                                      <tr> 
                                        <td valign="top" align="center" bgcolor="#989DA5">最新新闻</td>
                                      </tr>
                                      <tr> 
                                        <td valign="top"> 
                                          <%              
sql="select * from news order by news_id DESC limit 0,10" ;
rs=mdb.executeQuery(sql);
if(!rs.next())
{
  out.print("暂且没有新闻");         
}else
{ rs.previous();      
   while(rs.next()){
   %>
                                          <img src="img/dot.gif" width="15" height="15"> 
                                          <a href="news.jsp?news_id=<%=rs.getInt("news_id")%>" target="_blank"><%=rs.getString("news_title")%></a> 
                                          <br> 
                                          <%           
   }        
}       
         
  
                %>
                                        </td>
                                      </tr>
                                      <tr> 
                                        <td valign="top" align="right"> <a href="allnews.jsp" target="_blank"><img src="img/pics/more.gif" width="45" height="10" border="0"></a></td>
                                      </tr>
                                    </table></td>
                                  <td width="107">&nbsp;</td>
                                </tr>
                              </table>