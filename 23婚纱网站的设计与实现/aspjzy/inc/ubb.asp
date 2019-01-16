<%
function UBBCode(strContent)
	
	dim re,i
	'strContent=encodestr(strContent)

	'strContent=funkillWord(strContent)
	UbbCode=strContent
	if (instr(strContent,"[")=0 or instr(strContent,"]")=0) and instr(strContent,"http://")=0 then
		exit function
	end if
	
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	
	if instr(1,strContent,"[IMG]",1)=>0 then
		re.Pattern="(\[IMG\])(.[^\[]*)(\[\/IMG\])"
		strContent=re.Replace(strContent,"<a href=""$2"" target=_blank><IMG SRC=""$2"" border=0 alt=按此在新窗口浏览图片 onload=""javascript:if(this.width>500)this.width=500""></a> ")
	end if
	

		if instr(1,strContent,"[/dir]",1)>0 then
			re.Pattern="\[DIR=*([0-9]*),*([0-9]*)\](.[^\[]*)\[\/DIR]"
			strContent=re.Replace(strContent,"<object classid=clsid:166B1BCA-3F9C-11CF-8075-444553540000 codebase=http://download.macromedia.com/pub/shockwave/cabs/director/sw.cab#version=7,0,2,0 width=$1 height=$2><param name=src value=$3><embed src=$3 pluginspage=http://www.macromedia.com/shockwave/download/ width=$1 height=$2></embed></object>")
		end if
		if instr(1,strContent,"[/qt]",1)>0 then
			re.Pattern="\[QT=*([0-9]*),*([0-9]*)\](.[^\[]*)\[\/QT]"
			strContent=re.Replace(strContent,"<embed src=$3 width=$1 height=$2 autoplay=true loop=false controller=true playeveryframe=false cache=false scale=TOFIT bgcolor=#000000 kioskmode=false targetcache=false pluginspage=http://www.apple.com/quicktime/>")
		end if
		if instr(1,strContent,"[/mp]",1)>0 then
			re.Pattern="\[MP=*([0-9]*),*([0-9]*)\](.[^\[]*)\[\/MP]"
			strContent=re.Replace(strContent,"<object align=middle classid=CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95 class=OBJECT id=MediaPlayer width=$1 height=$2 ><param name=ShowStatusBar value=-1><param name=Filename value=$3><embed type=application/x-oleobject codebase=http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701 flename=mp src=$3  width=$1 height=$2></embed></object>")
		end if
		if instr(1,strContent,"[/rm]",1)>0 then
			re.Pattern="\[RM=*([0-9]*),*([0-9]*)\](.[^\[]*)\[\/RM]"
			strContent=re.Replace(strContent,"<OBJECT classid=clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA class=OBJECT id=RAOCX width=$1 height=$2><PARAM NAME=SRC VALUE=$3><PARAM NAME=CONSOLE VALUE=Clip1><PARAM NAME=CONTROLS VALUE=imagewindow><PARAM NAME=AUTOSTART VALUE=true></OBJECT><br><OBJECT classid=CLSID:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA height=32 id=video2 width=$1><PARAM NAME=SRC VALUE=$3><PARAM NAME=AUTOSTART VALUE=-1><PARAM NAME=CONTROLS VALUE=controlpanel><PARAM NAME=CONSOLE VALUE=Clip1></OBJECT>")
		end if
	if instr(1,strContent,"[flash]",1)>0 then
		re.Pattern="(\[FLASH\])(.[^\[]*)(\[\/FLASH\])"
		strContent= re.Replace(strContent,"<a href=""$2"" TARGET=_blank><IMG SRC=images/swf.gif border=0 alt=点击开新窗口欣赏该FLASH动画! height=16 width=16>[全屏欣赏]</a><br><OBJECT codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=500 height=400><PARAM NAME=movie VALUE=""$2""><PARAM NAME=quality VALUE=high><embed src=""$2"" quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width=500 height=400>$2</embed></OBJECT>")
	end if
	
	if instr(1,strContent,"[/url]",1)>0 then
		re.Pattern="(\[URL\])(.[^\[]*)(\[\/URL\])"
		strContent= re.Replace(strContent,"<A HREF=""$2"" TARGET=_blank>$2</A>")
		re.Pattern="(\[URL=(.[^\]]*)\])(.[^\[]*)(\[\/URL\])"
		strContent= re.Replace(strContent,"<A HREF=""$2"" TARGET=_blank>$3</A>")
	end if
	
	if instr(1,strContent,"[/email]",1)>0 then
		re.Pattern="(\[EMAIL\])(.[^\[]*)(\[\/EMAIL\])"
		strContent= re.Replace(strContent,"<img align=absmiddle src=images/email.gif><A HREF=""mailto:$2"">$2</A>")
		re.Pattern="(\[EMAIL=(.[^\[]*)\])(.[^\[]*)(\[\/EMAIL\])"
		strContent= re.Replace(strContent,"<img align=absmiddle src=images/email.gif><A HREF=""mailto:$2"">$3</A>")
	end if
	
	if instr(1,strContent,"http://",1)>0 then
		re.Pattern = "^(http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"<img align=absmiddle src=images/url.gif><a target=_blank href=$1>$1</a>")
		re.Pattern = "(http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)$"
		strContent = re.Replace(strContent,"<img align=absmiddle src=images/url.gif><a target=_blank href=$1>$1</a>")
		
		re.Pattern = "([^>=""])(http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"$1<img align=absmiddle src=images/url.gif><a target=_blank href=$2>$2</a>")
	end if
	
	if instr(1,strContent,"ftp://",1)>0 then
		re.Pattern = "^(ftp://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"<img align=absmiddle src=images/url.gif><a target=_blank href=$1>$1</a>")
		re.Pattern = "(ftp://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)$"
		strContent = re.Replace(strContent,"<img align=absmiddle src=images/url.gif><a target=_blank href=$1>$1</a>")
		re.Pattern = "([^>=""])(ftp://[A-Za-z0-9\.\/=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"$1<img align=absmiddle src=images/url.gif><a target=_blank href=$2>$2</a>")
	end if
	
	if instr(1,strContent,"rtsp://",1)>0 then
		re.Pattern = "^(rtsp://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"<img align=absmiddle src=images/url.gif><a target=_blank href=$1>$1</a>")
		re.Pattern = "(rtsp://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)$"
		strContent = re.Replace(strContent,"<img align=absmiddle src=images/url.gif><a target=_blank href=$1>$1</a>")
		re.Pattern = "([^>=""])(rtsp://[A-Za-z0-9\.\/=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"$1<img align=absmiddle src=images/url.gif><a target=_blank href=$2>$2</a>")
	end if
	
	if instr(1,strContent,"mms://",1)>0 then
		re.Pattern = "^(mms://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"<img align=absmiddle src=images/url.gif><a target=_blank href=$1>$1</a>")
		re.Pattern = "(mms://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)$"
		strContent = re.Replace(strContent,"<img align=absmiddle src=images/url.gif><a target=_blank href=$1>$1</a>")
		re.Pattern = "([^>=""])(mms://[A-Za-z0-9\.\/=\?%\-&_~`@':+!]+)"
		strContent = re.Replace(strContent,"$1<img align=absmiddle src=images/url.gif><a target=_blank href=$2>$2</a>")
	end if
	
	're.Pattern="(\[HTML\])(.+?)(\[\/HTML\])"
	'strContent=re.Replace(strContent,"<table width='100%' border='0' cellspacing='0' cellpadding='6' class=table002><td><b>以下内容为程序代码:</b><br>$2</td></table>")
	
	if instr(1,strContent,"[/color]",1)>0 then
		re.Pattern="(\[color=(.[^\[]*)\])(.[^\[]*)(\[\/color\])"
		strContent=re.Replace(strContent,"<font color=$2>$3</font>")
	end if
	if instr(1,strContent,"[/face]",1)>0 then
		re.Pattern="(\[face=(.[^\[]*)\])(.[^\[]*)(\[\/face\])"
		strContent=re.Replace(strContent,"<font face=$2>$3</font>")
	end if
	if instr(1,strContent,"[/align]",1)>0 then
		re.Pattern="(\[align=(.[^\[]*)\])(.[^\[]*)(\[\/align\])"
		strContent=re.Replace(strContent,"<div align=$2>$3</div>")
	end if
	
	if instr(1,strContent,"[/quote]",1)>0 then
		re.Pattern="(\[QUOTE\])(.[^\[]*)(\[\/QUOTE\])"
		strContent=re.Replace(strContent,"<table cellpadding=5 cellspacing=1 border=0 WIDTH=94% class=table003 align=center><TR><TD class=table002>$2</td></tr></table><br>")
	end if
	if instr(1,strContent,"[/fly]",1)>0 then
		re.Pattern="(\[fly\])(.[^\[]*)(\[\/fly\])"
		strContent=re.Replace(strContent,"<marquee width=90% behavior=alternate scrollamount=3>$2</marquee>")
	end if
	if instr(1,strContent,"[/move]",1)>0 then
		re.Pattern="(\[move\])(.[^\[]*)(\[\/move\])"
		strContent=re.Replace(strContent,"<MARQUEE scrollamount=3>$2</marquee>")	
	end if
	if instr(1,strContent,"[/glow]",1)>0 then
		re.Pattern="\[GLOW=*([0-9]*),*(#*[a-z0-9]*),*([0-9]*)\](.[^\[]*)\[\/GLOW]"
		strContent=re.Replace(strContent,"<table width=$1 style=""filter:glow(color=$2, strength=$3)"">$4</table>")
	end if
	if instr(1,strContent,"[/shadow]",1)>0 then
		re.Pattern="\[SHADOW=*([0-9]*),*(#*[a-z0-9]*),*([0-9]*)\](.[^\[]*)\[\/SHADOW]"
		strContent=re.Replace(strContent,"<table width=$1 style=""filter:shadow(color=$2, strength=$3)"">$4</table>")
	end if
	
	if instr(1,strContent,"[/i]",1)>0 then
		re.Pattern="(\[i\])(.[^\[]*)(\[\/i\])"
		strContent=re.Replace(strContent,"<i>$2</i>")
	end if
	if instr(1,strContent,"[/u]",1)>0 then
		re.Pattern="(\[u\])(.[^\[]*)(\[\/u\])"
		strContent=re.Replace(strContent,"<u>$2</u>")
	end if
	if instr(1,strContent,"[/b]",1)>0 then
		re.Pattern="(\[b\])(.[^\[]*)(\[\/b\])"
		strContent=re.Replace(strContent,"<b>$2</b>")
	end if
	
	if instr(1,strContent,"[/size]",1)>0 then
		re.Pattern="(\[size=1\])(.[^\[]*)(\[\/size\])"
		strContent=re.Replace(strContent,"<font size=1>$2</font>")
		re.Pattern="(\[size=2\])(.[^\[]*)(\[\/size\])"
		strContent=re.Replace(strContent,"<font size=2>$2</font>")
		re.Pattern="(\[size=3\])(.[^\[]*)(\[\/size\])"
		strContent=re.Replace(strContent,"<font size=3>$2</font>")
		re.Pattern="(\[size=4\])(.[^\[]*)(\[\/size\])"
		strContent=re.Replace(strContent,"<font size=4>$2</font>")
	end if
	
	if instr(1,strContent,"[/center]",1)>0 then
		re.Pattern="(\[center\])(.[^\[]*)(\[\/center\])"
		strContent=re.Replace(strContent,"<center>$2</center>")
	end if

	if instr(1,strContent,"[/list]",1)>0 then
		strContent = doCode(strContent, "[list]", "[/list]", "<ul>", "</ul>")
		strContent = doCode(strContent, "[list=1]", "[/list]", "<ol type=1>", "</ol id=1>")
		strContent = doCode(strContent, "[list=a]", "[/list]", "<ol type=a>", "</ol id=a>")
	end if
	if instr(1,strContent,"[/*]",1)>0 then
		strContent = doCode(strContent, "[*]", "[/*]", "<li>", "</li>")
	end if
	if instr(1,strContent,"[/code]",1)>0 then
		strContent = doCode(strContent, "[code]", "[/code]", "<pre id=code><font size=1 face=""Verdana, Arial"" id=code>", "</font id=code></pre id=code>")
	end if
  for i=0 to 31
	 re.Pattern="(\[em"&i&"\])"
	 strContent=re.Replace(strContent,"<img src=em/em"&i&".gif border=0 align=middle>")
  next

	set re=Nothing
	UBBCode=strContent
end function


function doCode(fString, fOTag, fCTag, fROTag, fRCTag)
	dim fOTagPos, fCTagPos
	fOTagPos = Instr(1, fString, fOTag, 1)
	fCTagPos = Instr(1, fString, fCTag, 1)
	while (fCTagPos > 0 and fOTagPos > 0)
		fString = replace(fString, fOTag, fROTag, 1, 1, 1)
		fString = replace(fString, fCTag, fRCTag, 1,1, 1)
		fOTagPos = Instr(1, fString, fOTag, 1)
		fCTagPos = Instr(1, fString, fCTag, 1)
	wend
	doCode = fString
end function

%>