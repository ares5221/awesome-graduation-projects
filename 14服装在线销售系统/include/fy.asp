<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" align="center" valign="middle">共 <%=allcounts%> 条　<%
	dim filename
	filename=Request.ServerVariables("SCRIPT_NAME")
	filename=mid(filename,InStrRev(filename,"/")+1,len(filename))
	if(pages=1) then
		Response.Write("首页")
	else
		Response.Write("<a href='"&filename&"?pages="&pages&"&act="&act&"'>首页</a>")
	end if
	%>　<%
	if(pages=1) then
		Response.Write("上一页")
	else
		Response.Write("<a href='"&filename&"?pages="&pages-1&"&act="&act&"'>上一页</a>")
	end if
	%>　<%
	if(pages=maxpages) then
		Response.Write("下一页")
	else
		Response.Write("<a href='"&filename&"?pages="&pages+1&"&act="&act&"'>下一页</a>")
	end if
	%>　<%
	if(pages=maxpages) then
		Response.Write("尾页")
	else
		Response.Write("<a href='"&filename&"?pages="&maxpages&"&act="&act&"'>尾页</a>")
	end if
	%>　页次：<%=pages%>/<%=maxpages%>页  <%=counts%>条/页</td>
  </tr>
</table>