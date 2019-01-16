<%@ include file="checksession.jsp"%>
<%String fbtime=(String) session.getAttribute("time");%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>

<%
int id = Integer.parseInt((String)request.getParameter("id"));
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from showbar where id="+id);
rs.next();
int  userid=Integer.parseInt((String) session.getAttribute("userid"));
if (userid==Integer.parseInt((String) rs.getString("memid"))){%>


<%
String lei=request.getParameter("lei");
String showname=request.getParameter("showname");
String showxing=request.getParameter("showxing");
String showaddress=request.getParameter("showaddress");
String showphoto=request.getParameter("showphoto");
String company=request.getParameter("company");
String username=request.getParameter("username");
String myname=request.getParameter("myname");
String tel=request.getParameter("tel");
String address=request.getParameter("address");
String email=request.getParameter("email");
String memid=request.getParameter("memid");

String sql="update showbar set lei='"+lei+"', showname='"+showname+"',showxing='"+showxing+"',showaddress ='"+showaddress+"',showphoto='"+showphoto+"',company='"+company+"',myname='"+myname+"',tel='"+tel+"',address='"+address+"',email='"+email+"',memid='"+memid+"',fbtime='"+fbtime+"',username='"+username+"' where id="+id;
stmt.executeUpdate(sql);

%>
<script language=JavaScript>{window.alert('修改成功!');window.location.href='glshow.jsp'}</script>
<%
stmt.close(); 
con.close();
%>


<%}else{%>
<script language=JavaScript>{window.alert('无权操作!');window.location.href='glshow.jsp'}</script>
<%
}
%>
