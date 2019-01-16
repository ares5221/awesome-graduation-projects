<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td>　</td>
              </tr>
              <tr> 
                <td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" height="18">
                    <tr> 
                      <td align="center"> <img border="0" src="img/promo_list_top.gif" width="100%" height="4"></td>
                    </tr>
                    <tr> 
                      <td align="center" height="20" bgcolor="#989DA5"> <b>站内公告</b></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#ECECEC"> 
                        <% 
 int i=0;
sql="select * from pub order by ID DESC";
rs=mdb.executeQuery(sql);
if(!rs.next())
 {
            %>
                        <p style="margin:0 5; ">暂无公告<br>
                          <%
 }
else{

  rs.previous();
  while(rs.next())
  {
			i=i+1;
			%>
                        <p style="margin:5; "><b><%=rs.getString("title")%></b><br>
                          <%=rs.getString("msg")%> <br>
                          <%=rs.getDate("date")%></p>
                        <%
   if(i>=3){
   break;
   } 

  }
}

%>
                      </td>
                    </tr>
                  </table></td>
              </tr>
              <tr> </table>