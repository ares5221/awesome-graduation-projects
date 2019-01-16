<%@ page contentType="text/html;charset=gb2312" %>


<table cellSpacing="0" cellPadding="0" width="100%" align="center" bgColor="#999999" border="0" height="123">
<tbody>
<tr>
<td bgColor="#ffffff" height=80>
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
<tbody><tr>


<%@ include file="../top.jsp"%>

</table>
   <TABLE cellSpacing=0 cellPadding=0 width="750" align=center 
      bgColor=#ff7d00 border=0>

</tr>

<tr>
<td background="images/title_13.gif" colSpan="3" width="100%">		
<%@ include file="menu.jsp"%>
</td>
              </tr>
              <tr bgColor="#cccccc">
                <td colSpan="3" height="8" width="100%" background="images/de1.gif"></td>
              </tr>
            </tbody>
          </table>
        </td>
      </tr>
    </tbody>
  </table>







<table border="0" style="border-collapse: collapse" cellpadding="0" id="table1" height="35" align=center>
<tr>
<td><embed src="../images/mianfei.swf" quality=high 
pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" 
type="application/x-shockwave-flash" width=630 height="75"></embed></td>
<td><img src=../images/bbb.jpg border=0></td>
</tr>
</table>











</td>
              </tr>
              <tr bgColor="#cccccc">
                <td colSpan="3" height="8" width="100%" background="images/de1.gif"></td>
              </tr>
            </tbody>
          </table>
        </td>
      </tr>
    </tbody>
  </table>



<%@ include file="../conn/conn.jsp"%>
<%String key=request.getParameter("key");%>
<%String biglei=request.getParameter("biglei");%>
<%String smalllei=request.getParameter("smalllei");%>









<html>
<body topmargin="0" leftmargin="0">
  <table style="BORDER-COLLAPSE: collapse" borderColor="#111111" height="22" cellPadding="0" width="750" align=center border="0" bgcolor="#F0F0F0">
    <tbody>
   
      <form action="search.jsp" method=get name=search><tr>
<input name="finaler" type="hidden" value="1">  
        <td align=center><font size=3>网站查找:</font><input class="ibox" size="70" name="key" value=""><input type="image" alt="搜" src="images/search_but.gif" align="absMiddle" border="0" name="I1"> </td>
      </tr></form>
    
   	<tr>
        <td height="9">
<TABLE width=100% border=0 cellPadding=0 cellSpacing=0>
  <TBODY>
  <TR>
    <TD width="25%" bgColor=#a6daf5><SPACER height="1" type="block"></TD>
    <TD width="25%" bgColor=#c0e898><SPACER height="1" type="block"></TD>
    <TD width="25%" bgColor=#f9adbe><SPACER height="1" type="block"></TD>
    <TD width="25%" bgColor=#fed57f><SPACER height="1" type="block"></TD></TR>
  <TR>
    <TD bgColor=#95d3f3><SPACER height="1" type="block"></TD>
    <TD bgColor=#b4e484><SPACER height="1" type="block"></TD>
    <TD bgColor=#f89db2><SPACER height="1" type="block"></TD>
    <TD bgColor=#fece67><SPACER height="1" type="block"></TD></TR>
  <TR>
    <TD bgColor=#7fc9f0><SPACER height="1" type="block"></TD>
    <TD bgColor=#a4de6a><SPACER height="1" type="block"></TD>
    <TD bgColor=#f688a1><SPACER height="1" type="block"></TD>
    <TD bgColor=#fec346><SPACER height="1" type="block"></TD></TR>
  <TR>
    <TD bgColor=#6ec2ee><SPACER height="1" type="block"></TD>
    <TD bgColor=#98da56><SPACER height="1" type="block"></TD>
    <TD bgColor=#f57995><SPACER height="1" type="block"></TD>
    <TD bgColor=#febb2e><SPACER height="1" type="block"></TD></TR>
 </TBODY></TABLE>
<table cellSpacing="0" cellPadding="0" width="100%" border="0" id="table2">
			<tr bgColor="#5d90de">
				<td width="20" background="result_back1.gif" bgcolor="#ff6d00">
				<br>
　</td>
				<td vAlign="bottom" background="result_back1.gif" height="30" bgcolor="#ff6d00"><!-- search bar -->
	<a href=../union><font color=ffffff size=3>首页:</font></a>&nbsp;&nbsp;



<font color=ffffff size=3><%=key%></font>

</td>



<td vAlign="button" noWrap align="right" background="result_back1.gif" height="30" bgcolor="#ff6d00">
<a class="title3" href="add.jsp"><img src=images/add.jpg border=0  width=70 height=28></a>
</td>
</tr>
		


<tr ><td height=30></td></tr>

		</table>
			</td>
      </tr>
    </tbody>
  </table>










<table style="BORDER-COLLAPSE: collapse" borderColor="#111111" height="181" cellSpacing="0" cellPadding="0" width="100%" border="0">
<tr> 


<table width="750" border="0" cellspacing="0" cellpadding="0" align=center>





<%
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from unionbar where webname like '%"+key+"%' or webtext='%"+key+"%' or biglei='"+key+"' or smalllei='"+smalllei+"' order by tui desc,id desc");
String pages = request.getParameter("page") ;
int pageInt =  1 ,i=0 ,k=1;
if(pages==null){}else{pageInt = Integer.parseInt(pages);}
while(i<20*(pageInt-1)&&rs.next()){i++ ;}
i=0;
while(rs.next()&i<20){
i++ ;
%>


<tr bgcolor=f3f3f3> 
<td width="15" height="25">&nbsp;</td>
<td width="15"></td>
<td class="fl"><strong><img src=../images/point.gif>
<a href="url.jsp?id=<%=rs.getString("id")%>" target="_blank"><font color="blue"  size=4><%=rs.getString("webname")%></font></a> <%if(Integer.parseInt((String)rs.getString("tui"))==0){}else{%><img src=images/tj.gif alt="合作站点"><%}%>&nbsp;&nbsp;
</strong></td>
</tr>
<tr> 
<td height="25">&nbsp;</td>
<td><div align="center"></div></td>
<td class="zl"><font color="#000000" size=3><img src=../images/point1.gif>
<%=rs.getString("webtext")%>
</font></td>
</tr>

<tr><iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src="html/<%=rs.getString("fileName")%>" topmargin=0 width=760 height=0></iframe></tr>

<tr ><td height=30></td></tr>

<%
}
%>



<tr ><td height=30></td></tr>

</table>








<%
rs=stmt.executeQuery("SELECT count(*) from unionbar where webname like '%"+key+"%' or webtext='%"+key+"%' or biglei='"+biglei+"'  or smalllei='"+smalllei+"'  order by id desc");
while(rs.next()) i = rs.getInt(1) ;
%>





<table style="BORDER-COLLAPSE: collapse" borderColor="#111111" height=30 cellSpacing="0" cellPadding="0" width="750" border="0" align=center>
                <tr> <td width="80" class="zl"></td>
                                            <td width="300" class="zl"><font color="#000000">总共找到</font><font color="#FF0000"><%=(i+20)/20%></font><font color="#000000">页</font> 
                                              <font color="#000000"><%=i%>个网站</font>　<font color="#000000">第</font><font color="#FF0000"><%=pageInt%></font><font color="#000000">页</font> 
                                            </td>
                                            <td width="10">&nbsp;</td>
                                            <td>  转到第&nbsp;<%for(int j=1;j<(i+40)/20;j++){%><a href="search.jsp?page=<%=j%>&key=<%=key%>"><font color=red><%=j%></font></a>&nbsp;<%}%>页</td>
                                            <td width="1">&nbsp;</td>
                                            <td width="10">&nbsp;</td>
                                          </tr>
                                       




</table>






</tr></table>
<table height="96" cellSpacing="0" cellPadding="0" width="750" align="center" background="images/de2.gif" border="0">
  <tbody>
    <tr bgColor="#cccccc">
      <td height="6">
        <table cellSpacing="0" cellPadding="0" width="100%" background="images/de1.gif" border="0">
          <tbody>
            <tr>
              <td height="8"></td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr bgColor="#cccccc">
      <td bgColor="#f6f5f5" height="1"></td>
    </tr>
    <tr bgColor="#cccccc">
      <td bgColor="#dfdfdf" height="1"></td>
    </tr>
    <tr>
      <td height="1"></td>
    </tr>
    <tr>
      <td height="67">
        <div align="center">
企富网(Qifo.CoM)版权所有 &copy;2004-2005<br><br> 
        </div>
      </td>
    </tr>
  </tbody>
</table>