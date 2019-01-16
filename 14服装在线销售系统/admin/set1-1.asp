<!--#include file="conn.asp"--><%
dim title,nope,bottomstr

title=Trim(Request.Form("title"))
nope=Trim(Request.Form("nope"))
bottomstr=Trim(Request.Form("bottomstr"))

sql="select * from aboutus"
rs.open sql,conn,1,3

if(not rs.eof) then
	rs("title")=title
	rs("contents")=nope
	rs("bottomstr")=bottomstr
	rs.update
else
	rs.addnew
	rs("title")=title
	rs("contents")=nope
	rs("bottomstr")=bottomstr
	rs.update
end if
rs.close

Response.Write("�޸ĳɹ�")
response.end
%>