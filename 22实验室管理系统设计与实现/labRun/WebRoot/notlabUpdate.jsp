<%@ page language="java" import="java.util.*,com.umt.lab.vo.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>实验室事务管理系统</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #D2E8F6;
}
-->
</style>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE1 {
	color: #006699;
	font-weight: bold;
}
-->
</style>

<script language="javaScript">
		
		  function check(){
	   	   var lore =document.form1.lore.value;
	   	    var labclass =document.form1.labclass.value;
	   	     var labname =document.form1.labname.value;
	   	      var labDate =document.form1.labDate.value;
	   	       var kts =document.form1.kts.value;
	   	        var team =document.form1.team.value; 
	   	         var teacher =document.form1.teacher.value;
	   	        
	   	  if (lore.length==0)
		   {
		    alert("请输入学部");
            document.form1.lore.focus();    //焦点      
            return;		   
		   }
		    if (labclass.length==0)
		   {
		    alert("请输入实验班级");
            document.form1.labclass.focus();    //焦点      
            return;	   
		   }
		    if (labname.length==0)
		   {
		    alert("请输入实验名称");
            document.form1.labname.focus();    //焦点      
            return;	   
		   }
		   
		    if (labDate.length==0)
		   {
		    alert("请输入实验日期");
            document.form1.labDate.focus();    //焦点      
            return;	   
		   }
		   if (kts.length==0)
		   {
		    alert("请输入节次");
            document.form1.kts.focus();    //焦点      
            return;	   
		   }
		   if (team.length==0)
		   {
		    alert("请输入组数");
            document.form1.team.focus();    //焦点      
            return;	   
		   }
		   if (teacher.length==0)
		   {
		    alert("请输入教师名称");
            document.form1.teacher.focus();    //焦点      
            return;	   
		   }
		  
               document.form1.action="labAction.do";
		       document.form1.submit();
		  } 
		   	function init(){  		   
		         var lore = <%=((labVo)request.getAttribute("simpleemp")).getLore()%>;
		      //  alert(mgr);
		         var option = document.form1.lore.options;		         
		         for(var i=0;i<option.length;i++){
		       // alert(option[i].value);
                    if(option[i].value == lore){
                       option[i].selected="selected";
          }		       
	 }
		   
		   
		   
		   
		   }
	</script>






</head>

<body  onload="init();">

<% 
	
	labVo  vo = (labVo)request.getAttribute("simpleemp");
	if (vo!=null)
	{
	
	%>
		<form name="form1" method="post" action="">

<table width="1000" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="img/til1.jpg" width="1000" height="71" /></td>
  </tr>
  <tr>
    <td><img src="img/banner1.jpg" width="1000" height="5" /></td>
  </tr>

   <tr>
<td background="img/lm_bg.jpg" class ="txtil"><img src="img/lm_banner1.jpg" width="25" height="33" />
    <a href="1.jsp">  最新实验通知 </a><a href="2.jsp">物品借用记录</a><a href="3.jsp">  演示实验通知</a>
    <a href="4.jsp">分组实验记录</a><a href="5.jsp"> 用户系统管理 </a><img src="img/lm_banner9.jpg" width="141" height="33" /></td>
  </tr>
  <tr>
    <td><table width="1000" border="0" cellpadding="0" cellspacing="0" background="img/2lm_bg1.jpg" class="txt1">
      <tr>
        <td width="25" height="29">&nbsp;</td>
        <td width="13"><img src="img/2lm_banner1.jpg" width="13" height="29" /></td>
       <td align="left" background="img/2lm_bg2.jpg">当前位置：实验室分组实验记录</td>
        <td align="right" background="img/2lm_bg2.jpg"> <a href="#" class="txt1">后退</a> | <a href="myInfo.html" class="txt1">个人信息</a> | <a href="login.html" class="txt1">注销</a></td>
        <td width="15"><img src="img/2lm_banner2.jpg" width="15" height="29" /></td>
        <td width="17">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="6" bgcolor="#D2E8F6"></td>
  </tr>
</table>
<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="28">&nbsp;</td>
    <td width="208" valign="top"><table width="208" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="4"><img src="img/left_banner1.jpg" width="208" height="8" /></td>
        </tr>
         <tr>
        <td width="1" bgcolor="#AFCBD9"></td>
        <td width="205" valign="top" bgcolor="E3F4FE"><table width="205" border="0" align="left" cellpadding="0" cellspacing="0">
          <tr>
            <td height="64" background="img/left_til_bg.jpg"><table width="180" border="0" align="center" cellpadding="4" cellspacing="0" class="txt1">
              <tr>
                <td><img width="18" height="17" align="absmiddle" src="img/conner1.jpg">&nbsp; 用户名：管理员</td>
              </tr>
              <tr>
                <td><img src="img/conner2.jpg" width="15" height="15" align="absmiddle" />&nbsp; 登录时间：</td>
              </tr>
              
              
            </table></td>
          </tr>
          <tr>
            <td height="1" bgcolor="A8CDE8"></td>
          </tr>
          <tr>
            <td height="1" bgcolor="#FFFFFF"></td>
          </tr>
          <tr>
            <td><table width="190" border="0" align="center" cellpadding="0" cellspacing="0" class="txt1">
              <tr>
            <td><table width="190" border="0" align="center" cellpadding="0" cellspacing="0" class="txt1">
               <tr>
                <td height="27">&nbsp;&nbsp;&nbsp;</td>
              </tr>
              <tr>
                <td height="1" background="img/xulin.jpg"></td>
              </tr>
              <tr>
                <td height="27">&nbsp;&nbsp;&nbsp;</td>
              </tr>
              <tr>
                <td height="1" background="img/xulin.jpg"></td>
              </tr>
              <tr>
                <td height="27">&nbsp;&nbsp;&nbsp;</td>
              </tr>
              <tr>
                <td height="1" background="img/xulin.jpg"></td>
              </tr>
              <tr>
                <td height="27"></td>
              </tr>
              <tr>
                <td height="1" background="img/xulin.jpg"></td>
              </tr>
              <tr>
                <td height="27">&nbsp;&nbsp;</td>
              </tr>
              <tr>
                <td height="1" background="img/xulin.jpg"></td>
              </tr>
              
              <tr>
                <td height="50">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          
        </table></td>
        <td width="1" bgcolor="FBFFFF"></td>
        <td width="1" bgcolor="#AFCBD9"></td>
      </tr>
      <tr>
        <td colspan="4"><img src="img/left_banner2.jpg" width="208" height="7" /></td>
        </tr>
    </table></td>
    <td width="6">&nbsp;</td>
    <td width="737" valign="top"><table width="737" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="4"><img src="img/body_til.jpg" width="737" height="8" /></td>
      </tr>
      <tr>
        <td width="1" bgcolor="#AFCBD9"></td>
        <td width="734" height="285" valign="top" bgcolor="E3F4FE"><table width="717" border="0" align="center" cellpadding="0" cellspacing="0" class="txt1">
           <tr>
            <td height="47" valign="bottom" background="img/infor_til.jpg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="txttil">修改信息</span><span class="txttil"></span></td>
          </tr>
          <tr>
            <td valign="top"><table width="746" border="0" cellspacing="0" cellpadding="0" height="325" style="height: 325px;">
              
              <tr>
                <td height="150" valign="top" bgcolor="#FFFFFF"><table width="710" border="0" align="center" cellpadding="3" bordercolordark="#FFFFFF" class="txt1">
                  <tr>
                    <td colspan="6" class="txt1"></td>
                  </tr>
				    <tr>
                    <td align="right"><div align="left"><div align="left">学部</div></div></td>
                    <td><select name="lore" class="input_mid" style=" border-bottom-color:#333333">
                      <option selected="selected">        </option>
                      <option value="初中部">初中部</option>
                      <option value="高中">高中</option>
                    </select></td>
                    </tr>
                  <tr>
                    <td width="55" class="txt1">实验班级<br></td>
                    <td width="266" class="txt1"><input name="labclass" type="text" class="input_mid" /></td>
                    <td width="92" align="right" class="txt1">&nbsp;</td>
                    <td width="263" colspan="3" class="txt1">&nbsp;</td>
                    </tr>                  
                  <tr>
                  <tr>
                    <td width="55" class="txt1"><div align="left"><div align="left">实验名称</div></div></td>
                    <td width="266" class="txt1"><input name="labname" type="text" class="input_mid" /></td>
                    <td width="92" align="right" class="txt1">&nbsp;</td>
                    <td width="263" colspan="3" class="txt1">&nbsp;</td>
                    </tr>                  
                  <tr>
				  <tr>
                    <td class="txt1"><div align="left"><div align="left">实验日期</div></div></td>
                    <td class="txt1"><input name="labDate" type="text" class="input_mid" readonly="true"/>
                      <a href="#"><img src="img/conner2.jpg" width="15" height="15" border="0" align="absmiddle" /></a></td>
                    <td align="right" class="txt1">&nbsp;</td>
                    <td colspan="3" class="txt1">&nbsp;</td>
                    </tr>
                    <tr>
                    <td class="txt1"><div align="left"><div align="left">节次</div></div></td>
                    <td class="txt1"><input name="kts" type="text" class="input_mid" /></td>
                    <td align="right" class="txt1">&nbsp;</td>
                    <td colspan="3" class="txt1">&nbsp;</td>
                    
                  </tr>
                  <tr>
                    <td class="txt1"><div align="left"><div align="left">组数</div></div></td>
                    <td class="txt1"><input name="team" type="text" class="input_mid" /></td>
                    <td align="right" class="txt1">&nbsp;</td>
                    <td colspan="3" class="txt1">&nbsp;</td>
                   <tr>
                    <td class="txt1">教师<br></td>
                    <td class="txt1"><input name="teacher" type="text" class="input_mid" readonly="true"/>&nbsp;</td>
                    <td align="right" class="txt1">&nbsp;</td>
                    <td colspan="3" class="txt1">&nbsp;</td>
                    </tr>
                  
                 
                  <tr>
                    
                    <td class="txt1" colspan="7" align="center"><br>
                    <input type="hidden" value="update" name="domethod">
                    <input type="hidden" name="id" value="<%=vo.getId()%>">
                    <input name="b1" type="button" class="button" value="提交" onclick="check();"/>
                    <input name="b2"  type="reset" class="button" value="清除" /><br><br></td>
                  </tr>
				     
				     <% }%>
             
              
            
          
          
      
      <tr>
        <td colspan="4"><img src="img/body_bottom.jpg" width="737" height="7" /></td>
      </tr>
    
 
 


</table>		
</body>
</html>
