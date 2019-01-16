
<table align="center"><tr><td>
<hr color="#989DA5" width="778" size="1"><div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="778" id="AutoNumber1">
    <tr>
      <td align="left" width="195">
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="180" id="AutoNumber2">
          <tr>
            <td width="100%" align="center"> 
            <img border="0" src="img/promo_list_top.gif" width="100%" height="4"></td>
          </tr>
          <tr>
            <td width="100%" align="center" bgcolor="#989DA5"><b><a 
            href="dingou-fangshi.jsp">订 购 方 式 <img height=6 src="img/gwzn1.gif" width=11 
            border=0></a></b></td>
          </tr>
          <tr>
            <td width="100%" align="center" bgcolor="#ECECEC"><img height=8 src="img/new4.gif" 
            width=8> <a href="dingou-fangshi.jsp#1" 
            target=_blank>网 上 订 购</a> <br>
              <img height=8 
            src="img/new4.gif" width=8> <a 
            href="dingou-fangshi.jsp#2" target=_blank>电 
              话 订 购</a> <br>
              <img height=8 src="img/new4.gif" 
            width=8> <a href="dingou-fangshi.jsp#4" 
            target=_blank>传 真 订 购</a> </td>
          </tr>
        </table>
      </td>
      <td align="center" width="195">
      <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="180" id="AutoNumber2">
        <tr>
          <td width="100%" align="center"> 
            <img border="0" src="img/promo_list_top.gif" width="100%" height="4"></td>
        </tr>
        <tr>
          <td width="100%" align="center" bgcolor="#989DA5"><b><a 
            href="peisong-fangshi.jsp">送 货 方 式 <img height=6 src="img/gwzn1.gif" width=11 
            border=0></a></b></td>
        </tr>
        <tr>
          <td width="100%" align="center" bgcolor="#ECECEC"><img height=8 
            src="img/new4.gif" width=8> <a 
            href="peisong-fangshi.jsp#1" target=_blank>送 
            货 上 门</a><br>
          <br>
            <img height=8 
            src="img/new4.gif" width=8> <a 
            href="peisong-fangshi.jsp#4" target=_blank>EMS特快专递</a> </td>
        </tr>
      </table>
      </td>
      <td align="center" width="195">
      <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="180" id="AutoNumber2" height="49">
        <tr>
          <td width="100%" align="center"> 
            <img border="0" src="img/promo_list_top.gif" width="100%" height="4"></td>
        </tr>
        <tr>
          <td width="100%" align="center" bgcolor="#989DA5"><b><a 
            href="fukuan-fangshi.jsp">付 款 方 式 <img height=6 src="img/gwzn1.gif" width=11 
            border=0></a></b></td>
        </tr>
        <tr>
          <td width="100%" align="center" bgcolor="#ECECEC"><img height=8 
            src="img/new4.gif" width=8> <a 
            href="fukuan-fangshi.jsp#2" target=_blank>邮 
            政 汇 款</a><br>
          <br>
            <img height=8 src="img/new4.gif" 
            width=8> <a href="fukuan-fangshi.jsp#3" 
            target=_blank>银 行 汇 款</a> </td>
        </tr>
      </table>
      </td>
      <td align="right" width="195">
      <div align="right">
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="180" id="AutoNumber3">
          <tr>
            <td width="100%" align="center"> 
            <img border="0" src="img/promo_list_top.gif" width="100%" height="4"></td>
          </tr>
          <tr>
            <td width="100%" align="center" bgcolor="#989DA5"><b><a 
            href="fuwu-baozheng.jsp">售 后 服 务<img height=6 src="img/gwzn1.gif" width=11 
            border=0></a></b></td>
          </tr>
          <tr>
            <td width="100%" align="center" bgcolor="#ECECEC"><img height=8 src="img/new4.gif" width=8> <a 
            href="fuwu-baozheng.jsp#2" target=_blank>商 品 
              退 换</a>&nbsp; <br>
              <br>
              <img height=8 src="img/new4.gif" 
            width=8> <a href="fuwu-baozheng.jsp#2" 
            target=_blank>关于本站商品</a></td>
          </tr>
        </table>
      </div>
      </td>
    </tr>
  </table>
  </center>
</div>
<div align="center">
  <center>
<table hwidth=778 border=0 width="778" style="border-collapse: collapse" bordercolor="#111111" cellpadding="0" cellspacing="0">
  <tr bgcolor=#ff0000> 
    <td colspan=2 bgcolor="#989DA5"> 
      <div align=center><font color=#ffffff>网上购物步骤=&gt; 加入会员-&gt; 会员登录-&gt; 选购商品-&gt; 
        加入购物车-&gt; 去收银台-&gt; 选择付款配送方式-&gt; 完成支付=&gt; 购物完成 </font></div>
    </td>
  </tr>
</table>
  </center>
</div>
<div align="center">
  <center>
<table style="BORDER-COLLAPSE: collapse" cellspacing=0 
cellpadding=0 width=778 border=0>
  <tbody> 
  <tr> 
  
<%
sql="select * from system";
rs=mdb.executeQuery(sql);
if(rs.next())
{
%>

  <td width=758 height=25 bgcolor="#ECECEC" > <p align=center><font face="宋体">&copy;</font>Copyright2003 <%=rs.getString("web")%> All Rights Reserved <br>
          客户服务中心信箱：<%=rs.getString("mail")%> 热线直拨：<%=rs.getString("tel")%>
  <a target="_self" href="admin">管理进入</a><br>
          公司地址：<%=rs.getString("ymaddr")%> 邮编：<%=rs.getString("code")%></tr>
  </tbody> 
</table>
  </center>
</div>
</td></tr></table>
<%
}
rs.close();
mdb.Close();
%>

</body>
</html>