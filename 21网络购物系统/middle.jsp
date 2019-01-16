    <table><tr><td height="118"> 
<%
 sql="select  * from logo  ";
 rs=mdb.executeQuery(sql);
 if(!rs.next())
 {
			        
   out.print("暂且没有广告");         
}else{
%>
  <a href="<%=rs.getString("url")%>"target="_blank"><img src="<%=rs.getString("banner")%>" width="395" height="118" border="0"></a>
                                </p>
<%
}
%>
<!---产品显示-->
 <table width="100%" border="0" cellspacing="0" cellpadding="0" height="60">
    <tr> 
       <td colspan="2"> 
          <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="151" id="AutoNumber1" height="20" background="img/fu.gif">
               <tr>
                    <td align="center" width="82"><b>精品推荐</b></td>
                    <td align="center">　</td>
               </tr>
          </table>
       </td>
   </tr>
   <tr> 
       <td> 
           <tr> 
<%
sql="select * from hw where tuijian=-1 order by hw_id DESC limit 0,10";
rs=mdb.executeQuery(sql);
if(!rs.next())
{
            %>
                  <td width="128" valign="top" align="left" bgcolor="#FFFFFF"><div align="center">
                        暂且没有推荐商品<br></div>
                 </td>
 <%
 }
i=0;
 while(rs.next())
 {
   i=i+1;
%>
                <td align="left" bgcolor="#FFFFFF"> 
                      <table width="147" border="0" align="center" cellpadding="3" cellspacing="0">
                          <tr> 
                              <td valign="bottom" width="285"> 
                                  <div align="center">
                    <table width="200" border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse" bordercolor="#111111">
                      <tr> 
                        <td valign="bottom" align="center">商品名称:<%=rs.getString("hw_name")%></td>
                      </tr>
                      <tr> 
                        <td align="center"><a href="views.jsp?hw_id=<%=rs.getInt("hw_id")%>">
                        <img border="0" src="<%=rs.getString("hw_pic")%>" width="114" height="83" vspace="6"></a></td>
                      </tr>
                      <tr> 
                        <td align="center">会员价：<%=rs.getInt("hw_cash")%>元</td>
                      </tr>
                      <tr> 
          
                           <table width="100%" border="0" cellspacing="0" cellpadding="0" height="60">
                       <tr> 
                           <td colspan="2"> 
                             <table border="0" cellpadding="0" cells          <td valign="top" align="center">
                                      <a target="_blank" href="views.jsp?hw_id=<%=rs.getInt("hw_id")%>">详情</a> 
                                      <a href='javascript:openbag(<%=rs.getInt("hw_id")%>)'>定购<img border="0" src="img/order.gif"></a></td>
                                           </tr>
                             </table>
                                       </div>
                                  </td>
                            </tr>
                            <tr> 
                                    <td  height="1" width="285"></td>
                            </tr>
                    </table>
          </td>
          <%
		if(i%2==0&i>=2)
		{
%>
        </tr>
        <tr> 
          <%
         }
	if(i>=10) {
	   break;
	   }
}

%>
        </tr>
      </table>
<!- 产品显示结束-->
    </td>
	</tr></table>