<!--#include file="conn.asp"--><%
dim uname,upass,uclass
uname=Trim(Request.Form("uname"))
upass=Trim(Request.Form("upass"))

sql="select * from userinfo where username='"&uname&"' and userpass='"&upass&"'"

rs.open sql,conn,1,1

if(not rs.eof) then
	response.redirect "main.asp"
	response.end
else
	response.redirect "default.asp"
	response.end
end if
%>