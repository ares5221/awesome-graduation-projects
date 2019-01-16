<!--#include file="conn.asp"--><%
dim n,id

n=Trim(Request("num"))
id=Trim(Request("id"))
if(isnumeric(id) and isnumeric(n)) then
	sql="select * from dingdan where id="&id
	rs.open sql,conn,1,3
	if(not rs.eof) then
		rs("productnum")=n
		rs.update
	end if
	rs.close
end if

response.redirect "ddcx.asp"
response.end
%>