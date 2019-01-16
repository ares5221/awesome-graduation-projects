<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
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
</head>

<body onload="check();">
<table width="1000" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="img/til1.jpg" width="1000" height="71" /></td>
  </tr>
  <tr>
    <td><img src="img/banner1.jpg" width="1000" height="5" /></td>
  </tr>
    <tr>
<td background="img/lm_bg.jpg" class ="txtil"><img src="img/lm_banner1.jpg" width="25" height="33" />
    <a href="labAction.do?domethod=labAllSeach"> 最新实验信息 &nbsp;</a>|<a href="labAction.do?domethod=SeachAllLab">实验记录&nbsp; </a>|<a href="labAction.do?domethod=SeachArticle">实验室资料管理 &nbsp;</a>|<a href="labAction.do?domethod=SeachAllDemo">实验演示信息&nbsp; </a>|<a href="labAction.do?domethod=SeachAllPeople">用户信息管理与成绩查询 </a>
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
                <td><img src="img/conner2.jpg" width="15" height="15" align="absmiddle" />　登录时间：&nbsp;&nbsp; <div id="time1"></div><br></td>
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
    <td width="737" valign="top"><table width="741" border="0" cellspacing="0" cellpadding="0" height="428">
      <tr>
        <td colspan="4"><img src="img/body_til.jpg" width="737" height="8" /></td>
      </tr>
      <tr>
        <td width="1" bgcolor="#AFCBD9"></td>
        <td width="734" height="285" valign="top" bgcolor="E3F4FE"><table width="719" border="0" align="center" cellpadding="0" cellspacing="0" class="txt1" height="318">
          
          <tr>
            <td valign="top"><table width="719" border="0" cellspacing="0" cellpadding="0" height="391">
              
              <tr>
                <td valign="top" bgcolor="#FFFFFF">
		    <table width="717" border="0" cellspacing="0" cellpadding="0" height="386">
              
              <tr>
<td width="1" rowspan="2" bgcolor="#62A1C4"></td>
              <td height="150" valign="top" background="img/haigui.jpg" bgcolor="#FFFFFF" class="bg1">&nbsp;<br></td>
              <td width="1" rowspan="2" bgcolor="#62A1C4"></td>
</tr>              
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
         
        </table></td>
        <td width="1" bgcolor="FBFFFF"></td>
        <td width="1" bgcolor="#AFCBD9"></td>
      </tr>
      
    </table></td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>