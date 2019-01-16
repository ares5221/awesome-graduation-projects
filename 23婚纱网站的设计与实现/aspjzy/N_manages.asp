<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Function.asp"-->
<%
Call QuanXian(News_B)
ParentClassID=Request("ParentClassID")
ClassNameID=Request("ClassNameID")
session("ClassNameID")=ClassNameID
IF session("ClassNameID")="" Then session("ClassNameID")=0 End IF
Type_Class=Request("Type_Class")
key=Request("key")
Order=Request("order")
ID=Request("ID")
'***************************************************************************************************
IF Order<>Empty And ID<>Empty Then
	Set B_Order=Conn.execute("select * from News Where ID="&ID&"")
	IF B_Order.Eof then
		twScript("操作失败!!!")
	End IF
	B_b=B_Order("N_X")
	IF Order="up" Then
		IF Type_Class="Big" Then 
			Set B1_Order=Conn.execute("select top 1 * from News Where N_X>"&B_b&" and Big_Class="&ClassNameID&" Order by N_X Asc")
		ElseIF Type_Class="Small" Then 
			Set B1_Order=Conn.execute("select top 1 * from News Where N_X>"&B_b&" and Small_Class="&ClassNameID&" Order by N_X Asc")
		Else
			Set B1_Order=Conn.execute("select top 1 * from News Where N_X>"&B_b&" Order by N_X Asc")
		End IF
			IF B1_Order.Eof Then
				twScript("不能操作")
			End IF
			conn.execute ("update News set N_X="&B1_Order("N_X")&" where ID="&ID&"")
			conn.execute ("update News set N_X="&B_b&" where ID="&B1_Order("ID")&"")
			Tw("<Script>window.location='N_manages.asp?Page="&Request("Page")&"&ClassNameID="&Request("ClassNameID")&"&ParentClassID="&ParentClassID&"&key="&key&"&Type_Class="&Type_Class&"'</Script>")
	ElseIF Order="dowm" Then
		IF Type_Class="Big" Then 
			Set B1_Order=Conn.execute("select top 1 * from News Where N_X<"&B_b&" and Big_Class="&ClassNameID&" Order by N_X Desc")
		ElseIF Type_Class="Small" Then 
			Set B1_Order=Conn.execute("select top 1 * from News Where N_X<"&B_b&" and Small_Class="&ClassNameID&" Order by N_X Desc")
		Else
			Set B1_Order=Conn.execute("select top 1 * from News Where N_X<"&B_b&" Order by N_X Desc")
		End IF
		IF B1_Order.Eof Then
			twScript("不能操作")
		End IF
		conn.execute ("update News set N_X="&B1_Order("N_X")&" where ID="&ID&"")
		conn.execute ("update News set N_X="&B_b&" where ID="&B1_Order("ID")&"")
		Tw("<Script>window.location='N_manages.asp?Page="&Request("Page")&"&ClassNameID="&ClassNameID&"&ParentClassID="&ParentClassID&"&key="&key&"&Type_Class="&Type_Class&"'</Script>")
	End IF
End IF
'***************************************************************************************************

'***************************************************************************************************
	SQL="select * from News "
	IF (ClassNameID<>Empty and Type_Class<>Empty) or key<>Empty Then
		SQL=SQL+"Where "
		IF ClassNameID<>Empty Then
			IF Type_Class="Big" Then
				SQL=SQL+"Big_Class="&ClassNameID&" "
			ElseIF Type_Class="Small" Then
				SQL=SQL+"Small_Class="&ClassNameID&" "
			End IF
		End IF
		IF key<>Empty Then
			SQL=SQL+"N_title Like '%"&key&"%'"
		End IF
	End IF
	SQL=SQL+"order by N_X Desc"
	set Rsn=Server.CreateObject("Adodb.Recordset")
	Rsn.open SQL,Conn,1,1
	dim strFileName,MaxPerPage
	strField=trim(request("Field"))
	if request("page")<>"" then
		currentPage=cint(request("page"))
	else
		currentPage=1
	end if
	ShowSmallClassType=ShowSmallClassType_Default
	MaxPerPage=20
	strFileName="?ClassNameID="&ClassNameID&"&ParentClassID="&ParentClassID&"&key="&key&"&Type_Class="&Type_Class&"&"
	totalput=Rsn.Recordcount
'************************************************************************************************
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style>
.b_t{padding-left:10px;padding-right:10px;}
</style>
<Script>
function CheckAll(form)
  {
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.Name != "chkAll")
       e.checked = form.chkAll.checked;
    }
  }
 function keya(formname)
 {
 if (formname.key.value=="")
 {
 alert("请输入标题关建字!!!")
 formname.key.focus()
 return false;
 }
 }

</Script>
</head>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="100" valign="middle"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="table_border">
      <tr bgcolor="#DBE6FF">
        <td colspan="2" class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
          <tr>
            <td align="center" class="table_bg_size"> 资讯分类查找</td>
          </tr>
        </table></td>
      </tr>
      <tr bgcolor="#DBE6FF">
        <td colspan="2"><table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
          <tr class="table_bg_n">
            <td height="22"><table border=0 cellpadding="5" cellspacing="0">
              <tr>
                <td class="b_t"><strong><a href="N_manages.asp">所有资讯</a></strong></td>
                <%
				Set RsBigClass=Conn.execute("select * from N_Class Where ParentClassID=0 Order By Xu Asc")
				IF RsBigClass.eof then
					Tw("暂无资讯类型")
				Else
				Do While Not RsBigClass.eof
				D=D+1
				%>
                <td class="b_t <%IF RsBigClass("ID")=Cint(session("ClassNameID")) Then Tw("table_bg_n1") End IF%>" ><strong><a href="?Type_Class=Big&ClassNameID=<%Tw(RsBigClass("ID"))%>&ParentClassID=<%Tw(RsBigClass("ID"))%>">
                  <%Tw(RsBigClass("ClassName"))%>
                </a></strong></td>
                <%
				IF D=8 Then Tw("</tr>") End IF
				RsBigClass.MoveNext
				Loop
				End if
				%>
              </tr>
            </table></td>
          </tr>
          <%
			  IF ParentClassID<>Empty Then
			  Set RsSmallClass=Conn.execute("select * from N_Class Where ParentClassID="&ParentClassID&" Order By Xu Asc")
			  IF Not RsSmallClass.eof then
			  %>
          <tr class="table_bg_n">
            <td height="22" class="table_bg_n1"><table border=0 cellpadding="5" cellspacing="0">
              <tr>
                <%
				Do While Not RsSmallClass.eof
				W=W+1
				%>
                <td class="b_t"><a href="?Type_Class=Small&ClassNameID=<%Tw(RsSmallClass("ID"))%>&ParentClassID=<%Tw(RsSmallClass("ParentClassID"))%>" <%IF RsSmallClass("ID")=Cint(session("ClassNameID")) Then Tw("Class='link_red'") End IF %>>
                  <%Tw(RsSmallClass("ClassName"))%>
                </a></td>
                <%
				IF W=7 Then Tw("</tr>") End IF
				RsSmallClass.MoveNext
				Loop
				%>
              </tr>
            </table></td>
          </tr>
          <%
			End IF
			End IF
			%>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="130" valign="top" style="padding-top:10px;"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="table_border">
      <tr bgcolor="#DBE6FF">
        <td colspan="2" class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
          <tr>
            <td align="center" class="table_bg_size">资讯管理</td>
          </tr>
        </table></td>
      </tr>
      <tr bgcolor="#DBE6FF">
        <td colspan="2"><table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
          <form name="form1" style="margin:0px; " method="post" action="N_Del.asp?Action=Del&ClassNameID=<%=ClassNameID%>&ParentClassID=<%=ParentClassID%>&key=<%=key%>&Page=<%=currentPage%>&Type_Class=<%=Type_Class%>">
            <tr align="center" class="table_bg_n">
              <td width="6%" height="22"><strong>排序</strong></td>
              <td width="6%"><strong>选择</strong></td>
              <td width="37%"><strong>资讯标题</strong></td>
              <td width="35%"><strong>类型</strong></td>
              <td width="9%"><strong>操作一</strong></td>
              <td width="7%"><strong>操作二</strong></td>
            </tr>
            <%
			IF Not Rsn.Eof then
				IF currentPage<>1 then
				Rsn.Move MaxPerPage*(currentPage-1)
				End if
			for T=1 to MaxPerPage
		   %>
            <tr class="table_bg_n">
              <td align="center"><%Tw(T)%></td>
              <td align="center"><input name='ID' type='checkbox' onClick="unselectall()" id="ID" value='<%Tw(Rsn("ID"))%>'></td>
              <td class="padding-left-10"><a href="N_show.asp?id=<%Tw(Rsn("ID"))%>">
                <%Tw(replace(Rsn("N_title"),"\\""",""""))%>
              </a><% If Rsn("N_index")=1 Then %><font color="#0000FF">推荐</font><% End If %></td>
              <td align="center"><%
				Set rsb=Conn.execute("select * from N_Class Where ID="&Rsn("Big_Class")&"")
				IF Not Rsb.Eof Then
					Tw(Rsb("ClassName"))
				End IF
				TClose(Rsb)
				%>
                /
                <%
				Set rsb=Conn.execute("select * from N_Class Where ID="&Rsn("Small_Class")&"")
				IF Not Rsb.Eof Then
					Tw(Rsb("ClassName"))
				End IF
				TClose(Rsb)
				%>              </td>
              <td align="center"><a href="?ID=<%=Rsn("ID")%>&order=up&ClassNameID=<%=ClassNameID%>&ParentClassID=<%=ParentClassID%>&key=<%=key%>&Page=<%=currentPage%>&Type_Class=<%=Type_Class%>"><img src="images/arrow_up.gif" width="17" height="14" border="0"></a> <a href="?ID=<%=Rsn("ID")%>&order=dowm&ClassNameID=<%=ClassNameID%>&ParentClassID=<%=ParentClassID%>&key=<%=key%>&Page=<%=currentPage%>&Type_Class=<%=Type_Class%>"><img src="images/arrow_down.gif" width="17" height="14" border="0"></a> </td>
              <td align="center"><a href="N_Modify.asp?ID=<%=Rsn("ID")%>">编辑</a></td>
            </tr>
            <%
		  	Rsn.MoveNext
			IF Rsn.Eof then exit for 
			Next
			End if
			Call tclose(Rsn)
		  %>
            <tr class="table_bg_n">
              <td height="25" align="center">全选</td>
              <td align="center"><input name="chkAll" type="checkbox" id="chkAll" onclick=CheckAll(this.form) value="checkbox"></td>
              <td colspan="4" class="padding-left-10"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="18%" align="center"><input type="submit" name="Submit" value="删除选中资讯"></td>
                  <td width="82%" align="right"></td>
                </tr>
              </table></td>
            </tr>
          </form>
        </table></td>
      </tr>
      <tr bgcolor="#DBE6FF">
        <td height="25" colspan="2" align="center" class="table_bg_n"><%call showpage(strFileName,totalput,MaxPerPage,true,true,"个资讯")%></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="130"><form name="form2" method="post" action="?" onSubmit="return keya(this)">
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="table_border">
        <tr bgcolor="#DBE6FF">
          <td colspan="2" class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
            <tr>
              <td align="center" class="table_bg_size"> 查找资讯</td>
            </tr>
          </table></td>
        </tr>
        <tr bgcolor="#DBE6FF">
          <td colspan="2"><table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
            <tr class="table_bg_n">
              <td height="25" align="center">资讯标题：
                <input name="key" type="text" id="key" size="30">
                &nbsp;
                <input type="submit" name="Submit" value="查找">              </td>
            </tr>
          </table></td>
        </tr>
      </table>
    </form></td>
  </tr>
</table>
</body>
</html>
