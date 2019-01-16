<!--#include file="search.asp"--><br />
<table width="200" border="0" cellspacing="0" cellpadding="0" class="login">
  <tr>
    <td class="title">热点新闻</td>
  </tr><%
  sql="select top 10 * from news order by seenum desc"
  rs.open sql,conn,1,1
  
  for i=1 to 10
  if(not rs.eof) then
  %>
  <tr>
    <td><a href="info.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
  </tr><%
  rs.movenext
  else
  exit for
  end if
  next
  rs.close
  %>
</table>
<br />
<table width="200" border="0" cellspacing="0" cellpadding="0" class="login">
  <tr>
    <td class="title">销售排行</td>
  </tr><%
  sql="select top 10 * from products order by xssl desc"
  rs.open sql,conn,1,1
  
  for i=1 to 10
  if(not rs.eof) then
  %>
  <tr>
    <td><a href="pinfo.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
  </tr><%
  rs.movenext
  else
  exit for
  end if
  next
  rs.close
  %>
</table>