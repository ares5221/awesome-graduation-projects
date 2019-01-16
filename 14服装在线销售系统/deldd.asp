<!--#include file="conn.asp"--><%
dim id
id=Trim(Request("id"))

if(isnumeric(id)) then
	sql="delete from dingdan where id="&id
	conn.execute(sql)
end if

response.redirect "ddcx.asp"
response.end
%>