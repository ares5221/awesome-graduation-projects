<!--#include file="conn.asp"--><%
dim id
id=Trim(Request("id"))

if(isnumeric(id)) then
	sql="delete from guest where id="&id
	conn.execute(sql)
end if

response.redirect "set7.asp"
response.end
%>