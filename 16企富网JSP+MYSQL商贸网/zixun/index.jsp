<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../top.jsp"%>
<%@ include file="../conn/conn.jsp"%>

<table width="750" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="202" align="center" valign="top"><table width="180" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="8"></td>
      </tr>
      <tr>
        <td height="12" align="center"><img src="../images/scr1.jpg" width="180" height="140" ></td>
      </tr>
        <tr>
          <td height="28" align="center" background="images/left_submenu_01.gif" class="boldfont">商人最新话题</td>
        </tr>
        <tr>
          <td height="140" background="images/left_box_bg.gif"><table width="172"  border="0" align="center" cellpadding="4" cellspacing="2">
              
             <tr>
			  
                 <td align="center"><img src="images/cs1.gif" border="0" class="imgbox" /></td>
              
			  </tr>
              <tr>
                <td  valign="top">


<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=../book/indexbook.jsp?status=0 topmargin=0 width=170 height=200></iframe>






</td>
              </tr>
              <tr>
                <td height="20" align="right"><a href="../book"><img src="images/more.gif" width="13" height="13" hspace="3" border="0" align="absmiddle">阅读更多>>></a></td>
              </tr>

          

          </table></td>
        </tr>
        <tr>
          <td background="images/left_box_bg.gif"><img src="images/left_box_bottom.gif" width="180" height="3"></td>
        </tr>
        <tr>
          <td height="12"></td>
        </tr>
        <tr>
          <td height="28" align="center" background="images/left_submenu_01.gif" class="boldfont">最新登录网站</td>
        </tr>
        <tr>
          <td height="140" background="images/left_box_bg.gif">


<table width="172"  border="0" align="center" cellpadding="0" cellspacing="2">
          
<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=../union/indexweb.jsp topmargin=0 width=170 height=210></iframe>

</table>


</td>
        </tr>
        <tr>
          <td background="images/left_box_bg.gif"><img src="images/left_box_bottom.gif" width="180" height="3"></td>
        </tr>
        <tr>
          <td height="12"></td>
        </tr>
        <tr>
          <td height="28" align="center" background="images/left_submenu_01.gif" class="boldfont">订阅资讯</td>
        </tr>
        <tr>
          <td background="images/left_box_bg.gif"><table width="172"  border="0" align="center" cellpadding="4" cellspacing="2">

            <tr>


		          <td><img src="images/button_subscibe.gif" width="170" height="46" border="0"></td>
            </tr>


<tr>


		          <td><input value="输入电子邮件地址"><input type=submit value="订阅"></td>
            </tr>



          </table></td>
        </tr>
        <tr>
          <td background="images/left_box_bg.gif"><img src="images/left_box_bottom.gif" width="180" height="3"></td>
        </tr>
    </table></td>
    <td valign="top">

        <table width="565" border="0" cellpadding="3" cellspacing="1">

          <tr>
            <td align="center" bgcolor="#eeeeee" height=5>
</td>

          </tr>
        </table>




<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
          <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="boldfont orangefont"><embed src="../images/piantou.swf" quality=high 
pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" 
type="application/x-shockwave-flash" width=565  height=130></embed></td>
                <td align="right"></td>
              </tr>
          </table></td>
        </tr>
</table>











      <table width="100%"  border="0" cellspacing="0" cellpadding="0">

        <tr>
          <td height="8" colspan="2"></td>
        </tr>
        <tr bgcolor="#DDDDDD">
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="43" height="2"><img src="images/title_icon.gif" width="49" height="33" hspace="4"></td>
          <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="boldfont orangefont">热门行业资讯 </td>
                <td align="right"><a href="../book/addbook.jsp"><img src="../images/too.gif"  hspace="3" border="0" align="absmiddle"></a></td>
              </tr>
          </table></td>
        </tr>
        <tr bgcolor="#999999">
          <td height="2" colspan="2"></td>
        </tr>
        <tr bgcolor="#eeeeee">
          <td height="3" colspan="2"></td>
        </tr>
      </table>
      <table width="98%"  border="0" cellspacing="0" cellpadding="0">
        <tr align="center">
          <td width="138%" height="20"><table width="98%"  border="0" cellspacing="0" cellpadding="0">
              
<tr>
<%int i=1,k=2;
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from zixun  where lei=1 order by id desc");
while(rs.next()&i<20){
i++ ;%>


<td width="50%" height="22"><img src="images/arrow_06.gif" width="4" height="7" hspace="4" align="absmiddle"><a href="list.jsp?id=<%=rs.getString("id")%>" target="_blank"><%=rs.getString("topic")%></a></td>

<%if (k==2){k-- ;}else{%></tr></tr><%k++ ;}%>



<%}%>

        </table></td>
        </tr>
      </table>

































      <table width="100%"  border="0" cellspacing="0" cellpadding="0">

        <tr>
          <td height="8" colspan="2"></td>
        </tr>
        <tr bgcolor="#DDDDDD">
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="43" height="2"><img src="images/title_icon.gif" width="49" height="33" hspace="4"></td>
          <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="boldfont orangefont">创业指点迷津 </td>
                <td align="right"></td>
              </tr>
          </table></td>
        </tr>
        <tr bgcolor="#999999">
          <td height="2" colspan="2"></td>
        </tr>
        <tr bgcolor="#eeeeee">
          <td height="3" colspan="2"></td>
        </tr>
      </table>
      <table width="98%"  border="0" cellspacing="0" cellpadding="0">
        <tr align="center">
          <td width="138%" height="20"><table width="98%"  border="0" cellspacing="0" cellpadding="0">
              


<%int q=1,b=2;
rs=stmt.executeQuery("SELECT * from zixun  where lei=2 order by id desc");
while(rs.next()&q<20){
q++ ;%>


<td width="50%" height="22"><img src="images/arrow_06.gif" width="4" height="7" hspace="4" align="absmiddle"><a href="list.jsp?id=<%=rs.getString("id")%>" target="_blank"><%=rs.getString("topic")%></a></td>

<%if (b==2){b-- ;}else{%></tr></tr><%b++ ;}%>



<%}%>

        </table></td>
        </tr>
      </table>





























      <table width="98%" border="0" cellspacing="1" cellpadding="0">
        <tr>
          <td width="48%" align="center" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="8" colspan="2"></td>
              </tr>
              <tr bgcolor="#DDDDDD">
                <td height="1" colspan="2"></td>
              </tr>
              <tr>
                <td width="43" height="2"><img src="images/title_icon.gif" width="49" height="33" hspace="4"></td>
                <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="boldfont orangefont">成败启发</td>
                    </tr>
                </table></td>
              </tr>
              <tr bgcolor="#999999">
                <td height="2" colspan="2"></td>
              </tr>
              <tr bgcolor="#eeeeee">
                <td height="3" colspan="2"></td>
              </tr>
            </table><!--  type_name='行业看台信息'-->
              <table width="95%"  border="0" cellspacing="2" cellpadding="3">
                 



<%int x=1,y=1;
rs=stmt.executeQuery("SELECT * from zixun  where lei=3 order by id desc");
while(rs.next()&x<20){
x++ ;%>




                 <tr>
                  <td height="20"><img src="images/arrow_06.gif" width="4" height="7" hspace="4" align="absmiddle" /><a href="list.jsp?id=<%=rs.getString("id")%>" target="_blank"><%=rs.getString("topic")%></a></td>
                </tr>



<%}%>








          </table></td>
          <td>&nbsp;</td>
          <td width="48%" align="center" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="8" colspan="2"></td>
              </tr>
              <tr bgcolor="#DDDDDD">
                <td height="1" colspan="2"></td>
              </tr>
              <tr>
                <td width="43" height="2"><img src="images/title_icon.gif" width="49" height="33" hspace="4"></td>
                <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="boldfont orangefont">管理培训</td>
                    </tr>
                </table></td>
              </tr>
              <tr bgcolor="#999999">
                <td height="2" colspan="2"></td>
              </tr>
              <tr bgcolor="#eeeeee">
                <td height="3" colspan="2"></td>
              </tr>
            </table><!-- 市场分析-->
              <table width="95%"  border="0" cellspacing="2" cellpadding="3">
          
		
<%int c=1,d=1;
rs=stmt.executeQuery("SELECT * from zixun  where lei=4 order by id desc");
while(rs.next()&c<20){
c++ ;%>



                 <tr>
                  <td height="20"><img src="images/arrow_06.gif" width="4" height="7" hspace="4" align="absmiddle" /><a href="list.jsp?id=<%=rs.getString("id")%>" target="_blank"><%=rs.getString("topic")%></a></td>
                </tr>


<%}%>

            </table></td>
        </tr>
      </table></td>
        </tr>
      </table></td>
  </tr>
</table>


<%@ include file="../end.jsp"%>