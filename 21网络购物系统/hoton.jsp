<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="20" align="center" bgcolor="#989DA5"><b>热卖型号</b></td>
                      </tr>
                      <tr> 
                        <td> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td bgcolor="#ECECEC"> 
                                <%
							  
	
	sql="select * from hw where sort_id="+sort_id+" order by hw_buys desc limit 0,10" ;                  
	 rs=mdb.executeQuery(sql);                
	int count=0;
	if(rs!=null){
		  while(rs.next()) 
		   {
			   count++;
			   if(count>8){break;}
             out.print("<li><A href=views.jsp?hw_id="+rs.getInt("hw_id")+">"+rs.getString("hw_name")+" "+rs.getInt("hw_buys")+"</A></li>");
	                                             
	       }                                    

	}
	else{
		out.print("目前没有该种手机的热销产品"+sort_id);
	}
                                   
                                   
%>
                              </td>
                            </tr>
                          </table></td>
                      </tr>
                    </table>