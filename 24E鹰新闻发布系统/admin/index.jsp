<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/aqu" prefix="aqu" %>
<jsp:useBean id="type" scope="page" class="com.v246.GetTemplateType"/>
<c:set value="${aqu:getUrl()}/admin/login.jsp" var="url"/>
<c:if test="${sessionScope.admin==null||sessionScope.admin!='yes'}">
	<c:redirect url="${url}"/>
</c:if>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="images/Admin_Style.css" rel="stylesheet" type="text/css">
</head>

<body>
***************************************系统标签*****************************<br>
{$nonceLocation$}---------当前位置<br>
{$title$}---------文章简短标题：<br>
{$titleIntact$}---------文章的完整标题<br>
{$subheading$}---------文章的副 标 题<br>
{$author$}---------文章作者<br>
{$copyFrom$}---------文章来源<br>
{$intro$}---------文章简介<br>
{$content$}---------文章内容<br>
{$updateTime$}---------文章的录入时间<br>
{$navigation$}--------栏目导航条<br>
{$click$}------------文章的点击数 
<p><br>
  ************************************自定义标签*****************************<br>
  在系统后台你还可以根据自己的需要来定制标签！<br>
</p>
<p>看看下面这两张图，保证你快速上手（前提是你得有网页制作基础）<br>
  这个是首页的模板，完成之后将其源代码作为首页模板！并将相关文件上传</p>
<p><img src="/images/001.JPG" width="810" height="456"><br>
</p>
<p>这个是首页模板中用到的自定义标签，当然了，你得首先在后台把栏目添加好！然后再添加自定义标签</p>
<p><img src="/images/002.JPG" width="700" height="248"></p>
</body>
</html>
