<div class="login"><div class="title">最优惠服装</div>
<center><%
sql="select * from products order by cpjg asc"
rs.open sql,conn,1,1

for i=1 to 8 
	if(not rs.eof) then
		Response.Write("<a href='pinfo.asp?id="&rs("id")&"'>")
		Response.Write(rs("title"))
		Response.Write("</a>")
		rs.movenext
	else
		exit for
	end if
next
rs.close
%></center></div>