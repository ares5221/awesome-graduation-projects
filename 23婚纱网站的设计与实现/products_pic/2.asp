<!--#include file="../hththt/inc/conn.asp"-->
<%
for i=1 to 5
set rs=server.createobject("adodb.recordset")
sql="select * from Products"
rs.open sql,conn,1,3
rs.addnew
rs("P_Name")="Ô±¹¤ÊØÔò"
rs("Big_Class")="153"
rs("Small_Class")="177"
rs("P_Content")="&nbsp;&nbsp;"
rs("P_Content_En")="&nbsp;&nbsp;"
rs("P_Bigpic")="../products_pic/ygsz/"&i&".jpg"
rs("P_Smallpic")="../products_pic/ygsz/"&i&".jpg"
rs.update
rs.close
next
%>