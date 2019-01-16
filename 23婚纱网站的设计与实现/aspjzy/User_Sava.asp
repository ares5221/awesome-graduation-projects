<!--#include file="inc/conn.asp"-->
<!--#include file="inc/md5.asp"-->
<%
Call QuanXian(Register_B)
UserID=Request("UserID")
UserName=trim(request("UserName"))
Password=trim(request("Password"))
PwdConfirm=trim(request("PwdConfirm"))
Question=trim(request("Question"))
Answer=trim(request("Answer"))
Sex=trim(Request("Sex"))
Email=trim(request("Email"))
HomePage=trim(request("HomePage"))
Comane=trim(request("Comane"))
Add=trim(request("Add"))
Somane=trim(request("Somane"))
Zip=trim(request("Zip"))
Phone=trim(request("Phone"))
Fox=trim(request("Fox"))
LockUser=request("LockUser")

Sub Sava()
	rsReg("UserName")=UserName
	rsReg("Password")=md5(Password)
	rsReg("Question")=Question
	rsReg("Answer")=md5(Answer)
	rsReg("Sex")=Sex
	rsReg("Email")=Email
	rsReg("HomePage")=HomePage
	rsReg("Comane")=Comane
	rsReg("Add")=Add
	rsReg("Somane")=Somane
	rsReg("Zip")=Zip
	rsReg("Phone")=Phone
	if LockUser<>"" then
	rsReg("LockUser")=LockUser
	end if
	rsReg("Fox")=Fox
End Sub

if Instr(UserName,"=")>0 or Instr(UserName,"%")>0 or Instr(UserName,chr(32))>0 or Instr(UserName,"?")>0 or Instr(UserName,"&")>0 or Instr(UserName,";")>0 or Instr(UserName,",")>0 or Instr(UserName,"'")>0 or Instr(UserName,",")>0 or Instr(UserName,chr(34))>0 or Instr(UserName,chr(9))>0 or Instr(UserName,"")>0 or Instr(UserName,"$")>0 then
	TwScript("用户名中含有非法字符")
end if


	IF Request("action")="add" then
		sqlReg="select * from [User] where UserName='" & Username & "'"
		set rsReg=server.createobject("adodb.recordset")
		rsReg.open sqlReg,conn,1,3
		if not(rsReg.bof and rsReg.eof) then
			TwScript("你注册的用户已经存在！请换一个用户名再试试!")
		else
		
		if Instr(Password,"=")>0 or Instr(Password,"%")>0 or Instr(Password,chr(32))>0 or Instr(Password,"?")>0 or Instr(Password,"&")>0 or Instr(Password,";")>0 or Instr(Password,",")>0 or Instr(Password,"'")>0 or Instr(Password,",")>0 or Instr(Password,chr(34))>0 or Instr(Password,chr(9))>0 or Instr(Password,"")>0 or Instr(Password,"$")>0 then
			TwScript("密码中含有非法字符")
		end if
		
			rsReg.addnew
				Call Sava()
			rsReg.update
			founderr=false
		end if
		rsReg.close
		set rsReg=nothing
		Tw("<Script>")
		Tw("if(!confirm('会员添加成功;是否继续添加会员!!!')){window.location='User_manages.asp'}else{window.location='User_add.asp'}")
		Tw("</Script>")
		Response.End
	elseif Request("action")="Modify" then
		sqlReg="select * from [User] where UserID=" & UserID & ""
		set rsReg=server.createobject("adodb.recordset")
		rsReg.open sqlReg,conn,1,3
		if rsReg.eof then
			TwScript("参数有误")
		else	
				IF Password<>Empty Then
					rsReg("Password")=md5(Password)
				End IF
				rsReg("Question")=Question
				IF Answer<>Empty Then
					rsReg("Answer")=md5(Answer)
				End IF
				rsReg("Sex")=Sex
				rsReg("Email")=Email
				rsReg("HomePage")=HomePage
				rsReg("Comane")=Comane
				rsReg("Add")=Add
				rsReg("Somane")=Somane
				rsReg("Zip")=Zip
				rsReg("Phone")=Phone
				if LockUser<>"" then
				rsReg("LockUser")=LockUser
				end if
				rsReg("Fox")=Fox
			rsReg.update
			founderr=false
		end if
		rsReg.close
		set rsReg=nothing
		Tw("<Script>alert('会员修改成功');window.location='User_Manages.asp'</Script>")
		Response.End
	End IF
%>