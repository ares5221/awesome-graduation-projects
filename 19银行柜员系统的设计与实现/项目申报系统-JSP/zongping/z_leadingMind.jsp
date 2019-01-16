<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>

<%
    String z_Loginmessage=(String)session.getValue("z_loginSign");
    String adminID=(String)session.getValue("adminID");    
    if(z_Loginmessage!="OK")
    {
	response.sendRedirect("index4.jsp");
    }
%>
<jsp:useBean id="z_leadingmind" scope="page" class="firm.firm"/>
<%
    String itemID=request.getParameter("itemID");
    String sql="select leading_mind from I_s_item where itemID='"+itemID+"'";
    ResultSet rs=z_leadingmind.executeQuery(sql);
	String leadingMind="";
	if(rs.next())
	{
	    leadingMind=rs.getString("leading_mind");
		rs.close();
        z_leadingmind.closeStmt();
        z_leadingmind.closeConn();
	}
%>
<html>
<head>
<title>项目总评</title>
<script language=JavaScript>
function check(form){
    if (form.leadingMind.value=="")
    { 
       alert("您还没有填写审批意见!");
       form.leadingMind.focus();
       return false; 
     }
     return true;
}
</Script>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<table border="0" cellspacing="0" cellpadding="0" align="center">
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
            <div align="center"><img src="../images/z_zongping.gif" width="112" height="22"></div>
          </td>
          <td width="33%">&nbsp;</td>
        </tr>
      </table>
      <table width="650" border="0" cellspacing="1" cellpadding="0">
        <tr> 
          <td height="77" bgcolor="#F0F0F0"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5">&nbsp;</td>
              </tr>
            </table>
            <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr> 
                <td align="center">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><font color="#000099" size="2">审批意见</font></td>
                    </tr>
                    <tr> 
                      <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=leadingMind%></td>
                    </tr>
                    <tr>
                      <td bgcolor="#000099"></td>
                    </tr>
                    <tr> 
                      <td> 
                        <form name=form method=post action="z_checkMind.jsp?itemID=<%=itemID%>" onSubmit="return check(this)">
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td>&nbsp;</td>
                            </tr>
                            <tr>
                              <td><font size="2" color="#000099">修改审批意见</font></td>
                            </tr>
                            <tr> 
                              <td> 
                                <textarea name="leadingMind" cols="65" rows="4"></textarea>
                              </td>
                            </tr>
                            <tr> 
                              <td>&nbsp;</td>
                            </tr>
                            <tr> 
                              <td align="center"> 
                                <input type=image src="../images/z_changeMind.gif" width="80" height="22" border="0">
                              </td>
                            </tr>
                          </table>
                        </form>
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
</body>
</html>
