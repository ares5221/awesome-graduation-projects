<!--#include file="conn.asp"--><%
dim id
id=Trim(Request.Form("id"))
id=replace(id,"' ","")
if(id<>"") then
	sql="delete from userinfo where id in ("&id&")"
	conn.execute(sql)
end if
response.redirect "set6.asp"
response.end
%>