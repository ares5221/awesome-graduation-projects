<!--#include file="conn.asp"--><%
dim id,pic,title,class1,class2,cpjg,cpsl,nope,jingpin,pic2

id=Trim(Request.Form("id"))
pic=Trim(Request.Form("pic"))
pic2=Trim(Request.Form("pic2"))
title=Trim(Request.Form("title"))
class1=Trim(Request.Form("class1"))
class2=Trim(Request.Form("class2"))
cpjg=Trim(Request.Form("cpjg"))
cpsl=Trim(Request.Form("cpsl"))
nope=Trim(Request.Form("nope"))
title=replace(title,"(","[")
title=replace(title,")","]")

jingpin=Trim(Request.Form("jingpin"))

if(isnumeric(jingpin)) then
	jingpin=int(jingpin)
else
	jingpin=0
end if

if(isnumeric(id)) then
	if(title<>"") then
		sql="select * from products where id="&id
		rs.open sql,conn,1,3
		if(not rs.eof) then
			rs("title")=title
			rs("pic")=pic2
			rs("cpjg")=cpjg
			rs("cpsl")=cpsl
			rs("class1")=class1
			rs("class2")=class2
			rs("nope")=nope
			rs("jingpin")=jingpin
			rs("bpic")=pic
			rs.update
		end if
	else
		sql="delete from products where id="&id
		conn.execute(sql)
	end if
else
	if(title<>"") then
		sql="select * from products where title='"&title&"'"

		rs.open sql,conn,1,3
		
		if(rs.eof) then
			rs.addnew
			rs("title")=title
			rs("pic")=pic2
			rs("cpjg")=cpjg
			rs("cpsl")=cpsl
			rs("class1")=class1
			rs("class2")=class2
			rs("nope")=nope
			rs("jingpin")=jingpin
			rs("jointime")=now()
			rs("bpic")=pic
			rs.update
		end if
		rs.close
	end if
end if

response.redirect "set4.asp"
response.end
%>