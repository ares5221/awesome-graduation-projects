<%@ taglib uri="/aqu" prefix="aqu" %>
<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="sort" class="com.v246.NoLevelSort" scope="page"/>
<c:set value="${aqu:getUrl()}/admin/login.jsp" var="url"/>
<c:if test="${sessionScope.admin==null||sessionScope.admin!='yes'}">
	<c:redirect url="${url}"/>
</c:if>
<html>
<head>
<title>文章管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="/css/Admin_Style.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="2" topmargin="0" marginheight="0" marginwidth="0">
<table class="border" align="center" border="0" cellpadding="2" cellspacing="1" width="100%">
  <tbody>
    <tr class="topbg"> 
      <td colspan="6" align="center" height="22"><strong>文章中心管理----</strong>添加文章</td>
    </tr>
    <tr class="tdbg"> 
      <td height="30" width="70"><strong>管理导航：</strong></td>
      <td colspan="5"><a href="http://www.v246.com/Admin/Admin_Article.asp?ChannelID=1&amp;Passed=All">文章管理首页</a>&nbsp;|&nbsp;<a href="http://www.v246.com/Admin/Admin_Article.asp?ChannelID=1&amp;Action=Add&amp;AddType=1&amp;ClassID=0&amp;SpecialID=0">添加文章（简洁模式）</a>&nbsp;|&nbsp;<a href="http://www.v246.com/Admin/Admin_Article.asp?ChannelID=1&amp;Action=Add&amp;AddType=2&amp;ClassID=0&amp;SpecialID=0">添加文章（高级模式）</a>&nbsp;|&nbsp;<a href="http://www.v246.com/Admin/Admin_Article.asp?ChannelID=1&amp;ManageType=Check&amp;Passed=False">审核文章</a>&nbsp;|&nbsp;<a href="http://www.v246.com/Admin/Admin_Article.asp?ChannelID=1&amp;ManageType=Special">专题文章管理</a>&nbsp;|&nbsp;<a href="http://www.v246.com/Admin/Admin_Article.asp?ChannelID=1&amp;ManageType=Recyclebin&amp;Passed=All">文章回收站管理</a></td>
    </tr>
  </tbody>
</table>
<script language="JavaScript">
function AddItem(strFileName){
  var arrName=strFileName.split('.');
  var FileExt=arrName[1];
  if (FileExt=='gif'||FileExt=='jpg'||FileExt=='jpeg'||FileExt=='jpe'||FileExt=='bmp'||FileExt=='png'){
      if(document.myform.IncludePic.selectedIndex<2){
        document.myform.IncludePic.selectedIndex+=1;
      }
  frmPreview.img.src='/Article/UploadFiles/'+strFileName;
  document.myform.DefaultPicUrl.value=strFileName;}
  document.myform.DefaultPicList.options[document.myform.DefaultPicList.length]=new Option(strFileName,strFileName);
  document.myform.DefaultPicList.selectedIndex+=1;
  if(document.myform.UploadFiles.value==''){
    document.myform.UploadFiles.value=strFileName;
  }
  else{
    document.myform.UploadFiles.value=document.myform.UploadFiles.value+'|'+strFileName;
  }
}
function selectPaginationType(){
  document.myform.PaginationType.value=2;
}
function rUseLinkUrl(){
  if(document.myform.UseLinkUrl.checked==true){
    document.myform.LinkUrl.disabled=false;
     ArticleContent.style.display='none';
     ArticleContent2.style.display='none';
     ArticleContent3.style.display='none';
  }
  else{
    document.myform.LinkUrl.disabled=true;
    ArticleContent.style.display='';
    ArticleContent2.style.display='';
    ArticleContent3.style.display='';
  }
}
function CheckForm(){
  if (document.myform.classID.value==''){
    alert('文章所属栏目不能指定为外部栏目！');
    document.myform.classID.focus();
    return false;
  }
  if (document.myform.classID.value=='0'){
    alert('指定的栏目不允许添加文章！只允许在其子栏目中添加文章。');
    document.myform.classID.focus();
    return false;
  }
  if (document.myform.title.value==''){
     alert('文章标题不能为空！');
     document.myform.title.focus();
     return false;
  }
  if (document.myform.keyword.value==''){
     alert('关键字不能为空！');
     document.myform.keyword.focus();
     return false;
  }
  if(document.myform.useLinkUrl.checked==true){
    if (document.myform.linkUrl.value==''||document.myform.LinkUrl.value=='http://'){
      alert('请输入转向链接的地址！');
      document.myform.linkUrl.focus();
      return false;
    }
  }
  else{
    if (document.myform.content.value==''){
      alert('文章内容不能为空！');
      document.content.focus();
      return false;
    }
  }
  return true;  
}
</script>
<form method="post" name="myform" onsubmit="return CheckForm();" action="./addArticle.do" target="_self">
  <table class="border" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
      <tr class="title"> 
        <td align="center" height="22"><b>添加文章（高级模式）</b>----输入内容</td>
      </tr>
      <tr align="center"> 
        <td> <table border="0" cellpadding="2" cellspacing="1" width="100%">
            <tbody>
              <tr class="tdbg"> 
                <td align="right" width="120"><strong>所属栏目：</strong></td>
                <td> <select name="classID" id="classID">
					<c:forEach var="noLevelSort" items="${sort.coll}">
            		<OPTION value=${noLevelSort.id}>${noLevelSort.title}</OPTION>
            		</c:forEach>
                   
                  </select> &nbsp;&nbsp;&nbsp;&nbsp;<font color="#ff0000"><strong>注意：</strong></font> 
                  <font color="#0000ff">不能指定为外部栏目</font> </td>
              </tr>
              <tr class="tdbg"> 
                <td align="right" width="120"><strong>所属专题：</strong></td>
                <td><select name="specialID" id="specialID">
                    <option value="0" selected>不属于任何专题</option>
                  </select></td>
              </tr>
              <tr class="tdbg"> 
                <td align="right" width="120"><strong>文章标题：</strong></td>
                <td> <table border="0" cellpadding="0" cellspacing="2" width="100%">
                    <tbody>
                      <tr> 
                        <td width="64">简短标题：</td>
                        <td> <select name="includePic" id="includePic">
                            <option value="0" selected="selected"> </option>
                            <option value="1">[图文]</option>
                            <option value="2">[组图]</option>
                            <option value="3">[推荐]</option>
                            <option value="4">[注意]</option>
                          </select> 
                          <input name="title" id="title" value="" size="44" maxlength="255" type="text"> 
                          <font color="#ff0000">*</font> <select name="titleFontColor" id="titleFontColor">
                            <option value="0" selected>颜色</option>
                            <option value="0">默认</option>
                            <option value="#000000"></option>
                            <option value="#FFFFFF"></option>
                            <option value="#008000"></option>
                            <option value="#800000"></option>
                            <option value="#808000"></option>
                            <option value="#000080"></option>
                            <option value="#800080"></option>
                            <option value="#808080"></option>
                            <option value="#FFFF00"></option>
                            <option value="#00FF00"></option>
                            <option value="#00FFFF"></option>
                            <option value="#FF00FF"></option>
                            <option value="#FF0000"></option>
                            <option value="#0000FF"></option>
                            <option value="#008080"></option>
                          </select> 
                          <select name="titleFontType" id="titleFontType">
                            <option value="0" selected="selected">字形</option>
                            <option value="1">粗体</option>
                            <option value="2">斜体</option>
                            <option value="3">粗+斜</option>
                            <option value="0">规则</option>
                          </select> </td>
                      </tr>
                      <tr> 
                        <td width="64">完整标题：</td>
                        <td><input name="titleIntact" id="titleIntact" value="" size="80" maxlength="500" type="text"></td>
                      </tr>
                      <tr> 
                        <td width="64">副 标 题：</td>
                        <td><input name="subheading" id="subheading" value="" size="80" maxlength="500" type="text"></td>
                      </tr>
                      <tr> 
                        <td>&nbsp;</td>
                        <td><input name="showCommentLink" id="showCommentLink" value="Yes" type="checkbox">
                          显示文章列表时在标题旁显示评论链接</td>
                      </tr>
                    </tbody>
                  </table></td>
              </tr>
              <tr class="tdbg"> 
                <td align="right" width="120"><strong>关键字：</strong></td>
                <td> <input name="keyword" id="keyword" value="" size="50" maxlength="255" type="text"> 
                  <font color="#ff0000">*</font> <font color="blue">&lt;=【<font onclick="document.myform.keyword.value+=(document.myform.keyword.value==''?'':'|')+'人生忠告，送给男人女人和所有人'" style="" color="green">人生忠告，送给男人女人和所有人</font>】【<font onclick="document.myform.keyword.value+=(document.myform.keyword.value==''?'':'|')+'鬼'" style="" color="green">鬼</font>】【<font onclick="document.myform.keyword.value+=(document.myform.keyword.value==''?'':'|')+'妹'" style="" color="green">妹</font>】【<font onclick="document.myform.keyword.value+=(document.myform.keyword.value==''?'':'|')+'真实的故事'" style="" color="green">真实的故事</font>】【<font onclick="window.open('Admin_SourceList.asp?ChannelID=1&TypeSelect=KeyList', 'KeyList', 'width=600,height=450,resizable=0,scrollbars=yes');" style="" color="green">更多</font>】</font> 
                  <br>
                  <font color="#0000ff">用来查找相关文章，可输入多个关键字，中间用<font color="#ff0000">“|”</font>隔开。不能出现"'&amp;?;:()等字符。</font> 
                </td>
              </tr>
              <tr class="tdbg"> 
                <td align="right" width="120"><strong>文章作者：</strong></td>
                <td> <input name="author" id="author" value="" size="50" maxlength="100" type="text">
                  <font color="blue">&lt;=【<font onclick="document.myform.author.value='未知'" style="" color="green">未知</font>】【<font onclick="document.myform.author.value='佚名'" style="" color="green">佚名</font>】【<font onclick="document.myform.author.value='admin'" style="" color="green">admin</font>】【<font onclick="window.open('Admin_SourceList.asp?TypeSelect=authorList&ChannelID=1', 'authorList', 'width=600,height=450,resizable=0,scrollbars=yes');" style="" color="green">更多</font>】</font> 
                </td>
              </tr>
              <tr class="tdbg"> 
                <td align="right" width="120"><strong>文章来源：</strong></td>
                <td> <input name="copyFrom" id="copyFrom" value="" size="50" maxlength="100" type="text">
                  <font color="blue">&lt;=【<font onclick="document.myform.copyFrom.value='本站原创'" style="" color="green">本站原创</font>】【<font onclick="window.open('Admin_SourceList.asp?TypeSelect=copyFromList&ChannelID=1', 'copyFromList', 'width=600,height=450,resizable=0,scrollbars=yes');" style="" color="green">更多</font>】</font> 
                </td>
              </tr>
              <tr class="tdbg"> 
                <td align="right" width="120"><strong><font color="#ff0000">转向链接：</font></strong></td>
                <td> <input name="linkUrl" id="linkUrl" value="http://" size="50" maxlength="255" disabled="disabled" type="text"> 
                  <input name="UseLinkUrl" id="UseLinkUrl" value="Yes" onclick="rUseLinkUrl();" type="checkbox"> 
                  <font color="#ff0000">使用转向链接</font> </td>
              </tr>
              <tr class="tdbg"> 
                <td align="right" width="120"><strong>文章简介：</strong></td>
                <td><textarea name="intro" cols="80" rows="4" id="intro"></textarea></td>
              </tr>
              <tr class="tdbg" id="ArticleContent" style=""> 
                <td align="right" valign="bottom" width="120"><p><strong>文章内容：</strong></p>
                  <table>
                    <tbody>
                      <tr>
                        <td><input name="SaveRemotePic" value="Yes" checked="checked" type="checkbox"></td>
                        <td>自动下载文章内容里的图片</td>
                      </tr>
                    </tbody>
                  </table>
                  <div align="left"><font color="#006600">&nbsp;&nbsp;&nbsp;&nbsp;启用此功能后，如果从其它网站上复制内容到右边的编辑器中，并且内容中包含有图片，本系统会在保存文章时自动把相关图片复制到本站服务器上。<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;系统会因所下载图片的大小而影响速度，建议图片较多时不要使用此功能。</font><br>
                    <br>
                    <font color="red">换行请按Shift+Enter<br>
                    <br>
                    另起一段请按Enter</font></div>
                  <br>
                  <br>
                  <br>
                  <br>
                  
                </td>
                <td> 
                  <INPUT type="hidden" name="content" value="<p>&nbsp;</p><p><font color=#ff0000>本样式为自带默认样式，最佳调用宽度550px，高度350px！</font></p><p>下面为一些高级调用功能的例子，你可以用脚本方便的编辑进行一些操作。</p><p>看到这些内容，且没有错误提示，说明安装已经正确完成！</p>">
                  <IFRAME ID="eWebEditor1" src="./eWebEditor.jsp?id=content&style=standard" frameborder="0" scrolling="no" width="640" height="350"></IFRAME>
                  </iframe> </td>
              </tr>
              <tr class="tdbg"> 
                <td align="right" width="120"><strong><font color="#ff0000">首页图片：</font></strong></td>
                <td> <input name="defaultPicUrl" id="defaultPicUrl" size="56" maxlength="200" type="text">
                  用于在首页的图片文章处显示 <br>
                  直接从上传图片中选择： 
                  <select name="defaultPicList" id="defaultPicList" onchange="DefaultPicUrl.value=this.value;frmPreview.img.src=((this.value == '') ? '../images/nopic.gif' : '/Article/UploadFiles/'+this.value);">
                    <option selected="selected">不指定首页图片</option>
                  </select> <input name="UploadFiles" id="UploadFiles" type="hidden"> 
                </td>
              </tr>
              <tr class="tdbg" id="ArticleContent2" style=""> 
                <td align="right" width="120"><strong>内容分页方式：</strong></td>
                <td> <select name="paginationType" id="paginationType">
                    <option value="0" selected="selected">不分页</option>
                    <option value="1">自动分页</option>
                    <option value="2">手动分页</option>
                  </select> &nbsp;&nbsp;&nbsp;&nbsp;<strong><font color="#0000ff">注：</font></strong><font color="#0000ff">手动分页符标记为“</font><font color="#ff0000">[NextPage]</font><font color="#0000ff">”，注意大小写</font> 
                </td>
              </tr>
              <tr class="tdbg" id="ArticleContent3" style=""> 
                <td align="right" width="120">&nbsp;</td>
                <td>自动分页时的每页大约字符数（包含HTML标记）：<strong> 
                  <input name="maxCharPerPage" id="maxCharPerPage" value="10000" size="8" maxlength="8" type="text">
                  </strong></td>
              </tr>
              <tr class="tdbg"> 
                <td align="right" width="120"><strong>文章阅读点数：</strong></td>
                <td><input name="readPoint" id="readPoint" value="0" size="5" maxlength="4" type="text"> 
                  &nbsp;&nbsp;<font color="#0000ff">如果点数大于0，则会员阅读此文章时将消耗相应点数（设为9999时除外），游客将无法查看此文章</font> 
                </td>
              </tr>
              <tr class="tdbg"> 
                <td align="right" width="120"><strong>文章属性：</strong></td>
                <td> <input name="onTop" id="onTop" value="yes" type="checkbox">
                  固顶文章&nbsp;&nbsp;&nbsp;&nbsp; <input name="hot" id="hot" value="yes" onclick="javascript:document.myform.Hits.value='1000'" type="checkbox">
                  热门文章&nbsp;&nbsp;&nbsp;&nbsp; <input name="elite" id="elite" value="yes" type="checkbox">
                  推荐文章&nbsp;&nbsp;&nbsp;&nbsp; 文章评分等级： 
                  <select name="stars" id="stars">
                    <option value="5">★★★★★</option>
                    <option value="4">★★★★</option>
                    <option value="3" selected="selected">★★★</option>
                    <option value="2">★★</option>
                    <option value="1">★</option>
                    <option value="0">无</option>
                  </select> </td>
              </tr>
              <tr class="tdbg"> 
                <td align="right" width="120"><strong>点击数初始值：</strong></td>
                <td> <input name="hits" id="hits" value="0" size="10" maxlength="10" type="text">
                  &nbsp;&nbsp; <font color="#0000ff">这功能是提供给管理员作弊用的。不过尽量不要用呀！^_^</font> 
                </td>
              </tr>
              <tr class="tdbg"> 
                <td align="right" width="120"><strong>录入时间：</strong></td>
                <td> <input name="updateTime" id="updateTime" value="<aqu:getNow/>" maxlength="50" type="text">
                  时间格式为“年-月-日 时:分:秒”，如：<font color="#0000ff">2003-5-12 12:32:47</font> 
                </td>
              </tr>
              <tr class="tdbg"> 
                <td align="right" width="120"><strong>配色风格：</strong></td>
                <td><select name="skinID" id="skinID">
                    <option value="0" selected="selected">系统默认风格</option>
                    <option value="1">蓝色经典（默认）</option>
                  </select>
                  &nbsp;相关模板中包含CSS、颜色、图片等信息</td>
              </tr>
              <tr class="tdbg"> 
                <td align="right" width="120"><strong>版面设计模板：</strong></td>
                <td><select name="templateID" id="templateID">
                    <option value="0" selected="selected">系统默认内容页模板</option>
                    <option value="6">文章内容页模板（一列式）（默认）</option>
                    <option value="7">文章内容页模板（二列式(左小右大)）</option>
                    <option value="8">文章内容页模板（二列式(左大右小)）</option>
                  </select>
                  &nbsp;相关模板中包含了版面设计的版式等信息</td>
              </tr>
              <tr class="tdbg"> 
                <td align="right" width="120"><strong>立即发布：</strong></td>
                <td> <input name="passed" id="passed" value="yes" checked="checked" type="checkbox">
                  是<font color="#0000ff">（如果选中的话将直接发布，否则审核后才能发布。）</font> </td>
              </tr>
            </tbody>
          </table></td>
      </tr>
    </tbody>
  </table>
  <p align="center"> 
    <input name="Action" id="Action" value="SaveAdd" type="hidden">
    <input name="AddType" id="AddType" value="2" type="hidden">
    <input name="ChannelID" id="ChannelID" value="1" type="hidden">
    <input name="add" id="Add" value=" 添 加 " onclick="document.myform.Action.value='SaveAdd';document.myform.target='_self';" style="" type="submit">
    &nbsp; 
    <input name="Preview" id="Preview" value=" 预 览 " onclick="document.myform.Action.value='Preview';document.myform.target='_blank';" style="" type="submit">
    <input name="Cancel" id="Cancel" value=" 取 消 " onclick="window.location.href='Admin_Article.asp?ChannelID=1&Action=Manage';" style="" type="button">
  </p>
  <br>
</form>
<!-- Powered by: PowerEasy 2005 -->
</body>
</html>
