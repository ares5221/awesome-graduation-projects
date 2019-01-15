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
		    function quit(){
				if(confirm("真的要退出系统吗?")){
					window.location.href="login.html";
				}
			}
	    
	       
	       //进行读者条形码校验
	       function checkreader(){
	            //清空上次查询读者借阅信息
				$(".childtrclass").remove();
	            //获取读者条形码的值
				var barcodeval=$("#readerbarcodeid").val();
				if(barcodeval==""){//非空校验
					alert("请输入读者条形码!");form.barcode.focus();return;
				}else{//数据库实名校验
					//发送ajax
					$.post("ReaderServlet",{operation:"findreader",readerbarcode:barcodeval},function(result){
						//判断读者身份
						if(result=="false"){
							alert("该读者信息不存在，请核对读者条形码输入是否正确");
							
							//清空上次查询读者信息
							$("#readernameid").val("");
						    $("#sexid").val("");
						    $("#readertypeid").val("");
						    $("#papertypeid").val("");
						    $("#papernoid").val("");
						    $("#numberid").val("");						    
						}else{
							//对result进行解析
							var varreader=JSON.parse(result);	
							//设置参数的值
						    $("#readernameid").val(varreader.name);
						    $("#sexid").val(varreader.sex);
						    $("#readertypeid").val(varreader.readerType.name);
						    $("#papertypeid").val(varreader.paperType);
						    $("#papernoid").val(varreader.paperNo);
						    
						    
						    //设置读者id
						     $("#readerid").val(varreader.rid);
						     //身份验证成功，获取该读者的借书信息,发送ajax
						     //获取读者id
						    var readerid=varreader.rid;
						    //发送ajax
						    var length=0;
						    $.post("ReaderServlet",{operation:"readerborrowinfo",readerid:readerid},function(result){
						    	if(result!="false"){  
						    		//对result进行解析
									var vararr=JSON.parse(result);	
									//借书表信息更新
									  //获取table
								    var vartable=$("#bookborrowtableid");
								    //对数组进行遍历
								    length=vararr.length;
								    $("#numberid").val(varreader.readerType.number-length);
								    for(var i=0;i<vararr.length;i++){
								         //时间格式转换
								         vartable.append($("<tr align='center' bgcolor='#F9D16B' class='childtrclass'><td width='29%' height='25'>"+vararr[i][2]+"</td><td width='12%'>"+formatDate(vararr[i][3])+"</td><td width='14%'>"+vararr[i][4]+"</td><td width='17%'>"+vararr[i][5]+"</td><td width='14%'>"+vararr[i][6]+"</td><td colspan='2'>"+vararr[i][7]+"</td></tr>")); 
								 } 
						    	} 
						    }); 
						     //做是否可借图书校验
						    if(length==varreader.readerType.number){
						    	alert("该读者借书数量已达上限，不能再借");
						    }
						}
					});	
				}
				
			}
			
			//借书
			function borrowBook(form){
			   //获取查询类型
			   var addtype= $("[name='addtype']:checked").val();
			   //获取查询关键字
			   var addkey=$("#inputkeyid").val();
			   //获取读者id
			   var readerid=$("#readerid").val();
			  // alert(addkey);
			   if(addkey!=""){
			        //发送ajax
			        $.post("ReaderServlet",{operation:"addbooktoreader",addtype:addtype,addkey:addkey,readerid:readerid},function(result){
			            if(result=="booknotfind"){
			            	alert("该书信息不存在");
			            }else if(result=="nobook"){
			            	alert("已无在架可借图书");
			            }else if(result=="false"){
			            	alert("添加失败");
			            }else if(result=="true"){			         
						    alert("借书成功");
						    //刷新页面
						    checkreader();
						    return; 
			            }
			        });
			   }else{
			       //进行非空校验
				   if(addtype=="barcode"){
						alert("请输入读者条形码!");
						return;
					}		
					if(addtype=="bookname"){
						alert("请输入查询关键字!");
						return;
					}
			   }
			}
	    	function myclose(){
					if(confirm("真的要关闭当前窗口吗?")){
						window.close();
					}
			}
			
			//json日期格式转换 
           function formatDate(time){
              // alert(time);
               return time;
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
		    <td valign="top" bgcolor="#FFFFFF">
			    <table width="100%" height="509"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
				    <tr>
				        <td height="27" valign="top" style="padding:5px;" class="word_orange">当前位置：图书借还 &gt; 图书借阅 &gt;&gt;&gt;</td>
				    </tr>
			        <tr>
			            <td align="center" valign="top" style="padding:5px;">
				            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
						        <form name="form1" method="post" action="">
					               <tr>
					               <td height="47" background="Images/borrowBackRenew.gif">&nbsp;</td>
					               </tr>
					               <tr>
					                  <td height="72" align="center" valign="top" background="Images/main_booksort_1.gif" bgcolor="#F8BF73"><table width="96%" border="0" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#F8BF73">
					                     <tr>
					                       <td valign="top" bgcolor="#F8BF73">
					                          <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
					                             <tr>
					                                <td>
					                                  <table width="90%" height="21" border="0" cellpadding="0" cellspacing="0">
					                                      <tr>
					                                         <td width="24%" height="18" style="padding-left:7px;padding-top:7px;"><img src="Images/reader_checkbg.jpg" width="142" height="18"></td>
					                                         <td width="76%" style="padding-top:7px;">读者条形码：
					                                           <input name="barcode" type="text" id="readerbarcodeid" value="" size="24">
					                                           &nbsp;
					                           				   <input name="Button" type="button" class="btn_grey" value="确定" onClick="checkreader()">
					                           				 </td>
					                                      </tr>
					                                 </table>
					                               </td>
					                            </tr>
					                            <tr>
					                                <td height="13" align="left" style="padding-left:7px;"><hr width="90%" size="1"></td>
					                    		</tr>
					                 			<tr>
					                    			<td align="center">
						                    			<table width="96%" border="0" cellpadding="0" cellspacing="0">
						                               	  <tr>
						                             		<td height="27">姓&nbsp;&nbsp;&nbsp;&nbsp;名：
						                           				 <input name="readername" type="text" id="readernameid" value="">
						                           		    </td>
						                          		    <td>性&nbsp;&nbsp;&nbsp;&nbsp;别：
						                                        <input name="sex" type="text" id="sexid" value="">
						                                    </td>
						                                    <td>读者类型：
						                             		    <input name="readerType" type="text" id="readertypeid" value="">
						                             	   </td>
						                                </tr>
						                                <tr>
						                          		   <td height="27">证件类型：
						                              	      <input name="paperType" type="text" id="papertypeid" value="">
						                              	   </td>
						                                   <td>证件号码：
						                            		  <input name="paperNo" type="text" id="papernoid" value="">
						                            	   </td>
						                          		   <td>可借数量：
						                            		   <input name="number" type="text" id="numberid" value="0" size="17">册
						                                       &nbsp;
						                                   </td>
						                                   <input type="hidden" id="readerid" value="" />
						                                </tr>
						                            </table>
					                             </td>
					                          </tr>
					                     </table>
					                  </td>
					               </tr>
					               <tr>
					                 <td height="32" background="Images/borrow_if.gif">&nbsp;添加的依据：
					                   <input name="addtype" type="radio" class="noborder" value="barcode" checked>
					                                                           图书条形码 &nbsp;&nbsp;
					                   <input name="addtype" type="radio" class="noborder" value="bookname">
											图书名称&nbsp;&nbsp;
					  				   <input name="inputkey" type="text" id="inputkeyid" size="50">
					                   <input name="Submit2" type="button" class="btn_grey" value="确定" onClick="borrowBook()">
					                   <input name="operator" type="hidden" id="operator" value="java1234">
					 				   <input name="Button" type="button" class="btn_grey" value="完成借阅" onClick="window.location.href='bookBorrow.jsp'">
					                </td>
					               </tr> 
					              <tr>
					                 <td valign="top" bgcolor="#FCEC9A" style="padding:5px">
						                 <table width="99%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" id="bookborrowtableid" bgcolor="#FFFFFF">
						                   <tr align="center" bgcolor="#F9D16B">
						                     <td width="29%" height="25">图书名称</td>
						                     <td width="12%">借阅时间</td>
						                     <td width="14%">应还时间</td>
						                     <td width="17%">出版社</td>
						                     <td width="14%">书架</td>
						                     <td colspan="2">定价(元)</td>
						                   </tr>
										   <input name="borrowNumber" type="hidden" id="borrowNumber" value="0">
						                 </table>
								    </td>
					              </tr>
					           </table>
					         </td>
					       </tr>
					      		   <tr>
					         <td height="19" background="Images/main_booksort_2.gif">&nbsp;</td>
					       </tr>
						       </form>
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