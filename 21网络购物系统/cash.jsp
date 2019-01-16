<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<head>
<link href=css.css rel=STYLESHEET type=text/css>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>收银台</title></head> 
<body topmargin="0">
<font color="#000000"><b>
<jsp:useBean id="mdb" class="ckstudio.db.mysqlconn" scope="page"/>
<%
if(session.getAttribute("user_name")==null){
	%>
<br>1.你尚未登录!请登录后再订购本站商品!<br>2.第一次来本站，请先注册会员（免费）!<br><br>
<%
		}else{
String count="";
String hw_id="";
if(request.getParameter("action")=="buy"){

if(request.getParameter("count")==""){
    int intcount=1;
    count=Integer.toString(intcount);
	}
else
    count=request.getParameter("count");

if(request.getParameter("hw_id")=="")
	out.print("没有此货物!");
else{
    hw_id=request.getParameter("hw_id");


String sql="select * from basket where hw_id='"+hw_id+"' and user_name='"+(String)session.getValue("user_name")+"' and basket_check='false'";
ResultSet rs;
rs=mdb.executeQuery(sql);

if(!rs.next()){

	String sql1="insert into basket(hw_id,user_name,basket_count,hw_name,hw_cash,user_type,basket_date) values('"+hw_id+"','"+session.getValue("user_name")+"','"+count+"','"+request.getParameter("hw_name")+"','"+request.getParameter("hw_cash")+"','"+request.getParameter("user_type")+"',now()) where hw_id='"+hw_id+"' and user_name='"+session.getValue("user_name")+"' and basket_check='false'";
    mdb.executeInsert(sql1);
}
else{
//rs("basket_count")=int(rs("basket_count"))+int(count)
rs.next();
int basket_count=Integer.parseInt(rs.getString("basket_count"));
basket_count=basket_count+Integer.parseInt(count);
String basket_count2=Integer.toString(basket_count);
String sql2="update basket set basket_count='"+basket_count+"'";
mdb.executeUpdate(sql2);
}
}
}
%>
</b></FONT> 
<br>
<table width="400" border="0" cellspacing="0" cellpadding="0" align="center" height="50">
  <tr> 
    <td align="center">
    <img border="0" src="img/promo_list_top.gif" width="100%" height="4"></td>
  </tr>
  <tr> 
    <td height="18" bgcolor="#989DA5" align="center">收银台</td>
  </tr>
  <tr> 
    <td height="25" valign="top"> <form method="POST" action="cashsave.jsp">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td valign="top"> 
            <table border="0" width="416" cellspacing="0" height="34" cellpadding="0">
                <tr> 
                  <td width="378" height="120" valign="bottom" bgcolor="#ECECEC"><p><br>
                      　您订购的物品如下:</p>
                    <div align="center">
                      <center>
                    <table width="90%" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111">
                      <tr background="img/pics/tile_bg.gif"> 
                        <td width="195" height="25"><div align="center">商品名称</div></td>
                        <td width="60" height="25"><div align="center">单价</div></td>
                        <td width="60" height="25"><div align="center">数量</div></td>
                        <td width="80" height="25"><div align="center">合计</div></td>
                      </tr>
                      <%
      String user_name=(String)session.getValue("user_name");
      String sql3="select * from basket where user_name='"+user_name+"'and basket_check='false'";
	  ResultSet rs2;
	  rs2=mdb.executeQuery(sql3);
	  int totalcash=0;
      if(!rs2.next())
		  out.print("你没有订购任何商品");
      else{
		  rs2.previous();
	  while(rs2.next()){
		  String h_cash=rs2.getString("hw_cash");
		  String b_count=rs2.getString("basket_count");
	  int h_c=Integer.parseInt(h_cash);
	  int b_c=Integer.parseInt(b_count);
      String h_n=rs2.getString("hw_name");

      %>
                      <tr> 
                        <td width="195" height="25"><div align="center"><font color=red><%=h_n%></font></div></td>
                        <td width="60" height="25"><div align="center"><%=h_cash%>元</div></td>
                        <td width="60" height="25"><div align="center"><%=b_count%></div></td>
                        <td width="80" height="25"><div align="center"><%=(h_c*b_c)%>元 
                          </div></td>
                      </tr>
                      <%
		  totalcash=totalcash+(h_c*b_c);
	  }
	  }
      %>
                      <tr> 
                        <td height="25"><div align="center"><b class="dz1">总计：<font color=red><%=totalcash%></font>元</b></div></td>
                        <td height="25" colspan="3"><div align="center"><b class="dz1"> 
                            <input 
      align=absMiddle alt=确认 cache name="B1" 
      src="img/pics/ok.gif" type=image tppabs="" width="45" height="20">
                            </b></div></td>
                      </tr>
                    </table>
                      </center>
                  </div>
                    <br> <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td valign="middle"><div align="center"><img src="img/pics/seperator.gif" width="359" height="1"></div></td>
                      </tr>
                    </table></td></tr>
              </table>
              
            </td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
<%}
			mdb.Close();
%>