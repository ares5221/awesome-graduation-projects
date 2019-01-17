<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/aqu" prefix="aqu"%>
<c:set value="${aqu:getUrl()}/admin/login.jsp" var="url"/>
<c:if test="${sessionScope.admin==null||sessionScope.admin!='yes'}">
	<c:redirect url="${url}"/>
</c:if>
<jsp:useBean id="sort" class="com.v246.NoLevelSort" scope="page"/>
<c:if test="${param.pid==null||param.pid=='0'}"> 
<c:set value="Article" var="query"/> 
	${aqu:initArticleManage(query)} 
	<c:out value="Article"/> 
</c:if> 
<c:if test="${param.pid!=null||param.pid!=''}"> 
	<c:set value="Article where ClassId=${param.pid}" var="query"/> 
	<c:out value="${query}"/> 
	${aqu:initArticleManage(query)} 
</c:if> 
<c:if test="${param.page==null||param.page==0}"> 
	<c:set value="1" var="page"/> 
</c:if> 
<c:if test="${param.page!=null||param.page==0}"> 
	${aqu:gotoPage(param.page)}
</c:if> 
<c:if test="${param.page>aqu:getPageCount()}"> 
	<c:set value="${aqu:getPageCount()}" var="page"/> 
</c:if> 
<c:if test="${param.page<=aqu:getPageCount()}"> 
	<c:set value="${param.page}" var="page"/> 
</c:if> 
${aqu:setPageSize('20')} 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0077)http://127.0.0.1/admin/Admin_Article.asp?ChannelID=1&Action=Manage&Passed=All -->
<HTML>
<HEAD>
<TITLE>文章管理</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK 
href="/css/Admin_Style.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1505" name=GENERATOR>
</HEAD>
<BODY leftMargin=2 topMargin=0 marginheight="0" marginwidth="0">
<TABLE class=border cellSpacing=1 cellPadding=2 width="100%" align=center 
border=0>
  <TBODY>
    <TR class=topbg> 
      <TD align=middle colSpan=2 
  height=22><STRONG>文章中心管理----</STRONG>文章管理首页</TD>
    </TR>
    <TR class=tdbg> 
      <TD width=70 height=30><STRONG>管理导航：</STRONG></TD>
      <TD>添加文章</TD>
    </TR>
  <FORM name=form3 
  action=file:///C|/Documents%20and%20Settings/Administrator/My%20Documents/%B6%AF%D2%D7%CD%F8%C2%E7--%BA%F3%CC%A8%B9%DC%C0%ED.files/Admin_Article.asp?ChannelID=1&Action=Manage&ManageType=&ClassID=0&SpecialID=0&Field=&keyword= 
  method=post>
  </FORM></TBODY>
</TABLE>
<SCRIPT language=javascript>
function unselectall(){
    if(document.myform.chkAll.checked){
 document.myform.chkAll.checked = document.myform.chkAll.checked&0;
    }
}
function CheckAll(form){
  for (var i=0;i<form.elements.length;i++){
    var e = form.elements[i];
    if (e.Name != 'chkAll'&&e.disabled==false)
       e.checked = form.chkAll.checked;
    }
  }
function ConfirmDel(){
 if(document.myform.Action.value=='Del'){
     if(confirm('确定要删除选中的文章吗？本操作将把选中的文章移到回收站中。必要时您可从回收站中恢复！'))
         return true;
     else
         return false;
 }
 else if(document.myform.Action.value=='MoveToClass'){
     if(document.myform.TargetClassID.value==''){
         alert('不能将文章移动到含有子栏目的栏目或外部栏目中！');
         return false;
     }
     if(confirm('确定要将选中的文章移动到指定的栏目吗？'))
         return true;
     else
         return false;
 }
 else if(document.myform.Action.value=='ConfirmDel'){
     if(confirm('确定要彻底删除选中的文章吗？彻底删除后将不能恢复！'))
         return true;
     else
         return false;
 }
 else if(document.myform.Action.value=='ClearRecyclebin'){
     if(confirm('确定要清空回收站？一旦清空将不能恢复！'))
         return true;
     else
         return false;
 }
 else if(document.myform.Action.value=='DelFromSpecial'){
     if(confirm('确定要将选中的文章从其所属专题中删除吗？操作成功后文章将不属于任何专题。'))
         return true;
     else
         return false;
 }
 else if(document.myform.Action.value=='MoveToSpecial'){
     if(confirm('确定要将选中的文章移动到指定的专题吗？'))
         return true;
     else
         return false;
 }
}
</SCRIPT>
<BR>
<TABLE class=border cellSpacing=1 cellPadding=2 width="100%" align=center 
border=0>
  <TBODY>
    <TR class=title> 
      <TD height=22><A 
            onclick="return confirm('确定要重新生成所有文章么？');" 
            href="${aqu:getUrl()}/admin/MDDArticle.jsp?action=writeAll&amp;id=0">生成所有文章</A>&nbsp;</TD>
    </TR>
  </TBODY>
</TABLE>
<BR>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TBODY>
    <TR> 
      <TD height=22>您现在的位置：&nbsp;文章中心管理&nbsp;&gt;&gt;&nbsp;文章管理&nbsp;&gt;&gt;&nbsp;<c:if test="${query=='Article'}">所有文章</c:if><c:if test="${page!='all'}"><c:set value="class where Id=${param.pid}" var="queryClassName"/><c:out value="${aqu:getParentName(queryClassName)}"/></c:if></TD>
      <TD align=right width=200 height=22> <SELECT  onchange="javascript:window.location='articleManage.jsp?pid='+this.options[this.selectedIndex].value+'&amp;Action=manage&amp;page=1'" 
      size=1 name=page>
          <OPTION value=0 
        selected>栏目跳转至......</OPTION>
          <c:forEach var="noLevelSort" items="${sort.coll}"> 
          <OPTION value=${noLevelSort.id}>${noLevelSort.title}</OPTION>
          </c:forEach> </SELECT></TD>
    </TR>
  </TBODY>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
    <TR> 
      <FORM name=myform onsubmit="return ConfirmDel();" action="./articleManage.do"
    method=post>
        <TD> <TABLE class=border cellSpacing=1 cellPadding=0 width="100%" border=0>
            <TBODY>
              <TR class=title height=22> 
                <TD align=middle width=30 height=22><STRONG>选中</STRONG></TD>
                <TD align=middle width=25><STRONG>ID</STRONG></TD>
                <TD align=middle><STRONG>文章标题</STRONG></TD>
                <TD align=middle width=60><STRONG>录入</STRONG></TD>
                <TD align=middle width=40><STRONG>点击数</STRONG></TD>
                <TD align=middle width=80><STRONG>文章属性</STRONG></TD>
                <TD align=middle width=40><STRONG>已审核</STRONG></TD>
                <TD align=middle width=180><STRONG>常规管理操作</STRONG></TD>
              </TR>
              <c:forEach var="aqu" begin="1" end="20"> <c:if test="${aqu:next()}"> 
              <TR class=tdbg onmouseover="this.style.backgroundColor='#BFDFFF'" 
        onmouseout="this.style.backgroundColor=''"> 
                <TD align=middle width=30><INPUT id=ArticleID onclick=unselectall() 
            type=checkbox value=${aqu:getInt('ArticleId')} name=articleId></TD>
                <TD align=middle width=25><c:out value="${aqu:getInt('ArticleId')}"/></TD>
                <TD><A 
            href="${aqu:getUrl()}/admin/articleManage.jsp?action=manage&amp;pid=${aqu:getInt('ClassId')}&amp;page=${page}">[<c:set value="class where Id=${aqu:getInt('ClassId')}" var="queryParentName"/><c:out value="${aqu:getParentName(queryParentName)}"/>]</A>&nbsp;${aqu:getString('Title')}</TD>
                <TD align=middle width=60>admin</TD>
                <TD align=middle width=40><c:out value="${aqu:getInt('Hits')}"/></TD>
                <TD align=middle 
            width=80>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                </TD>
                <TD align=middle width=40><B>√</B> </TD>
                <TD align=left width=180>&nbsp;修改&nbsp;<A 
            onclick="return confirm('确定要删除此文章吗？删除后你还可以从回收站中还原。');" 
            href="${aqu:getUrl()}/admin/MDDArticle.jsp?action=del&amp;id=${aqu:getInt('ArticleId')}">删除</A>&nbsp;<A 
            onclick="return confirm('确定要重新生成此文章么？');" 
            href="${aqu:getUrl()}/admin/MDDArticle.jsp?action=writeOne&amp;id=${aqu:getInt('ArticleId')}">重新生成</A>&nbsp;</TD>
              </TR>
              </c:if> </c:forEach> 
            </TBODY>
          </TABLE>
          <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
            <TBODY>
              <TR> 
                <TD width=200 height=30><INPUT id=chkAll onclick=CheckAll(this.form) 
            type=checkbox value=checkbox name=chkAll>
                  选中本页显示的所有文章</TD>
                <TD><INPUT onclick="document.myform.Action.value='Del'" type=submit value=删除选定的文章 name=submit1>
                  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
<INPUT 
            id=Action type=hidden name=Action>
                  <INPUT id=ChannelID type=hidden 
            value=1 name=ChannelID>
                </TD>
              </TR>
            </TBODY>
          </TABLE></TD>
      </FORM>
    </TR>
  </TBODY>
</TABLE>
<TABLE align=center>
  <TBODY>
    <TR> 
      <TD>共${aqu:getRowsCount()}篇文章&nbsp;&nbsp;<a href='${aqu:getUrl()}/admin/articleManage.jsp?pid=${param.pid}&Action=manage&page=1'>首页</a> 
        <c:if test="${aqu:getPageCount()<=1}">上一页&nbsp;下一页&nbsp;</c:if><c:if test="${aqu:getPageCount()>1&&page==aqu:getPageCount()}"><a href='${aqu:getUrl()}/admin/articleManage.jsp?pid=${param.pid}&Action=manage&page=${page-1}'>上一页&nbsp;</a>下一页&nbsp;</c:if><c:if test="${aqu:getPageCount()>1&&page<=1}">上一页&nbsp;</c:if><c:if test="${aqu:getPageCount()>1&&page<aqu:getPageCount()&&page!=1}"><a href='${aqu:getUrl()}/admin/articleManage.jsp?pid=${param.pid}&Action=manage&page=${page-1}'>上一页&nbsp;</a></c:if><c:if test="${aqu:getPageCount()>1&&page<aqu:getPageCount()}"><a href='${aqu:getUrl()}/admin/articleManage.jsp?pid=${param.pid}&Action=manage&page=${page+1}'>下一页&nbsp;</a></c:if><a href='${aqu:getUrl()}/admin/articleManage.jsp?pid=${param.pid}&Action=manage&page=${aqu:getPageCount()}'>尾页</a>&nbsp;页次：<STRONG><FONT 
      color=red><c:out value="${page}"/></FONT>/<c:out value="${aqu:getPageCount()}"/></STRONG>页 
        &nbsp;<B>20</B>篇文章/页&nbsp;转到： 
        <SELECT onchange="javascript:window.location='articleManage.jsp?pid=${param.pid}&amp;Action=manage&amp;page='+this.options[this.selectedIndex].value;" 
      size=1 name=page>
          <c:set value="1" var="jumpCount"/> <c:forEach var="jump" begin="1" end="${aqu:getPageCount()}"> <OPTION value=${jumpCount}
	      <c:if test="${param.page==jumpCount}">
	  selected
	  </c:if> >第${jumpCount}页</OPTION> <c:set value="${jumpCount+1}" var="jumpCount"/> 
          </c:forEach> </SELECT></TD>
    </TR>
  </TBODY>
</TABLE>
<BR>
<TABLE class=border cellSpacing=0 cellPadding=0 width="100%" border=0><TBODY>
  <TR class=tdbg> 
    <TD align=right width=80><STRONG>文章搜索：</STRONG></TD>
    <TD> <TABLE cellSpacing=0 cellPadding=0 border=0>
        <FORM name=SearchForm 
        action=file:///C|/Documents%20and%20Settings/Administrator/My%20Documents/%B6%AF%D2%D7%CD%F8%C2%E7--%BA%F3%CC%A8%B9%DC%C0%ED.files/Admin_Article.asp?ChannelID=1&Action=Manage&ManageType= 
        method=get>
          <TBODY>
            <TR> 
              <TD align=middle height=28><SELECT size=1 name=Field>
                  <OPTION 
              value=Title selected>文章标题</OPTION>
                  <OPTION 
              value=Content>文章内容</OPTION>
                  <OPTION 
              value=Author>文章作者</OPTION>
                  <OPTION 
            value=Inputer>录入者</OPTION>
                </SELECT>
                <SELECT name=ClassID>
                  <OPTION 
              value="" selected>所有栏目</OPTION>
                  <OPTION 
            value=1>ddd</OPTION>
                </SELECT>
                <INPUT onfocus=this.select(); 
            maxLength=50 value=关键字 name=keyword>
                <INPUT type=submit value=搜索 name=Submit>
                <INPUT 
            id=ManageType type=hidden name=ManageType>
                <INPUT id=ChannelID 
            type=hidden value=1 
  name=ChannelID></TD>
            </TR>
        </FORM>
        
      </TABLE></TD>
  </TR></TBODY>
</TABLE>
<BR>
<B>说明：</B><BR>
&nbsp;&nbsp;&nbsp;&nbsp;文章属性中的各项含义：<FONT 
color=blue>顶</FONT>----固顶文章，<FONT color=red>热</FONT>----热门文章，<FONT 
color=green>荐</FONT>----推荐文章，<FONT color=blue>图</FONT>----首页图片文章<BR>
<BR>
<!-- Powered by: PowerEasy 2005 -->
</BODY>
</HTML></body>
</html> 