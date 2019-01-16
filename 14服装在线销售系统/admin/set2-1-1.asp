<!--#include file="conn.asp"--><%
dim id,title,layer
id=Trim(Request.Form("id"))
title=Trim(Request.Form("title"))

if(isnumeric(id)) then
	if(title<>"") then
		sql="select * from leibie where id="&id
		rs.open sql,conn,1,3
		if(not rs.eof) then
			rs("title")=title
			rs.update
		end if
		rs.close
	else
		sql="delete from leibie where id="&id
		conn.execute(sql)
	end if
else
	if(title<>"") then
		sql="select * from leibie"
		rs.open sql,conn,1,3
		rs.addnew
		rs("title")=title
		rs("fromof")=0
		rs("layer")=1
		rs.update
		rs.close
	end if
end if

response.redirect "set2.asp"
response.end
%>