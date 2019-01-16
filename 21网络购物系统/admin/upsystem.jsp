<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="conn.jsp"%>
<%
if(session.getAttribute("admin_name")==null){
	response.sendRedirect("bomb.htm");}else{
%>
<head>
<link href=../css.css rel=STYLESHEET type=text/css>
</head>
<%
String action=request.getParameter("action");
if(action==null)
	action="notchange";
if(action.equals("change")){

sql="update system set name='"+getStr(request.getParameter("name"))+"',tel='"+getStr(request.getParameter("tel"))+"',fax='"+getStr(request.getParameter("fax"))+"',mail='"+getStr(request.getParameter("mail"))+"',oicq='"+getStr(request.getParameter("oicq"))+"',web='"+getStr(request.getParameter("web"))+"',sitename='"+getStr(request.getParameter("sitename"))+"',code='"+getStr(request.getParameter("code"))+"',maddr='"+getStr(request.getParameter("maddr"))+"',msn='"+getStr(request.getParameter("msn"))+"',mname='"+getStr(request.getParameter("mname"))+"',ymaddr='"+getStr(request.getParameter("ymaddr"))+"',ymname='"+getStr(request.getParameter("ymname"))+"'";

mdb.executeUpdate(sql);
out.print("系统更新完毕");
}else{

%>



<table border="0" width="100%" cellspacing="1">
  <tr>
    <td width="100%">
      <form method="POST" action="upsystem.jsp?action=change">
        <table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr> 
            <%sql="select * from system";
          rs=mdb.executeQuery(sql);
		  rs.next();%>
            <td width="11%">联系人</td>
            <td width="89%"><input type="text" name="name" size="20" value="<%=rs.getString("name")%>" class=input></td>
          </tr>
          <tr> 
            <td width="11%">联系电话</td>
            <td width="89%"><input type="text" name="tel" size="20" value="<%=rs.getString("tel")%>" class=input></td>
          </tr>
          <tr>
            <td>联系传真</td>
            <td><input type="text" name="fax" size="20" value="<%=rs.getString("fax")%>" class=input></td>
          </tr>
          <tr>
            <td>电子邮件</td>
            <td><input type="text" name="mail" size="20" value="<%=rs.getString("mail")%>" class=input></td>
          </tr>
          <tr>
            <td>OICQ</td>
            <td><input type="text" name="oicq" size="20" value="<%=rs.getString("oicq")%>" class=input></td>
          </tr>
          <tr>
            <td>网站名称</td>
            <td><input type="text" name="sitename" size="20" value="<%=rs.getString("sitename")%>" class=input></td>
          </tr>
          <tr>
            <td>网址</td>
            <td><input type="text" name="web" size="20" value="<%=rs.getString("web")%>" class=input>
              <font color="#FF0000">例如：www.freedown.net</font></td>
          </tr>
          <tr>
            <td>银行汇款地址</td>
            <td><input type="text" name="maddr" size="60
			" value="<%=rs.getString("maddr")%>" class=input></td>
          </tr>
          <tr>
            <td>银行汇款帐号</td>
            <td><input type="text" name="msn" size="60
			" value="<%=rs.getString("msn")%>" class=input></td>
          </tr>
          <tr>
            <td>收款人姓名</td>
            <td><input type="text" name="mname" size="20" value="<%=rs.getString("mname")%>" class=input></td>
          </tr>
          <tr>
            <td>邮局汇款地址</td>
            <td><input type="text" name="ymaddr" size="60
			" value="<%=rs.getString("ymaddr")%>" class=input></td>
          </tr>
          <tr>
            <td>邮递接收人</td>
            <td><input type="text" name="ymname" size="20" value="<%=rs.getString("ymname")%>" class=input></td>
          </tr>
          <tr>
            <td>邮政编码</td>
            <td><input type="text" name="code" size="20" value="<%=rs.getString("code")%>" class=input></td>
          </tr>
        </table>

        <p><input type="submit" value="提交" name="B1" class=input></p>
      </form>
      <p>　</td>
  </tr>
</table>
<%}
mdb.Close();
	}
%>