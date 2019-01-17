<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.category.*"%>




<%
	List<Category> categories = CategoryService.getInstance().getCategories();
%>
<html>
	<head>
		<title>类别列表</title>

		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<meta name="keywords"
			content="Discuz!,Board,Comsenz,forums,bulletin board,">
		<meta name="description" content="金尚商城会员列表">
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
.header			{ font: 11px Verdana,Tahoma; color: #000000; font-weight: bold; background-image: url("images/green/bg01.gif") }
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
		<style type="text/css" id="defaultPopStyle">.cPopText { font-family: Tahoma, Verdana; background-color: #FFFFCC; border: 1px #000000 solid; font-size: 12px; padding-right: 4px; padding-left: 4px; height: 20px; padding-top: 2px; padding-bottom: 2px; visibility: hidden; filter: Alpha(Opacity=80)}</style>
	</head>
	<body leftmargin="0" rightmargin="0" topmargin="0"
		onkeydown="if(event.keyCode==27) return false;">
		<div id="popLayer" style="position: absolute; z-index: 1000;"
			class="cPopText"></div>


		<table style="table-layout: fixed;" align="center" border="0"
			cellpadding="0" cellspacing="0" width="97%">
			<tbody>
				<tr>
					<td class="nav" align="left" nowrap="nowrap" width="90%">
						&nbsp;类别管理 &#187; 类别列表
					</td>
					<td align="right" width="10%">
						&nbsp;
						<a href="#bottom"><img src="../images/arrow_dw.gif"
								align="absmiddle" border="0">
						</a>
					</td>
				</tr>
			</tbody>
		</table>
		<br>
		
		<center><a href="CategoryAdd.jsp">添加根类别</a></center>
		
		<table class="tableborder" align="center" cellpadding="4"
			cellspacing="1" width="97%">
			<tbody>
				<tr class="header">
					<td align="center" width="5%">
						类别编号
					</td>
					<td align="center" width="40%">
						类别名称
					</td>
					<td align="right" width="16%">
						类别描述
					</td>
					<td align="center" width="5%">
						PID
					</td>
					<td align="center" width="10%">
						代表字串
					</td>
					<td align="center" width="5%">
						级别
					</td>
					<td align="center">
						处理
					</td>
				</tr>

				<%
				for (int i = 0; i < categories.size(); i++) {
					Category c = categories.get(i);
					String preStr = "";
					for(int j=1; j<c.getGrade(); j++) {
						preStr += "----";
					}
				%>

					<tr>
						<td class="altbg1" align="center" nowrap="nowrap">
							<%=c.getId()%>
						</td>
						<td class="altbg2" align="left">
							<%=preStr + c.getName()%>
						</td>
						<td class="altbg1" align="center">
							<%=c.getDescr()%>
						</td>
						<td class="altbg1" align="center">
							<%=c.getPid()%>
						</td>
						<td class="altbg1" align="center">
							<%=c.getCno()%>
						</td>
						<td class="altbg1" align="right">
							<%=c.getGrade() %>
						</td>
						<td class="altbg2" align="right">
							<a target="detail" href="CategoryModify.jsp?id=<%=c.getId()%>">修改类别</a>
							<% if(c.getGrade()<Category.MAX_GRADE) { %>
								<a href="CategoryAddChild.jsp?pid=<%=c.getId()%>&grade=<%=c.getGrade()%>">添加子类别</a>
							<% } %>
						</td>
					</tr>

				<%
				}
				%>

				
				
			</tbody>
		</table>

		

		<a name="bottom" />
	</body>
</html>
