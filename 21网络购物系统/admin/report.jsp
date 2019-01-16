<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*,java.util.Date" errorPage="" %>
<%@ include file="conn.jsp"%>
<jsp:useBean id="mdb2" class="ckstudio.db.mysqlconn2" scope="page"/>
<%
if(session.getAttribute("admin_name")!=null){
//--------------------------------------logged------------------------------------------------------------------
  String sub_ids,sub_number;
    int sub_id;
 sub_ids=request.getParameter("sub_id");
 sub_id=Cint(sub_ids);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Language" content="zh-cn">
<link href=../css.css rel=STYLESHEET type=text/css>
</head>
<%
sub_number=request.getParameter("sub_number");
sub_number.trim();
sql="select * from sub where sub_number='"+sub_number+"'";
   rs=mdb2.executeQuery(sql);
if(!rs.next())
{
%>

<p align="center">没有此订单的信息+<%=sub_number%></p>
<%
}else
{
%>
<head>
<link href=../css.css rel=STYLESHEET type=text/css>
<title>订单:<%=sub_number%>详细信息</title>
</head>

<table border="0" width="560" cellspacing="1">
  <tr>
    <td width="100%">
      <table border="0" width="100%" cellspacing="1">
        <tr>
          <td width="100%" bgcolor="efefef"> 
            <p align="center">定单号:<font color=blue><%=sub_number%> 
             
              </font> &nbsp;&nbsp;&nbsp;&nbsp;付款方式：<font color=blue><%=rs.getString("qian")%></font> 
          </td>
        </tr>
        <tr>
          <td width="100%">
            <table border="0" width="100%" cellspacing="0" cellpadding="0">
              <tr> 
                <td bgcolor="#FFFFFF" colspan="2">订购日期：<b><%=rs.getDate("sub_date")%></b></td>
                <td bgcolor="#FFFFFF" colspan="2">订货人：<b><%=rs.getString("user_name")%></b></td>
              </tr>
              <tr> 
                <td bgcolor="#FFFFFF" colspan="2">收货人：<b><%=rs.getString("sub_to")%></b></td>
                <td bgcolor="#FFFFFF" colspan="2">收货地址：<b><%=rs.getString("sub_adds")%></b></td>
              </tr>
              <tr> 
                <td bgcolor="#FFFFFF" colspan="2">电话：<b><%=rs.getString("sub_tel")%></b></td>
                <td bgcolor="#FFFFFF" colspan="2">E-mail：<b><%=rs.getString("sub_mail")%></b></td>
              </tr>
              <tr> 
                <td bgcolor="#FFFFFF" colspan="4" height="15">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="16%">备注信息：</td>
                      <td width="84%"><b><%=rs.getString("other")%></b></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <%rs.close();%>
              <tr bgcolor="#f0f0f0"> 
                <td colspan="4"> 
                  <p align="center"><font color="#FF0000">订购货物列表</font></p>
                </td>
              </tr>
              <tr bgcolor="#f7f7f7"> 
         ā       <td width="29%">货物名称</td>
                <td width="12%">单价</td>
                <td width="19%">数量</td>
                <td width="40%">合计</td>
              </tr>
              <%
			  sql="select * from basket where sub_number='"+sub_number+"'";
              rs=mdb2.executeQuery(sql);
              if(!rs.next())
               {   out.print("没有此订单信息");
                 
               }else
			   {
			      rs.previous();
				  String hw_cashs,basket_counts;
				  int totalcash=0,hw_cash,basket_count;
                  while (rs.next())
				  {
				  hw_cashs=rs.getString("hw_cash");
				  hw_cash=Cint(hw_cashs);
				   basket_counts=rs.getString("basket_count");
				  basket_count=Cint(basket_counts);
				  %>
              <tr> 
                <td width="29%" bgcolor="#FFFFFF"><%=rs.getString("hw_name")%></td>
                <td width="12%" bgcolor="#FFFFFF"> <%=hw_cashs%> 元</td>
                <td width="19%" bgcolor="#FFFFFF"><%=basket_counts%></td>
                <td width="40%" bgcolor="#FFFFFF"><font color=red> <%=hw_cash*basket_count%> 
                  </font>元</td>
                <%
				totalcash=totalcash+hw_cash*basket_count;%>
              </tr>
              <%
                 }
              %>
              <tr> 
                <td bgcolor="#FFFFFF" colspan="3">总计</td>
                <td width="40%" bgcolor="#FFFFFF"><font color=red><%=totalcash%></font>元</td>
              </tr>
              <%
			  }
              rs.close();
			  sql="select * from sub where sub_number='"+sub_number+"'";
			  rs=mdb2.executeQuery(sql);
			  if(rs.next()){
			  sub_id=rs.getInt("sub_id");
 
			  %>
              <tr> 
                <td bgcolor="#FFFFFF" colspan="4"> 
                  <p align="center"><a href="submore.jsp?sub_id=<%=sub_id%>&action=pass">订单确认</a> 
                    <a href="submore.jsp?sub_id=<%=sub_id%>&action=del">删除此订单</a> 
                </td>
              </tr>
			  <%
			  }%>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<%
  }//-----------------------------------------------dieng dan found----------------------------------
}
mdb2.Close();
%>
