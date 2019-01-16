<!--#include file="../inc/conn.asp" -->
<!--#include file="../inc/function.asp" -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="title" content="Charles">
<META content="原古设计 网页制作 软件开发 网络推广 域名注册 domain domain domain domain homepage homepage homepage homepage web hosting web hosting web hosting" name=keywords>
<META content=原古设计,提供国际国内域名注册，包括中文域名的注册；虚拟主机，空间的租用，以及设计制作主页等服务 name=description>
<title><%= Web_Name %></title>
<link href="../css/css.css" rel="stylesheet" type="text/css">
<STYLE>
TABLE {FONT-SIZE: 10.5pt;FONT-FAMILY: 宋体;LINE-HEIGHT: 160%}
A:link {COLOR: #000000; TEXT-DECORATION: none}
A:active {COLOR: #000000; TEXT-DECORATION: none}
A:visited {COLOR: #000000; TEXT-DECORATION: none}
A:hover {COLOR: #ff0000; TEXT-DECORATION: none}
body,td { line-height:1.5; font-size: 9pt} 
body {
	margin-top: 0px;
	background-color: #ffffff;
	margin-left: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.mytable {
border-collapse : collapse;
}
.mytable td {
    background-color: ;
    border: 1px solid #ff9900;
}
.style1 {color: #FFFFFF}
-->
</STYLE>
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
//-->
</script>
</head>
<script language="JavaScript">
<!--

function high(which2)
{
theobject=which2
highlighting=setInterval("highlightit(theobject)",10)
}
function low(which2)
{
clearInterval(highlighting)
which2.filters.alpha.opacity=50
}
function highlightit(cur2)
{
if(cur2.filters.alpha.opacity<100)
cur2.filters.alpha.opacity+=10
else if(window.highlighting)
clearInterval(highlighting)
}
 
//-->
</script>

<body topmargin="0" onLoad="MM_preloadImages('../images/previous_o.gif','../images/next_o.gif','img/previous_o.gif','img/next_o.gif')" >
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#000000">
  <tr>
    <td bgcolor="#000000" colspan="2"><div align="right"><a href="#" onClick="javascript:window.close();return false;"><img src="../images/close.gif" width="92" height="22" border="0"></a></div></td>
  </tr>
  <tr> 
    <td width="80%" valign="top" bgcolor="#000000">
<%
if request("ID")="" then
set rsid=conn.execute("select top 1 * from Products Where Small_Class="&request("Small_Class")&" order by id desc" )
if not rsid.eof then
picid=rsid("id")
end if
rsid.close
set rsid=nothing
else
rsid=request("ID")
end if
%>
	<iframe border=0 frameborder=0 width=100%  height=100%  name=main  src="display.asp?ID=<%= picid %>" scrolling="no"> 
      </iframe> </td>
    <td width="220" valign="top" bgcolor="#000000"> <br>
<%
Set Rs=Server.CreateObject("adodb.recordset")
StrSql="select * from P_Class Where ID="&request("Small_Class")
Rs.open StrSql,conn,1,3
if not Rs.eof then
Big_Name=Rs("ClassName")
end if
Rs.close
set Rs=nothing

maxPerPage=10 
page=Request("page")
if (page="" or isempty(page)) then page=1
thisUrl="?Small_Class="&request("Small_Class")&"&ID="&request("ID")

Set Rs2=Server.CreateObject("adodb.recordset")
StrSql2="select * from Products Where Small_Class="&request("Small_Class")&" Order by P_X Desc"
Rs2.open StrSql2,conn,1,3
if not Rs2.eof then
num1=Rs2.recordcount
Rs2.pagesize=MaxPerPage
end if
%>    
	  <table width="220" border="0" align="center" cellpadding="0" cellspacing="0"  >
        <tr> 
          <td height="26" align="left" bgcolor="#000000" class="style1">&nbsp;&nbsp;
		  <img src="../images/list.gif" width="7" height="7" border="0">
		  &nbsp;《<a href="product.asp"><font color="#FFFFFF"><%= Big_Name %></font></a>》--&nbsp;共有 
            <%= num1 %> 张图片</td>
        </tr>
        <tr> 
          <td height="14" align="left"> 
            <table width="100%" border="0" cellpadding="0" cellspacing="0" >
              <tr> 
                <td width="100%" height="159" align="center" valign="top"> 
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td> 
                        <table width="100%" border="0" cellpadding="5" cellspacing="0">
                          <tr> </tr>
                          <tr> 
                            <td bgcolor="#000000">
							<table align=center width=85>
<%
i=1
if not (Rs2.eof or err) then Rs2.move (page-1)*maxPerPage
do while not Rs2.eof
if i mod 2=1 then Response.Write("<tr>")
%>
                                  <td align="center" width="33%">
								  <a href=display.asp?id=<%= Rs2("ID") %> target="main"><img src=<%= Rs2("P_Bigpic") %> alt="<%= Rs2("P_name") %>" width="80" height="60" border="0" style="BACKGROUND-COLOR: #ffcccc;  FILTER: alpha(opacity=50)" onMouseOver="high(this)" onMouseOut="low(this)" ></a>
								  </td>
                                
<%
if i mod 2=0 then Response.Write("</tr>")
i=i+1
if i>maxPerPage then exit do
Rs2.MoveNext
Loop
%>
                            </table>
							</td>
                          </tr>
                        </table>
                        <table width="100%" border="0" cellpadding="5" cellspacing="0">
                          <form name="form2" method="post" action="photolist.asp?classid=171">
                            <tr> 
                              <td height="36" align="center"> <p> <span class="style1">当前第 <%=page%>/<%=Rs2.pageCount%> 页</span> 
							  <%if page>1 then%>                                 
                                  <a href="<%=thisUrl%>&page=<%=page-1%>"><img src="../images/previous.gif" alt="向上反动相册" name="Image232" width="51" height="13" border="0" id="Image232"></a> 
							  <%else%>
                                  <img src="../images/previous.gif" alt="向上反动相册" name="Image232" width="51" height="13" border="0" id="Image232"> 
                               <%
							   end if 
							   if Rs2.recordCount>page*maxPerPage then
							   %>
							      <a href="<%=thisUrl%>&page=<%=page+1%>"><img src="../images/next_o.gif" alt="向下反动相册" name="Image242" width="32" height="13" border="0" id="Image242"></a> 
                              <%else%>
                                  <img src="../images/next_o.gif" alt="向下反动相册" name="Image232" width="32" height="13" border="0" id="Image232"> 
							  <% end if %>
                                </p></td>
                            </tr>
                          </form>
                        </table></td>
                    </tr>
                  </table>
				
                </td>
              </tr>
            </table></td>
        </tr>
      </table>
<%
				Rs2.close
				set Rs2=nothing
%> 
      <table width="190" border="0" align="right" cellpadding="0" cellspacing="0">
        <tr>
          <td width="190" bgcolor="#000000">
		  <form name="formpic" method="post" action="#">
            <input type="checkbox" name="piccheck" value="ok" onclick="GetSession()"> 自动播放
          </form>
		  </td>
        </tr>
    </table>    </td>
  </tr>
</table>
<SCRIPT language=javascript type=text/javascript>
function GetSession()
{
   var oBao = new ActiveXObject("MSXML2.XMLHTTP");
   if (document.formpic.piccheck.checked ==true)
   {
    oBao.open("post","picsession.asp?action=ok",false);
    oBao.send();
	window.main.document.location.reload();
   }
   else
   {
    oBao.open("post","picsession.asp?action=no",false);
    oBao.send();
	window.main.document.location.reload();
   }
}
</SCRIPT>
</body>
</html>