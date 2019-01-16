<!--#include file="inc/conn.asp"-->
<%
Call QuanXian(Products_B)
ID=Request("ID")
Set P_Modify=Conn.execute("select * from Products Where ID="&ID&"")
IF P_Modify.Eof Then
	TwScript("参数有误")
End IF
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.p {padding-left:10px;}
.style1 {color: #990000}
-->
</style>
<script>
var onecount;
subcat = new Array();
        <%
set rsclass=server.createobject("adodb.recordset")
sql = "select * from P_Class Where ParentClassID<>0 order by Xu asc"
rsclass.open sql,conn,1,1
        count = 0
        do while not rsclass.eof 
        %>
subcat[<%=count%>] = new Array("<%= trim(rsclass("ClassName"))%>","<%= trim(rsclass("ParentClassID"))%>","<%= trim(rsclass("ID"))%>");
        <%
        count = count + 1
        rsclass.movenext
        loop
        rsclass.close
        %>
onecount=<%=count%>;

function changelocation(locationid)
    {
    document.myform.SmallClassName.length = 1; 
    var locationid=locationid;
    var i;
    for (i=0;i < onecount; i++)
        {
            if (subcat[i][1] == locationid)
            { 
                document.myform.SmallClassName.options[document.myform.SmallClassName.length] = new Option(subcat[i][0], subcat[i][2]);
            }        
        }
    }    
function cek(formname)
{
	
	if(formname.SmallClassName.value=="")
	{
	alert("请选择产品分类")
	formname.SmallClassName.focus()
	return false;
	}
	
	if(formname.P_Item.value=="")
	{
	alert("货号必须填写")
	formname.P_Item.focus()
	return false;
	}
	
	if(formname.smpic.value=="" | formname.smpic.value.length<4)
	{
	alert("小图片不能为空或地址有误")
	formname.smpic.focus()
	return false;
	}
	
	if(formname.bigpic.value=="" | formname.bigpic.value.length<4)
	{
	alert("大图片不能为空或地址有误")
	formname.bigpic.focus()
	return false;
	}
}
</script>
</head>

<body style="padding-bottom:10px;">
<form name="myform" method="post" action="p_Sava.asp?action=Modify" onSubmit="return cek(this)">
  <table width="85%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="table_border">
    <tr bgcolor="#DBE6FF">
      <td colspan="2" class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
          <tr>
            <td align="center" class="table_bg_size"> 修改产品</td>
          </tr>
      </table></td>
    </tr>
    <tr bgcolor="#DBE6FF">
      <td colspan="2"><table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
	          <tr class="table_bg_n">
          <td width="30%" height="25" align="center"> 类型</td>
          <td width="70%" class="padding-left-10">
		  <%
		  set rs=server.createobject("adodb.recordset")
        sql = "select * from P_Class Where ParentClassID=0 and ID<>71 Order By Xu Asc"
        rs.open sql,conn,1,1
		if rs.eof and rs.bof then
			response.write "请先添加栏目。"
		else
		%>
                <select name="BigClassName" onChange="changelocation(document.myform.BigClassName.options[document.myform.BigClassName.selectedIndex].value)" size="1">
		  <%
			do while not rs.eof
		  %>
			  <option value="<%=trim(rs("ID"))%>" <% 
			  IF rs("ID")=Cint(P_Modify("Big_Class")) Then 
			 	 Tw("Selected") 
				 selclass=rs("ID")
			  End IF
			  %>><%=trim(rs("ClassName"))%></option>
		  <%
			rs.movenext
			loop
			end if
			rs.close
		 %>
                </select>
				
                <select name="SmallClassName">
                 <option value="" selected>请选择分类</option>
		    <%
			set rs=server.createobject("adodb.recordset")
			sql="select * from P_Class where ParentClassID=" & selclass & " Order By Xu Asc"
			rs.open sql,conn,1,1
			if not rs.eof then
			do while not rs.eof
			%>
                  <option value="<%=rs("ID")%>" <% IF rs("ID")=Cint(P_Modify("Small_Class")) Then Tw("Selected") End IF%>><%=rs("ClassName")%></option>
		   <%
			rs.movenext
			loop
			end if
	        rs.close
			%>
                </select></td>
        </tr>
          <tr class="table_bg_n">
            <td height="25" align="center">名称</td>
            <td class="padding-left-10"><input name="P_Name" type="text" id="P_Name" value="<%Tw(P_Modify("P_Name"))%>" size="40">
            <span class="style1">*(带*必填)</span></td>
          </tr>

          <tr class="table_bg_n">
            <td height="25" align="center">小图</td>
            <td class="padding-left-10"><input name="smpic" type="text" id="smpic" value="<%Tw(P_Modify("P_Smallpic"))%>" size="41" maxlength="120">
            <input type="button" name="Submit2" value="上 传" onClick="window.open('upload_flash.asp?formname=myform&editname=smpic&uppath=../products_pic&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')">
              <span class="style1">*</span></td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center">大图</td>
            <td class="padding-left-10"><input name="bigpic" type="text" id="bigpic" value="<%Tw(P_Modify("P_Bigpic"))%>" size="41" maxlength="120">
            <input type="button" name="Submit2" value="上 传" onClick="window.open('upload_flash.asp?formname=myform&editname=bigpic&uppath=../products_pic&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')">
              <span class="style1">*</span></td>
          </tr>
		  <tr class="table_bg_n">
            <td height="80" align="center"> 详细说明</td>
            <td class="padding-left-10">
			<input name="Content" type="hidden" value="<%Tw(P_Modify("P_Content"))%>">
			<iframe id="eWebEditor1" src="../WebEditor/ewebeditor.asp?id=Content&style=s_mini1" frameborder="0" scrolling="no" width="380" height="250"></iframe>			</td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center"> 添加日期</td>
            <td class="padding-left-10"><input name="P_Time" type="text" id="P_Time" value="<%Tw(P_Modify("P_Time"))%>" maxlength="50" style="background-color:#EFEFEF">
              <span class="style1">日期正确格式为2006-12-12</span></td>
          </tr>
          <tr class="table_bg_n"><input name="ID" type="hidden"  id="ID" value="<%Tw(P_Modify("ID"))%>">
            <td height="25" colspan="2" align="center"><input type="submit" name="Submit" value="修改产品">
            &nbsp;&nbsp;
            <input type="reset" name="Submit" value="重新填写"></td>
          </tr>
      </table></td>
    </tr>
  </table>
</form>
</body>
</html>
