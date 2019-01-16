<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" %>
<%@ page autoFlush="true" errorPage="error.html"%>
<html>
<%@ include file="top.jsp"%>

<link href="../../frshop/css.css" rel="stylesheet" type="text/css">
<%
	
	int sort_id,  Nsort_id;
	String sort_name,Nsort_name;
	sort_name="无此类";
	sort_id=0;
	if(request.getParameter("sort_id")=="")
	   {
	   response.sendRedirect("index.jsp");
	   }
	else
	{
	sort_id=Cint(request.getParameter("sort_id"));
	 sql="select * from sort where sort_ID="+sort_id;
    rs=mdb.executeQuery(sql);
 	if(rs.next()){
		sort_name=rs.getString("sort_name");
		}
 %>

<table width=778 border=0 align="center" cellpadding=0 cellspacing=0>
  <!--DWLayoutTable-->
     <tr> 
      <td colspan=2 height=3></td>
      <td width="572"></td>
      <td width="12"></td>
    </tr>
    <tr> 
      <!--------------------------left begin---------------------------------------------->
      <td width="181" height="554" valign="top"> <table width="180" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr> 
            <td valign="top"> 
              <!--是否登陆及其显示-->
              <%@ include file="dengluyufou.jsp"%>
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
        <!--------------------search page------------------------------>
        <%@ include file="in-search.jsp"%>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="5">
          <tr> 
            <td> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td>　</td>
                </tr>
              </table>
              <%@ include file="topsort.jsp"%>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td>　</td>
                </tr>
                <tr> 
                  <td align="center"> 
                    <!-------------hot begin------------------>
					                    <%@ include file="hoton.jsp"%>
                    <!------------hot end--------------->
                  </td>
                </tr>
                <tr> </table></td>
          </tr>
        </table></td>
      <td width="13">&nbsp;</td>
      <td valign="top"> 
        <!-------------------------right------------------------------->
	
            <%@ include file="right.jsp"%>
          
        
      </td>
      <!--------------------------left end--------------------------------------------->
      <td rowspan="2">　</td>
    </tr>
    <tr> 
      <td height="22" colspan="3" valign="top"><%@ include file="copy.jsp"%></td>
    </tr>
    <tr> 
      <td colspan=2 height=2></td>
      <td></td>
      <td></td>
    </tr>
 
</table>
<%
}//判断是否有小类ID结束
%>
