<!--#include file="inc/conn.asp"-->
<%
Call QuanXian(Products_B)
'-------------------------------------------------------开始接收
ID=Trim(Request.Form("ID"))								'ID接收
'-------------------------------------------------------结束接收
IF request("ClassName")=Empty or request("smpic")=Empty then
	twScript("带*号必须填写")
End IF



Set Rs=Conn.execute("select Max(Xu) as PageID from P_Class")
		PageID=Rs("PageID")
		IF PageID<>Empty Then
			PageID=PageID
		Else
			PageID=1
		End IF
Call twClose()
	
set rs=server.createobject("adodb.recordset")
	if request("action")="add" then
	    sql="select * from P_Class where (ID is null)"
		rs.open sql,conn,1,3
		rs.addnew
			call SaveData
			rs("Xu")=PageID+1
		rs.update
		rs.close
		set rs=nothing
	Tw("<Script>")
	Tw("if(!confirm('添加成功;是否继续添加!!!')){window.location='P_manages3.asp'}else{window.location='P_Add3.asp'}")
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
				Response.Write("<Script>alert('修改成功');window.location='P_manages2.asp?"&session("Se")&"';</Script>")
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
	rs("ClassName")=request("ClassName")
	rs("ParentClassID")=request("ParentClassID")
	rs("pic")=request("smpic")
	rs("content")=request("content")
end sub
%>