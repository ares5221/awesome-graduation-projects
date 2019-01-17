<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/aqu" prefix="aqu" %>
<jsp:useBean id="sort" class="com.v246.NoLevelSort" scope="page"/>
<html>
<head>
<c:set value="${aqu:getUrl()}/admin/login.jsp" var="url"/>
<c:if test="${sessionScope.admin==null||sessionScope.admin!='yes'}">
	<c:redirect url="${url}"/>
</c:if>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="/css/Admin_Style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>自定义标签</title>
</head>

<body>
<form name="form1" method="post" action="./addCustom.do" onSubmit="return aquCheckout()">
  请输入标签名称：<font color="#FF0000"><strong>{$</strong></font> 
  <input name="lableName" type="text" id="lableName">
  <font color="#FF0000"><strong>$}</strong></font> 标签描述：
  <input name="remark" type="text" id="remark" size="45">
  <br>
  请选择栏目： 
  <SELECT name=withClass id="withClass">
    <OPTION value=0 
        selected>无(不指定即为所有栏目)</OPTION>
    <c:forEach var="noLevelSort" items="${sort.coll}"> 
    <OPTION value=${noLevelSort.id}>${noLevelSort.title}</OPTION>
    </c:forEach> 
  </SELECT>
  <br>
  <input name="hotOrNews" type="radio" value="hot" checked>
  热门文章 
  <input type="radio" name="hotOrNews" value="news">
  最新文章<br>
  显示条数： 
  <input name="barNumber" type="text" id="barNumber" value="10" size="5">
  <br>
  每行显示字数： 
  <input name="letterNumber" type="text" id="letterNumber" value="0" size="5">
  (<font color="#666666">0表示不限制</font>)<br>
  <input name="isDate" type="checkbox" id="isDate" value="checkbox">
  是否显示更新时间 　 
  <input name="isClick" type="checkbox" id="isClick" value="checkbox">
  是否显示点击数 <br>
  <label>
  <input name="staticOrDynamic" type="radio" value="staticed" checked>
  静态显示
  </label>
  <label> 
  <input type="radio" name="staticOrDynamic" value="dinamic">
  动态显示<br>
  <br>
  </label>
  <input type="reset" name="Submit" value="重置">
  <input type="submit" name="Submit2" value="提交">
</form>
<p>&nbsp; </p>
<script language="JavaScript">
	function aquCheckout()
	{
		if(document.form1.barNumber.value=="")
		{
			alert("显示条数不能为空");
			document.form1.barNumber.focus();
			return false;
		}
		if(document.form1.letterNumber.value=="")
		{
			alert("请输入每行显示的字数");
			document.form1.letterNumber.focus();
			return false;
		}
	}
</script>
</body>
</html>
