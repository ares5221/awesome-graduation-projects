<!--#include file="conn.asp"--><%
dim uname,upass,upass2,names,sex,addr,tel,email,wt,da

uname=Trim(session("UserLogin"))
upass=Trim(Request.Form("upass"))
names=Trim(Request.Form("name"))
sex=Trim(Request.Form("sex"))
addr=Trim(Request.Form("addr"))
tel=Trim(Request.Form("tel"))
email=Trim(Request.Form("email"))
wt=Trim(Request.Form("wt"))
da=Trim(Request.Form("da"))

if(uname="" or names="" or addr="" or tel="" or upass="") then
	Response.Write("<script language='javascript'>alert('有必填内容项没有填写。');window.history.back(); </script>")
	response.end
else
	sql="select * from userinfo where username='"&uname&"'"
	rs.open sql,conn,1,3
	
	if(not rs.eof) then
		rs("userpass")=upass
		rs("realname")=names
		rs("sex")=sex
		rs("addr")=addr
		rs("tel")=tel
		rs("email")=email
		rs("mibaowt")=wt
		rs("mibaoda")=da
		rs.update
	end if
	rs.close
end if
response.redirect "modinfo.asp"
response.end
%>