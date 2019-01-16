<!--#include file="conn.asp"--><%
dim id,title,nope

id=Trim(Request.Form("id"))
title=Trim(Request.Form("title"))
nope=Trim(Request.Form("nope"))

if(isnumeric(id)) then
	if(title<>"") then
		sql="select * from news where id="&id
		rs.open sql,conn,1,3
		
		if(not rs.eof) then
			rs("title")=title
			rs("nope")=nope
			rs.update
		end if
		rs.close
	else
		sql="delete from news where id="&id
		conn.execute(sql)
	end if
else
	if(title<>"") then
	sql="select * from news where title='"&title&"'"
	rs.open sql,conn,1,3
	
	if(rs.eof) then
		rs.addnew
		rs("title")=title
		rs("nope")=nope
		rs("jointime")=date()
		rs.update
	end if
	rs.close
	end if
end if

response.redirect "set3.asp"
response.end
%>