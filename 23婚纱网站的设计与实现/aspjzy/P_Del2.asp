<!--#include file="inc/conn.asp"-->
<%
Call QuanXian(Products_B)
dim ArticleID,Action,sqlDel,rsDel,FoundErr,ErrMsg,ObjInstalled
ID=trim(request("ID"))
Action=Trim(Request("Action"))

if ID="" or Action<>"Del" then
	TwScript("请选择要删除的序号!!!")
end if

if instr(ID,",")>0 then
	idArr=split(ID)
	for i = 0 to ubound(idArr)
		call DelArticle(clng(idarr(i)))
	next
else
	call DelArticle(clng(ID))
end if
if PurviewChecked=False Then
	Response.Write("<script>alert('删除成功');window.location='P_manages2.asp'</script>")
Else
	twscript("操作未成功!!!")
End IF
sub DelArticle(ID)
	PurviewChecked=False
	sqlDel="select * from Products where ID=" & CLng(ID)
	Set rsDel= Server.CreateObject("ADODB.Recordset")
	rsDel.open sqlDel,conn,1,3
	dim fso
	'以下是开始删除图片的代码区域
	Set fso = CreateObject("Scripting.FileSystemObject")
	'缩略图
	smpic=rsDel("P_Smallpic")
	'大图片
	bigpic=rsDel("P_Bigpic")
	'删除缩略图
	if smpic<>Empty then
		if fso.fileexists(server.mappath(smpic)) then
			Set thisfile = fso.GetFile(server.mappath(smpic)) 
			thisfile.Delete True
		end if
	End IF
	'删除大图片
	if bigpic<>Empty then
		if fso.fileexists(server.mappath(bigpic)) then
			Set thisfile = fso.GetFile(server.mappath(bigpic)) 
			thisfile.Delete True
		end if
	End if
	Set fso = nothing
rsDel.delete
rsDel.update
set rsDel=nothing
end sub
%>