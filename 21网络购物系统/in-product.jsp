<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="margin-bottom: 6">
        <tr bgcolor="#FFFFFF"> 
          <td height="100" colspan="2" align="center"> 
            <div align="center"></div>
            <table width="95%" height="5" border="0" align="center" cellpadding="0" cellspacing="0">
              <%
	  String id=request.getParameter("hw_id").trim();
	  int hw_id=Cint(id);
	  String hw_pic,hw_name,hw_content,hw_content2;
      hw_pic=null;
	  hw_name=null;
	  hw_content=null;
	  hw_content2=null;
	  int pifa,daili,hw_cash;
	  pifa=0;
	 daili=0;
	 hw_cash=0;
	  boolean tuijian=false;
      sql="select * from hw where hw_id="+hw_id;
      rs=mdb.executeQuery(sql);
      if(!rs.next())
	  {
		 
      %>
              <tr> 
                <td width="380" height="18"> 没有找到你要查看的商品 </td>
              </tr>
              <%
	  }
	  else
	  {
	     pifa=rs.getInt("pifa");
		   daili=rs.getInt("daili");
		   hw_cash=rs.getInt("hw_cash");
		   tuijian=rs.getBoolean("tuijian");
		   hw_pic=rs.getString("hw_pic");
		  hw_name=rs.getString("hw_name");
		  hw_content=rs.getString("hw_content");
		   hw_content2=rs.getString("hw_content2");

      %>
              <tr> 
                <td width="100%" valign="top"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" height="10">
                    <tr> 
                      <td></td>
                    </tr>
                  </table>
                  <table border="0" width="100%" cellspacing="0">
                    <tr> 
                      <td width="100%" bgcolor="#FFFFFF" valign="top"> 
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="180" style="border-right:#989DA5 1px solid"> 
                              <div align="center"><a href="<%=hw_pic%>" target="_blank">
                                <img border="0" src="<%=hw_pic%>" width="140" height="99"><br>
                                <br>
                                [查看大图片]</a></div>
                            </td>
                            <td width="362" align="center"><a href="views.asp?hw_id=<%=hw_id%>"><font color="#D06800"><b class="dz1"></b></font></a> 
                              <div align="center">
                                <center> 
                              <table width="90%" border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#808080" bgcolor="#ECECEC">
                                <tr align="center"> 
                                  <td height="25" colspan="2">商品名称：<a href="views.asp?hw_id=<%=hw_id%>"><%=hw_name%></a></td>
                                </tr>
                                <tr bgcolor="#FFFFFF"> 
                                  <td width="50%" height="25"> 
                                    <div align="right">市场价格：</div>
                                  </td>
                                  <td width="50%" height="25"> 
                                    <div align="center"><s>￥<%=pifa%></s>元</div>
                                  </td>
                                </tr>
                                <tr bgcolor="#FFFFFF"> 
                                  <td height="25"> 
                                    <div align="right">会员价格：</div>
                                  </td>
                                  <td height="25"> 
                                    <div align="center"><font color="#D03430">￥<%=hw_cash%></font>元</div>
                                  </td>
                                </tr>
                                <tr bgcolor="#FFFFFF"> 
                                  <td height="25"> 
                                    <div align="right"><font size="1" face="sans-serif"><b>VIP</b></font>会员价：</div>
                                  </td>
                                  <td height="25"> 
                                    <div align="center"><font color="#D03430">￥<%=daili%></font>元</div>
                                  </td>
                                </tr>
                                <tr bgcolor="#FFFFFF"> 
                                  <td height="35" colspan="2"> 
                                    <div align="center"><a href='javascript:openbag(<%=hw_id%>)'>定购<img border="0" src="img/order.gif" align="absmiddle"></a></div>
                                  </td>
                                </tr>
                              </table>
                                </center>
                            </div>
                              <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td height="30" valign="bottom"><%=hw_content%></td>
                                </tr>
                              </table>
                              <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td>&nbsp; 
                                    <% if(tuijian)
			                              {%>
                                    <img src="img/ttt.gif" width="40" height="20"> 
                                    <% }%>
                                  </td>
                                </tr>
                              </table>
                              <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td height="5"> <img src="img/pics/seperator.gif" width="359" height="1"></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td width="100%" bgcolor="#FFFFFF" valign="top" align="center"> 
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td bgcolor="f7f7f7" style="border-bottom:#cccccc 1px solid">&nbsp;商 品 详 细 说 明</td>
                          </tr>
                          <tr> 
                            <td style="line-height:20px"><%=hw_content2%></td>
                          </tr>
                        </table>
                        
                      </td>
                    </tr>
                    <%
		 
		
      }
    
      %>
                  </table>
                </td>
              </tr>
              <tr> 
                <td width="100%"></td>
              </tr>
            </table>
            <table width="95%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td>　</td>
              </tr>
            </table>
            <table width="95%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td bgcolor="f7f7f7" style="border-bottom:#cccccc 1px solid">&nbsp;商 品 售 后 服 务 </td>
              </tr>
              <tr> 
                <td style="line-height:20px">售后服务:<br>
                  本公司暂不支持货到付款业务,所有商品一律款到发货!EMS发货! <br>
                  一、本公司售出的手机，自客户收到机器当日起（以发货单为准）7日内出现非人为损坏的质量问题，本公司负责免费更换同型号、同颜色机器； 
                  <br>
                  二、本公司售出手机，自客户收到机器当日起（以发货单为准）一个月之内出现非人为损坏的质量问题，本公司承诺免费保修； <br>
                  三、本站售出的手机配件，半年之内出现非人为损坏的质量问题，免费更换； <br>
                  四、所有换机或保修的邮寄机器费用由双方各负一半。<br>
                  五、注: 客户指定西门子6688由标准版升级到6688i后如出现偶尔死机或自动关机现像属正常现像,不在保修范围内!6688机壳后部易裂,属于西门子设计缺陷,也不属于保修范围,请客户注意!<br>
                  六、本站对以上条款拥有最终解释权。<%=hw_id%>
				  <%
				  sql="select * from system";
				  rs=mdb.executeQuery(sql);
				   if(rs.next()){
				  %><br>
                    联系地址：<%=rs.getString("ymaddr")%><br>
                    邮 编：<%=rs.getString("code")%><br>
                    咨询电话：<%=rs.getString("tel")%><br>
                    联系人：<%=rs.getString("name")%> 
					<%}
				  %>
				  </td>
              </tr>
            </table>
            <br>
            <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td valign="middle"> 
                  <div align="center"><img src="img/pics/seperator.gif" width="359" height="1"></div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>