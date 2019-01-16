<!--#include file="conn.asp"--><%

if(session("dingdanid")<>"" and session("UserLogin")<>"") then
	sql="update dingdan set flags=1 where name='"&session("UserLogin")&"' and dingdanid='"&session("dingdanid")&"'"
	conn.execute(sql)
end if

response.redirect "ddcx.asp"
response.end
%>