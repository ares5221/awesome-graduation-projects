<!--#include file="inc/conn.asp"-->
<%
Call QuanXian(Products_B)
'-------------------------------------------------------开始接收
ID=Trim(Request.Form("ID"))								'ID接收
BigClassName=trim(request.form("BigClassName"))			'大类别接收
SmallClassName=trim(request.form("SmallClassName"))		'小类别接收
P_Item=trim(request.form("P_Item"))						'产品货号接收
P_Name=trim(request.form("P_Name"))						'产品名称接收
P_Other1_Name=trim(request.form("P_Other1_Name"))		'后台字段接收1
P_Other2_Name=Trim(Request.Form("P_Other2_Name"))		'后台字段接收2
P_Other3_Name=trim(request.form("P_Other3_Name"))		'后台字段接收3
smpic=trim(Request.Form("smpic"))						'小图片接收
bigpic=trim(request.form("bigpic"))						'大图片接收
Content=trim(request.Form("Content"))					'备注接收
P_Hits=trim(request.form("P_Hits"))						'点击数接收
P_Time=Trim(Request.form("P_Time"))						'添加日期接收
P_Index=Trim(Request.form("P_Index"))					'是否设为首页接收
P_Register=Trim(Request.form("P_Register"))				'是否为会员产品接收
'-------------------------------------------------------'English字段接收
P_Name_En=trim(request.form("P_Name_En"))
P_Other1_Name_En=trim(request.form("P_Other1_Name_En"))
P_Other2_Name_En=trim(request.form("P_Other2_Name_En"))
P_Other3_Name_En=trim(request.form("P_Other3_Name_En"))
Content_En=trim(request.form("Content_En"))
'-------------------------------------------------------结束接收
IF P_Name=Empty or smpic=Empty or bigpic=Empty then
	twScript("带*号必须填写")
End IF

IF P_Index=Empty Then
	P_Index="False"
End IF

IF P_Register=Empty Then
	P_Register="False"
End IF

Set Rs=Conn.execute("select Max(P_X) as PageID from Products")
		PageID=Rs("PageID")
		IF PageID<>Empty Then
			PageID=PageID
		Else
			PageID=1
		End IF
Call twClose()
	
set rs=server.createobject("adodb.recordset")
	if request("action")="add" then
		sql="select * from Products where (ID is null)" 
		rs.open sql,conn,1,3
		rs.addnew
			call SaveData
			rs("P_X")=PageID+1
		rs.update
		rs.close
		set rs=nothing
	Tw("<Script>")
	Tw("if(!confirm('产品添加成功;是否继续添加产品!!!')){window.location='P_manages.asp'}else{window.location='P_Add.asp'}")
	Tw("</Script>")
	Response.End
	elseif request("action")="Modify" then
  		if ID<>"" then
			sql="select * from Products where ID=" & ID
			rs.open sql,conn,1,3
			if not (rs.bof and rs.eof) then
					call SaveData
				rs.update
				rs.close
				set rs=nothing
				Response.Write("<Script>alert('修改成功');window.location='P_manages.asp?"&session("Se")&"';</Script>")
				Response.End
 			else
				TwScript("找不到此产品，可能已经被其他人删除。")
			end if
		else
			TwScript("不能确定ID的值")
		end if
	else
		TwScript("没有选定参数")
	end if
	
sub SaveData()
	rs("Big_Class")=BigClassName
	rs("Small_Class")=SmallClassName
	rs("P_Item")=P_Item
	rs("P_Name")=P_Name
	rs("P_Other1_Name")=P_Other1_Name
	rs("P_Other2_Name")=P_Other2_Name
	rs("P_Other3_Name")=P_Other3_Name
	rs("P_Smallpic")=smpic
	rs("P_Bigpic")=bigpic
	rs("P_Content")=Content
	'rs("P_Hits")=P_Hits
	rs("P_Time")=P_Time
	rs("P_Index")=P_Index
	rs("P_Register")=P_Register
	'----------------------------
	rs("P_Name_En")=P_Name_En
	rs("P_Other1_Name_En")=P_Other1_Name_En
	rs("P_Other2_Name_En")=P_Other2_Name_En
	rs("P_Other3_Name_En")=P_Other3_Name_En
	rs("P_Content_En")=Content_En
end sub
%>