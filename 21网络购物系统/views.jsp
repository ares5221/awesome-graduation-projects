<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" %>
<%@ page autoFlush="true" errorPage="error.html"%>
<html>
<%@ include file="top.jsp"%>

<link href="css.css" rel="stylesheet" type="text/css">
<TABLE width=778 border=0 align="center" cellPadding=0 cellSpacing=0>
  <TBODY> 
  <TR> 
    <TD colSpan=4 height=3></TD>
  </TR>
  <TR> 
    <td width="180" valign="top"> 
      <table width="180" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td valign="top"> 
		  <!---------------------------user info--------------------------------->
           <%@ include file="dengluyufou.jsp"%>
			<!-----------------------user info end----------------------------------->
          </td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" height="5">
        <tr> 
          <td></td>
        </tr>
        <tr> 
          <td></td>
        </tr>
      </table>
	  <!---------------------------searchpage------------------------------------>
      <%@ include file="in-search.jsp"%>
	   <!---------------------------searchpage-   end----------------------------------->
      <table width="100%" border="0" cellspacing="0" cellpadding="0" height="5">
        <tr> 
          <td> 
            <%@ include file="topsort.jsp"%>
          </td>
        </tr>
      </table>
    </td>
    <TD width=13 height=150>¡¡</TD>
    <TD width=575 height=150 valign="top"> 
      <!---------------------------product info--------------------------------------->
	  <%@include file="in-product.jsp"%>
    </TD>
    <TD width=10 height=150>¡¡</TD>
  </TR>
  <TR> 
    <TD colSpan=4 height=2></TD>
  </TR>
  </TBODY> 
</TABLE>
<%@ include file="copy.jsp"%>