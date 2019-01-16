<!--#include file="inc/conn.asp"-->
<%
Call QuanXian(News_B)
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
	Response.Write("<script>alert('删除成功');window.location='N_manages.asp?Page="&Request("Page")&"&ClassNameID="&Request("ClassNameID")&"&ParentClassID="&Request("ParentClassID")&"&key="&Request("key")&"&Type_Class="&Request("Type_Class")&"'</script>")
	Response.End()
Else
	twscript("操作未成功!!!")
End IF
sub DelArticle(ID)
	PurviewChecked=False
	sqlDel="select * from News where ID=" & CLng(ID)
	Set rsDel= Server.CreateObject("ADODB.Recordset")
	rsDel.open sqlDel,conn,1,3
	if not rsDel.eof then
		dim fso
		'以下是开始删除图片的代码区域
		Set fso = CreateObject("Scripting.FileSystemObject")
		'缩略图
		'大图片
		d_picture=rsDel("d_savepathfilename")
		'删除缩略图
		if d_picture<>Empty then
			IF left(d_picture,1)<>"|" Then
				d_picture="|"&d_picture
			End IF
			d_picture=split(d_picture,"|")
			for ii=1 to ubound(d_picture)
				if fso.fileexists(server.mappath(d_picture(ii))) then
					Set thisfile = fso.GetFile(server.mappath(d_picture(ii))) 
					thisfile.Delete True
				end if
			Next
		End IF
		Set fso = nothing
rsDel.delete
rsDel.update
set rsDel=nothing
End IF	
end sub
%>