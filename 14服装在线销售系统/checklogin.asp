<!--#include file="conn.asp"--><%
dim u,p
u=Trim(Request.Form("uname"))
p=Trim(Request.Form("upass"))

sql="select * from userinfo where username='"&u&"' and userpass='"&p&"'"
rs.open sql,conn,1,1

if(not rs.eof) then
	session("UserLogin")=u
end if
rs.close

response.redirect "default.asp"
response.end
%>