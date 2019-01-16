<%@ page language="java" contentType="text/html;charset=GB2312"%>

<%
    String z_Loginmessage=(String)session.getValue("z_loginSign");
    String adminID=(String)session.getValue("adminID");    
    if(z_Loginmessage!="OK")
    {
	response.sendRedirect("index4.jsp");
    }
%>
<html>
<head>
<title>项目总评</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" text="#000000">
  
<table width="780" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
      <td height="349" bgcolor="#000000"> 
        <table width="100%" border="0" cellspacing="1" cellpadding="0" height="168">
          
        <tr valign="bottom"> 
          <td colspan="2" bgcolor="#0010a0" height="60"><a href="index4.jsp"><img src="../images/back.gif" width="90" height="30" border="0"></a></td>
          </tr>
          <tr> 
            <td colspan="2" bgColor=#ffcc00></td>
          </tr>
          <tr> 
            <td height="355" width="5%" bgcolor="#0010a0"><img src="../images/welcome.gif" width="49" height="263"></td>
            <td height="149" width="95%" bgcolor="#FFFFFF">              
                
            <table width="50%" border="0" cellspacing="0" cellpadding="0" height="119" align="center">
              <tr> 
                <td colspan="2"> 
                  <div align="center"><font color="#000099">您好！</font></div>
                </td>
              </tr>
              <tr> 
                <td colspan="2"> 
                  <div align="center"><font color="#000099">欢迎您使用本系统。</font></div>
                </td>
              </tr>
              <tr> 
                <td height="60">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td align="center"> <a href="z_unit.jsp" target="_blank"><img src="../images/s_info.gif" width="80" height="22" border="0"></a></td>
                <td align="center"> <a href="z_expert.jsp" target="_blank"><img src="../images/p_info.gif" width="80" height="22" border="0"></a></td>
              </tr>
              <tr> 
                <td align="center">&nbsp;</td>
                <td align="center">&nbsp;</td>
              </tr>
              <tr> 
                <td align="center"><a href="z_item.jsp?SubSort=0000" target="_blank"><img src="../images/z_item.gif" width="80" height="22" border="0"></a></td>
                <td align="center"><a href="z_itemSetup.jsp" target="_blank"><img src="../images/z_setup.gif" width="80" height="22" border="0"></a></td>
              </tr>
              <tr> 
                <td align="center">&nbsp;</td>
                <td align="center">&nbsp;</td>
              </tr>
              <tr> 
                <td align="center"><a href="z_scoreCheck.jsp?SubSort=0000" target="_blank"><img src="../images/z_fen.gif" width="80" height="22" border="0"></a></td>
                <td align="center"><a href="z_changePw.jsp" target="_blank"><img src="../images/changePw.gif" width="80" height="22" border="0"></a></td>
              </tr>
            </table>           
            </td>
          </tr>
          <tr> 
            <td colspan="2" height="2"></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</body>
</html>
