<%@ page language="java" import="com.bjsxt.shopping.product.*" pageEncoding="GBK"%>
<%@ page import="com.bjsxt.shopping.category.*" %>
<%@ page import="java.util.*"%>

<%

request.setCharacterEncoding("GBK");

int id = Integer.parseInt(request.getParameter("id"));
Product p = ProductMgr.getInstance().loadById(id);

String action = request.getParameter("action");

if(action != null && action.trim().equals("add")) {
	String name = request.getParameter("name");
	double normalPrice = Double.parseDouble(request.getParameter("normalPrice"));
	double memberPrice = Double.parseDouble(request.getParameter("memberPrice"));
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	String descr = request.getParameter("descr");
	p.setName(name);
	p.setNormalPrice(normalPrice);
	p.setMemberPrice(memberPrice);
	p.setDescr(descr);
	p.setCategoryId(categoryId);
	p.setPdate(new Date());
	ProductMgr.getInstance().update(p);
	out.println("更新成功！");
%>
	<script type="text/javascript">
	<!--
		parent.main.location.reload();	
	//-->
	</script>
<%
}
 %>

<html><head><title>金尚商城产品添加</title>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="keywords" content="Discuz!,Board,Comsenz,forums,bulletin board,">
<meta name="description" content="醒客论坛专区  - Discuz! Board">
<meta name="generator" content="Discuz! 4.0.0RC4 with Templates 4.0.0">
<meta name="MSSmartTagsPreventParsing" content="TRUE">
<meta http-equiv="MSThemeCompatible" content="Yes">

<style type="text/css"><!--
a			{ text-decoration: none; color: #000000 }
a:hover			{ text-decoration: underline }
body			{ scrollbar-base-color: #F3F6FA; scrollbar-arrow-color: #4D76B3; font-size: 12px; background-color: #ffffff }
table			{ font: 12px Verdana,Tahoma; color: #000000 }
input,select,textarea	{ font: 11px Verdana,Tahoma; color: #000000; font-weight: normal; background-color: #F3F6FA }
select			{ font: 11px Verdana,Tahoma; color: #000000; font-weight: normal; background-color: #F3F6FA }
.nav			{ font: 12px Verdana,Tahoma; color: #000000; font-weight: bold }
.nav a			{ color: #000000 }
.header			{ font: 11px Verdana,Tahoma; color: #FFFFFF; font-weight: bold; background-image: url("images/green/bg01.gif") }
.header a		{ color: #FFFFFF }
.category		{ font: 11px Verdana,Tahoma; color: #000000; background-color: #EFEFEF }
.tableborder		{ background: #4D76B3; border: 0px solid #4D76B3 } 
.singleborder		{ font-size: 0px; line-height: 0px; padding: 0px; background-color: #F3F6FA }
.smalltxt		{ font: 11px Verdana,Tahoma }
.outertxt		{ font: 12px Verdana,Tahoma; color: #000000 }
.outertxt a		{ color: #000000 }
.bold			{ font-weight: bold }
.altbg1			{ background: #F3F6FA }
.altbg2			{ background: #FFFFFF }
--></style>
<script language="JavaScript" src="images/common.js"></script>
<style type="text/css" id="defaultPopStyle">.cPopText { font-family: Tahoma, Verdana; background-color: #FFFFCC; border: 1px #000000 solid; font-size: 12px; padding-right: 4px; padding-left: 4px; height: 20px; padding-top: 2px; padding-bottom: 2px; visibility: hidden; filter: Alpha(Opacity=80)}</style></head><body leftmargin="0" rightmargin="0" topmargin="0" onkeydown="if(event.keyCode==27) return false;"><div id="popLayer" style="position: absolute; z-index: 1000;" class="cPopText"></div>

<script type="text/javascript">
function check() {
	var selectedCategory = document.formModify.categoryId.options[document.formModify.categoryId.selectedIndex];
	var selectedValue = selectedCategory.value;
	if(selectedValue.split("|")[1] == "1") {
		alert("请选择第二级分类！");
		document.formModify.categoryId.focus();
		return false;
	} else {
		selectedCategory.value = selectedValue.split("|")[0];
	}
	return true;
}
</script>

<br>
<form method="post" name="formModify" action="ProductModify.jsp" onsubmit="return check()">
<input type="hidden" name="action" value="add"/>
<input type="hidden" name="id" value="<%=id %>"/>

<table class="tableborder" align="center" cellpadding="4" cellspacing="1" width="97%">
<tbody><tr>
<td colspan="2" class="header">产品修改 - 必填内容</td>
</tr>
<tr>
<td class="altbg1" width="21%">产品名称:</td>
<td class="altbg2"><input name="name" size="25" maxlength="25" type="text" value="<%=p.getName()%>"> 
</tr>

<tr>
<td class="altbg1">市场价格:</td>
<td class="altbg2"><input name="normalPrice" size="25" type="text" value="<%=p.getNormalPrice()%>"></td>
</tr><tr>
<td class="altbg1">会员价格:</td>
<td class="altbg2"><input name="memberPrice" size="25" type="text" value="<%=p.getMemberPrice()%>"></td>
</tr>

<tr>
<td class="altbg1">所属类别</td>
<td class="altbg2">
	<select name="categoryId">
		<%
		List<Category> categories = CategoryService.getInstance().getCategories();
		for(Iterator<Category> it = categories.iterator(); it.hasNext(); ) {
			Category c = it.next();
			String selected = "";
			if(c.getId() == p.getCategoryId()) selected = "selected";
			String preStr = "";
			for(int i=1; i<c.getGrade(); i++) preStr += "--";
			%>
			<option value="<%=c.getId()%>|<%=c.getGrade()%>" <%=selected%>><%=preStr + c.getName()%></option>
			<%
		}
		 %>
	</select>
</td>
</tr>

<tr>
<td class="altbg1" valign="top">产品描述:</td>
<td class="altbg2"><textarea name="descr" cols="60" rows="5" id="descr"><%=p.getDescr()%></textarea></td>
</tr>
</tbody></table>
<br>
<center><input name="regsubmit" value="提 &nbsp; 交" type="submit"></center>
</form>

<script language="JavaScript">
//document.register.username.focus();
</script>

</body></html>