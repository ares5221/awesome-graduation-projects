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
		<script type="text/javascript" src="JS/jquery-1.9.1.js" charset="utf-8"></script>
		<script type="text/javascript">
			
			//原密码校验
			function checkOldPwd(oldpwd1){
			   //获取原密码
			   var oldpwd=$("#oldpwdid").val();
			   if(oldpwd==""){
			        $("#span01id").html("<b style='color:red'>请输入的原密码</b>");
					return false;
				}else{
				    //进行原密码是否正确校验 
					if(oldpwd!=oldpwd1){
					    $("#span01id").html("<b style='color:red'>原密码输入错误</b>");
						return false;
					}else{
						$("#span01id").html("");
						return true;
					}
				}
			}
			
			//新密码校验
			function checkNewPwd(){
			    //获取新密码
			    var newpwd=$("#newpwdid").val();
				
				if(newpwd==""){
				    $("#span02id").html("<b style='color:red'>请输入的新密码</b>");
					return false;
				}else{
					var regex=/^\w{6,8}$/ig;
					var bool=regex.test(newpwd);
					if(!bool){
					    $("#span02id").html("<b style='color:red'>密码必须由字母数字下划线构成</b>");
						return false;
					}else{
					    $("#span02id").html("");
					    return  true;
					}
				}
			}
			//确认密码校验
			function checkRePwd(){
			   //获取新密码
			    var newpwd=$("#newpwdid").val();
			    //获取确认密码
			    var repwd=$("#repwdid").val();
			    if(repwd==""){
			        $("#span03id").html("<b style='color:red'>请确认新密码</b>");
					return false;
				 }else{
					if(newpwd!=repwd){
					    $("#span03id").html("<b style='color:red'>您两次输入的新密码不一致，请重新输入</b>");
						$("#newpwdid").val("");
						$("#repwdid").val("");
						return false;
				    }else{
				        $("#span03id").html("");
				        return true;
				    }
				}
			}
			
			
			function modifyPwd(oldpwd){ 
				//获取新密码
			    var newpwd=$("#newpwdid").val();
				if(checkOldPwd(oldpwd)&&checkNewPwd()&&checkRePwd()){
				   //发送请求
				   $.get("AdminServlet2",{operation:"modifypwd",newpwd:newpwd},function(result){
				   		if(result=="true"){
				   			alert("修改成功");
				   			window.location.href="pwd_Modify.jsp";
				   		}else if(result=="false"){
				   			alert("修改失败");
				   		}else{
				   			alert("获取参数出错");
				   		}	
				   });
			    }else{
			    	alert("校验未通过");
			    }
	
			}
			
			function myclose(){
				if(confirm("真的要关闭当前窗口吗?")){
					window.close();
				}
			}
			
			function quit(){
				if(confirm("真的要退出系统吗?")){
					window.location.href="login.html";
				}
			}
		</script>
	</head>
	<body onLoad="clockon(bgclock)">
		<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
		   		<td height="118" valign="top" background="Images/top_bg.gif" bgcolor="#EEEEEE">
			   		<table width="100%" height="33"  border="0" cellpadding="0" cellspacing="0">
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
		   		    </table>
		   		</td>
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
		         <td width="66%" align="right" bgcolor="#B0690B" class="word_white"><a href="BookServlet" class="word_white">首页</a> |
		             <a  onmouseover=showmenu(event,sysmenu) onmouseout=delayhidemenu() class="word_white" style="CURSOR:hand" >系统设置</a> | <a  onmouseover=showmenu(event,readermenu) onmouseout=delayhidemenu() style="CURSOR:hand"  class="word_white">读者管理</a> | <a  onmouseover=showmenu(event,bookmenu) onmouseout=delayhidemenu() class="word_white" style="CURSOR:hand" >图书管理</a> | <a  onmouseover=showmenu(event,borrowmenu) onmouseout=delayhidemenu() class="word_white" style="CURSOR:hand">图书借还</a> | <a  onmouseover=showmenu(event,querymenu) onmouseout=delayhidemenu()  class="word_white" style="CURSOR:hand" >系统查询</a> | <a  href="pwd_Modify.jsp" class="word_white">更改口令</a> | <a href="AdminServlet2?operation=logout" onClick="quit()" class="word_white">退出系统</a>
		         </td>
		         <td width="2%" bgcolor="#B0690B">&nbsp;</td>
		      </tr>
		      <tr bgcolor="#DFA40C">
		        <td height="9" colspan="4" background="Images/navigation_bg_bottom.gif"></td>
		      </tr>
		</table>
		
		<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
		  <tr>
		    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
		  <tr>
		    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
		       <tr>
		          <td height="22" valign="top" class="word_orange">当前位置：更改口令 &gt;&gt;&gt;</td>
		       </tr>
		       <tr>
		          <td align="center" valign="top">
		 			 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
		  				<tr>
		    				<td width="84%">&nbsp;      </td>
						</tr>
					 </table>  
						 <form  action="">
			 				 <table width="47%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" >
			 					 <tr align="center">
			    					<td width="27%" align="left" style="padding:5px;">管理员名称：</td>
			   					    <td width="73%" align="left">
			     						<input name="name" type="text" id="snameid" value="${manager.name }" readonly="readonly" size="30">    
			     					</td>
			     				</tr>
							    <tr>
								    <td align="left" style="padding:5px;">原密码：</td>
								    <td align="left">
								    	<input name="oldpwd" type="password" id="oldpwdid" size="30" onblur="checkOldPwd('${manager.pwd }');"><br><span id="span01id"></span>								     
								    </td>
							    </tr>
			         		    <tr>
								    <td align="left" style="padding:5px;">新密码：</td>
								    <td align="left">
								    	<input name="pwd" type="password" id="newpwdid" size="30" onblur="checkNewPwd();"><br><span id="span02id"></span>
								    </td>
							    </tr>
			   					<tr>
							        <td align="left" style="padding:5px;">确认新密码：</td>
							        <td align="left">
							        	<input name="pwd1" type="password" id="repwdid" size="30" onblur="checkRePwd();"><br><span id="span03id"></span>
							        </td>
							    </tr>
							    <tr>
							      	<td height="65" align="left" style="padding:5px;">&nbsp;</td>
							      	<td>
							      		<input name="Submit" type="button" class="btn_grey" value="保存" onclick="modifyPwd('${manager.pwd }');">
							       		 &nbsp;
							        	<input name="Submit2" type="reset" class="btn_grey" value="取消">
							        </td>
 						     </table>
			              </form>
		              </td>
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