<!--#include file="../inc/conn.asp"-->
<noscript><iframe src=*.html></iframe></noscript>
<Script Language=javascript> 
function Click(){ 
alert('http://www.vivi-xn.cn  \n\r\n\r <%= P_Name %>'); 
window.event.returnValue=false; 
} 
document.oncontextmenu=Click; 
</Script>
<% 
if request("ID")<>"" then
Set Rs2=Server.CreateObject("adodb.recordset")
StrSql2="select top 1 * from Products Where ID="&request("ID")&" order by id desc" 
Rs2.open StrSql2,conn,1,3
if not Rs2.eof then
P_Name=Rs2("P_Name")
P_Bigpic=Rs2("P_Bigpic")
end if
Rs2.close
set Rs2=nothing
end if

if request("ID")<>"" then
		sqlne="select top 1 * from Products where id < "&request("id")&" order by id desc" 
		set rsne=server.createobject("adodb.recordset")
        rsne.open sqlne,conn,1,3
		if not rsne.eof then
		Lin_next="display.asp?id="&rsne("id")
		else
		Lin_next="#"
		end if
		rsne.close
end if
%>
<html>
<head>
<title><%= P_Name %></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" >
<% If session("picsession")="ok" Then %>
<meta http-equiv="refresh" content="5;URL=<%= Lin_next %>">
<% End If %>
<script for=window event=onLoad language=vbscript>
image1.filters.item(0).apply()
image1.filters.item(0).transition = 23
image1.Style.visibility = ""
image1.filters(0).play(2.0)
</script>
</head>
<body bgcolor="#ffffff" leftmargin=0 topmargin=0>
<table width="100%" height="100%" border=0 
                        align=center cellpadding=0 cellspacing=0 class=bk>
              <tbody> 
              <tr> 
                
    <td width="100%" valign="middle" bgcolor="#000000"> 
      <div align="center"> 
        <table width='100%' height=100% border='0' cellspacing='0' cellpadding='0' align='center'><tr><td align='center'><a href="<%= P_Bigpic %>" target="_blank"><img src='<%= P_Bigpic %>'  alt='在新窗口中查看' name="image1" onload="javascript:if(this.height>=this.width){this.height=550;}else{this.width=700;}" border=0 align='center' id='image1'  style='visibility:hidden; FILTER:revealTrans(Duration=4.0, Transition=23);'></a></td>
        </tr></table>
      </div>
    </td>
              </tr>
              </tbody> 
</table>
<script LANGUAGE="JavaScript">
    self.onError=null;
    currentX = currentY = 0; 
    whichIt = null; 
    lastScrollX = 0; lastScrollY = 0;
    NS = (document.layers) ? 1 : 0;
    IE = (document.all) ? 1: 0;
    <!-- STALKER CODE -->
    function heartBeat() {
        if(IE) { diffY = document.body.scrollTop; diffX = document.body.scrollLeft; }
    if(NS) { diffY = self.pageYOffset; diffX = self.pageXOffset; }
        if(diffY != lastScrollY) {
    percent = .1 * (diffY - lastScrollY);
    if(percent > 0) percent = Math.ceil(percent);
    else percent = Math.floor(percent);
                    if(IE) document.all.floater.style.pixelTop += percent;
                    if(NS) document.floater.top += percent; 
    lastScrollY = lastScrollY + percent;
    }
        if(diffX != lastScrollX) {
            percent = .1 * (diffX - lastScrollX);
            if(percent > 0) percent = Math.ceil(percent);
            else percent = Math.floor(percent);
            if(IE) document.all.floater.style.pixelLeft += percent;
            if(NS) document.floater.left += percent;
            lastScrollX = lastScrollX + percent;
        }    
    }
    <!-- /STALKER CODE -->
    <!-- DRAG DROP CODE -->
    function checkFocus(x,y) { 
    stalkerx = document.floater.pageX;
    stalkery = document.floater.pageY;
    stalkerwidth = document.floater.clip.width;
    stalkerheight = document.floater.clip.height;
    if( (x > stalkerx && x < (stalkerx+stalkerwidth)) && (y > stalkery && y < (stalkery+stalkerheight))) return true;
    else return false;
    }
    function grabIt(e) {
        if(IE) {
            whichIt = event.srcElement;
            while (whichIt.id.indexOf("floater") == -1) {
                whichIt = whichIt.parentElement;
                if (whichIt == null) { return true; }
        }
            whichIt.style.pixelLeft = whichIt.offsetLeft;
        whichIt.style.pixelTop = whichIt.offsetTop;
            currentX = (event.clientX + document.body.scrollLeft);
            currentY = (event.clientY + document.body.scrollTop);     
        } else { 
    window.captureEvents(Event.MOUSEMOVE);
    if(checkFocus (e.pageX,e.pageY)) { 
    whichIt = document.floater;
    StalkerTouchedX = e.pageX-document.floater.pageX;
    StalkerTouchedY = e.pageY-document.floater.pageY;
    } 
        }
    return true;
    }
    function moveIt(e) {
        if (whichIt == null) { return false; }
        if(IE) {
        newX = (event.clientX + document.body.scrollLeft);
        newY = (event.clientY + document.body.scrollTop);
        distanceX = (newX - currentX); distanceY = (newY - currentY);
        currentX = newX; currentY = newY;
        whichIt.style.pixelLeft += distanceX;

        whichIt.style.pixelTop += distanceY;
            if(whichIt.style.pixelTop < document.body.scrollTop) whichIt.style.pixelTop = document.body.scrollTop;
            if(whichIt.style.pixelLeft < document.body.scrollLeft) whichIt.style.pixelLeft = document.body.scrollLeft;
            if(whichIt.style.pixelLeft > document.body.offsetWidth - document.body.scrollLeft - whichIt.style.pixelWidth - 20) whichIt.style.pixelLeft = document.body.offsetWidth - whichIt.style.pixelWidth - 20;
            if(whichIt.style.pixelTop > document.body.offsetHeight + document.body.scrollTop - whichIt.style.pixelHeight - 5) whichIt.style.pixelTop = document.body.offsetHeight + document.body.scrollTop - whichIt.style.pixelHeight - 5;
            event.returnValue = false;
        } else { 
            whichIt.moveTo(e.pageX-StalkerTouchedX,e.pageY-StalkerTouchedY);
    if(whichIt.left < 0+self.pageXOffset) whichIt.left = 0+self.pageXOffset;
    if(whichIt.top < 0+self.pageYOffset) whichIt.top = 0+self.pageYOffset;
    if( (whichIt.left + whichIt.clip.width) >= (window.innerWidth+self.pageXOffset-17)) whichIt.left = ((window.innerWidth+self.pageXOffset)-whichIt.clip.width)-17;
    if( (whichIt.top + whichIt.clip.height) >= (window.innerHeight+self.pageYOffset-17)) whichIt.top = ((window.innerHeight+self.pageYOffset)-whichIt.clip.height)-17;
    return false;
        }
    return false;
    }
    function dropIt() {
        whichIt = null;
    if(NS) window.releaseEvents (Event.MOUSEMOVE);
    return true;
    }
    <!-- DRAG DROP CODE -->
    if(NS) {
        window.captureEvents(Event.MOUSEUP|Event.MOUSEDOWN);
        window.onmousedown = grabIt;
        window.onmousemove = moveIt;
        window.onmouseup = dropIt;
    }
    if(IE) {
        document.onmousedown = grabIt;
        document.onmousemove = moveIt;
        document.onmouseup = dropIt;
    }
    if(NS || IE) action = window.setInterval("heartBeat()",1);
    </script>
</body>

</html>
