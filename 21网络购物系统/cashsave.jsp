<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<link href="css.css" rel="stylesheet" type="text/css">
<jsp:useBean id="mdb" class="ckstudio.db.mysqlconn" scope="page"/>
<head>
<script language="JavaScript">

<!--
if (parent.frames.length > 0) {
parent.location.href = location.href;
}
function form1_onsubmit() {
if (document.form1.sub_to.value=="")
	{
	  alert("收货人姓名不能为空。")
	  document.form1.sub_to.focus()
	  return false
	 }
else if(document.form1.sub_adds.value=="")
	{
	  alert("收货人地址不能为空。")
	  document.form1.sub_adds.focus()
	  return false
	 }
else if(document.form1.sub_post.value=="")
	{
	  alert("收货人邮编不能为空。")
	  document.form1.sub_post.focus()
	  return false
	 }
else if(document.form1.sub_tel.value=="")
	{
	  alert("联系电话不能为空。")
	  document.form1.sub_tel.focus()
	  return false
	 }
else if(document.form1.sub_mail.value=="")
	{
	  alert("联系信箱不能为空。")
	  document.form1.sub_mail.focus()
	  return false
	 }	 	 
}
// -->
</script>
<link href=css.css rel=STYLESHEET type=text/css>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>购物成功！请填写收货人的详细信息</title>
</head> 
<body topmargin="0">
<font color="#FFFFFF"><b> 
<%
if(session.getAttribute("user_name")==null){%><br><center>1.你尚未登录!请登录后再订购本站图书!<br>2.第一次来本站，请先注册会员（免费）!<br><br><%
}else
{

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
<table width="400" border="0" cellspacing="0" cellpadding="0" align="center" height="65">
  <tr> 
    <td valign="top"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0" >
        <tr> 
          <td valign="top" height="120"> <table border="0" width="100%" cellspacing="0" cellpadding="0" height="5" align="center">
              <%if(session.getAttribute("user_name")==null)
        response.sendRedirect("index.jsp");
    else{
		String user_name;
        user_name=(String)session.getValue("user_name");
		String sql1;
    sql1="select * from basket where user_name='"+user_name+"' and basket_check='false'";
    ResultSet rs1;
	rs1=mdb.executeQuery(sql1);
    if(!rs1.next())
        out.print("你没有订购任何商品");
    else{
        String sub_number="";
		String now=(String)((new java.util.Date()).toLocaleString());
        sub_number=user_name+now;
		sub_number=sub_number.replace('-','1');
		sub_number=sub_number.replace(' ','2');
		sub_number=sub_number.replace(':','3');
		rs1.previous();
        while(rs1.next()){
			String b_c=rs1.getString("basket_count");
			String h_id=rs1.getString("hw_id");
			String sql2="update basket set basket_check='true',sub_number='"+sub_number+"' where user_name='"+user_name+"' and basket_check='false'";
            mdb.executeUpdate(sql2);

			int h_i=Integer.parseInt(h_id);
			String sql3="select * from hw where hw_id="+h_i+"";
			ResultSet rs2=mdb.executeQuery(sql3);
			rs2.next();
			
			int h_b=rs2.getInt("hw_buys")+Integer.parseInt(b_c);
			String sql4="update hw set hw_buys="+h_b+" where hw_id="+h_i+"";
			mdb.executeUpdate(sql4);

		}

        
    String sql5="insert into sub(user_name,sub_number,sub_date) values('"+user_name+"','"+sub_number+"',now())";
    mdb.executeInsert(sql5);
    
    %>
              <tr> 
                <td>
    <img border="0" src="img/promo_list_top.gif" width="100%" height="4"></td>
              </tr>
              <tr> 
                <td height="17" bgcolor="#989DA5" align="center">谢谢您从本站购物！您的订单号为：<font color=#FFFF00><b><%=sub_number%></b></font></td>
              </tr>
              <tr> 
                <td width="380"> <form method="POST" language="javascript" onsubmit="return form1_onsubmit()" name="form1" action="saveto.jsp?sub_number=<%=sub_number%>">
                    <%
					String sql6;
                    sql6="select * from member where user_name='"+(String)session.getValue("user_name")+"'";
ResultSet rs3=mdb.executeQuery(sql6);
rs3.next();
%><table width="100%" border="0" cellspacing="0" cellpadding="0" >
                      <tr> 
                        <td><table width="100%" height="34" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td width="398" height="120" valign="bottom" bgcolor="#ECECEC" ><br>
                                　 请记牢本订单号，你可以使用本订单号对成交情况进行查询和投诉<br> <br> 
                                <div align="center">
                                  <center> 
                                <table width="90%" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" height="243">
                                  <tr background="img/pics/tile_bg.gif"> 
                                    <td height="25" colspan="2"><b>请填写收货人的详细信息</b></td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF"> 
                                    <td width="19%" height="25" bgcolor="#ECECEC"> 
                                      <div align="right">姓名：</div>
                                    </td>
                                    <td width="81%" height="25" bgcolor="#ECECEC">　 
                                      <input style="FONT-SIZE: 12px; WIDTH: 110px" type="text" name="sub_to" size="20" class=input value="<%=rs3.getString("user_name")%>">
                                    </td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF"> 
                                    <td width="19%" height="25" bgcolor="#ECECEC"> 
                                      <div align="right">地址：</div>
                                    </td>
                                    <td height="25" bgcolor="#ECECEC">　 
                                      <input style="FONT-SIZE: 12px; WIDTH: 210px" type="text" name="sub_adds" size="40" class=input value="<%=rs3.getString("user_adds")%>">
                                    </td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF"> 
                                    <td width="19%" height="25" bgcolor="#ECECEC"> 
                                      <div align="right">邮编：</div>
                                    </td>
                                    <td height="25" bgcolor="#ECECEC">　 
                                      <input style="FONT-SIZE: 12px; WIDTH: 110px" type="text" name="sub_post" size="10" class=input value="<%=rs3.getString("user_postcode")%>">
                                    </td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF"> 
                                    <td width="19%" height="25" bgcolor="#ECECEC"> 
                                      <div align="right">电话：</div>
                                    </td>
                                    <td height="25" bgcolor="#ECECEC">　 
                                      <input style="FONT-SIZE: 12px; WIDTH: 110px" type="text" name="sub_tel" size="20" class=input value="<%=rs3.getString("user_tel")%>">
                                    </td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF"> 
                                    <td width="19%" height="25" bgcolor="#ECECEC"> 
                                      <div align="right">E-mail：</div>
                                    </td>
                                    <td height="25" bgcolor="#ECECEC">　 
                                      <input style="FONT-SIZE: 12px; WIDTH: 110px" type="text" name="sub_mail" size="20" class=input value="<%=rs3.getString("user_mail")%>">
                                    </td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF"> 
                                    <td width="19%" height="19" bgcolor="#ECECEC"> 
                                      <div align="right">付款方式：</div>
                                    </td>
                                    <td height="19" bgcolor="#ECECEC">　 
                                      <select size="1" name="qian">
                                        <option value="货到付款">货到付款</option>
                                        <option value="银行转帐">银行转帐</option>
                                        <option value="邮政汇款">邮政汇款</option>
                                      </select>
                                    </td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td width="19%" height="39" bgcolor="#ECECEC">
                                      <div align="right">备注：<br>
                                        (50汉字内) </div>
                                    </td>
                                    <td height="39" bgcolor="#ECECEC"> 　 
                                      <textarea style="FONT-SIZE: 12px; WIDTH: 250px" name="other" cols="30" class="input" rows="3"></textarea>
                                    </td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF"> 
                                    <td height="35" colspan="2" bgcolor="#ECECEC"> 
                                      <table width="40%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr> 
                                          <td> 
                                            <div align="center"> 
                                              <input 
      align=absMiddle alt=确认 cache name="B1" 
      src="img/pics/ok.gif" type=image tppabs="" width="45" height="20">
                                            </div>
                                          </td>
                                          <td> 
                                            <div align="center"> 
                                              <input type="reset" value="清除" name="B2" class=input>
                                            </div>
                                          </td>
                                        </tr>
                                      </table>
                                    </td>
                                  </tr>
                                </table>
                                  </center>
                              </div>
                                <br> <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
                                  <tr> 
                                    <td valign="middle"><div align="center"><img src="img/pics/seperator.gif" width="359" height="1"></div></td>
                                  </tr>
                                </table></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="3" valign="top"></td>
                            </tr>
                          </table> </td>
                      </tr>
                    </table>   
                    <%
	}
	}
                    %>
                  </form></td>
              </tr>
            </table></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<%}
					mdb.Close();
%>