<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/aqu" prefix="aqu" %>
<jsp:useBean id="sort" class="com.v246.NoLevelSort" scope="page"/>
<c:set value="${aqu:getUrl()}/admin/login.jsp" var="url"/>
<c:if test="${sessionScope.admin==null||sessionScope.admin!='yes'}">
	<c:redirect url="${url}"/>
</c:if>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0064)http://www.v246.com/Admin/Admin_Class.asp?ChannelID=1&Action=Add -->
<HTML>
<HEAD>
<TITLE>文章中心管理----栏目管理</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK 
href="/css/Admin_Style.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1515" name=GENERATOR>
</HEAD>
<BODY leftMargin=2 topMargin=0 marginheight="0" marginwidth="0">
<TABLE class=border cellSpacing=1 cellPadding=2 width="100%" align=center 
border=0>
  <TBODY>
    <TR class=topbg> 
      <TD align=middle colSpan=2 height=22><STRONG>文章中心管理----栏目管理</STRONG></TD>
    </TR>
    <TR class=tdbg> 
      <TD width=70 height=30><STRONG>管理导航：</STRONG></TD>
      <TD height=30><A 
      href="http://www.v246.com/Admin/Admin_Class.asp?ChannelID=1">文章栏目管理首页</A>&nbsp;|&nbsp;<A 
      href="http://www.v246.com/Admin/Admin_Class.asp?ChannelID=1&amp;Action=Add">添加文章栏目</A>&nbsp;</TD>
    </TR>
  </TBODY>
</TABLE>
<FORM name=form1 onsubmit="return check()" action=./addClass.do method=post>
  <TABLE class=border cellSpacing=1 cellPadding=2 width="100%" align=center 
border=0>
    <TBODY>
      <TR class=title> 
        <TD align=middle colSpan=2 height=22><STRONG>添加文章栏目</STRONG></TD>
      </TR>
      <TR class=tdbg2> 
        <TD width=200><STRONG>所属栏目：</STRONG></TD>
        <TD><SELECT name=parentID id="parentID">
			
            <OPTION value=0 
        selected>无（做为一级栏目）</OPTION>
		<c:forEach var="noLevelSort" items="${sort.coll}">
            <OPTION value=${noLevelSort.id}>${noLevelSort.title}</OPTION>
            </c:forEach>
          </SELECT> <FONT 
      color=blue>不能指定为外部栏目</FONT></TD>
      </TR>
      <TR class=tdbg> 
        <TD width=200><STRONG>栏目名称：</STRONG></TD>
        <TD> <FONT 
  color=red> 
          <input name=className id="className" size=37 maxlength=20>
          * </FONT></TD>
      </TR>
      <TR class=tdbg> 
        <TD width=200><STRONG>栏目类型：</STRONG><BR> <FONT 
      color=red>请慎重选择，栏目一旦添加后就不能再更改栏目类型。</FONT></TD>
        <TD> <TABLE>
            <TBODY>
              <TR> 
                <TD width="414"> <FIELDSET>
                  <LEGEND></LEGEND>
                  <BR>
                  <TABLE id=ClassSettings cellSpacing=1 cellPadding=2 width="100%" 
            bgColor=#ffffff border=0>
                    <!--DWLayoutTable-->
                    <TBODY>
                      <TR class=tdbg2> 
                        <TD align=middle colSpan=2><B>栏目参数设置</B></TD>
                      </TR>
                      <TR class=tdbg> 
                        <TD width=300><STRONG>栏目目录：</STRONG>（栏目英文名）<BR> <FONT 
                  color=#ff0000>只能是英文，不能带空格或“\”、“/”等符号。<BR>
                          本功能需要服务器支持FSO。但即使你的服务器不支持FSO，也请认真录入，因为可以在换了空间再批量生成。</FONT></TD>
                        <TD><INPUT name=classDir id="classDir" size=15 maxLength=20> 
                          <FONT 
                  color=red>*</FONT></TD>
                      </TR>
                      <TR class=tdbg2 id=ClassSetting3 style="DISPLAY: none"> 
                        <TD height="24" valign="top"><STRONG>每页显示的文章数：</STRONG><BR>
                          当此栏目为最下一级栏目时，则会分页显示此栏目中的文章，这里指定的是每页显示的文章数。</TD>
                        <TD><SELECT name=maxPerPage id="maxPerPage">
                            <OPTION 
                    value=5>&nbsp;&nbsp;5&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=6>&nbsp;&nbsp;6&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=7>&nbsp;&nbsp;7&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=8>&nbsp;&nbsp;8&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=9>&nbsp;&nbsp;9&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=10>&nbsp;&nbsp;10&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=11>&nbsp;&nbsp;11&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=12>&nbsp;&nbsp;12&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=13>&nbsp;&nbsp;13&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=14>&nbsp;&nbsp;14&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=15>&nbsp;&nbsp;15&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=16>&nbsp;&nbsp;16&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=17>&nbsp;&nbsp;17&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=18>&nbsp;&nbsp;18&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=19>&nbsp;&nbsp;19&nbsp;&nbsp;</OPTION>
                            <OPTION value=20 
                    selected>&nbsp;&nbsp;20&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=21>&nbsp;&nbsp;21&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=22>&nbsp;&nbsp;22&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=23>&nbsp;&nbsp;23&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=24>&nbsp;&nbsp;24&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=25>&nbsp;&nbsp;25&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=26>&nbsp;&nbsp;26&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=27>&nbsp;&nbsp;27&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=28>&nbsp;&nbsp;28&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=29>&nbsp;&nbsp;29&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=30>&nbsp;&nbsp;30&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=31>&nbsp;&nbsp;31&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=32>&nbsp;&nbsp;32&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=33>&nbsp;&nbsp;33&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=34>&nbsp;&nbsp;34&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=35>&nbsp;&nbsp;35&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=36>&nbsp;&nbsp;36&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=37>&nbsp;&nbsp;37&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=38>&nbsp;&nbsp;38&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=39>&nbsp;&nbsp;39&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=40>&nbsp;&nbsp;40&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=41>&nbsp;&nbsp;41&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=42>&nbsp;&nbsp;42&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=43>&nbsp;&nbsp;43&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=44>&nbsp;&nbsp;44&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=45>&nbsp;&nbsp;45&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=46>&nbsp;&nbsp;46&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=47>&nbsp;&nbsp;47&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=48>&nbsp;&nbsp;48&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=49>&nbsp;&nbsp;49&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=50>&nbsp;&nbsp;50&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=51>&nbsp;&nbsp;51&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=52>&nbsp;&nbsp;52&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=53>&nbsp;&nbsp;53&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=54>&nbsp;&nbsp;54&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=55>&nbsp;&nbsp;55&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=56>&nbsp;&nbsp;56&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=57>&nbsp;&nbsp;57&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=58>&nbsp;&nbsp;58&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=59>&nbsp;&nbsp;59&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=60>&nbsp;&nbsp;60&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=61>&nbsp;&nbsp;61&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=62>&nbsp;&nbsp;62&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=63>&nbsp;&nbsp;63&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=64>&nbsp;&nbsp;64&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=65>&nbsp;&nbsp;65&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=66>&nbsp;&nbsp;66&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=67>&nbsp;&nbsp;67&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=68>&nbsp;&nbsp;68&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=69>&nbsp;&nbsp;69&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=70>&nbsp;&nbsp;70&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=71>&nbsp;&nbsp;71&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=72>&nbsp;&nbsp;72&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=73>&nbsp;&nbsp;73&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=74>&nbsp;&nbsp;74&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=75>&nbsp;&nbsp;75&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=76>&nbsp;&nbsp;76&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=77>&nbsp;&nbsp;77&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=78>&nbsp;&nbsp;78&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=79>&nbsp;&nbsp;79&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=80>&nbsp;&nbsp;80&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=81>&nbsp;&nbsp;81&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=82>&nbsp;&nbsp;82&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=83>&nbsp;&nbsp;83&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=84>&nbsp;&nbsp;84&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=85>&nbsp;&nbsp;85&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=86>&nbsp;&nbsp;86&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=87>&nbsp;&nbsp;87&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=88>&nbsp;&nbsp;88&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=89>&nbsp;&nbsp;89&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=90>&nbsp;&nbsp;90&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=91>&nbsp;&nbsp;91&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=92>&nbsp;&nbsp;92&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=93>&nbsp;&nbsp;93&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=94>&nbsp;&nbsp;94&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=95>&nbsp;&nbsp;95&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=96>&nbsp;&nbsp;96&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=97>&nbsp;&nbsp;97&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=98>&nbsp;&nbsp;98&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=99>&nbsp;&nbsp;99&nbsp;&nbsp;</OPTION>
                            <OPTION 
                    value=100>&nbsp;&nbsp;100&nbsp;&nbsp;</OPTION>
                          </SELECT></TD>
                      </TR>
                    </TBODY>
                  </TABLE>
                  </FIELDSET></TD>
              </TR>
            </TBODY>
          </TABLE></TD>
      </TR>
      <TR class=tdbg> 
        <TD align=middle colSpan=2 height=40><INPUT id=Action type=hidden 
      value=SaveAdd name=Action> <INPUT id=ChannelID type=hidden value=1 
      name=ChannelID> <INPUT style="CURSOR: hand" type=submit value=" 添 加 " name=Add> 
          &nbsp;&nbsp; <INPUT id=Cancel style="CURSOR: hand" onclick="window.location.href='Admin_Class.asp?ChannelID=1'" type=button value=" 取 消 " name=Cancel></TD>
      </TR>
    </TBODY>
  </TABLE>
</FORM>
<SCRIPT language=JavaScript type=text/JavaScript>
function check(){
  if (document.form1.className.value==''){
   alert('栏目名称不能为空！');
   document.form1.className.focus();
   return false;}
    if(document.form1.classDir.value==''){
      alert('栏目目录不能为空！');
      document.form1.classDir.focus();
      return false;}
}

</SCRIPT>
<!-- Powered by: PowerEasy 2005 -->
</BODY>
</HTML>
