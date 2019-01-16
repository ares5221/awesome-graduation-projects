<!--#include file="conn.asp"--><%
dim reply,id

id=Trim(Request.Form("id"))
reply=Trim(Request.Form("reply"))

if(isnumeric(id)) then
	sql="select * from guest where id="&id
	rs.open sql,conn,1,3
	
	if(not rs.eof) then
		rs("reply")=reply
		rs("replydate")=now()
		rs.update
	end if
	rs.close
end if
response.redirect "set7.asp"
response.end
%>