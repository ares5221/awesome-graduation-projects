<!--#include file="conn.asp"--><%
dim name,qq,email,title,content,adddate

name=Trim(Request.Form("name"))
qq=Trim(Request.Form("qq"))
email=Trim(Request.Form("email"))
title=Trim(Request.Form("title"))
content=Trim(Request.Form("content"))
adddate=now()

sql="select * from guest"
rs.open sql,conn,1,3

rs.addnew
rs("name")=name
rs("qq")=qq
rs("email")=email
rs("title")=title
rs("content")=content
rs("adddate")=adddate
rs.update
rs.close

response.redirect "guest.asp"
response.end
%>