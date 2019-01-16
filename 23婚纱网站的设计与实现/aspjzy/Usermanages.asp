<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Function.asp"-->
<%
Call QuanXian(Register_B)
class_type=Request("class_type")
key=Request("key")
ID=Request("ID")
'***************************************************************************************************
IF Request("Del")="delete" AND ID<>Empty Then
	Conn.execute("delete from [mebmer] Where ID="&ID&"")
	Tw("<Script>alert('删除会员成功');window.location='Usermanages.asp?page="&request("page")&"&class_type="&Request("class_type")&"&key="&key&"'</Script>")
	Response.End
End IF
'**************************************************************************************************?*

	SQL="select * from mebmer "
	IF class_type<>Empty and key<>Empty Then
		SQL=SQL+"Where "&class_type&" like '%"&key&"%'"
	End IF
	SQL=SQL+"order by ID Desc"
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
	MaxPerPage=10
	strFileName="?class_type="&class_type&"&key="&key&"&"
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
 alert("请输入搜索的关建字!!!")
 formname.key.focus()
 return false;
 }
 }

</Script>
</head>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="130" valign="top" style="padding-top:10px;"><form name="form1" method="post" action="N_Del.asp?Action=Del&ClassNameID=<%=ClassNameID%>&ParentClassID=<%=ParentClassID%>&key=<%=key%>&Page=<%=currentPage%>&Type_Class=<%=Type_Class%>">
      <table width="85%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="table_border">
        <tr bgcolor="#DBE6FF">
          <td colspan="2" class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
              <tr>
                <td align="center" class="table_bg_size">会员管理</td>
              </tr>
          </table></td>
        </tr>
        <tr bgcolor="#DBE6FF">
          <td colspan="2"><table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
              <tr align="center" class="table_bg_n">
                <td width="5%" height="22"><strong>序号</strong></td>
                <td width="15%"><strong>用户名</strong></td>
                <td width="12%"><strong>推荐人</strong></td>
                <td width="12%"><strong>姓名</strong></td>
                <td width="20%"><strong>E-MAIL</strong></td>
                <td width="18%"><strong>操作一</strong></td>
                <td width="8%"><strong>操作二</strong></td>
                <td width="10%"><strong>操作三</strong></td>
              </tr>
		   <%
			IF Not Rsn.Eof then
				IF currentPage<>1 then
				Rsn.Move MaxPerPage*(currentPage-1)
				End if
			for T=1 to MaxPerPage
		   %>
              <tr class="table_bg_n">
                <td height="22" align="center"><%Tw(T)%></td>
                <td class="padding-left-10"><a href="User_Ck.asp?UserID=<%Tw(Rsn("ID"))%>"><%Tw(Rsn("UserName"))%></A></td>
                <td align="center"><%Tw(Rsn("tuijianren"))%></td>
                <td align="center"><%Tw(Rsn("Realname"))%></td>	
                <td align="center"><a href="mailto:<%Tw(Rsn("email"))%>"><%Tw(Rsn("email"))%></a></td>
                <td align="center"><a href="?class_type=tuijianren&key=<%Tw(Rsn("UserName"))%>">查看该会员推荐的人</a></td>
                <td align="center"><a href="UserModify.asp?UserID=<%=Rsn("ID")%>">编辑</a></td>
                <td align="center"><a href="?ID=<%=Rsn("ID")%>&page=<%Tw(currentPage)%>&key=<%Tw(key)%>&class_type=<%Tw(class_type)%>&Del=delete">删除</a></td>
              </tr>
		  <%
		  	Rsn.MoveNext
			IF Rsn.Eof then exit for 
			Next
			End if
			Call tclose(Rsn)
		  %>
              <tr align="right" valign="bottom" class="table_bg_n">
                <td height="30" colspan="8"><%call showpage(strFileName,totalput,MaxPerPage,true,true,"个会员")%></td>
                </tr>
          </table></td>
        </tr>
      </table>
    </form></td>
  </tr>
  <tr>
    <td height="130"><form name="form2" method="post" action="Usermanages.asp" onSubmit="return keya(this)">
      <table width="85%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="table_border">
        <tr bgcolor="#DBE6FF">
          <td colspan="2" class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
              <tr>
                <td align="center" class="table_bg_size"> 查找会员</td>
              </tr>
          </table></td>
        </tr>
        <tr bgcolor="#DBE6FF">
          <td colspan="2"><table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
              <tr class="table_bg_n">
                <td height="25" align="center">查找会员：
                  <select name="class_type" id="class_type">
                    <option value="username" selected>按会员号</option>
                    <option value="tuijianren">按推荐人</option>
                  </select> 
                  <input name="key" type="text" id="key" size="30">
                  &nbsp;
                  <input type="submit" name="Submit" value="查找会员">                  </td>
              </tr>
          </table></td>
        </tr>
      </table>
    </form></td>
  </tr>
</table>
</body>
</html>
