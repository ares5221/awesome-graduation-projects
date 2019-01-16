<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../top.jsp"%>
<%@ include file="../conn/conn.jsp"%>
<%
stmt = con.createStatement() ;
int id = Integer.parseInt((String)request.getParameter("id"));
rs=stmt.executeQuery("SELECT * from zixun where id="+id);
while(rs.next())
{%>


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
                <td align="center"><img src="images/left_box_dotline.gif" width="164" height="1"></td>
              </tr>
              <tr>
                <td height="20" align="right"><a href="../soft/setup.exe"><img src="images/more.gif" width="13" height="13" hspace="3" border="0" align="absmiddle">下载>>></a></td>
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
          <td height="140" background="images/left_box_bg.gif"><table width="172"  border="0" align="center" cellpadding="0" cellspacing="2">
          

   
<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=../union/indexweb.jsp topmargin=0 width=170 height=210></iframe>



          </table></td>
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
          <td height="8" colspan="2"></td>
        </tr>
        <tr bgcolor="#DDDDDD">
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="43" height="2"><img src="images/title_icon.gif" width="49" height="33" hspace="4"></td>
          <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="boldfont orangefont"><%=rs.getString("topic")%></td>
                <td align="right"><a href="../book/addbook.jsp"><img src="../images/too.gif"  hspace="3" border="0" align="absmiddle"></a></td>
              </tr>
          </table></td>
        </tr>
        <tr bgcolor="#999999">
          <td height="2" colspan="2"></td>
        </tr>
        <tr bgcolor="#eeeeee">
          <td height="3" colspan="2"><br><br>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString("text")%><br><br></td>
        </tr>

   <tr bgcolor="#eeeeee">
          <td height="3" colspan="2" align=right>发表人:<%=rs.getString("fbmem")%>&nbsp;&nbsp;&nbsp;&nbsp;发表时间:<%=rs.getString("fbtime")%></td>
        </tr>




 </table>
    </td>
        </tr>
      </table></td>
        </tr>
      </table></td>
  </tr>
</table>


<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src="html/<%=rs.getString("fileName")%>" topmargin=0 width=760 height=0></iframe>


<%}%>




<%@ include file="../end.jsp"%>