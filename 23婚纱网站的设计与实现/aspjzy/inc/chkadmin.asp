<!--¼ì²éµÇÂ¼-->
<%
if Session("admin")="" then
	Response.Write("<script>alert('ÇëµÇÂ¼');top.location='index.asp'</script>")
	Response.End()
end if
%>