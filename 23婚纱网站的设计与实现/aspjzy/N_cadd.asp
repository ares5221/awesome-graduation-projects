<!--#include file="inc/conn.asp"-->
<%
Call QuanXian(News_B)
ID=Request("ID")
ClassName=Request("ClassName")
Sel=Request("Sel")

if ClassName<>Empty then
	ClassName_key=Request.form("ClassName_key")
	ClassName_En=Request.form("ClassName_En")
	order=Request("order")
	'取排序的值+++++++++++++++++++++++++++++++++++++++++++++++++++
	Set Rs=Conn.execute("select Max(Xu) as PageID from N_Class")
		PageID=Rs("PageID")
		IF PageID<>Empty Then
			PageID=PageID
		Else
			PageID=1
		End IF
	Call twClose()
	'结束+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	
	'大类
	if ClassName="Big" then
		if order<>Empty Then
			'打开ID取出当前的ID数++++++++++++++++++++++++++++++++++
			Set B_Order=Conn.execute("select * from N_Class Where ID="&ID&"")
			IF B_Order.Eof then
				twScript("操作失败,资讯类型中没有此ID号")
			End IF
			B_b=B_Order("Xu")
			IF Order="up" Then
				'打开ID上前一列数的值++++++++++++++++++++++++++++++
				Set B1_Order=Conn.execute("select top 1 * from N_Class Where Xu<"&B_b&" and ParentClassID=0 Order by Xu Desc")
				IF B1_Order.Eof Then
					twScript("不能操作")
				End IF
				conn.execute ("update N_Class set Xu="&B1_Order("Xu")&" where ID="&ID&"")
				conn.execute ("update N_Class set Xu="&B_b&" where ID="&B1_Order("ID")&"")
				response.Redirect(request.ServerVariables("HTTP_REFERER"))
				'结束上一个ID++++++++++++++++++++++++++++++++++++++++
			Elseif Order="dowm" Then
				'打开ID上前一列数的值++++++++++++++++++++++++++++++
				Set B1_Order=Conn.execute("select Top 1 * from N_Class Where Xu>"&B_b&" and ParentClassID=0 Order by Xu asc")
				IF B1_Order.Eof Then
					twScript("不能操作")
				End IF
				conn.execute ("update N_Class set Xu="&B1_Order("Xu")&" where ID="&ID&"")
				conn.execute ("update N_Class set Xu="&B_b&" where ID="&B1_Order("ID")&"")
				response.Redirect(request.ServerVariables("HTTP_REFERER"))
				B1_Order.Close
				Set B1_Order=NotHing
				'结束上一个ID++++++++++++++++++++++++++++++++++++++++
			End if
			B_Order.Close
			Set B_Order=Nothing
		Else
			'添加大类+++++++++++++++++++++++++++++++++++++++++++++++++
			if Sel="Add" then
				Conn.execute("insert into N_Class(ClassName,ParentClassID,E_ClassName,Xu)values('"&ClassName_key&"',0,'"&ClassName_En&"',"&PageID+1&")")
				Response.Write("<Script>alert('资讯大类添加成功');window.location='N_Class.asp'</Script>")
				Response.End()
			'修改大类+++++++++++++++++++++++++++++++++++++++++++++++++
			Elseif Sel="Modify1" then
				Conn.execute("Update N_Class Set ClassName='"&ClassName_key&"',E_ClassName='"&ClassName_En&"' Where ID="&ID&" ")
				Response.Write("<Script>alert('资讯大类修改成功');window.location='N_Class.asp'</Script>")
				Response.End()
			'删除大类和此类资讯一起删除+++++++++++++++++++++++++++++++
			Elseif Sel="Delete" then
				'删除此类资讯+++++++++++++++++++++++++++++++++++++++++
				Conn.execute("delete from News Where Big_Class="&ID&"")
				'结束+++++++++++++++++++++++++++++++++++++++++++++++++
				Conn.execute("delete from N_Class Where ParentClassID="&ID&"")
				Conn.execute("delete from N_Class Where ID="&ID&"")
				Response.Write("<Script>alert('资讯大类和此类资讯成功!!!');window.location='N_Class.asp'</Script>")
				Response.End()
			End IF
			'结束大类添加,修改,删除+++++++++++++++++++++++++++++++++++
		End if
	'小类
	Elseif ClassName="Small" then
		if order<>Empty Then
			'打开ID取出当前的ID数++++++++++++++++++++++++++++++++++
			Set B_Order=Conn.execute("select * from N_Class Where ID="&ID&"")
			IF B_Order.Eof then
				twScript("操作失败,资讯类型中没有此ID号")
			End IF
			B_b=B_Order("Xu")
			B_b_P=B_Order("ParentClassID")
			IF Order="up" Then
				'打开ID上前一列数的值++++++++++++++++++++++++++++++
				Set B1_Order=Conn.execute("select top 1 * from N_Class Where Xu<"&B_b&" and ParentClassID="&B_b_P&" Order by Xu Desc")
				IF B1_Order.Eof Then
					twScript("不能操作")
				End IF
				conn.execute ("update N_Class set Xu="&B1_Order("Xu")&" where ID="&ID&"")
				conn.execute ("update N_Class set Xu="&B_b&" where ID="&B1_Order("ID")&"")
				response.Redirect(request.ServerVariables("HTTP_REFERER"))
				'结束上一个ID++++++++++++++++++++++++++++++++++++++++
			Elseif Order="dowm" Then
				'打开ID上前一列数的值++++++++++++++++++++++++++++++
				Set B1_Order=Conn.execute("select Top 1 * from N_Class Where Xu>"&B_b&" and ParentClassID="&B_b_P&" Order by Xu asc")
				IF B1_Order.Eof Then
					twScript("不能操作")
				End IF
				conn.execute ("update N_Class set Xu="&B1_Order("Xu")&" where ID="&ID&"")
				conn.execute ("update N_Class set Xu="&B_b&" where ID="&B1_Order("ID")&"")
				response.Redirect(request.ServerVariables("HTTP_REFERER"))
				B1_Order.Close
				Set B1_Order=NotHing
				'结束上一个ID++++++++++++++++++++++++++++++++++++++++
			End if
			B_Order.Close
			Set B_Order=Nothing
		Else
			BigID=Request.Form("BigID")
			'添加小类+++++++++++++++++++++++++++++++++++++++++++++++++
			if Sel="Add" then
				Conn.execute("insert into N_Class(ClassName,ParentClassID,E_ClassName,Xu)values('"&ClassName_key&"',"&BigID&",'"&ClassName_En&"',"&PageID+1&")")
				Response.Write("<Script>alert('资讯小类添加成功');window.location='N_Class.asp'</Script>")
				Response.End()
			'修改小类+++++++++++++++++++++++++++++++++++++++++++++++++
			ElseIF Sel="Modify1" then
				Conn.execute("Update N_Class Set ClassName='"&ClassName_key&"',E_ClassName='"&ClassName_En&"',ParentClassID="&BigID&" Where ID="&ID&" ")
				Response.Write("<Script>alert('资讯小类修改成功');window.location='N_Class.asp'</Script>")
				Response.End()
			'删除小类+++++++++++++++++++++++++++++++++++++++++++++++++
			ElseIF Sel="Delete" then
				'删除此类资讯+++++++++++++++++++++++++++++++++++++++++
				Conn.execute("delete from News Where Small_Class="&ID&"")
				'结束+++++++++++++++++++++++++++++++++++++++++++++++++
				Conn.execute("delete from N_Class Where ID="&ID&"")
				Response.Write("<Script>alert('资讯小类和此类资讯成功!!!');window.location='N_Class.asp'</Script>")
				Response.End()
			End if
			'结束小类添加,修改,删除+++++++++++++++++++++++++++++++++++
		End if
	End if
	'类结束
End if

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<Script>
function Classname(formname)
{
	if(formname.ClassName_key.value=="")
	{
	alert("类别名称不能为空")
	formname.ClassName_key.focus()
	return false;
	}
}
function delbig()
{
if(!confirm('确定删除资讯大类吗？删除后所属于此类资讯一起删除！！！'))
{
return false;
}
}
function delsmall()
{
if(!confirm('确定删除资讯小类吗？删除后所属于此类资讯一起删除！！！'))
{
return false;
}
}
</Script>
<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
<!--分类管理<开始>------------------------------------------------------------------>
  <tr>
    <td height="150">
      <table width="85%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="table_border">
        <tr bgcolor="#DBE6FF">
          <td colspan="2" class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
              <tr>
                <td align="center" class="table_bg_size">发布资讯（请选择相应的栏目发布相关资讯）</td>
              </tr>
          </table></td>
        </tr>
        <tr bgcolor="#DBE6FF">
          <td colspan="2"><%
		  Set Rsp=Server.CreateObject("adodb.recordset")
		  StrSql="select * from N_Class Where ParentClassID=0 Order by Xu Asc"
		  Rsp.open StrSql,conn,1,3
		  if Rsp.eof then
		  Response.Write("暂无分类")
		  else
		  Page=Rsp.recordcount
		  %>
              <table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
                <tr align="center" class="table_bg_n">
                  <td width="10%" height="23"><B>排序</B></td>
                  <td width="68%"><B>类别名称</B></td>
                  <td width="19%"><STRONG>操作</STRONG></td>
                  <td width="3%">&nbsp;</td>
                </tr>
				<%
				Do while Not Rsp.Eof 
				Q=Q+1
				%>
                <tr class="table_bg_n">
                  <td height="22" align="center" style="color:#990000;"><%Response.Write(Q)%></td>
                  <td class="padding-left-10"><img src="images/tree_folder4.gif" width="15" height="15"><%IF banben_China=True Then Tw(Rsp("ClassName")) End IF%><%IF banben_En=True Then Tw("&nbsp;"&Rsp("E_ClassName")) End if%></td>
                  <td colspan="2" align="center">&nbsp;</td>
                </tr>
				<%
				Set rsB=Server.CreateObject("adodb.recordset")
				StrSql="select * from N_Class Where ParentClassID="&rsp("ID")&" Order by Xu Asc"
				rsB.open StrSql,conn,1,3
				if Not rsB.eof then
				Do While Not rsB.eof
				Pagesmall=RsB.recordcount
				W=W+1
				%>
				<tr class="table_bg_n1">
                  <td height="22" align="center"><span class="huang">
                    <%Response.Write(W)%>
                  </span></td>
                  <td class="padding-left-20 huang"><img src="images/tree_folder3.gif" width="15" height="15">
				  <%IF banben_China=True Then Tw(rsB("ClassName")) End IF%><%IF banben_En=True Then Tw("&nbsp;"&RsB("E_ClassName")) End if%></td>
                  <td align="center"><a href="N_add.asp?Big_Class=<%= rsp("ID") %>&Small_Class=<%= rsb("ID") %>">发布信息</a></td>
                  <td align="center">&nbsp;</td>
				</tr>
				<%
				rsB.MoveNext
				Loop
				End if
				W=0
				Rsp.MoveNext
				Loop
				%>
              </table>
            <%
		  End if
		  Rsp.Close
		  %>          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
