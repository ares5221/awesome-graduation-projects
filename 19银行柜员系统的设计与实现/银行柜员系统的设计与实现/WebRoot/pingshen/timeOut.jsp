<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>
<jsp:useBean id="timeOut" scope="page" class="firm.firm"/>
<%
    String sql="select * from I_itemSetup";
    ResultSet rs=timeOut.executeQuery(sql);
    java.util.Date today=new java.util.Date();
    java.util.Date p_beginDate=new java.util.Date();
    java.util.Date p_finishDate=new java.util.Date();
    String msg="";
    if(rs.next())
    {
	p_beginDate=rs.getDate("p_beginDate");
	p_finishDate=rs.getDate("p_finishDate");
    }
    if(today.before(p_beginDate))
    {
	msg="对不起，未到评审时间！";
    }
    else if(today.after(p_finishDate))
    {
	msg="对不起，评审时间已过！";
    }
%>
<html>
<head>
<title>项目设置</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<div align="center">
  <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td bgcolor="#000099"> 
        <table width="650" border="0" cellspacing="0" cellpadding="0">
          <tr bgcolor="#FFFFFF"> 
            <td colspan="3">&nbsp;</td>
            </tr>
            <tr> 
              <td colspan="3"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="3">&nbsp;</td>
            </tr>
            <tr> 
              
            <td width="33%">&nbsp;</td>
              
            <td bgcolor="#FFFFFF"> 
              <div align="center"><img src="../images/z_itemSetup.gif" width="112" height="22"></div>
            </td>
              
            <td width="33%">&nbsp;</td>
            </tr>
          </table>
          
        <table width="100%" border="0" cellspacing="1" cellpadding="0" height="120">
          <tr>
              
            <td height="179" bgcolor="#FFFFFF"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="5">&nbsp;</td>
                </tr>
              </table>
              <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center" height="151">
                <tr>
                  <td>
                      <table width="95%" border="0" cellspacing="1" cellpadding="1" align="center">
                        <tr> 
                          <td bgcolor="#d9d8dc">&nbsp;</td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center"> 
                            
                          <p><font color="#000099" size="5"><%=msg%></font></p>
                          </td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center">&nbsp; </td>
                        </tr>
                        <tr bgcolor="#d9d8dc" align="center"> 
                          <td> 
                            <input onClick=javascript:window.close(); type=image src="../images/shutdown.gif" width="80" height="22" name="refer">
                          </td>
                        </tr>
                      </table>
                  </td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td></td>
                </tr>
              </table>
            </td>
            </tr>
          </table>        
      </td>
    </tr>
  </table>
</div>
</body>
</html>
