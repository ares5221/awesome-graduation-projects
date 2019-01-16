<!--#include file="inc/conn.asp"-->
<%
Call QuanXian(News_B)
session("News")=0
ID=Request("ID")
Set N_Modify=Conn.execute("select * from News Where ID="&ID&"")
IF N_Modify.Eof Then
	TwScript("参数有误")
End IF

BackOldUrl=request.ServerVariables("HTTP_REFERER")

dim rs
dim sql
dim count
set rs=server.createobject("adodb.recordset")
sql = "select * from N_Class Where ParentClassID<>0 order by Xu asc"
rs.open sql,conn,1,1
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
        count = 0
        do while not rs.eof 
        %>
subcat[<%=count%>] = new Array("<%= trim(rs("ClassName"))%>","<%= trim(rs("ParentClassID"))%>","<%= trim(rs("ID"))%>");
        <%
        count = count + 1
        rs.movenext
        loop
        rs.close
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
		
		if(formname.N_title.value=="")
		{
		alert("标题必须填写")
		formname.N_title.focus()
		return false;
		}
		
		if(formname.content.value=="")
		{
		alert("内容必须填写")
		formname.content.focus()
		return false;
		}
}

function Checkwb1(){
if (document.myform.wb111.checked == false) {
        wbms1.style.display = "none";
}else
        wbms1.style.display = "";
}

</script>
<Script Language=JavaScript>
	// 当上传图片等文件时，往下拉框中填入图片路径，可根据实际需要更改此函数
	function doChange(objText, objDrop){
		if (!objDrop) return;
		var str = objText.value;
		var arr = str.split("|");
		var nIndex = objDrop.selectedIndex;
		objDrop.length=1;
		for (var i=0; i<arr.length; i++){
			objDrop.options[objDrop.length] = new Option(arr[i], arr[i]);
		}
		objDrop.selectedIndex = nIndex;
	}

	// 表单提交客户端检测
	</Script>

</head>

<body style="padding-bottom:10px;">
<form name="myform" method="post" action="N_Sava.asp?action=Modify">
<input type="hidden" name="BackOldUrl" value="<%= BackOldUrl %>">
	<% '取源文件名 %>

  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="table_border">
    <tr bgcolor="#DBE6FF">
      <td colspan="2" class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
          <tr>
            <td align="center" class="table_bg_size"> 修改资讯</td>
          </tr>
      </table></td>
    </tr>
    <tr bgcolor="#DBE6FF">
      <td colspan="2"><table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
        <tr class="table_bg_n">
          <td height="25" align="center"> 资讯类型</td>
          <td class="padding-left-10">
		  <%
        sql = "select * from N_Class Where ParentClassID=0 Order By Xu Asc"
        rs.open sql,conn,1,1
		if rs.eof and rs.bof then
			response.write "请先添加栏目。"
		else
		%>
                <select name="BigClassName" onChange="changelocation(document.myform.BigClassName.options[document.myform.BigClassName.selectedIndex].value)" size="1">
		  <%
			dim selclass
			do while not rs.eof
		  %>
			  <option value="<%=trim(rs("ID"))%>" <%
			  IF rs("ID")=Cint(N_Modify("Big_Class")) Then 
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
			sql="select * from N_Class where ParentClassID=" & selclass & " Order By Xu Asc"
			rs.open sql,conn,1,1
			if not(rs.eof and rs.bof) then
			do while not rs.eof
			%>
                  <option value="<%=rs("ID")%>" <% IF rs("ID")=Cint(N_Modify("Small_Class")) Then Tw("Selected") End IF%>><%=rs("ClassName")%></option>
		  <%
			rs.movenext
			loop
			end if
	        rs.close
			%>
                </select></td>
        </tr>
		  <%
		  IF banben_China=True Then
		  %>
          <tr class="table_bg_n">
            <td width="20%" height="25" align="center">资讯标题</td>
            <td width="80%" class="padding-left-10"><input name="N_title" type="text" id="N_title" size="50" value="<%= replace(N_Modify("N_title"),"\\""","""") %>">
            <span class="style1">*(带*必填)</span></td>
          </tr>
		  <%
		  End IF
		  %>
          <tr class="table_bg_n">
            <td height="25" align="center">发布人</td>
            <td class="padding-left-10"><input name="N_fabu" type="text" id="N_fabu" value="<%Tw(N_Modify("N_fabu"))%>" size="15"></td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center">发布日期</td>
            <td class="padding-left-10"><input name="N_Time" type="text" id="UpdateTime2" value="<%Tw(N_Modify("N_Time"))%>" maxlength="50">
              <span class="style1">(正确格式：2006-12-12)</span></td>
          </tr>
		  <%
		  IF banben_China=True Then
		  %>
          <tr class="table_bg_n">
            <td height="80" align="center" class="table_bg_n">内容</td>
            <td><textarea name="content" style="display:none"><%= replace(N_Modify("N_Content"),"\\""","""") %></textarea>
                <IFRAME ID="eWebEditor" SRC="../WebEditor/eWebEditor.asp?id=content&style=s_coolblue&originalfilename=d_originalfilename&savefilename=d_savefilename&savepathfilename=d_savepathfilename" FRAMEBORDER="0" SCROLLING="no" WIDTH="680" HEIGHT="400"></IFRAME></td>
          </tr>
		  <%
		  End IF
		  %>
          <tr class="table_bg_n">
            <td height="25" align="center"> 推荐</td>
            <td class="padding-left-10"><input name="N_Index" type="checkbox" id="N_Index" value="1" <%IF N_Modify("N_Index")="1" Then Tw("checked") End IF%>>
                <span class="style1"></span></td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" align="center">初始点击数</td>
            <td class="padding-left-10"><input name="N_Hits" type="text" id="N_Hits" size="15" value="<%Tw(N_Modify("N_Hits"))%>">
              <span class="style1">(正确格式为数字)</span></td>
          </tr>
          <tr class="table_bg_n">
            <td height="25" colspan="2" align="center"><input type="submit" name="Submit" value="修改资讯">
            &nbsp;&nbsp;<input type="Hidden" name="ID" id="ID" value="<%Tw(N_Modify("ID"))%>">
            <input type="reset" name="Submit" value="重新填写"></td>
          </tr>
      </table></td>
    </tr>
  </table>
</form>
</body>
</html>
