<!--#include FILE="inc/upload.inc"-->
<html>
<head>
<title>文件上传</title>
<link rel="stylesheet" href="admin.css" type="text/css">
</head>
<body leftmargin="5" topmargin="3" >

<% 
response.write "<FONT color=red>"&upNum&"</font>"
dim upload,file,formName,formPath,iCount,filename,fileExt
set upload=new upload_5xSoft ''建立上传对象

 formPath=upload.form("filepath")
 ''在目录后加(/)
 if right(formPath,1)<>"/" then formPath=formPath&"/" 


for each formName in upload.file ''列出所有上传了的文件
 set file=upload.file(formName)  ''生成一个文件对象
 if file.filesize<100 then
 	response.write "<font size=2>请先选择你要上传的文件　[ <a href=# onclick=history.go(-1)>重新上传</a> ]</font>"
	response.end
 end if
 	
 if file.filesize>30000 then
 	response.write "<font size=2>文件大小超过了限制 30,000K　[ <a href=# onclick=history.go(-1)>重新上传</a> ]</font>"
	response.end
 end if

 fileExt=lcase(right(file.filename,4))

 if fileEXT<>".gif" and fileEXT<>".jpg" and fileEXT<>".zip" and fileEXT<>".rar" and fileEXT<>".doc" and fileEXT<>".xsl" and fileEXT<>".exe" and fileEXT<>".ppt"then
 	response.write "<font size=2>文件格式不正确　[ <a href=# onclick=history.go(-1)>重新上传</a> ]</font>"
	response.end
 end if 

 randomize
 ranNum=int(90000*rnd)+10000
 filename=formPath&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum&fileExt
 
' filename=formPath&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&file.FileName
 
 if file.FileSize>0 then         ''如果 FileSize > 0 说明有文件数据
  file.SaveAs Server.mappath(FileName)   ''保存文件
'  response.write file.FilePath&file.FileName&" ("&file.FileSize&") => "&formPath&File.FileName&" 成功!<br>"
 end if
 set file=nothing
next
set upload=nothing  ''删除此对象

Htmend FileName

sub HtmEnd(Msg)
 set upload=nothing
 response.write "路径：<input type=""text"" size=""45"" value="""&Msg&""" name=softpath> <a href=# onclick=history.go(-1)>继续上传</a>"
 response.end
end sub
%>
</body>
</html>