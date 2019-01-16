<%
'----------------------------------------------------------------------
'转发时请保留此声明信息,这段声明不并会影响你的速度!
'*******************    无组件上传类   ********************************
'修改者:梁无惧
'电子邮件:yjlrb@21cn.com
'网站:http://www.25cn.com
'原作者:稻香老农
'原作者网站:http://www.5xsoft.com
'声明:此上传类是在化境编程界发布的无组件上传类的基础上修改的.
'在与化境编程界无组件上传类相比,速度快了将近50倍,当上传4M大小的文件时
'服务器只需要10秒就可以处理完,是目前最快的无组件上传程序,当前版本为0.96
'源代码公开,免费使用,对于商业用途,请与作者联系
'文件属性：例如上传文件为c:\myfile\doc.txt
'FileName    文件名       字符串    "doc.txt"
'FileSize    文件大小     数值       1210
'FileType    文件类型     字符串    "text/plain"
'FileExt     文件扩展名   字符串    "txt"
'FilePath    文件原路径   字符串    "c:\myfile"
'使用时注意事项:
'由于Scripting.Dictionary区分大小写,所以在网页及ASP页的项目名都要相同的大小
'写,如果人习惯用大写或小写,为了防止出错的话,可以把
'sFormName = Mid (sinfo,iFindStart,iFindEnd-iFindStart)
'改为
'(小写者)sFormName = LCase(Mid (sinfo,iFindStart,iFindEnd-iFindStart))
'(大写者)sFormName = UCase(Mid (sinfo,iFindStart,iFindEnd-iFindStart))
'**********************************************************************
'----------------------------------------------------------------------
dim oUpFileStream

Class upload_file
  
dim Form,File,Version
  
Private Sub Class_Initialize 
   '定义变量
  dim RequestBinDate,sStart,bCrLf,sInfo,iInfoStart,iInfoEnd,tStream,iStart,oFileInfo
  dim iFileSize,sFilePath,sFileType,sFormvalue,sFileName
  dim iFindStart,iFindEnd
  dim iFormStart,iFormEnd,sFormName
   '代码开始
  Version="无组件上传类 Version 0.96"
  set Form = Server.CreateObject("Scripting.Dictionary")
  set File = Server.CreateObject("Scripting.Dictionary")
  if Request.TotalBytes < 1 then Exit Sub
  set tStream = Server.CreateObject("adodb.stream")
  set oUpFileStream = Server.CreateObject("adodb.stream")
  oUpFileStream.Type = 1
  oUpFileStream.Mode = 3
  oUpFileStream.Open 
  oUpFileStream.Write Request.BinaryRead(Request.TotalBytes)
  oUpFileStream.Position=0
  RequestBinDate = oUpFileStream.Read 
  iFormEnd = oUpFileStream.Size
  bCrLf = chrB(13) & chrB(10)
  '取得每个项目之间的分隔符
  sStart = MidB(RequestBinDate,1, InStrB(1,RequestBinDate,bCrLf)-1)
  iStart = LenB (sStart)
  iFormStart = iStart+2
  '分解项目
  Do
    iInfoEnd = InStrB(iFormStart,RequestBinDate,bCrLf & bCrLf)+3
    tStream.Type = 1
    tStream.Mode = 3
    tStream.Open
    oUpFileStream.Position = iFormStart
    oUpFileStream.CopyTo tStream,iInfoEnd-iFormStart
    tStream.Position = 0
    tStream.Type = 2
    tStream.Charset ="gb2312"
    sInfo = tStream.ReadText      
    '取得表单项目名称
    iFormStart = InStrB(iInfoEnd,RequestBinDate,sStart)-1
    iFindStart = InStr(22,sInfo,"name=""",1)+6
    iFindEnd = InStr(iFindStart,sInfo,"""",1)
    sFormName = Mid (sinfo,iFindStart,iFindEnd-iFindStart)
    '如果是文件
    if InStr (45,sInfo,"filename=""",1) > 0 then
      set oFileInfo= new FileInfo
      '取得文件属性
      iFindStart = InStr(iFindEnd,sInfo,"filename=""",1)+10
      iFindEnd = InStr(iFindStart,sInfo,"""",1)
      sFileName = Mid (sinfo,iFindStart,iFindEnd-iFindStart)
      oFileInfo.FileName = GetFileName(sFileName)
      oFileInfo.FilePath = GetFilePath(sFileName)
      oFileInfo.FileExt = GetFileExt(sFileName)
      iFindStart = InStr(iFindEnd,sInfo,"Content-Type: ",1)+14
      iFindEnd = InStr(iFindStart,sInfo,vbCr)
      oFileInfo.FileType = Mid (sinfo,iFindStart,iFindEnd-iFindStart)
      oFileInfo.FileStart = iInfoEnd
      oFileInfo.FileSize = iFormStart -iInfoEnd -2
      oFileInfo.FormName = sFormName
      file.add sFormName,oFileInfo
    else
    '如果是表单项目
      tStream.Close
      tStream.Type = 1
      tStream.Mode = 3
      tStream.Open
      oUpFileStream.Position = iInfoEnd 
      oUpFileStream.CopyTo tStream,iFormStart-iInfoEnd-2
      tStream.Position = 0
      tStream.Type = 2
      tStream.Charset = "gb2312"
      sFormvalue = tStream.ReadText 
      form.Add sFormName,sFormvalue
    end if
    tStream.Close
    iFormStart = iFormStart+iStart+2
    '如果到文件尾了就退出
    loop until (iFormStart+2) = iFormEnd 
  RequestBinDate=""
  set tStream = nothing
End Sub

Private Sub Class_Terminate  
  '清除变量及对像
  if not Request.TotalBytes<1 then
    oUpFileStream.Close
    set oUpFileStream =nothing
    end if
  Form.RemoveAll
  File.RemoveAll
  set Form=nothing
  set File=nothing
End Sub
   
 '取得文件路径
Private function GetFilePath(FullPath)
  If FullPath <> "" Then
    GetFilePath = left(FullPath,InStrRev(FullPath, "\"))
    Else
    GetFilePath = ""
  End If
End function
 
'取得文件名
Private function GetFileName(FullPath)
  If FullPath <> "" Then
    GetFileName = mid(FullPath,InStrRev(FullPath, "\")+1)
    Else
    GetFileName = ""
  End If
End function

'取得扩展名
Private function GetFileExt(FullPath)
  If FullPath <> "" Then
    GetFileExt = mid(FullPath,InStrRev(FullPath, ".")+1)
    Else
    GetFileExt = ""
  End If
End function

End Class

'文件属性类
Class FileInfo
  dim FormName,FileName,FilePath,FileSize,FileType,FileStart,FileExt
  Private Sub Class_Initialize 
    FileName = ""
    FilePath = ""
    FileSize = 0
    FileStart= 0
    FormName = ""
    FileType = ""
    FileExt = ""
  End Sub
  
'保存文件方法
 Public function SaveToFile(FullPath)
    dim oFileStream,ErrorChar,i
    SaveToFile=1
    if trim(fullpath)="" or right(fullpath,1)="/" then exit function
    set oFileStream=CreateObject("Adodb.Stream")
    oFileStream.Type=1
    oFileStream.Mode=3
    oFileStream.Open
    oUpFileStream.position=FileStart
    oUpFileStream.copyto oFileStream,FileSize
    oFileStream.SaveToFile FullPath,2
    oFileStream.Close
    set oFileStream=nothing 
    SaveToFile=0
  end function
End Class
%>