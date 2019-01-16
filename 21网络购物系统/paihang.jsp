<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td valign="top" align="center"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td height="3"></td>
                                </tr>
                              </table>
                              <table width="165" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td align="center"> <img border="0" src="img/promo_list_top.gif" width="100%" height="4"></td>
                                </tr>
                                <tr> 
                                  <td align="center" bgcolor="#989DA5">销售排行</td>
                                </tr>
                                <tr> 
                                  <td  align="center">
								   <%@include file="paihang2.jsp"%>
                                  </td>
                                </tr>
                                <tr> 
                                  <td> </td>
                                </tr>
                              </table>
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td> </td>
                                </tr>
                              </table>
                              
                              <!-- --------------------------友情链接----------------------------------------------->
                              <table width="165" border="0" cellspacing="0" cellpadding="0" height="18" style="border-collapse: collapse" bordercolor="#111111">
                                <tr> 
                                  <td align="center" bgcolor="#FFFFFF">
								  <!----------------------------------------最新新闻----------------------------------------------->
								        <%@ include file="topnews.jsp"%>　
									  <!-----------------------------最新新闻结束------------------------------------>	
										</td>
                                </tr>
                                <tr> 
                                  <td align="center"><img border="0" src="img/promo_list_top.gif" width="100%" height="4"></td>
                                </tr>
                                <tr> 
                                  <td align="center" height="20" bgcolor="#989DA5"> 
                                    <b>友情链接</b></td>
                                </tr>
                                <tr> 
                                  <td bgcolor="#ECECEC"> <p style="line-height:150%" align=center> 
                                      <%      
sql="select * from ad order by bs";
rs=mdb.executeQuery(sql);
String url;
String wordlink;
      while (rs.next())
	  {
	  
     out.print("<a href="+rs.getString("url").trim()+" target=_blank>"+rs.getString("wordlink").trim()+"</a><br>");
      }
      
     
      %>
                                    </p></td>
                                </tr>
                              </table>
                              <!---------------------------------友情链接结束----------------------------------------------->
                            </td>
                          </tr>
                        </table>