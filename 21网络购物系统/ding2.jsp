<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="top.jsp"%>
<link href="css.css" rel="stylesheet" type="text/css">
<TABLE width=778 border=0 align="center" cellPadding=0 cellSpacing=0>
  <TBODY> 
  <TR> 
      <TD colSpan=5 height=3></TD>
    </TR>
    <TR> 
      
    <TD width=183 height=134 valign="top">&nbsp; </TD>
      
    <TD width=7 height=134>　</TD>
      
    <TD width=400 height=134 valign="top"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0" height="48">
          <tr> 
            
          <td height="108">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="8" align="center">
                <tr> 
                  <td width="100%" height="25" bgcolor="#989DA5"> 
                  <div align="center"><font color="#FFFFFF"><b>订单投诉</b></font></div>
                  </td>
                </tr>
                <tr> 
                  
                <td height="63" bgcolor="#ECECEC"> 
                  <div align="center">
                    <table width="100%" height="30" border="0" cellspacing="1">
                      <tr> 
                        <td width="100%" height="37" class="zi2"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                            <form method="POST" action="userts.jsp">
                              <tr> 
                                <td height="110" valign="middle" class="zi2"> 
                                  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="5">
                                    <tr> 
                                      <td width="38%"> 
                                        <div align="center">用户名：</div>
                                      </td>
                                      <td width="62%"> 
                                        <div align="center"> 
                                          <input name="user_name" type="text" class=input id="user_name" size="12">
                                        </div>
                                      </td>
                                    </tr>
                                    <tr> 
                                      <td> 
                                        <div align="center">订单号：</div>
                                      </td>
                                      <td> 
                                        <div align="center"> 
                                          <input name="sub_number" type="text" class=input id="sub_number" size="12">
                                        </div>
                                      </td>
                                    </tr>
                                  </table>
                                  <table width="90%" border="0" cellspacing="5" cellpadding="0" align="center">
                                    <tr> 
                                      <td width="80">　</td>
                                      <td> 
                                        <div align="center"> 
                                          <input name=B12 type=image id="B12" 
      src="img/pics/ts.gif" alt=投诉 
      align=absMiddle width="56" height="25" cache tppabs="">
                                        </div>
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                              </tr>
                            </form>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </div>
                </td>
                </tr>
              </table></td>
          </tr>
        </table></TD>
      
    <TD width=7 height=134>　</TD>
      
    <TD width=193 height=134 valign="top">　</TD>
    </TR>
    <TR> 
      <TD colSpan=5 height=2></TD>
    </TR>
  </TBODY>
</TABLE>
<%@ include file="copy.jsp"%>