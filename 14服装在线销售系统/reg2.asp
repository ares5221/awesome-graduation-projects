<!--#include file="conn.asp"--><%
dim uname,upass,upass2
dim name,addr,tel,sex,email,wt,da

uname=Trim(Request.Form("uname"))
upass=Trim(Request.Form("upass"))
upass2=Trim(Request.Form("upass2"))
name=Trim(Request.Form("name"))
addr=Trim(Request.Form("addr"))
tel=Trim(Request.Form("tel"))
sex=Trim(Request.Form("sex"))
email=Trim(Request.Form("email"))
wt=Trim(Request.Form("wt"))
da=Trim(Request.Form("da"))

if(uname<>"" and upass=upass2) then
	sql="select * from userinfo where username='"&uname&"'"
	rs.open sql,conn,1,3
	
	if(not rs.eof) then
		showdlg "此用户名已有人注册。"
		response.end
	else
		rs.addnew
		rs("username")=uname
		rs("userpass")=upass
		rs("realname")=name
		rs("addr")=addr
		rs("tel")=tel
		rs("sex")=sex
		rs("email")=email
		rs("mibaowt")=wt
		rs("mibaoda")=da
		rs.update
	end if
	rs.close
	
	showdlg "注册成功。"
else
	showdlg "有内容没有填写!"
end if
'response.redirect "wdxc.asp"
response.end

function showdlg(s)
	Response.Write("<script language='javascript'>")
	Response.Write("alert('"&s&"');")
	Response.Write("window.close();")
	Response.Write("</script>")
end function
%>