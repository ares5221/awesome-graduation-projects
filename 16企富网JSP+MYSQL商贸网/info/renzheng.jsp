<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../config.jsp"%>
<%@ include file="../conn/conn.jsp"%>
<%
String username=(String) request.getParameter("id");
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from qyml where username='"+username+"'");
rs.next();%>

<HTML><HEAD><TITLE><%=webname%>-会员认证书</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<STYLE type=text/css>TD {
	FONT-SIZE: 12px
}
P {
	FONT-SIZE: 12px
}
A:active {
	COLOR: #ffffff; TEXT-DECORATION: none
}
A:hover {
	COLOR: #ffffff; TEXT-DECORATION: underline
}
A:link {
	COLOR: #ffffff; TEXT-DECORATION: none
}
A:visited {
	COLOR: #ffffff; TEXT-DECORATION: none
}
TD {
	FONT-SIZE: 12px
}
.Arial_8 {
	FONT-SIZE: 8pt; FONT-FAMILY: "Arial"
}
.Verdana_8 {
	FONT-SIZE: 8pt; FONT-FAMILY: "Verdana"
}
.L13 {
	LINE-HEIGHT: 150%
}
.p10 {
	FONT-SIZE: 10.5pt; FONT-FAMILY: "宋体"
}
</STYLE>

<META content="MSHTML 6.00.2800.1476" name=GENERATOR>
<SCRIPT language=JavaScript>
<!--
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_dragLayer(objName,x,hL,hT,hW,hH,toFront,dropBack,cU,cD,cL,cR,targL,targT,tol,dropJS,et,dragJS) { //v4.01
  //Copyright 1998 Macromedia, Inc. All rights reserved.
  var i,j,aLayer,retVal,curDrag=null,curLeft,curTop,IE=document.all,NS4=document.layers;
  var NS6=(!IE&&document.getElementById), NS=(NS4||NS6); if (!IE && !NS) return false;
  retVal = true; if(IE && event) event.returnValue = true;
  if (MM_dragLayer.arguments.length > 1) {
    curDrag = MM_findObj(objName); if (!curDrag) return false;
    if (!document.allLayers) { document.allLayers = new Array();
      with (document) if (NS4) { for (i=0; i<layers.length; i++) allLayers[i]=layers[i];
        for (i=0; i<allLayers.length; i++) if (allLayers[i].document && allLayers[i].document.layers)
          with (allLayers[i].document) for (j=0; j<layers.length; j++) allLayers[allLayers.length]=layers[j];
      } else {
        if (NS6) { var spns = getElementsByTagName("span"); var all = getElementsByTagName("div"); 
          for (i=0;i<spns.length;i++) if (spns[i].style&&spns[i].style.position) allLayers[allLayers.length]=spns[i];}
        for (i=0;i<all.length;i++) if (all[i].style&&all[i].style.position) allLayers[allLayers.length]=all[i]; 
    } }
    curDrag.MM_dragOk=true; curDrag.MM_targL=targL; curDrag.MM_targT=targT;
    curDrag.MM_tol=Math.pow(tol,2); curDrag.MM_hLeft=hL; curDrag.MM_hTop=hT;
    curDrag.MM_hWidth=hW; curDrag.MM_hHeight=hH; curDrag.MM_toFront=toFront;
    curDrag.MM_dropBack=dropBack; curDrag.MM_dropJS=dropJS;
    curDrag.MM_everyTime=et; curDrag.MM_dragJS=dragJS;
    curDrag.MM_oldZ = (NS4)?curDrag.zIndex:curDrag.style.zIndex;
    curLeft= (NS4)?curDrag.left:(NS6)?parseInt(curDrag.style.left):curDrag.style.pixelLeft; 
    if (String(curLeft)=="NaN") curLeft=0; curDrag.MM_startL = curLeft;
    curTop = (NS4)?curDrag.top:(NS6)?parseInt(curDrag.style.top):curDrag.style.pixelTop; 
    if (String(curTop)=="NaN") curTop=0; curDrag.MM_startT = curTop;
    curDrag.MM_bL=(cL<0)?null:curLeft-cL; curDrag.MM_bT=(cU<0)?null:curTop-cU;
    curDrag.MM_bR=(cR<0)?null:curLeft+cR; curDrag.MM_bB=(cD<0)?null:curTop+cD;
    curDrag.MM_LEFTRIGHT=0; curDrag.MM_UPDOWN=0; curDrag.MM_SNAPPED=false; //use in your JS!
    document.onmousedown = MM_dragLayer; document.onmouseup = MM_dragLayer;
    if (NS) document.captureEvents(Event.MOUSEDOWN|Event.MOUSEUP);
  } else {
    var theEvent = ((NS)?objName.type:event.type);
    if (theEvent == 'mousedown') {
      var mouseX = (NS)?objName.pageX : event.clientX + document.body.scrollLeft;
      var mouseY = (NS)?objName.pageY : event.clientY + document.body.scrollTop;
      var maxDragZ=null; document.MM_maxZ = 0;
      for (i=0; i<document.allLayers.length; i++) { aLayer = document.allLayers[i];
        var aLayerZ = (NS4)?aLayer.zIndex:parseInt(aLayer.style.zIndex);
        if (aLayerZ > document.MM_maxZ) document.MM_maxZ = aLayerZ;
        var isVisible = (((NS4)?aLayer.visibility:aLayer.style.visibility).indexOf('hid') == -1);
        if (aLayer.MM_dragOk != null && isVisible) with (aLayer) {
          var parentL=0; var parentT=0;
          if (NS6) { parentLayer = aLayer.parentNode;
            while (parentLayer != null && parentLayer.style.position) {             
              parentL += parseInt(parentLayer.offsetLeft); parentT += parseInt(parentLayer.offsetTop);
              parentLayer = parentLayer.parentNode;
          } } else if (IE) { parentLayer = aLayer.parentElement;       
            while (parentLayer != null && parentLayer.style.position) {
              parentL += parentLayer.offsetLeft; parentT += parentLayer.offsetTop;
              parentLayer = parentLayer.parentElement; } }
          var tmpX=mouseX-(((NS4)?pageX:((NS6)?parseInt(style.left):style.pixelLeft)+parentL)+MM_hLeft);
          var tmpY=mouseY-(((NS4)?pageY:((NS6)?parseInt(style.top):style.pixelTop) +parentT)+MM_hTop);
          if (String(tmpX)=="NaN") tmpX=0; if (String(tmpY)=="NaN") tmpY=0;
          var tmpW = MM_hWidth;  if (tmpW <= 0) tmpW += ((NS4)?clip.width :offsetWidth);
          var tmpH = MM_hHeight; if (tmpH <= 0) tmpH += ((NS4)?clip.height:offsetHeight);
          if ((0 <= tmpX && tmpX < tmpW && 0 <= tmpY && tmpY < tmpH) && (maxDragZ == null
              || maxDragZ <= aLayerZ)) { curDrag = aLayer; maxDragZ = aLayerZ; } } }
      if (curDrag) {
        document.onmousemove = MM_dragLayer; if (NS4) document.captureEvents(Event.MOUSEMOVE);
        curLeft = (NS4)?curDrag.left:(NS6)?parseInt(curDrag.style.left):curDrag.style.pixelLeft;
        curTop = (NS4)?curDrag.top:(NS6)?parseInt(curDrag.style.top):curDrag.style.pixelTop;
        if (String(curLeft)=="NaN") curLeft=0; if (String(curTop)=="NaN") curTop=0;
        MM_oldX = mouseX - curLeft; MM_oldY = mouseY - curTop;
        document.MM_curDrag = curDrag;  curDrag.MM_SNAPPED=false;
        if(curDrag.MM_toFront) {
          eval('curDrag.'+((NS4)?'':'style.')+'zIndex=document.MM_maxZ+1');
          if (!curDrag.MM_dropBack) document.MM_maxZ++; }
        retVal = false; if(!NS4&&!NS6) event.returnValue = false;
    } } else if (theEvent == 'mousemove') {
      if (document.MM_curDrag) with (document.MM_curDrag) {
        var mouseX = (NS)?objName.pageX : event.clientX + document.body.scrollLeft;
        var mouseY = (NS)?objName.pageY : event.clientY + document.body.scrollTop;
        newLeft = mouseX-MM_oldX; newTop  = mouseY-MM_oldY;
        if (MM_bL!=null) newLeft = Math.max(newLeft,MM_bL);
        if (MM_bR!=null) newLeft = Math.min(newLeft,MM_bR);
        if (MM_bT!=null) newTop  = Math.max(newTop ,MM_bT);
        if (MM_bB!=null) newTop  = Math.min(newTop ,MM_bB);
        MM_LEFTRIGHT = newLeft-MM_startL; MM_UPDOWN = newTop-MM_startT;
        if (NS4) {left = newLeft; top = newTop;}
        else if (NS6){style.left = newLeft; style.top = newTop;}
        else {style.pixelLeft = newLeft; style.pixelTop = newTop;}
        if (MM_dragJS) eval(MM_dragJS);
        retVal = false; if(!NS) event.returnValue = false;
    } } else if (theEvent == 'mouseup') {
      document.onmousemove = null;
      if (NS) document.releaseEvents(Event.MOUSEMOVE);
      if (NS) document.captureEvents(Event.MOUSEDOWN); //for mac NS
      if (document.MM_curDrag) with (document.MM_curDrag) {
        if (typeof MM_targL =='number' && typeof MM_targT == 'number' &&
            (Math.pow(MM_targL-((NS4)?left:(NS6)?parseInt(style.left):style.pixelLeft),2)+
             Math.pow(MM_targT-((NS4)?top:(NS6)?parseInt(style.top):style.pixelTop),2))<=MM_tol) {
          if (NS4) {left = MM_targL; top = MM_targT;}
          else if (NS6) {style.left = MM_targL; style.top = MM_targT;}
          else {style.pixelLeft = MM_targL; style.pixelTop = MM_targT;}
          MM_SNAPPED = true; MM_LEFTRIGHT = MM_startL-MM_targL; MM_UPDOWN = MM_startT-MM_targT; }
        if (MM_everyTime || MM_SNAPPED) eval(MM_dropJS);
        if(MM_dropBack) {if (NS4) zIndex = MM_oldZ; else style.zIndex = MM_oldZ;}
        retVal = false; if(!NS) event.returnValue = false; }
      document.MM_curDrag = null;
    }
    if (NS) document.routeEvent(objName);
  } return retVal;
}
//-->
</SCRIPT>
</HEAD>
<BODY text=#000000 vLink=#ffffff aLink=#ffffff link=#ffffff bgColor=#cccccc  onUnload="leave()">
<DIV id=Layer1 
onmouseover="MM_dragLayer('Layer1','',0,0,0,0,true,false,-1,-1,-1,-1,422,654,50,'',false,'')" 
style="BORDER-RIGHT: medium none; BORDER-TOP: medium none; Z-INDEX: 1; LEFT: 552px; BORDER-LEFT: medium none; WIDTH: 140px; BORDER-BOTTOM: medium none; POSITION: absolute; TOP: 554px; HEIGHT: 103px"><IMG 
height=128 src="images/zhang.gif" width=154 border=0></DIV>
<TABLE cellSpacing=0 cellPadding=0 width=600 border=0  align=center>
  <TBODY>
  <TR>
    <TD height=76>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <TR>
          <TD width=1 bgColor=#000000 rowSpan=13></TD>
          <TD bgColor=#000000 colSpan=3 height=1></TD>
          <TD width=1 bgColor=#000000 rowSpan=13></TD></TR>
        <TR>
          <TD align=middle background=images/bgggg.gif colSpan=3 
          height=874><BR>
            <TABLE cellSpacing=0 cellPadding=0 width=390 align=center 
              border=0><TBODY>
              <TR>
                <TD align=middle><IMG height=148 
                  src="images/icon_cn.jpg" width=220></TD></TR>
              <TR>
                <TD><IMG height=40 src="images/title_cn.gif" 
                  width=390></TD></TR>
              <TR>
                <TD><IMG height=50 src="images/bottom_cn.gif" 
                  width=390></TD></TR></TBODY></TABLE>
            <TABLE cellSpacing=0 cellPadding=3 width=500 align=center 
              border=0><TBODY>
              <TR class=L13>
                <TD>
                  <P align=center><SPAN class=p10><B>证　明</B></SPAN></P>
                  <P><B><SPAN class=L13><FONT color=#ff0000> 
                  <a href=../web/index.jsp?id=<%=rs.getString("id")%> target="_blank"><font color=red ><%=rs.getString("qymc")%></font></a></FONT> 已是<FONT color=#ff0000> 中国<%=webname%>的会员 
                  </FONT>，并已在中国<%=webname%>数据库中登记。</SPAN></B></P>
                  <P align=left><SPAN class=L13><SPAN 
                  class=Verdana_8><BR></SPAN></SPAN><SPAN class=Verdana_8><SPAN 
                  class=L13>This is the company name <FONT 
                  color=#ff0000></FONT></SPAN><SPAN class=Verdana_8><SPAN 
                  class=Verdana_8><SPAN class=L13><FONT 
                  color=#ff0000> <a href=../web/index.jsp?id=<%=rs.getString("id")%> target="_blank"><font color=red ><%=rs.getString("qymc")%></font></a> </FONT></SPAN></SPAN></SPAN><SPAN 
                  class=L13>has registered in  the Qifo.com Database. </SPAN><SPAN 
                  class=Verdana_8><SPAN class=L13></SPAN></P></TD></TR></TBODY></TABLE><BR>
            <TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=2 width=500 
            align=center borderColorLight=#666666 border=1>
              <TBODY>
              <TR>
                <TD align=right width=211>会员帐号：</TD>
                <TD width=275>&nbsp; <%=rs.getString("username")%> </TD></TR>
          
              <TR>
                <TD align=right width=211>会员名称：</TD>
                <TD width=275>&nbsp; <%=rs.getString("myname")%> </TD></TR>
              <TR>
                <TD align=right width=211>诚信指数：</TD>
                <TD width=275>&nbsp; <iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=../info/memgrade.jsp?memid=<%=rs.getString("id")%> topmargin=0 width=65 height=15></iframe></TD></TR>
              <TR>
                <TD align=right width=211>公司名称：</TD>
                <TD width=275>&nbsp; <a href=../web/index.jsp?id=<%=rs.getString("id")%> target="_blank"><font color=red ><%=rs.getString("qymc")%></font></a> </TD></TR>

  <TR>
                <TD align=right width=211>所在地址：</TD>
                <TD width=275>&nbsp; <%=rs.getString("address")%> </TD></TR>
  <TR>
                <TD align=right width=211>邮政编码：</TD>
                <TD width=275>&nbsp; <%=rs.getString("post")%> </TD></TR>
  <TR>
                <TD align=right width=211>联系电话：</TD>
                <TD width=275>&nbsp; <%=rs.getString("tel")%> </TD></TR>
  <TR>
                <TD align=right width=211>传真：</TD>
                <TD width=275>&nbsp; <%=rs.getString("fax")%> </TD></TR>
  <TR>
                <TD align=right width=211>网站：</TD>
                <TD width=275>&nbsp; <%=rs.getString("web")%> </TD></TR>

  <TR>
                <TD align=right width=211>企业简介：</TD>
                <TD width=275>&nbsp; <%=rs.getString("qyjj")%> </TD></TR>
              <TR>
                <TD align=right width=211>注册时间：</TD>
                <TD width=275>&nbsp;<%=rs.getString("regtime")%> </TD></TR>
              


</TBODY></TABLE>
            <P>&nbsp;</P>
            <P align=center>本证书仅用于证明该企业是通过中国企富网注册，并不做为其他证明文件之用！</P>
            <P align=center>&nbsp;</P></TD></TR>
        <TR>
          <TD bgColor=#98b0d2 colSpan=3 height=2></TD></TR>
        <TR>
          <TD align=middle bgColor=#416194 colSpan=3><IMG height=10 
            src="images/spacer.gif" width=10><FONT 
            color=#ffffff>鉴别本证书的真伪，请查看地址栏的网址是否来源于 </FONT><A 
            href="<%=WebUrl%>"><%=WebUrl%>/</A></TD></TR>
        <TR>
          <TD bgColor=#000000 colSpan=3 height=1><IMG height=1 
            src="images/cer" width=1></TD></TR></TBODY></TABLE></TD>
    <TD vAlign=top width=5 bgColor=#666666 height=76>
      <TABLE height=5 cellSpacing=0 cellPadding=0 width=5 bgColor=#cccccc 
      border=0>
        <TBODY>
        <TR bgColor=#cccccc>
          <TD><IMG height=1 src="images/cer" 
      width=1></TD></TR></TBODY></TABLE></TD></TR>
  <TR bgColor=#666666>
    <TD colSpan=2>
      <TABLE height=5 cellSpacing=0 cellPadding=0 width=5 border=0>
        <TBODY>
        <TR bgColor=#cccccc>
          <TD><IMG height=1 src="images/cer" 
      width=1></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<script language="JavaScript" src='../leave.js'></script>
</BODY></HTML>
