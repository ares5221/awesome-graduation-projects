<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>

<%@ include file="conn.jsp"%>
<%
if(session.getAttribute("admin_name")!=null){
//--------------------------------------logged------------------------------------------------------------------
%>
<html>
<head>
<title>管理页面</title>
<style type=text/css>
BODY{
FONT-SIZE:9pt;
scrollbar-face-color: #DEE3E7;
scrollbar-highlight-color: #FFFFFF;
scrollbar-shadow-color: #DEE3E7;
scrollbar-3dlight-color: #D1D7DC;
scrollbar-arrow-color:  #006699;
scrollbar-track-color: #EFEFEF;
scrollbar-darkshadow-color: #98AAB1;
}
td  { font:normal 12px 宋体; }
a  { font:normal 12px 宋体; color:#000000; text-decoration:none; }
a:hover  { color:#428EFF;text-decoration:underline; }
</style>
</head>
<BODY leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td  id=menuTitle1 onclick="showsubmenu(0)" align="center">
        <img border="0" src="../img/promo_list_top.gif" width="100%" height="4"></td>
  </tr>
  <tr>
        <td height=25  id=menuTitle1 onclick="showsubmenu(0)" align="center" bgcolor="#DBC2B0"> 
          <b><font color="#3366CC">使用帮助</font></b></td>
  </tr>
  <tr>
    <td bgcolor="#F5EFE7">
            <table cellpadding=0 cellspacing=0 align=center width=135>
              <tr> 
                <td height=20><a target="_top" href="../index.jsp">返回首页</a></td>
              </tr>
              <tr> 
                <td height=20><a href="quit.jsp" target="_top">注销登陆</a></td>
              </tr>
    
              <tr> 
                <td height=20><a href=main.html target=right>查看使用帮助</a></td>
              </tr>
            </table>
	</td>
  </tr>
</table>

<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td  id=menuTitle1 onclick="showsubmenu(0)" align="center">
        <img border="0" src="../img/promo_list_top.gif" width="100%" height="4"></td>
  </tr>
  <tr>
        <td height=25 align="center" bgcolor="#DBC2B0"> 
          <b><font color="#3366CC">商品订单管理</font></b></td>
  </tr>
  <tr>
    <td bgcolor="#F5EFE7">
            <table cellpadding=0 cellspacing=0 align=center width=135>
              <tr> 
                <td height=20><a href=addhw.jsp target=right>添加新商品</a></td>
              </tr>
              <tr> 
                <td height=20><a href=delhw.jsp target=right>查看与修改</a></td>
              </tr>
              <tr> 
                <td height=20><a href=subpass.html target=right>管理商品订单</a></td>
              </tr>
              <tr> 
                <td height=20><a href=submitsub.html target=right>已确认定单</a></td>
              </tr>
              <tr> 
                <td height=20><a href=subreport.html target=right>查询投诉订单</a></td>
              </tr>
              </table>
	</td>
  </tr>
</table>

<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td  id=menuTitle1 onclick="showsubmenu(0)" align="center">
        <img border="0" src="../img/promo_list_top.gif" width="100%" height="4"></td>
  </tr>
  <tr>
        <td height=25 align="center" bgcolor="#DBC2B0"> 
          <b><font color="#3366CC"> 
          <span>管理网站用户</span></font></b></td>
  </tr>
  <tr>
    <td bgcolor="#F5EFE7">
            <table cellpadding=0 cellspacing=0 align=center width=135>
              <tr> 
                <td height=20><a href=usermanage.jsp target=right>管理网站用户</a></td>
              </tr>
              <tr> 
                <td height=20><a href=adduser.jsp target=right>管理VIP 用户</a></td>
              </tr>
              <tr> 
                <td height=20><a target="right" href="ac.jsp">管理后台管理员</a></td>
              </tr>
            </table>
	</td>
  </tr>
</table>

<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td  id=menuTitle1 onclick="showsubmenu(0)" align="center">
        <img border="0" src="../img/promo_list_top.gif" width="100%" height="4"></td>
  </tr>
  <tr>
        <td height=25 align="center" bgcolor="#DBC2B0"> 
          <font color="#3366CC"><b>分类管理</b></font></td>
  </tr>
  <tr>
    <td bgcolor="#F5EFE7">
            <table cellpadding=0 cellspacing=0 align=center width=135>
              <tr> 
                <td height=20><a href=addsort.jsp target=right>商品大类管理</a></td>
              </tr>
              <tr> 
                <td height=20><a href=addsort.jsp target=right>商品小类管理</a></td>
              </tr>
            </table>
	</td>
  </tr>
</table>

<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td  id=menuTitle1 onclick="showsubmenu(0)" align="center">
        <img border="0" src="../img/promo_list_top.gif" width="100%" height="4"></td>
  </tr>
  <tr>
        <td height=25 align="center" bgcolor="#DBC2B0"> 
          <font color="#3366CC"><b>网站信息管理</b></font></td>
  </tr>
  <tr>
    <td bgcolor="#F5EFE7">
<table cellpadding=0 cellspacing=0 align=center width=135>
	
<tr>
                <td height=20><a href=addnews.jsp target=right>添加首页新闻</a></td>
              </tr>

<tr>
                <td height=20><a href=delnews.jsp target=right>新闻修改删除</a></td>
              </tr>

<tr>
                <td height=20><a href=gg.jsp target=right>首页公告设置</a></td>
              </tr>

</table>
	</td>
  </tr>
</table>

<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td  id=menuTitle1 onclick="showsubmenu(0)" align="center">
        <img border="0" src="../img/promo_list_top.gif" width="100%" height="4"></td>
  </tr>
  <tr>
        <td height=25 align="center" bgcolor="#DBC2B0"> 
          <font color="#3366CC"><b>网站常规设置</b></font></td>
  </tr>
  <tr>
    <td bgcolor="#F5EFE7">
            <table cellpadding=0 cellspacing=0 align=center width=135>
              <tr> 
                <td height=20><a href=upsystem.jsp target=right>网站信息设置</a></td>
              </tr>
              <tr> 
                <td height=20><a href=guanggao.jsp target=right>网站广告设置</a></td>
              </tr>
              
              <tr> 
                <td height=20><a href=links.jsp target=right>友情链接管理</a></td>
              </tr>
            </table>
	</td>
  </tr>
</table>

<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td  id=menuTitle2 onclick="showsubmenu(0)" align="center">
        <img border="0" src="../img/promo_list_top.gif" width="100%" height="4"></td>
  </tr>
  <tr>
        <td height=25 align="center" bgcolor="#DBC2B0"> 
          <font color="#3366CC"><b>版权信息</b></font></td>
  </tr>
  <tr>
    <td bgcolor="#F5EFE7">
            <table cellpadding=0 cellspacing=0 align=center width=135 height="29">
              <tr> 
                <td height=29><p style="line-height: 150%">
				&copy;<a target="_blank" href="http://shop.danhome.com"><font color="#FF0000"><b>ckstudio</b></a><br>
				<a target="_blank" href="http://shop.danhome.com">
                http://shop.danhome.com</a><br>
				<a href="mailto:ckstudio@sina.com">ckstudio@sina.com</a><br>
              QQ:<span lang="zh-cn">41044086</span></td>
              </tr>
              </table>
	</td>
  </tr>
</table>
<%
}
else{//------------------------------------not logged-------------------------------------------------------
response.sendRedirect("login.jsp");
}
%>