<!--#include file="inc/conn.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sql="select * from Products order by ID asc"
rs.open sql,conn,1,3
i=2
do while not rs.eof
'content=Replace(rs("Lin_content"),"http://www.china400.com/baima/","http://www.fz128.com/")
conn.execute("update Products set P_X="&i&" where  ID="&rs("ID"))
i=i+1
rs.movenext
loop
rs.close
%>