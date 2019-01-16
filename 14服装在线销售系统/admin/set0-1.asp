<!--#include file="conn.asp"--><%
dim links
links=Request.Form("links")

sql="select * from aboutus"
rs.open sql,conn,1,3

if(not rs.eof) then
	rs("links")=links
	rs.update
else
	rs.addnew
	rs("links")=links
	rs.update
end if
rs.close

Response.Write("�޸ĳɹ�")
response.end
%>