<!--#include file="inc/conn.asp"-->
<%
Call QuanXian(News_B)
'-------------------------------------------------------开始接收
ID=Trim(Request.Form("ID"))								'ID接收
BigClassName=trim(request.form("BigClassName"))			'大类别接收
SmallClassName=trim(request.form("SmallClassName"))		'小类别接收
N_title=trim(request.form("N_title"))					'资讯标题
N_fabu=trim(request.form("N_fabu"))						'资讯发布人
N_Time=Trim(Request.Form("N_Time"))						'发布日期
Content=trim(request.form("Content"))					'内容
N_Hits=trim(request.form("N_Hits"))						'点击数接收
N_Index=Trim(Request.form("N_Index"))					'是否设为首页接收
N_file=trim(request("N_file"))
'-------------------------------------------------------图片
d_picture=Request("d_picture")
d_originalfilename=Request("d_originalfilename")
d_savefilename=Request("d_savefilename")
d_savepathfilename=Request("d_savepathfilename")
'-------------------------------------------------------结束接收

IF SmallClassName=Empty Then 
	TwScript("请选择资讯类型")
End IF

IF N_title=Empty  then
	twScript("资讯标题和内容不能为空")
End IF

IF IsNumeric(N_Hits)=False Then
	TwScript("点击数必须为数字")
End IF



IF N_Index=Empty Then
	N_Index="0"
End IF

Set Rs=Conn.execute("select Max(N_X) as PageID from News")
		PageID=Rs("PageID")
		IF PageID<>Empty Then
			PageID=PageID
		Else
			PageID=1
		End IF 
Call twClose()
	
set rs=server.createobject("adodb.recordset")
	if request("action")="add" then
		
		session("News")=session("News")+1
		IF session("News")>1 Then
			Tw("<Script>alert('资讯添加成功');window.location='N_add.asp'</Script>")
			Response.End()
		End IF
		
		sql="select * from News where (ID is null)" 
		rs.open sql,conn,1,3
		rs.addnew
			call SaveData
			rs("N_X")=PageID+1
		rs.update
		rs.close
		set rs=nothing
	Tw("<Script>")
	Tw("if(!confirm('资讯添加成功;是否继续添加资讯!!!')){window.location='N_manages.asp'}else{window.location='N_Add.asp?Big_Class="&BigClassName&"&Small_Class="&SmallClassName&"'}")
	Tw("</Script>")
	Response.End()
	elseif request("action")="Modify" then
  		if ID<>"" then
			sql="select * from News where ID=" & ID
			rs.open sql,conn,1,3
			if not (rs.bof and rs.eof) then
					call SaveData
				rs.update
				rs.close
				set rs=nothing
				Response.Write("<Script>alert('修改成功!');window.location='"&request("BackOldUrl")&"';</Script>")
				Response.End
 			else
				TwScript("找不到此资讯，可能已经被其他人删除。")
			end if
		else
			TwScript("不能确定ID的值")
		end if
	else
		TwScript("没有选定参数")
	end if
	Tw(ID)
	Response.End()
sub SaveData()
	rs("Big_Class")=BigClassName
	rs("Small_Class")=SmallClassName
	rs("N_title")=N_title
	rs("N_fabu")=N_fabu
	rs("N_Time")=N_Time
	rs("N_Content")=Content
	rs("N_Hits")=N_Hits
	rs("N_Index")=N_Index
end sub
%>