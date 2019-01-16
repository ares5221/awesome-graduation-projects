<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../conn/conn.jsp"%>


<style type="text/css">
BODY { OVERFLOW-X: hidden; OVERFLOW: scroll}
.DEK { Z-INDEX: 200; VISIBILITY: hidden; POSITION: absolute} 
</style>
<body>
<div class=dek id=dek>
<SCRIPT type=text/javascript language="">
Xoffset= 0;    // modify these values to ...
Yoffset= 20;    // change the popup position.
myImg= new Array()
myImg[1]="../info/images/help.gif"
var nav,old,iex=(document.all),yyy=-1000;
if(navigator.appName=="Netscape"){(document.layers)?nav=true:old=true;}
if(!old){
var skn=(nav)?document.dek:dek.style;
if(nav)document.captureEvents(Event.MOUSEMOVE);
document.onmousemove=get_mouse;
}
function popup(i){
var content="<img src='"+ myImg[i]+"'>";
if(old){alert(msg);return;} 
else{yyy=Yoffset;
if(nav){skn.document.write(content);skn.document.close();skn.visibility="visible"}
if(iex){document.all("dek").innerHTML=content;skn.visibility="visible"}
}
}
function get_mouse(e){
var x=(nav)?e.pageX:event.x+document.body.scrollLeft;skn.left=x+Xoffset;
var y=(nav)?e.pageY:event.y+document.body.scrollTop;skn.top=y+yyy;
}
function kill(){
if(!old){yyy=-1000;skn.visibility="hidden";}
}
//-->
</SCRIPT>
</div>

<%
stmt = con.createStatement() ;
String memid=(String) request.getParameter("memid");
rs=stmt.executeQuery("SELECT * from grade where memid='"+memid+"' order by id desc");
rs.next();
%>


<%if(Integer.parseInt(rs.getString("fen"))>0&&Integer.parseInt(rs.getString("fen"))<100){%>
<a href="../info/gradeindex.jsp" onMouseOver=popup(1) onMouseOut=kill() target="_blank"><img src=../info/images/grade1.gif alt="诚信指数:1星" border=0></a><%}else{%>

<%if(Integer.parseInt(rs.getString("fen"))>99&&Integer.parseInt(rs.getString("fen"))<200){%>
<a href="../info/gradeindex.jsp" onMouseOver=popup(1) onMouseOut=kill() target="_blank"><img src=../info/images/grade2.gif alt="诚信指数:2星" border=0></a><%}else{%>


<%if(Integer.parseInt(rs.getString("fen"))>199&&Integer.parseInt(rs.getString("fen"))<300){%>
<a href="../info/gradeindex.jsp" onMouseOver=popup(1) onMouseOut=kill() target="_blank"><img src=../info/images/grade3.gif alt="诚信指数:3星" border=0></a><%}else{%>


<%if(Integer.parseInt(rs.getString("fen"))>299&&Integer.parseInt(rs.getString("fen"))<400){%>
<a href="../info/gradeindex.jsp" onMouseOver=popup(1) onMouseOut=kill() target="_blank"><img src=../info/images/grade4.gif alt="诚信指数:4星" border=0></a><%}else{%>


<%if(Integer.parseInt(rs.getString("fen"))>399&&Integer.parseInt(rs.getString("fen"))<500){%>
<a href="../info/gradeindex.jsp" onMouseOver=popup(1) onMouseOut=kill() target="_blank"><img src=../info/images/grade5.gif alt="诚信指数:5星" border=0></a><%}else{%>




<%if(Integer.parseInt(rs.getString("fen"))>499&&Integer.parseInt(rs.getString("fen"))<600){%>
<a href="../info/gradeindex.jsp" onMouseOver=popup(1) onMouseOut=kill() target="_blank"><img src=../info/images/grade6.gif alt="诚信指数:6星" border=0></a><%}else{%>




<%if(Integer.parseInt(rs.getString("fen"))>599&&Integer.parseInt(rs.getString("fen"))<700){%>
<a href="../info/gradeindex.jsp" onMouseOver=popup(1) onMouseOut=kill() target="_blank"><img src=../info/images/grade7.gif alt="诚信指数:7星" border=0></a><%}else{%>



<%if(Integer.parseInt(rs.getString("fen"))>699&&Integer.parseInt(rs.getString("fen"))<800){%>
<a href="../info/gradeindex.jsp" onMouseOver=popup(1) onMouseOut=kill() target="_blank"><img src=../info/images/grade8.gif alt="诚信指数:8星" border=0></a><%}else{%>




<%if(Integer.parseInt(rs.getString("fen"))>799&&Integer.parseInt(rs.getString("fen"))<10000){%>
<a href="../info/gradeindex.jsp" onMouseOver=popup(1) onMouseOut=kill() target="_blank"><img src=../info/images/grade9.gif alt="诚信指数:9星" border=0></a><%}else{%>

<%if(Integer.parseInt(rs.getString("fen"))>9999){%>
<a href="../info/gradeindex.jsp" onMouseOver=popup(1) onMouseOut=kill() target="_blank"><img src=../info/images/grade10.gif alt="企富通会员" border=0></a><%}else{%>



<%}%>
<%}%>
<%}%>
<%}%>
<%}%>
<%}%>
<%}%>
<%}%>
<%}%>
<%}%>



</body>





