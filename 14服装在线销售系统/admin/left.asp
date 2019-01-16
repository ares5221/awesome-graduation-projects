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
}
.leftmenu a {
	font-size: 12px;
	line-height: 30px;
	color: #000000;
	text-decoration: none;
	text-align: left;
	text-indent: 10px;
	display: block;
	height: 30px;
}
.leftmenu a:hover{
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
img{border:0px;}
-->
</style><link href="../include/style.css" rel="stylesheet" type="text/css" />
</head>
<script language="javascript">
function showwin(id)
{
	var _o=eval("document.getElementById(\"tab"+id+"\")");
	if(_o.style.display=="none")
	{
		//eval("document.getElementById(\"img"+id+"\").src=\"images/list2.jpg\";");
		_o.style.display="";
	}
	else
	{
		//eval("document.getElementById(\"img"+id+"\").src=\"images/list1.jpg\";");
		_o.style.display="none";
	}
	
}
</script>
<body>
<table width="240" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="7"><img src="images/t1.jpg" width="7" height="24" /></td>
            <td width="226" align="center" valign="middle" background="images/t2.jpg"><span class="STYLE1"><br />
              <br />
            后台管理导航菜单<br />
            <br />
            <br />
            </span></td>
            <td width="7"><img src="images/t3.jpg" width="7" height="24" /></td>
          </tr>
          <tr>
            <td bgcolor="#FFFFFF"></td>
            <td bgcolor="#FFFFFF"><br />
			<div class="leftmenu">
				<a href="set1.asp" target="mainifr"><img src="images/items.gif" width="21" height="22" />　网站设置</a>
				<a href="set2.asp" target="mainifr"><img src="images/items.gif" width="20" height="20" />　产品分类</a>
				<a href="set3.asp" target="mainifr"><img src="images/items.gif" width="20" height="20" />　新闻动态</a>
				<a href="set4.asp" target="mainifr"><img src="images/items.gif" width="20" height="20" />　产品管理</a>
				<a href="set5.asp" target="mainifr"><img src="images/items.gif" width="20" height="20" />　订单管理</a>
				<a href="set6.asp" target="mainifr"><img src="images/items.gif" width="20" height="20" />　用户管理</a>
				<a href="set7.asp" target="mainifr"><img src="images/items.gif" width="20" height="20" />　留言板管理</a>
				<a href="../quitlogin.asp" target="_top"><img src="images/items.gif" width="20" height="20" />　退出系统</a>				</div>
			<br /></td>
            <td bgcolor="#FFFFFF"></td>
          </tr>
        </table>


</body>
</html>
