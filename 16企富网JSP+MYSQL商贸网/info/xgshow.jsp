<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="top.jsp"%>
<%@ include file="../conn/time.jsp"%>
<%
String userid=(String) session.getAttribute("userid");
stmt = con.createStatement() ;%>


<TABLE cellSpacing=0 cellPadding=0 width=778 border=0>
<TBODY>
<TR>
<TD vAlign=top align=middle width=150  background=images/leftmanu_bg.gif>
<%@ include file="left.jsp"%>
</TD>


<TD style="BACKGROUND-POSITION: right 50%; BACKGROUND-IMAGE: url(images/bg1.gif); BACKGROUND-REPEAT: repeat-y; BACKGROUND-COLOR: #ffffff"  vAlign=top align=middle width=628>     


<div align=center>

                            <table width="100%" border="0" cellspacing="0" cellpadding="0" align=center>
                              <tr> 
                                <td height="30">&nbsp;</td>
                              </tr>
                              <tr> 
                                <td><div align="center"> 
                                    <table width="610" border="0" cellspacing="0" cellpadding="0" align=center>
                                      <tr> 
                                        <td height="24" background="images/del_6.gif"><table width="285" border="0" cellspacing="0" cellpadding="0">
                                            <tr> 
                                              <td width="102"><div align="center"> 
                                                  <p class="zl"></p>
                                                </div></td>
                                           
                                            </tr>
                                          </table></td>
                                      </tr>
                                      <tr> 
                                        <td><table width="610" border="0" cellpadding="3" cellspacing="1" bgcolor="97C5E4">
                                            <tr> 
                                              <td height="610" valign="top" bgcolor="#FFFFFF"><div align="center"> 
                                                  <table width="610" border="0" cellspacing="0" cellpadding="0">
                                                    <tr> 
                                                      <td height="20">&nbsp;</td>
                                                    </tr>
                                                    <tr> 
                                                      <td><div align="center"> 
                                                          <table width="500" border="0" cellspacing="0" cellpadding="0">
                                                            <tr> 
                                                              <td height="24" bgcolor="E4E6E7"><table width="500" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr> 
                                                                    <td width="30"><img src="../images/pointi.gif" ></td>
                                                                    <td class="zl"><strong><font color="#1F69A0">发布产品展示</font></strong></td>
                                                                  </tr>
                                                                </table></td>
                                                            </tr>
                                                            <tr> 
                                                              <td height="18">&nbsp;</td>
                                                            </tr>
                                                            <tr> 
                                                              <td><form  action="xgshowok.jsp" method="post" name="form1"  onSubmit="return check1();">
                                                                  <table width="500" border="0" cellpadding="3" cellspacing="1" bgcolor="A8A8A9">
                                                                    <tr bgcolor="EAECED"> 
                                                                      <td height="35" colspan="3"> 
                                                                        <div align="center"> 
                                                                          <p class="zl2"><font color="3C3E3F">请填写展示产品的信息</font></p>
                                                                        </div></td>
                                                                    </tr>

<%
int id = Integer.parseInt((String)request.getParameter("id"));
rs=stmt.executeQuery("SELECT * from showbar where id="+id);
rs.next();%>
                                          





                        <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">选择行业</font></a>:<FONT color=red size=2>*</FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp;
<select name="lei" class="zh" id="lei">
<option value="">重新选择行业分类</option>

<option value="工业用品">工业用品</option>

<option value="建材">建材</option>

<option value="化工">化工</option>

<option value="冶金矿产">冶金矿产</option>

<option value="纺织皮革">纺织皮革</option>

<option value="服饰">服饰</option>

<option value="安全、防护">安全、防护</option>

<option value="能源">能源</option>

<option value="环保">环保</option>

<option value="电子电工">电子电工</option>

<option value="电脑、软件">电脑、软件</option>

<option value="通讯">通讯</option>

<option value="交通运输 ">交通运输 </option>

<option value="汽摩及配件">汽摩及配件</option>

<option value="农业">农业</option>

<option value="包装、纸 ">包装、纸 </option>

<option value="印刷、出版">印刷、出版</option>

<option value="办公、文教">办公、文教</option>

<option value="家用电器">家用电器</option>

<option value="家居用品">家居用品</option>

<option value="食品、饮料">食品、饮料</option>

<option value="商业服务">商业服务</option>

<option value="医药、保养">医药、保养</option>

<option value="运动、休闲">运动、休闲</option>

<option value="工艺、礼品">工艺、礼品</option>

<option value="玩具">玩具</option>

<option value="房地产">房地产</option>

<option value="库存积压品">库存积压品</option>

<option value="人才、教育">人才、教育</option>

<option value="其他">其他</option>

</select>
</td>
</tr>






                                                                    <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">产品名称</font></a>:<FONT color=red size=2>*</FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                                                                        <input name="showname" type="text" class="zl" id="showname" size="30" value=<%=rs.getString("showname")%>></td>
                                                                    </tr>
                                                                                                                               <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">产品型号</font></a>:<FONT color=red size=2>*</FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                                                                        <input name="showxing" type="text" class="zl" id="showxing" size="30"  value=<%=rs.getString("showxing")%>></td>
                                                                    </tr>
                                                           
                                                                                            <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">出产地</font></a>:<FONT color=red size=2>*</FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                                                                        <input name="showaddress" type="text" class="zl" id="showaddress" size="30"  value=<%=rs.getString("showaddress")%>></td>
                                                                    </tr>
                                                           


                                             <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">选择图片</font></a>:<FONT color=red size=2>*</FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                                                                        
<select name="showphoto" id="showphoto">
<option selected>请从下拉框中重新选择产品图片</option>


<%
rs=stmt.executeQuery("SELECT * from photo where memid='"+userid+"' order by id desc");
while(rs.next()){%>                       
<option value="<%=rs.getString("photoname")%>"><%=rs.getString("phototext")%></option>
<%}%>

</select></td>
                                                                    </tr>
                                                           




<%
rs=stmt.executeQuery("SELECT * from showbar where id="+id);
rs.next();%>


                                                                    <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">联系人</font></a>:<FONT color=red size=2></FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                                                                        <input name="myname" type="text" class="zl" id="myname" size="28"  value="<%=rs.getString("myname")%>" readonly=true></td>
                                                                    </tr>
                                                                    <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">联系电话</font></a>:<FONT color=red size=2></FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                                                                        <input name="tel" type="text" class="zl" id="tel" size="28"   value="<%=rs.getString("tel")%>" readonly=true></td>
                                                                  </tr>
                                                      


                                                                    <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">电子邮件</font></a>:</div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                                                                        <input name="email" type="text" class="zl" id="email" size="28"   value="<%=rs.getString("email")%>" readonly=true></td>
                                                                    </tr>



<input name="id" type="hidden" class="zl" id="id" size="28"   value="<%=id%>">

<input name="username" type="hidden" class="zl" id="username" size="28"   value="<%=rs.getString("username")%>">
<input name="company" type="hidden" class="zl" id="company" size="28"   value="<%=rs.getString("company")%>">
<input name="memid" type="hidden" class="zl" id="memid" size="28" value="<%=rs.getString("memid")%>">




                                                                    <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">联系地址</font></a>:<FONT color=red size=2></FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 




<textarea name="address" cols="50" rows="2" id="address"  readonly=true><%=rs.getString("address")%></textarea> 


</td>
                                                                    </tr>
                                                                    <tr> 
                                                                      <td width="18%" height="80" bgcolor="#FFFFFF"> 
                                                                        <div align="center"></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF"><div align="center"> 
                                                                          <table width="200" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr> 
                                                                              <td><input name="submit" type="submit" value="发布" onclick:javascipt"check()"></td>
                                                                              <td><input type="reset" name="Submit3" value="重置"></td>
                                                                            </tr>
                                                                          </table>
                                                                        </div></td>
                                                                    </tr>
                                                                  </table>
                                                                </form></td>
                                                            </tr>
                                                          </table>
                                                        </div></td>
                                                    </tr>
                                                    <tr> 
                                                      <td height="25">&nbsp;</td>
                                                    </tr>
                                                  </table>
                                                </div></td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                      <tr> 
                                        <td height="40">&nbsp;</td>
                                      </tr>
                                    </table>
                                  </div></td>
                              </tr>
                            </table>
                          </div></td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
</table></td>
    </tr>
  </table>
</div>




<script language=javascript>
 
<!--
  function check1(){
    ff=document.form1 


if (ff.lei.value==""){
window.alert("请重新选择行业分类！")
      ff.lei.focus()
      return false
    }



if (ff.showname.value==""){
window.alert("请填写产品名称！")
      ff.showname.focus()
      return false
    }
    

if (ff.showxing.value==""){
window.alert("请填写产品型号！")
      ff.showxing.focus()
      return false
    }
    


    if (ff.showaddress.value==""){
      window.alert("请填写产品出产地！")
      ff.showaddress.focus()
      return false
    }
    
   
    if (ff.showphoto.value==""){
      window.alert("请选择产品图片！")
      ff.showphoto.focus()
      return false
    }
    

        
    if (ff.myname.value==""){
    window.alert("请填写联系人！")
    ff.myname.focus()
    return false
    }



        
    if (ff.tel.value==""){
    window.alert("请填写联系电话！")
    ff.tel.focus()
    return false
    }



        
    if (ff.address.value==""){
    window.alert("请填写联系地址！")
    ff.address.focus()
    return false
    }




  }
//-->
</script>
























</TD></TR></TBODY></TABLE><IMG 
height=10 src="images/bottom.gif" width=778><BR>

<%@ include file="end.jsp"%>
</BODY></HTML>
