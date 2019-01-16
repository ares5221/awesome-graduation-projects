 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <%
sql="select * from hw order by hw_buys DESC limit 0,11";
rs=mdb.executeQuery(sql);
if(!rs.next())
{
out.print("本站目前没有成交任何商品");
 }else
{
rs.previous();
i=0;
int hw_id,daili;
String hw_name;
while(rs.next()&i<=10){
	hw_id=rs.getInt("hw_id");
	hw_name=rs.getString("hw_name");
	daili=rs.getInt("daili");
                  %>
                                   
                                      <tr> 
                                        <td width="70%" height="22" bgcolor="#ECECEC">&nbsp; 
                                          <a href="views.jsp?hw_id=<%=hw_id%>"><%=hw_name%></a></td>
                                        <td width="30%" bgcolor="#ECECEC"><%=daili%></td>
                                      </tr>
                                    
                                    <%
    i=i+1;                                                   
     
      }
}

 %>                                 </table>