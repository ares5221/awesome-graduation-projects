<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/aqu" prefix="aqu"%>
<c:set value="${aqu:getUrl()}/admin/login.jsp" var="url"/>
<c:if test="${sessionScope.admin==null||sessionScope.admin!='yes'}">
	<c:redirect url="${url}"/>
</c:if>
<jsp:useBean id="type" scope="page" class="com.v246.GetTemplateType"/>
<html>
<head>
<title>文章中心管理----模板管理</title>
<meta http-equiv="content-Type" content="text/html; charset=gb2312">
<link href="images/Admin_Style.css" rel="stylesheet" type="text/css">
<style type="text/css" title="">
/* 文本框的CSS定义:对应CSS中的“INPUT”，这里为文本框的风格设置，可定义内容为背景、字体、颜色、边框等 */
Input
{
BACKGROUND-COLOR: #ffffff; 
BORDER-BOTTOM: #666666 1px solid;
BORDER-LEFT: #666666 1px solid;
BORDER-RIGHT: #666666 1px solid;
BORDER-TOP: #666666 1px solid;
COLOR: #666666;
HEIGHT: 18px;
border-color: #666666 #666666 #666666 #666666; font-size: 9pt
}
/* 下拉列表框的CSS定义:对应CSS中的“SELECT”，这里为下拉列表框的风格设置，可定义内容为背景、字体、颜色、边框等 */
Select
{
FONT-SIZE: 9pt;HEIGHT: 20px;
}
</style>
</head>
<body leftmargin="2" topmargin="0" marginheight="0" marginwidth="0">
<c:set value="/admin/templateManage.jsp?id=${param.pid}" var="nextUrl"/>
<c:url value="${aqu:getUrl()}${nextUrl}" var="aqu"/>
<c:choose>
	<c:when test="${param.action=='set'}">
		${aqu:setDefault(param.id)}
		<c:redirect url="${aqu}"/>
	</c:when>
	<c:when test="${param.action=='del'}">
		<c:set value="template where TemplateId=${param.id}" var="dele"/>
		${aqu:deleteData(dele)}
		<c:redirect url="${aqu}"/>
	</c:when>
	<c:when test="${param.action=='modify'}">
		<c:set value="${aqu:modifyTemplate(param.id)}" var="modify"/>
<table class="border" align="center" border="0" cellpadding="2" cellspacing="1" width="100%">
  <tbody>
    <tr class="topbg"> 
      <td colspan="3" align="center" height="22"><strong>文章中心管理----模板管理</strong></td>
    </tr>
    <tr class="tdbg"> 
      <td height="30" width="70"><!--DWLayoutEmptyCell-->&nbsp;</td>
      <td><!--DWLayoutEmptyCell-->&nbsp;</td>
    </tr>
  </tbody>
</table>
<br>
<script language="JavaScript">
    addeditorcss=false;
    addeditorcss2=false;
    function sizecontent(num,objname){
        var obj = document.getElementById(objname);
        if (parseInt(obj.rows)+num>=1) {
            obj.rows = parseInt(obj.rows) + num;
        }
        if (num>0){
            obj.width="90%";
        }
    }
    function copy(num) {
        if (num==1) {
        var content= document.form1.content.value;
        while(content.indexOf("[/textarea]")>0)
        {
            content = content.replace("[/textarea]", "</textarea>");
        }
            document.form1.content.value=content;
            document.form1.content.focus();
            document.form1.content.select();
            textRange = document.form1.content.createTextRange();
            textRange.execCommand("Copy");
        }
        else {
            document.form1.content2.focus();
            document.form1.content2.select();
            textRange = document.form1.content2.createTextRange();
            textRange.execCommand("Copy");
        }
    }
    function LoadEditorAlgebra(num){
        if (num==1){
            document.form1.content.rows=30;
            showAlgebra.style.display="";
            showeditor.style.display="none";
            document.form1.Editorfullscreen.disabled=true;
            document.form1.Copy.disabled=false;
            if (addeditorcss==false){
                addeditorcss=true;
                setcontent('get',1)
                editor.yToolbarsCss();
                editor.showBorders();
            }else{
                setcontent('get',1)
                editor.yToolbarsCss()
            }
        }else{
            document.form1.content2.rows=30;
            showAlgebra2.style.display="";
            showeditor2.style.display="none";
            document.form1.Editorfullscreen2.disabled=true;
            document.form1.Copy2.disabled=false;
            if (addeditorcss2==false){
                addeditorcss2=true;
                setcontent('get',2);
                editor2.yToolbarsCss();
                editor2.showBorders();
            }else{
                setcontent('get',2)
                editor.yToolbarsCss()
            }
        }
 }
 function LoadEditorEdit(num){
        if (num==1){
            showAlgebra.style.display="none";
            showeditor.style.display="";
            document.form1.Editorfullscreen.disabled=false;
            document.form1.Copy.disabled=true;
            if (addeditorcss==false){
                addeditorcss=true;
                setcontent('set',1);
                editor.yToolbarsCss();
                editor.showBorders();
            }else{
                setcontent('set',1)
                editor.yToolbarsCss()
            }
        }else{
            showAlgebra2.style.display="none";
            showeditor2.style.display="";
            document.form1.Editorfullscreen2.disabled=false;
            document.form1.Copy2.disabled=true;
            if (addeditorcss2==false){
                addeditorcss2=true;
                setcontent('set',2);
                editor2.yToolbarsCss();
                editor2.showBorders();
            }else{
                setcontent('set',2)
                editor.yToolbarsCss()
            }
        }
  }
  function LoadEditorMix(num){
        if (num==1){
            document.form1.content.rows=10;
            showeditor.style.display="";
            showAlgebra.style.display="";
            document.form1.Editorfullscreen.disabled=false;
            document.form1.Copy.disabled=false;
            if (addeditorcss==false){
                addeditorcss=true;
                editor.yToolbarsCss()
                editor.showBorders()
            }else{
                editor.yToolbarsCss()
            }
        }else{
            document.form1.content2.rows=8;
            showeditor2.style.display="";
            showAlgebra2.style.display="";
            document.form1.Editorfullscreen2.disabled=false;
            document.form1.Copy2.disabled=false;
            if (addeditorcss2==false){
                addeditorcss2=true;
                editor2.yToolbarsCss();
                editor2.showBorders();
            }else{
                editor.yToolbarsCss()
            }
        }
  }
  function fullscreen(num) {
        window.open ("../Editor/editor_fullscreen.asp?ChannelID=1&num="+num+"", "", "toolbar=no, menubar=no, top=0,left=0,width=1024,height=768, scrollbars=no, resizable=no,location=no, status=no");
  }
  function Templateskin(){
    if(confirm('您确定要转入风格设计，如果您没有保存当前操作的模板请保存模板。')){
        window.location.href='Admin_Skin.asp?Action=Modify&SkinID=1&IsDefault=-1';
    };  
  }
</script>
<script language="VBScript">
    Dim Strsave,Strsave2
    Dim regEx, Match, Matches, StrBody,strTemp,strTemp2,strMatch,arrMatch,i
    Dim content1,content2,content3,content4,Templatecontent,Templatecontent2,Templatecontent3,arrcontent
    Set regEx = New RegExp
    regEx.IgnoreCase = True
    regEx.Global = True
    Strsave="A"
    Strsave2="A"
    Sub CheckForm(Num)
        if document.form1.templateName.value="" then
            alert "模板名称不能为空！"
            document.form1.templateName.focus()
            exit sub
        End if
        if Num=2 then
            if document.form1.content2.value="" then 
                alert "小类模版主内容不能为空！"
                exit sub
            End if
        End if
        form1.submit
    End Sub
Function  Resumeblank(byval content)
 Dim strHtml,strHtml2,Num,Numtemp,Strtemp
   strHtml=Replace(content, "<DIV", "<div")
   strHtml=Replace(strHtml, "</DIV>", "</div>")
   strHtml=Replace(strHtml, "<TABLE", "<table")
   strHtml=Replace(strHtml, "</TABLE>", vbCrLf & "</table>"& vbCrLf)
   strHtml=Replace(strHtml, "<TBODY>", "")
   strHtml=Replace(strHtml, "</TBODY>","" & vbCrLf)
   strHtml=Replace(strHtml, "<TR", "<tr")
   strHtml=Replace(strHtml, "</TR>", vbCrLf & "</tr>"& vbCrLf)
   strHtml=Replace(strHtml, "<TD", "<td")
   strHtml=Replace(strHtml, "</TD>", "</td>")
   strHtml=Replace(strHtml, "<!--", vbCrLf & "<!--")
   strHtml=Replace(strHtml, "<SELECT",vbCrLf & "<Select")
   strHtml=Replace(strHtml, "</SELECT>",vbCrLf & "</Select>")
   strHtml=Replace(strHtml, "<OPTION",vbCrLf & "  <Option")
   strHtml=Replace(strHtml, "</OPTION>","</Option>")
   strHtml=Replace(strHtml, "<INPUT",vbCrLf & "  <Input")
   strHtml=Replace(strHtml, "<script",vbCrLf & "<script")
   strHtml=Replace(strHtml, "&amp;","&")
   strHtml=Replace(strHtml, "{$--",vbCrLf & "<!--$")
   strHtml=Replace(strHtml, "--}","$-->")
   arrcontent = Split(strHtml,vbCrLf)
    For i = 0 To UBound(arrcontent)
        Numtemp=false
        if Instr(arrcontent(i),"<table")>0 then
            Numtemp=True
            if Strtemp<>"<table" and Strtemp <>"</table>" then
              Num=Num+2
            End if 
            Strtemp="<table"
        elseif Instr(arrcontent(i),"<tr")>0 then
            Numtemp=True
            if Strtemp<>"<tr" and Strtemp<>"</tr>" then
              Num=Num+2
            End if 
            Strtemp="<tr"
        elseif Instr(arrcontent(i),"<td")>0 then
            Numtemp=True
            if Strtemp<>"<td" and Strtemp<>"</td>" then
              Num=Num+2
            End if 
            Strtemp="<td"
        elseif Instr(arrcontent(i),"</table>")>0 then
            Numtemp=True
            if Strtemp<>"</table>" and Strtemp<>"<table" then
              Num=Num-2
            End if 
            Strtemp="</table>"
        elseif Instr(arrcontent(i),"</tr>")>0 then
            Numtemp=True
            if Strtemp<>"</tr>" and Strtemp<>"<tr" then
              Num=Num-2
            End if 
            Strtemp="</tr>"
        elseif Instr(arrcontent(i),"</td>")>0 then
            Numtemp=True
            if Strtemp<>"</td>" and Strtemp<>"<td" then
              Num=Num-2
            End if 
            Strtemp="</td>"
        elseif Instr(arrcontent(i),"<!--")>0 then
            Numtemp=True
        End if
        if Num< 0 then Num = 0
        if trim(arrcontent(i))<>"" then
            if i=0 then
                strHtml2= string(Num," ") & arrcontent(i) 
            elseif Numtemp=True then
                strHtml2= strHtml2 & vbCrLf & string(Num," ") & arrcontent(i) 
            else
                strHtml2= strHtml2 & vbCrLf & arrcontent(i) 
            end if
        end if
    Next
 Resumeblank=strHtml2
End function
    function setcontent(zhi,templateType)
    if zhi="get" then
        if templateType=1 then
            if Strsave="A" then Exit Function
            Strsave="A"
            Templatecontent= document.form1.content.value
            Templatecontent2= editor.HtmlEdit.document.body.innerHTML
        else
            if Strsave2="A" then Exit Function
            Strsave2="A"
            Templatecontent= document.form1.content2.value
            Templatecontent2= editor2.HtmlEdit.document.body.innerHTML
        End if
        if Templatecontent="" then 
            alert "您删除了代码框网页，请您务必填写网页 ！"
            Exit function
        End if
        if Instr(Templatecontent,"<body>")=0 then
            regEx.Pattern = "(\<body)(.[^\<]*)(\>)"
            Set Matches = regEx.Execute(Templatecontent)
            For Each Match In Matches
                StrBody = Match.Value
            Next
            If StrBody = ""  Then
                alert "您加载的文本框没有包含 <body> 或您没有给body 参数这会使网页很难看,请最少给出 <body> ！"
                Exit function
            End If 
        Else
            StrBody="<body>" 
        End if
        arrcontent = Split(Templatecontent, StrBody)
        if ubound(arrcontent)=0 then 
           alert "您加载的文本框没有包含 <body> 或您没有给body 参数这会使网页很难看,请最少给出 <body> ！"
           exit function
        End if
        content1 = arrcontent(0) & StrBody
        content2 = arrcontent(1)
        regEx.Pattern = "\<IMG(.[^\<]*)\}\'\>"
        Set Matches = regEx.Execute(Templatecontent2)
        For Each Match In Matches
            regEx.Pattern = "\{\$(.*)\}"
            Set strTemp = regEx.Execute(replace(Match.Value," ",""))
            For Each Match2 In strTemp
                strTemp2 = Replace(Match2.Value, "?", """")
                Templatecontent2 = Replace(Templatecontent2, Match.Value, "<!--" & strTemp2 & "-->")
            Next
        Next
        regEx.Pattern = "\<IMG(.[^\<]*)\$\>"
        Set Matches = regEx.Execute(Templatecontent2)
        For Each Match In Matches
            regEx.Pattern = "\#(.*)\#"
            Set strTemp = regEx.Execute(Match.Value)
            For Each Match2 In strTemp
                strTemp2 = Replace(Match2.Value, "&amp;", "&")
                strTemp2 = Replace(strTemp2, "#", "")
                strTemp2 = Replace(strTemp2,"&13;&10;",vbCrLf)
                strTemp2 = Replace(strTemp2,"&9;",vbTab)
                strTemp2 = Replace(strTemp2, "[!", "<")
                strTemp2 = Replace(strTemp2, "!]", ">")
                Templatecontent2 = Replace(Templatecontent2, Match.Value, strTemp2)
            Next
        Next
        Templatecontent2=Replace(Templatecontent2, "http://www.v246.com/","{$InstallDir}")
        Templatecontent2=Replace(Templatecontent2, "http://www.v246.com/","{$InstallDir}")
        Templatecontent2=Resumeblank(Templatecontent2)
        Templatecontent2=Replace(Templatecontent2,"{$InstallDir}{$rsClass_ClassUrl}","{$rsClass_ClassUrl}")
        Templatecontent2=Replace(Templatecontent2,"{$InstallDir}$","#")
        if templateType =1 then
            document.form1.content.value=content1& vbCrLf &Templatecontent2& vbCrLf &"</body>"& vbCrLf &"</html>"
        else
            document.form1.content2.value=content1 & vbCrLf &Templatecontent2& vbCrLf &"</body>"& vbCrLf &"</html>"
        End if
    Else
        if templateType =1 then    
            if Strsave="B" then Exit Function
            Strsave="B"
            Templatecontent= document.form1.content.value
        else 
            if Strsave2="B" then Exit Function
            Strsave2="B"
            Templatecontent= document.form1.content2.value
        End if    
        if Templatecontent="" then 
            alert "您删除了代码框网页，请您务必填写网页 ！"
            Exit function
           
        End if
        if Instr(Templatecontent,"<body>")=0 then
            regEx.Pattern = "(\<body)(.[^\<]*)(\>)"
            Set Matches = regEx.Execute(Templatecontent)
            For Each Match In Matches
                StrBody = Match.Value
            Next
            If StrBody = ""  Then
                alert "您加载的文本框没有包含 <body> 或您没有给body 参数这会使网页很难看,请最少给出 <body> ！"
                Exit function
            End If 
        Else
            StrBody="<body>" 
        End if
        arrcontent = Split(Templatecontent, StrBody)
        if ubound(arrcontent)=0 then 
           alert "您加载的文本框没有包含 <body> 或您没有给body 参数这会使网页很难看,请最少给出 <body> ！"
           exit function
        End if
        content1 = arrcontent(0) & StrBody
        content2 = arrcontent(1)
        content2 = Replace(content2, "<!--$", "{$--")
        content2 = Replace(content2, "$-->", "--}")
        content2 = Replace(content2, "<!--{$", "{$")
        content2 = Replace(content2, "}-->", "}")
        '图片替换JS
        regEx.Pattern = "(\<Script)(.[^\<]*)(\<\/Script\>)"
        Set Matches = regEx.Execute(content2)
        For Each Match In Matches
            strTemp = Replace(Match.Value, "<", "[!")
            strTemp = Replace(strTemp, ">", "!]")
            strTemp = Replace(strTemp, "'", """")
            strTemp = "<IMG alt='#" & strTemp & "#' src=""/editor/images/jscript.gif"" border=0 $>"
            content2 = Replace(content2, Match.Value, strTemp)
        Next
        '图片替换超级标签
        regEx.Pattern = "(\{\$GetPicArticle|\{\$GetArticleList|\{\$GetSlidePicArticle|\{\$GetPicSoft|\{\$GetSoftList|\{\$GetSlidePicSoft|\{\$GetPicPhoto|\{\$GetPhotoList|\{\$GetSlidePicPhoto|\{\$GetPicProduct|\{\$GetProductList|\{\$GetSlidePicProduct)\((.[^(\{\$)]*)\)\}"
        content2 = regEx.Replace(content2, "<IMG src=""/editor/images/label.gif"" border=0 zzz='""$1($2)}'>")
        regEx.Pattern = "\{\$InstallDir\}"
        content2 = regEx.Replace(content2,"http://www.v246.com/")
        regEx.Pattern = "\[\/textarea\]"
        content2 = regEx.Replace(content2,"</textarea>")
        content2=Replace(content2,"href=""#""","href=""$""")
        content2=Replace(content2,"href='#'","href=""$""")
        if templateType=1 then
            editor.HtmlEdit.document.body.innerHTML=content2
            editor.showBorders()
            editor.showBorders()
        else
            editor2.HtmlEdit.document.body.innerHTML=content2
            editor2.showBorders()
            editor2.showBorders()
        End if
    End if
    End function
    function setstatus()
    end function
</script>
<form name="form1" method="post" action="./addTemplate.do">
  <table class="border" border="0" cellpadding="2" cellspacing="1" width="100%">
    <tbody>
      <tr class="title"> 
        <td colspan="2" align="center" height="22"><strong>添 加 新 模 板</strong></td>
      </tr>
      <tr class="tdbg"> 
        <td>&nbsp;&nbsp;<strong> 模板类型： </strong> 
        	<select name="templateType" id="templateType">
       
            <option value="${modify[1]}">${modify[0]}</option> 
          </select></td>
      </tr>
      <tr class="tdbg"> 
        <td>&nbsp;&nbsp;<strong> 模板名称： </strong> <input name="templateName" id="templateName" value="${modify[2]}" size="50" maxlength="50" type="text"></td>
      </tr>
      <tr class="tdbg"> 
        <td align="center" valign="top"><b> 模 板 内 容 ↓</b> </td>
      </tr>
      <tr class="tdbg" id="showAlgebra"> 
        <td> <table>
            <tbody>
              <tr> 
                <td width="20"></td>
                <td><textarea name="content" rows="30" cols="128" wrap="OFF" id="content" class="body2" onmouseup="setcontent('get',1)">${modify[3]}</textarea></td>
              </tr>
            </tbody>
          </table></td>
      </tr>
      <tr class="tdbg"> 
        <td><table>
            <tbody>
              <tr> 
                <td width="95%">&nbsp;&nbsp;&nbsp;&nbsp; <input name="EditorAlgebra" disabled="disabled" id="EditorAlgebra" value=" 代码模式 " onclick="LoadEditorAlgebra(1);" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''" type="button"> 
                  &nbsp; <input name="EditorMix" id="EditorMix" value=" 混合模式 " disabled="disabled" onclick="LoadEditorMix(1);" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''" type="button"> 
                  &nbsp; <input name="EditorEdit" id="EditorEdit" value=" 编辑模式 " disabled="disabled" onclick="LoadEditorEdit(1);" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''" type="button"> 
                  &nbsp; <input name="Copy" id="Copy" value=" 复制代码 " onclick="copy(1);" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''" type="button"> 
                  &nbsp; <input name="Editorfullscreen" id="Editorfullscreen" value=" 全屏编辑 " disabled="disabled" onclick="fullscreen(1);" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''" type="button"> 
                  &nbsp; <input name="EditorSkin" id="EditorSkin" value=" 修改风格 " disabled="disabled" onclick="return Templateskin()" onmouseover="this.style.backgroundColor='#BFDFFF'" onmouseout="this.style.backgroundColor=''" type="button"> 
                </td>
                <td align="right" width="5%"><img src="images/sizeplus.gif" onclick="sizecontent(5,'content')" height="20" width="20">&nbsp;<img src="images/sizeminus.gif" onclick="sizecontent(-5,'content')" height="20" width="20">&nbsp;&nbsp;</td>
              </tr>
            </tbody>
          </table></td>
      </tr>
      <tr class="tdbg" id="showeditor" style="display: none;"> 
        <td valign="top"> <table>
            <tbody>
              <tr> 
                <td width="20"></td>
                <td> </td>
              </tr>
            </tbody>
          </table></td>
      </tr>
      <tr class="tdbg">
      <c:if test="${modify[4]=='true'}"> 
        <td valign="top">&nbsp;&nbsp; <input name="isDefault" id="isDefault" value="Yes" type="checkbox" checked>
          将此模板设为默认模板</td>
      </c:if>
      <c:if test="${modify[4]!='true'}">
      	<td valign="top">&nbsp;&nbsp; <input name="isDefault" id="isDefault" value="Yes" type="checkbox">
          将此模板设为默认模板</td>
      </c:if>
      </tr>
      <tr class="tdbg"> 
        <td align="center" height="50"><input name="ChannelID" id="ChannelID" value="1" type="hidden"> 
          <input name="action" id="action" value="modify" type="hidden"> <input name="modifyId" id="modifyId" value="${param.id}" type="hidden"> <input name="button" value=" 添 加 " onclick="return CheckForm(1);" type="button"> 
        </td>
      </tr>
    </tbody>
  </table>
</form>
	</c:when>
</c:choose>
<!-- Powered by: PowerEasy 2005 -->
</body>
</html>
