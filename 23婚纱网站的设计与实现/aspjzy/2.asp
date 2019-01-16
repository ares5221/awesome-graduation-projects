<!--#include file="inc/conn.asp"-->
<%
for i=1 to 43
set rs=server.createobject("adodb.recordset")
sql="select * from Products"
rs.open sql,conn,1,3
rs.addnew
rs("P_Name")="薇薇新娘经典作品"
rs("Big_Class")="125"
rs("Small_Class")="133"
rs("P_Content")="&nbsp;&nbsp;"
rs("P_Content_En")="&nbsp;&nbsp;"
rs("P_Bigpic")="../products_pic/zuopin/2/"&i&".jpg"
rs("P_Smallpic")="../products_pic/tese/2/s/"&i&".jpg"
rs.update
rs.close
next
%>