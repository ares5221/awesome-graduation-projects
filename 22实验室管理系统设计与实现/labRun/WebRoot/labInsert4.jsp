<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>添加资料借还信息</title>
		
		
		<script language="javaScript">
		
		  function check(){
		   var borrowdate =document.form1.borrowdate.value;
	   	   var borrowname =document.form1.borrowname.value;
	   	   var articlename =document.form1.articlename.value;
	   	   var model =document.form1.model.value;
	   	   var borrowlist =document.form1.borrowlist.value;
	   	    
	   	   var returndate =document.form1.returndate.value;
	   	   var returnlist =document.form1.returnlist.value;
	   	   var returnpeople =document.form1.returnpeople.value;
	   	   var returnno =document.form1.returnno.value;
	   	   var returnno=document.form1.returnno.value;
	   	       
	   	        
	   	 if (borrowdate.length==0)
		   {
		    alert("请输入借用日期");
            document.form1.borrowdate.focus();    //焦点      
           return;	   
		   }
	   	  if (borrowname.length==0)
		   {
		    alert("请输入借用人姓名");
            document.form1.borrowname.focus();    //焦点      
            return;		   
		   }
		    if (articlename.length==0)
		   {
		    alert("请输入借用资料名称");
            document.form1.articlename.focus();    //焦点      
            return;	   
		   }
		    if (model.length==0)
		   {
		    alert("请输入资料编号");
            document.form1.model.focus();    //焦点      
            return;	   
		   }
		    if (borrowlist.length==0)
		   {
		    alert("请输入借用资料数量");
            document.form1.borrowlist.focus();    //焦点      
            return;	   
		   }
		   
		   
		   if (returndate.length==0)
		   {
		    alert("请输入归还资料时间");
            document.form1.returndate.focus();    //焦点      
            return;	   
		   }
	   	  if (returnlist.length==0)
		   {
		    alert("请输入归还资料数量");
            document.form1.returnlist.focus();    //焦点      
            return;		   
		   }
		   if (returnpeople.length==0)
		   {
		    alert("请输入归还人姓名");
            document.form1.returnpeople.focus();    //焦点      
            return;	   
		   }
		
		   if (returnno.length==0)
		   {
		    alert("请输入归还资料状态");
            document.form1.returnno.focus();    //焦点      
            return;	   
		   }
		   
		   
		       document.form1.action="labAction.do";
		       document.form1.submit();
		   
		   }
	</script>

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
	font-size: large;
	font-weight: bold;
}
-->
</style>
<script src="time/time.js">
</script>
	</head onload="check();">

	<body>
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="img/til1.jpg" width="1000" height="71" /></td>
  </tr>
  <tr>
    <td><img src="img/banner1.jpg" width="1000" height="5" /></td>
  </tr>
    <tr>
<td background="img/lm_bg.jpg" class ="txtil"><img src="img/lm_banner1.jpg" width="25" height="33" />
    <a href="labAction.do?domethod=labAllSeach"> 最新实验信息</a>|<a href="labAction.do?domethod=SeachAllLab">实验记录</a>|<a href="labAction.do?domethod=SeachArticle">实验室资料管理</a>|<a href="labAction.do?domethod=SeachAllDemo">实验演示信息</a>|<a href="labAction.do?domethod=SeachAllPeople">用户信息管理与成绩查询 </a>
    <img src="img/lm_banner9.jpg" width="141" height="33" /></td>
  </tr>
  <tr>
    <td><table width="1000" border="0" cellpadding="0" cellspacing="0" background="img/2lm_bg1.jpg" class="txt1">
      <tr>
        <td width="25" height="29">&nbsp;</td>
        <td width="13"><img src="img/2lm_banner1.jpg" width="13" height="29" /></td>
        <td align="left" background="img/2lm_bg2.jpg"><br></td>
        <td align="right" background="img/2lm_bg2.jpg">&nbsp;&nbsp;  <a href="labMain.jsp" class="txt1">返回首页</a> | <a href="login.jsp" class="txt1">退出登录</a></td>
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
                <td><img src="img/conner1.jpg" width="18" height="17" align="absmiddle" />　用户名：管理员</td>
              </tr>
              <tr>
                <td><img src="img/conner2.jpg" width="15" height="15" align="absmiddle" />　登录时间：&nbsp;&nbsp;<div id="time1"></div> <br></td>
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
                <td height="27">&nbsp;&nbsp; </td> 
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
                <td height="27">&nbsp;&nbsp;&nbsp; </td>
              </tr>
              <tr>
                <td height="1" background="img/xulin.jpg"></td>
              </tr>
              <tr>
                <td height="1" background="img/xulin.jpg"></td>
              </tr>
              <tr>
                <td height="27">&nbsp;</td>
              </tr>
              <tr>
                <td height="1"></td>
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
            <td height="47" valign="bottom" background="img/infor_til.jpg">　　　&nbsp; 添加实验室资料信息<font size="2"><strong></strong></font></td>
          </tr>
          <tr>
            <td valign="top"><table width="717" border="0" cellspacing="0" cellpadding="0">
              
              <tr>
                <td valign="top" bgcolor="#FFFFFF">
		    <table width="717" border="0" cellspacing="0" cellpadding="0">
		     <tr>
<td width="1" rowspan="2" bgcolor="#62A1C4"></td>
              <td height="150" valign="top" background="" bgcolor="#FFFFFF" class="bg1">&nbsp;    
		<form name="form1" method="post" class="txt1">
			<pre>
借用时间:        <input type="text" name="borrowdate" value="">
借用人:          <input type="text" name="borrowname" value="">
借用资料名称:     <input type="text" name="articlename" value="">
借用资料类型:     <input type="text" name="model" value="">
借用资料数量 ：    <input type="text" name="borrowlist" value="">
归还资料日期 :    <input type="text" name="returndate" value="">
归还资料数量:     <input type="text" name="returnlist" value="">
归还人:          <input type="text" name="returnpeople" value="">
归还状态:         <select name="returnno">
<option value="0">请选择</option>
<option value="10">全部归还</option>
<option value="20">未全部归还</option>
<option value="30">已损坏</option>
</select> 
 
                <input type="button" name="b1" value="提交" onclick="check();">       <input type="reset"  name="r1" value="重置" >

</pre>
</form>


<br></td></tr>              
              <tr>
                <td height="1" bgcolor="62A1C4"></td>
            </tr>
            </table>
		 </td>
              </tr>   
              <tr>
                <td height="1" bgcolor="62A1C4"></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table></td>
        <td width="1" bgcolor="FBFFFF"></td>
        <td width="1" bgcolor="#AFCBD9"></td>
      </tr>
      <tr>
        <td colspan="4"><img src="img/body_bottom.jpg" width="737" height="7" /></td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
