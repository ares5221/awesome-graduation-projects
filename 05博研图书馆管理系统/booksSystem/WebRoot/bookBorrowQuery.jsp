<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	    <script type="text/javascript" src="JS/jquery-1.9.1.js" charset="utf-8"></script>
	    <script type="text/javascript">
		    function quit(){
				if(confirm("真的要退出系统吗?")){
					window.location.href="login.html";
				}
			}
	    	function myclose(){
					if(confirm("真的要关闭当前窗口吗?")){
						window.close();
					}
			}
			
	    </script>	
    </head>
	<body onLoad="clockon(bgclock)">
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
		      onmouseout="highlightmenu(event,'off');dynamichide(event)" style="Z-index:100;position:absolute;"> 
		</div>
		<table width="778"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
		      <tr bgcolor="#DFA40C">
		        <td width="3%" height="27">&nbsp;</td>
		        <td width="29%"><div id="bgclock" class="word_white"></div></td>
				<td width="66%" align="right" bgcolor="#B0690B" class="word_white">
					  <a href="BookServlet" class="word_white">首页</a> 
					| <a  onmouseover=showmenu(event,sysmenu) onmouseout=delayhidemenu() class="word_white" style="CURSOR:hand" >系统设置</a> 
			        | <a  onmouseover=showmenu(event,readermenu) onmouseout=delayhidemenu() style="CURSOR:hand"  class="word_white">读者管理</a> 
			        | <a  onmouseover=showmenu(event,bookmenu) onmouseout=delayhidemenu() class="word_white" style="CURSOR:hand" >图书管理</a> 
			        | <a  onmouseover=showmenu(event,borrowmenu) onmouseout=delayhidemenu() class="word_white" style="CURSOR:hand">图书借还</a> 
			        | <a  onmouseover=showmenu(event,querymenu) onmouseout=delayhidemenu()  class="word_white" style="CURSOR:hand" >系统查询</a> 
			        | <a  href="pwd_Modify.jsp" class="word_white">更改口令</a> | <a href="AdminServlet2?operation=logout" onClick="quit()" class="word_white">退出系统</a>
			    </td>
		        <td width="2%" bgcolor="#B0690B">&nbsp;</td>
		      </tr>
		      <tr bgcolor="#DFA40C">
		        <td height="9" colspan="4" background="Images/navigation_bg_bottom.gif"></td>
		      </tr>
		</table>
		
				    	
				    
		<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
		  <tr>
		     <td>
		      <form action="AdminServlet1" method="post">
		                <input type="hidden" name="operation" value="findbookborrowinfo">
				    	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
				    		<tr>
				    		   <td style="background-color:#F9D16B">
				    		        <img src="Images/search.gif" width="45" height="28">
				    		   		<span >请选择查询条件</span> &nbsp;&nbsp;   
				    		   		条形码&nbsp;&nbsp;<input type="radio"  name="type"  value="0"  checked="checked"/>&nbsp;&nbsp;&nbsp;
				    		   		书名&nbsp;&nbsp;<input type="radio"  name="type"  value="1" />	
				    		       <input type="text" id="keyid" name="key" value=""/>&nbsp;&nbsp;
				    		       <input type="submit" value="提交" />
				    		   </td>
				    		</tr>
				    	</table>
				    	</form>
		     
		     
		     
		     </td>
		  </tr>
		  
		  
		  <tr>
		    <td valign="top" bgcolor="#FFFFFF">
			    <table width="100%" height="509"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
				    <tr>
				        <td height="27" valign="top" style="padding:5px;" class="word_orange">当前位置：系统查询 &gt; 图书借阅查询 &gt;&gt;&gt;</td>
				    </tr>
			        <tr>
			            <td align="center" valign="top" style="padding:5px;"> 
				            <table width="100%"  border="0" cellspacing="0" cellpadding="0">		
					              <tr>
					                 <td valign="top" bgcolor="#FCEC9A" style="padding:5px">
						                 <table width="99%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" id="bookborrowtableid" bgcolor="#FFFFFF">
						                   <tr align="center" bgcolor="#F9D16B">
						                     <td width="20%" height="25">图书条形码</td>
						                     <td width="12%">图书名称</td>
						                     <td width="10%">作者</td>
						                     <td width="14%">出版社</td>
						                     <td width="10%">价格(元)</td>
						                     <td width="10%">图书类型</td>
						                     <td width="5%">书架</td>
						                     <td width="10%">馆藏剩余量</td>
						                     <td colspan="2">借阅次数</td>
						                   </tr>
						                   <c:forEach items="${borrowList }" var="each">
							                   	 <tr align="center" bgcolor="#F9D16B">
								                     <td width="20%" height="25">${each[0] }</td>
								                     <td width="12%">${each[1] }</td>
								                     <td width="10%">${each[2] }</td>
								                     <td width="14%">${each[3] }</td>
								                     <td width="10%">${each[4] }</td>
								                     <td width="10%">${each[5] }</td>
								                     <td width="5%">${each[6] }</td>
								                     <td width="10%">${each[7] }</td>
								                     <td colspan="2">${each[8] }</td>
							                     </tr>
						                   </c:forEach>
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