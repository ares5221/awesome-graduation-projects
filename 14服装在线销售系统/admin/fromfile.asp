<%Server.ScriptTimeOut=5000%>
<!--#include FILE="upload_5xsoft.inc"-->
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=gb2312">
<title>文件上传</title>
</head>
<body><%

dim upload,file,formName,formPath,iCount
dim uname,upic,unope
dim checkcode

set upload=new upload_5xsoft ''建立上传对象


formPath="../uploadfile"

if right(formPath,1)<>"/" then formPath=formPath&"/" 
 
iCount=0

for each formName in upload.objFile
	set file=upload.file(formName)

	if file.FileSize>0 then
		file.SaveAs Server.mappath(formPath&file.FileName)
		checkcode=upload.form("checkcode")
		uname=upload.form("uname")
		upic=formPath&file.FileName

		SaveFileName = file.FileName
		Session.CodePage=936
		Response.Buffer = True
		Response.Charset = "GB2312"
		Server.ScriptTimeout=99
		dim act
		act=upload.form("act")
        Response.write "<span style=""color:red;"">" & SaveFileName & " </span>文件上传成功!"
		Response.Write("<script language='Javascript'>")
		Response.Write("window.opener.document.getElementById("""&act&""").value = ""UploadFile/"&SaveFileName&""";")
		Response.Write("window.close();")
		Response.Write("</script>")

		iCount=iCount+1
	end if
	set file=nothing
next

set upload=nothing  ''删除此对象
'Htmend iCount&" 个文件上传结束!"

sub HtmEnd(Msg)
	set upload=nothing
	
	Response.Write("<script language='Javascript'>")
	Response.Write("alert('内容已经提交！');")
'	Response.Write("window.opener.location.reload();")
'	Response.Write("window.opener.parent.location.reload();")
	Response.Write("window.close();")
	Response.Write("</script>")
	response.end
end sub
%>
</body>
</html>