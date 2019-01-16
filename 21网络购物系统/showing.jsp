<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<jsp:useBean id="mdb" class="ckstudio.db.mysqlconn" scope="page"/>
<link href=css.css rel=STYLESHEET type=text/css>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>
<%!
 int Cint(String cint)
   {
    try {
	  int n;
      n= Integer.parseInt(cint);
	  return n;
        }
       catch (NumberFormatException e) {
                 return 0;
        }
}
%>
<%!
 String getStr(String str)
{
 	try
	{
		String temp_p=str;
		byte[] temp_t=temp_p.getBytes("ISO8859-1");
		String temp=new String(temp_t);
		return temp;
	}
	catch(Exception e)
	{
		e.printStackTrace();
		return null;
	 }
}
%>
<%
String user_name,action,sql,hw_name,dailis,user_type,basket_count;
ResultSet rs;
int count=0,hw_id,basket_id,hw_cash,totalcash=0,jiage,daili;
user_name=(String)session.getValue("user_name");
user_type=(String)session.getValue("user_type");
action=request.getParameter("action");
String hw_ids=request.getParameter("hw_id");
String counts=request.getParameter("count");
String hw_cashs=request.getParameter("hw_cash");
hw_name=request.getParameter("hw_name");
if(hw_name!=null){
	  hw_name=getStr(hw_name);
	  }
if(user_name!=null) 
{
    out.print(user_name+"的购物车");
 }
else
{
        out.print("购物车");
}%>
</title>
</head> 
<body topmargin="0">
<table border="0" width="400" cellspacing="0" cellpadding="0">
  <tr> 
    <td align="center">
    <img border="0" src="img/promo_list_top.gif" width="100%" height="4"></td>
  </tr>

  <tr> 
    <td height="18" align="center" bgcolor="#989DA5">当前你已订购的商品</td>
  </tr>
  <!------------------------------things you have bought---------------------------------------->
<%@ include file="bought.jsp"%>

  <!-------------------------------things bought end------------------------->
  <tr> 
    <td height="30" bgcolor="#ECECEC"><table width="83%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="33%"><a href="buy.jsp"><img src="img/pics/lookbcar.gif" width="100" height="20" border="0"></a></td>
          <td width="33%"><a href="clear.jsp"><img src="img/pics/relbcar.gif" width="100" height="20" border="0"></a></td>
          <td width="33%"><a href="cash.jsp"><img src="img/pics/gobuy.gif" width="100" height="20" border="0"></a></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td></td>
  </tr>
</table>

<table width="400" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr> 
    <td width="400" height="16" valign="top"><div align="center"><a href=# onclick="javasrcript:window.close();">关闭窗口</a></div></td>
  </tr>
</table>
<%
mdb.Close();
%>
</body>
</html>