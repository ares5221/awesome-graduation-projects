<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.wy.form.ManagerForm"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<jsp:useBean id="getSystemTime" scope="page" class="com.wy.tool.GetSystemTime"></jsp:useBean>
</head>
<script language="JavaScript" src="js/validate.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}



 function quit() {
  if(confirm("您确实要退出本系统吗？")){
    window.location.href="exitSave.jsp";
	}
  }
//-->
</script>
<%
String sign="";
if(session.getAttribute("managerform")==null){
out.print("<script language=javascript>alert('您已经与服务器断开');window.location.href='index.jsp';</script>");
}else{
ManagerForm managerform=(ManagerForm)session.getAttribute("managerform");
sign=managerform.getManagerLevel().trim();
}
%>
<map name="Map">
  <area shape="rect" coords="187,28,256,79" href="department.do?method=queryDepartment">
  <area shape="rect" coords="278,27,347,86" href="employee.do?method=queryEmployee">
  <area shape="rect" coords="367,24,435,101" href="inviteJob.do?method=queryInviteJob">
  <area shape="rect" coords="461,29,525,92" href="train.do?method=queryTrain">
  <area shape="rect" coords="551,24,623,103" href="cj.do?method=queryCj">
  <area shape="rect" coords="642,28,704,103" href="pay.do?method=queryPay">
  <%if(sign.equals("1")){ %>
  <area shape="rect" coords="708,20,793,134" href="manager.do?method=queryManager">
  <%} %>
</map>




<body onLoad="MM_preloadImages('images/top-11.gif','images/top-22.gif','images/top-33.gif')">
<table width="100" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="images/top1.jpg" width="801" height="60" border="0" usemap="#Map"></td>
      </tr>
    </table>



      <table width="100" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="images/top2.jpg" width="801" height="107"></td>
        </tr>
      </table>  
<table width="801" height="34" border="0" cellpadding="0" cellspacing="0" background="images/top3.jpg">
        <tr>
          <td width="532" align="right" valign="top">
		  <table width="224" border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td width="206" height="30" valign="bottom" align="right"><font color="#666633">系统时间：<%=getSystemTime.getToday()%></font></td>
              <td width="10">&nbsp;</td>
            </tr>
          </table>         
	      </td>
          <td width="88"><a href="manager_update.jsp" onClick="javascript:;" onMouseOver="MM_swapImage('Image1','','images/top-11.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="images/top-1.gif" name="Image1" width="85" height="34" border="0" id="Image1"></a></td>
          <td width="88"><a href="mainPage.jsp" onClick="javascript:;" onMouseOver="MM_swapImage('Image2','','images/top-22.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="images/top-2.gif" name="Image2" width="85" height="34" border="0" id="Image2"></a></td>
          <td width="93"><a href="javascript:quit()" onClick="javascript:;" onMouseOver="MM_swapImage('Image3','','images/top-33.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="images/top-3.gif" name="Image3" width="85" height="34" border="0" id="Image3"></a></td>
        </tr>
      </table>
	  

	  
	  </body>
</html>
