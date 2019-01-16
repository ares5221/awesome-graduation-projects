<!--#include file="conn.asp"--><%
dim id,id2

id=Trim(Request.Form("id"))
id=replace(id,", ",",")

if(id<>"") then
	sql="select * from dingdan where flags2<>1 and id in ("&id&")"
	rs.open sql,conn,1,3
	while not rs.eof
		id2=rs("productid")
		sql="select * from products where id="&id2
		rs2.open sql,conn,1,3
		if(not rs2.eof) then
			if(rs2("cpsl")>rs("productnum")) then
				Response.Write(rs2("title")&" 发货成功。<br>")
				rs2("cpsl")=rs2("cpsl")-rs("productnum")
				rs2("xssl")=rs2("xssl")+rs("productnum")
				rs2.update
			else
				Response.Write(rs2("title")&" 库存不足，发货失败。<br>")
			end if
		end if
		rs2.close
		rs("flags2")=1
		rs.update
		rs.movenext
	wend
	rs.close
end if

'response.redirect "set5.asp"
response.end
%>