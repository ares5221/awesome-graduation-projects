<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<jsp:useBean id="mdb" class="ckstudio.db.mysqlconn2" scope="page"/>
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
<!----------------------------initial check----------------------------------------------->
<font color="#000000"><b> 
<%
if(user_name==null)
{ 
	out.print(  "<br>");
    out.print(  "1.你尚未登录!请登录后再订购本站商品!");
    out.print( "<br>2.第一次来本站，请先注册会员（免费）!");
	out.print(  "<br>");
	out.print(  "<br>");
    
}
else{
//<!-----------------------------logged ------------------------------------------->
if(action!=null){
  if(action.equals("buy"))
   {   
      if(counts==null)
         { 
		  counts="1";
          }
	 if(hw_cashs==null)
	     {
		 hw_cashs="1000";
		 }
	   
      if (hw_ids==null)
        {
		   out.print("没有此货物!");
		}
      sql="select * from basket where hw_id='"+hw_ids+"' and user_name='"+user_name+"' and basket_check='false'";
      rs=mdb.executeQuery(sql);
      if(!rs.next())
       {   
	      sql="insert into basket(hw_id,user_name,basket_count,hw_name,hw_cash,basket_date)";
		  sql=sql+"values('"+hw_ids+"','"+user_name+"','"+counts+"','"+hw_name+"','"+hw_cashs+"',now())";
		  mdb.executeInsert(sql);
	    }else
        {  
		    rs.previous();
	        basket_count="0";
	        if(rs.next())
		    {
	           basket_count=rs.getString("basket_count");
		    }
		      count=Cint(basket_count);
		     int duoyu=Cint(counts);
		     count=count+duoyu;
	         rs.previous();
		 if(rs.next()){
		 rs.updateString("basket_count",Integer.toString(count));
		 rs.updateRow();
		 }
       }
  }  %>
</b>
</FONT>

<%
}
//end action=buy
response.sendRedirect("showing.jsp");
}
mdb.Close();
%>
<!---------------------------initial check ends----------------------------------->
<table width="400" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr> 
    <td width="400" height="16" valign="top"><div align="center"><a href=# onclick="javasrcript:window.close();">关闭窗口</a></div></td>
  </tr>
</table>


