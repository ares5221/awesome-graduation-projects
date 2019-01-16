<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>管理后台</title>
<style type="text/css">
<!--
.STYLE1 {
	color: #FFFFFF;
	font-weight: bold;
	font-size: 14px;
	margin-bottom: 5px;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #FFFFFF;
	text-align: center;
	display: block;
}
.leftmenu{
	text-align: center;
	height: 38px;
	width: 750px;
}
.leftmenu a {
	font-size: 12px;
	line-height: 30px;
	color: #000000;
	text-decoration: none;
	text-align: left;
	text-indent: 10px;
	height: 30px;
}
.leftmenu a:hover{
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
img{border:0px;}
body {
	background-color: #d3ceba;
}
-->
</style>
</head>
<script language="javascript">
function showwin(id)
{
	var _o=eval("document.getElementById(\"tab"+id+"\")");
	if(_o.style.display=="none")
	{
		eval("document.getElementById(\"img"+id+"\").src=\"images/list2.jpg\";");
		_o.style.display="";
	}
	else
	{
		eval("document.getElementById(\"img"+id+"\").src=\"images/list1.jpg\";");
		_o.style.display="none";
	}
	
}
</script>
<body>
<table width="1004" border="0" align="center" cellpadding="0" cellspacing="0" background="images/c.jpg">
  <tr>
    <td height="425" colspan="3" align="center" style="background-image:url(images/top.jpg); background-repeat:no-repeat;">
	<br /><br /><br /><br /><br /><br /><br /><br />
	<div class="leftmenu"><span class="STYLE1">导航菜单</span>
	<a href="set1.asp" target="mainifr">　网站设置</a>
	<a href="set2.asp" target="mainifr">　产品分类</a>
	<a href="set3.asp" target="mainifr">　新闻动态</a>
	<a href="set4.asp" target="mainifr">　产品管理</a>
	<a href="set5.asp" target="mainifr">　订单管理</a>
	<a href="set6.asp" target="mainifr">　用户管理</a>
	<a href="set7.asp" target="mainifr">　留言板管理</a>
	<a href="../" target="_top">　退出系统</a>			</div>
    <iframe name="mainifr" class="mainifr" frameborder="0" scrolling="no" style="margin:0px;height:350px;width:750px;border:#966666 solid 5px;padding:0px;" id="mainifr">右侧主内容</iframe></td>
  </tr>
  <tr>
    <td height="30" colspan="3" align="left" valign="top"><img src="images/bottom.jpg" width="1004" height="72" /></td>
  </tr>
</table>
</body>
</html>
