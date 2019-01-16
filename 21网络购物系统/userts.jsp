<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="top.jsp"%>
<link href="css.css" rel="stylesheet" type="text/css">
        <div align="center">
          <center>
        <table border="0" width="600" cellspacing="0" cellpadding="0" style="border-collapse: collapse" bordercolor="#111111">
          <tr> 
            <td width="380" height="25"> 
              <%
			  String errmsg="";
			  String user_name="";
			  String sub_number="";
			  boolean founderr=false;
    if(request.getParameter("user_name").equals("")){
        founderr=true;
        errmsg=errmsg+"<br>"+"<li>使用投诉功能要提供用户账号";
		}
    else
        user_name=request.getParameter("user_name");
    
    if(request.getParameter("sub_number").equals("")){
        founderr=true;
        errmsg=errmsg+"<br>"+"<li>使用投诉功能要提供订单号";
	}
    else
        sub_number=request.getParameter("sub_number");
    
    if(founderr==false){
        sql="select * from sub where sub_number='"+sub_number+"' and user_name='"+user_name+"'";
		rs=mdb.executeQuery(sql);
        if(!rs.next()){
            founderr=true;
            errmsg=errmsg+"<br>"+"<li>用户没有此订单信息";
		}
        else{
            sql="select * from ts where sub_number='"+sub_number+"'";
			rs=mdb.executeQuery(sql);
            if(!rs.next()){
				sql="insert into ts(user_name,sub_number,ts_date) values('"+user_name+"','"+sub_number+"',now())";
				mdb.executeInsert(sql);
            }
				else{
                founderr=true;
                errmsg=errmsg+"<BR>"+"<li>请不要重复提交投诉信息!";
				}
		}
	}
     %>
              <div align="center"><font color="#FFFFFF"><b> 
                <%if(founderr==true)
            out.print("请确认你的投诉信息");
        else
            out.print("　您的投诉信息已经确认！");
        %>
                </b></font></div></td>
          </tr>
          <tr> 
            <td width="100%" height="25">
            <%
        if(founderr==true)
            out.print(errmsg);
        else{%>您的投诉订单为:<font color=red><%=sub_number%></font><br>我们会尽快的处理给您一个满意的答复</td>
		<%}%>
          </tr>
        </table>
          </center>
</div>
<%@ include file="copy.jsp"%>