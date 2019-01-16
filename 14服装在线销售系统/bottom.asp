<%
sql="select top 1 * from aboutus"
rs.open sql,conn,1,1

if(not rs.eof) then
%>
<table width="100%" height="100" border="0" cellpadding="0" cellspacing="0" background="images/bottom.jpg">
  <tr>
    <td align="center" valign="middle"><%=rs("title")%>¡¡&copy;°æÈ¨ËùÓĞ<br />
	<%=rs("bottomstr")%>
	</td>
  </tr>
</table><%
	Response.Write("<script language='javascript'>")
	Response.Write("document.title='"&rs("title")&"';")
	Response.Write("</script>")
end if
rs.close
%>
