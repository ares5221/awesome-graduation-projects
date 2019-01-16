<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ECECEC" style="border-collapse: collapse" bordercolor="#111111">
                <tr> 
                  <td height="18"> <table width="100%" border="0" cellspacing="0" cellpadding="0" height="23">
                      <tr> 
                        <td align="center" height="4"> <img border="0" src="img/promo_list_top.gif" width="100%" height="4"></td>
                      </tr>
                      <tr> 
                        <td align="center" height="19" bgcolor="#989DA5"> <b>商品分类</b></td>
                      </tr>
                    </table></td>
                </tr>
                <tr> 
                  <td valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse" bordercolor="#111111" height="16">
                            <tr> 
                              <td height="16" valign="top"> 
                                <%
	sql="select * from sort";
	rs=mdb.executeQuery(sql);
	if(!rs.next()){
		out.print("没有任何分类"); 
		}
	else 
	{
		rs.previous();
	  while(rs.next()) 
	   {
%>
                                <table cellspacing=0 cellpadding=0 width=95% background="" 
                  border=0>
                                  <tbody>
                                    <tr height=22> 
                                      <td width=34 align="center"><img 
                      src="img/dot.gif" width="15" height="15"></td>
                                      <td width="124"><a href="sort.jsp?sort_id=<%=rs.getInt("sort_id")%>"><u><%=rs.getString("sort_name")%></u></a></td>
                                    </tr>
                                  </tbody>
                                </table>
                                <% 
	   }
	
	
	}
	 
	
	
%>
                              </td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                </tr>
              </table>