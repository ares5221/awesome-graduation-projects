
<head>
<link href="css.css" rel="stylesheet" type="text/css">
<%!
boolean IsMail(String user_mail){
	int index=user_mail.indexOf("@");
	int index2=user_mail.indexOf(".");
	if(index==-1 || index2==-1)
		return false;
	else return true;
}

public String getStr(String str)
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
	 }
	return "null";
}
%>
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
<jsp:useBean id="mdb" class="ckstudio.db.mysqlconn" scope="page"/>
<script>
  function openbag(id) { window.open("basket.jsp?hw_id="+id,"","height=420,width=460,left=190,top=10,resizable=yes,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no");} 
</script>
<script language="javascript">
function openScript(url, width, height){
	var Win = window.open(url,"openScript",'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=yes' );
}
</script>

<title>
<%
//得到标题栏信息
String sql="select * from system";
ResultSet rs;
 rs=mdb.executeQuery(sql);
if(rs.next()){   
%>
<%=rs.getString("web")%> - <%=rs.getString("sitename")%>
<%
}
else{
out.print("ckstudio");
}
%>
</title></head> 
<body onload="if(event.shiftKey){location.href='a/'}" topmargin="0" leftmargin="0">

<table align="center" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="778"><tr><td>
     <table border="0" height="28" style="border-collapse: collapse" bordercolor="#111111" cellpadding="0" cellspacing="0"><tr>
          <td width="98" align="center" height="28" background="img/main.gif"> <a href="index.jsp">主页</a></td>
     <!--set rs2=server.createobject("adodb.recordset") 
        sql2="select * from sort" 
        rs2.open sql2,conn,3,3 
        do while not rs2.eof
         -->
  <%
  rs.close();
  sql="select * from sort order by sort_id asc";	
   rs=mdb.executeQuery(sql);
   int a=0;
  while(rs.next()){ 
	  a=a+1;
%>
         
         <td width="98" align="center" height="28" background="img/main.gif"><a href="sort.jsp?sort_id=<%=rs.getInt("sort_id")%>"><%=rs.getString("sort_name")%></a></td>
          <%
			 if(a>=6)
			 break;
		 }
  rs.close();
              %> 	
  <td width="98" align="center" height="28" background="img/main.gif">
     <a target="_blank" href="http://www.freedown.net/forum">客户论坛</a></td></tr></table>
</td></tr></table>
      

<div align="center">
  <center>
      

<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1" background="img/1right.gif" height="20">
  <tr><td align="center"> <a href="ding2.jsp">订单投诉</a>
| <a href="fuwu-baozheng.jsp">客户服务</a>
| <a href="fukuan-fangshi.jsp">付款方式</a>
| <a href="allnews.jsp">新闻中心</a>
| <a href="javascript:openScript('subpass.jsp',460,300)">我的订单</a>
| <a href="javascript:openScript('buy.jsp',460,300)">购物车</a>
| <a href="javascript:openScript('cash.jsp',460,300)">收银台</a>
<!-- dim rs,sql
          set rs=server.createobject("adodb.recordset")
          sql="select * from sort"
          rs.open sql,conn,3,3
          if rs.eof then
          response.write ""
          end if
          do while not rs.eof
          %>
                <!--rs.movenext
          loop
          rs.close-->
<%
 
  if((String)session.getValue("user_name")!=null) 
    {
%>
| <a href=javascript:openScript('modify.jsp',500,340)>更改资料</a>
| <a href="quit.jsp">退出</a>&nbsp;&nbsp;
<%
    }else
    {
%>
| 更改资料 | 退出&nbsp;&nbsp;
<%
    }
%>
<!--
显示时间
-->
<script language="JavaScript">
<!--
todayDate = new Date();
date = todayDate.getDate();
month= todayDate.getMonth() +1;
year= todayDate.getYear();
document.write("今天是")
if(navigator.appName == "Netscape")
{
    document.write("<font color=#ff0000>");
	document.write(1900+year);
	document.write("</font ");
	document.write("年");
	document.write("<font color=#ff0000>");
	document.write(month);
	document.write("</font ");
	document.write("月");
	document.write("<font color=#ff0000>");
	document.write(date);
	document.write("</font ");
	document.write("日");
}
if(navigator.appVersion.indexOf("MSIE") != -1)
{
document.write("<font color=#ff0000>");
document.write(year);
document.write("</font>");
document.write("年");
document.write("<font color=#ff0000>");
document.write(month);
document.write("</font>");
document.write("月");
document.write("<font color=#ff0000>");
document.write(date);
document.write("</font>");
document.write("日");

}

//--> 
</script></td></tr></table>
  </center>
</div>