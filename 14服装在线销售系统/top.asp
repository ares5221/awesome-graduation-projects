<div>
<img src="images/logo.gif" style="float:left;" />
<div class="time"></div>
<div class="menu"><%
dim menus,menui,menustr,filename

menus="首页|default.asp|关于我们|about.asp|新闻动态|news.asp|服装商城|product.asp|顾客留言|guest.asp"
menus=split(menus,"|")
menustr=""

filename=Request.ServerVariables("SCRIPT_NAME")
filename=mid(filename,InStrRev(filename,"/")+1,len(filename))

for menui=LBound(menus) to UBound(menus) step 2
	menustr=menustr&"<a href='"&menus(menui+1)&"'"
	if(filename=menus(menui+1)) then
		menustr=menustr&" class='cur'"
	end if
	menustr=menustr&">"&menus(menui)&"</a>"		
next
Response.Write(menustr)
%>
</div><img src="images/top.gif" class="topimg"/><br />
</div>