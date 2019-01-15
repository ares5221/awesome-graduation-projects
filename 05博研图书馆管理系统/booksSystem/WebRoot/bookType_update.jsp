<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  	<head>
        <base href="<%=basePath%>">
        <title>图书馆管理系统</title>
        <link href="CSS/style.css" rel="stylesheet">
		<script src="JS/onclock.JS" charset="gbk"></script>
		<script src="JS/menu.JS" charset="gbk"></script>
 	</head>
  
  <body>
   <table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
		    <td height="118" valign="top" background="Images/top_bg.gif" bgcolor="#EEEEEE"><table width="100%" height="33"  border="0" cellpadding="0" cellspacing="0">
		      <tr>
		        <td width="81%" height="10"></td>
		        <td colspan="2"></td>
		      </tr>
		      <tr>
		        <td height="20">&nbsp;</td>
		        <td width="10%"><a href="#" onClick="window.location.reload();" class="word_dark">刷新页面</a></td>
		        <td width="9%"><a href="#" onClick="myclose()" class="word_dark">关闭系统</a></td>
		        </tr>
		    </table>
		      <table width="93%" height="79"  border="0" cellpadding="0" cellspacing="0">
		        <tr>
		          <td height="69" align="right" valign="bottom">当前登录用户：${manager.name }</td>
		        </tr>
		    </table></td>
		  </tr>
		</table>
		
		<div class=menuskin id=popmenu
		      onmouseover="clearhidemenu();highlightmenu(event,'on')"
		      onmouseout="highlightmenu(event,'off');dynamichide(event)" style="Z-index:100;position:absolute;"></div>
		<table width="778"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
		      <tr bgcolor="#DFA40C">
		        <td width="3%" height="27">&nbsp;</td>
		        <td width="29%"><div id="bgclock" class="word_white"></div></td>
		        <td width="66%" align="right" bgcolor="#B0690B" class="word_white"><a href="BookServlet" class="word_white">首页</a> |
		        <a  onmouseover=showmenu(event,sysmenu) onmouseout=delayhidemenu() class="word_white" style="CURSOR:hand" >系统设置</a> | <a  onmouseover=showmenu(event,readermenu) onmouseout=delayhidemenu() style="CURSOR:hand"  class="word_white">读者管理</a> | <a  onmouseover=showmenu(event,bookmenu) onmouseout=delayhidemenu() class="word_white" style="CURSOR:hand" >图书管理</a> | <a  onmouseover=showmenu(event,borrowmenu) onmouseout=delayhidemenu() class="word_white" style="CURSOR:hand">图书借还</a> | <a  onmouseover=showmenu(event,querymenu) onmouseout=delayhidemenu()  class="word_white" style="CURSOR:hand" >系统查询</a> | <a  href="pwd_Modify.jsp" class="word_white">更改口令</a> | <a href="AdminServlet2?operation=logout" onClick="quit()" class="word_white">退出系统</a></td>
		        <td width="2%" bgcolor="#B0690B">&nbsp;</td>
		  </tr>
		      <tr bgcolor="#DFA40C">
		        <td height="9" colspan="4" background="Images/navigation_bg_bottom.gif"></td>
		      </tr>
		</table>
		
		<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
		  <tr>
		    <td valign="top" bgcolor="#FFFFFF"><table width="100%" height="509"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
		  <tr>
		    <td height="27" valign="top" style="padding:5px;" class="word_orange">&nbsp;当前位置：图书管理&gt; 图书类型设置&gt;&gt;&gt;</td>
		  </tr>
		  <tr>
		    <td align="center" valign="top" style="padding:5px;">
			    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
			      <tr>
			        <td height="47" background="Images/borrowBackRenew_r.gif">&nbsp;</td>
			      </tr>
			      <tr>
			        <td height="72" align="center" valign="top" background="Images/main_booksort_1.gif" bgcolor="#F8BF73">
				         <table width="96%" border="0" cellpadding="1" cellspacing="1" bordercolor="#F8BF73">
				          <tr>
				            <td valign="top" bgcolor="#F8BF73">
				                <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
									   <form action="AdminServlet1" method="post">
   <input type="hidden" name="operation" value="updatebook">
   <input type="hidden" name="tid" value="${bookType.tid }" /> 
   	<table align="center" style="border:solid 1px red" >
   		<tr>
   			<td>图书类型名称</td>
   			<td><input type="text" name="uname" value="${bookType.typeName }"></td>
   			
   		<tr>
   		<tr>
   			<td>可借天数</td>
   			<td><input type="text" name="udate" value="${bookType.days }"></td>
   				
   			
   		<tr>
   		
   		<tr>
   			
   			<td colspan="2"><input type="submit" value="修改成功"></td>
   			
   		<tr>
   		
   		
   		
   		
   		
   	
   	</table>
   	
   	
   
   </form>
  								</table>
							</td>
				          </tr>
				         </table>
				    </td>
	              </tr>
	              <tr>
			        <td height="19" background="Images/main_booksort_2.gif">&nbsp;</td>
			      </tr>
			    </table>
			</td>
		  </tr>
		</table>
		    
		<table width="778" height="66"  border="0" align="center" cellpadding="-2" cellspacing="-2" bgcolor="#FFFFFF">
		      <tr>
		        <td height="11" colspan="4" background="Images/copyright_t.gif"></td>
		 	  </tr>
		      <tr>
		        <td width="124" height="23">&nbsp;</td>
		        <td valign="bottom" align="center"> CopyRight &copy; 2008 www.**********.com 长春市*****有限公司</td>
		        <td width="141">&nbsp;</td>
		      </tr>
		      <tr>
		        <td height="23">&nbsp;</td>
		        <td align="center">本站请使用IE6.0或以上版本 1024*768为最佳显示效果</td>
		        <td>&nbsp;</td>
		      </tr>
		      <tr>
		        <td height="8"></td>
		        <td height="8"></td>
		        <td height="8"></td>
		      </tr>
	    </table>
	   </td>
      </tr>
     </table>
    </body>
</html>
   
  
  