<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="top.jsp"%>
<%@ include file="../conn/fl.jsp"%>
<%@ include file="../conn/time.jsp"%>
<%
String userid=(String) session.getAttribute("userid");
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from qyml where id='"+userid+"'");
rs.next();%>
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
                                                                    <td class="zl"><strong><font color="#1F69A0">发布招骋信息</font></strong></td>
                                                                  </tr>
                                                                </table></td>
                                                            </tr>
                                                            <tr> 
                                                              <td height="18">&nbsp;</td>
                                                            </tr>
                                                            <tr> 
                                                              <td><form  action="okjob.jsp" method="post" name="form1"  onSubmit="return check1();">
                                                                  <table width="500" border="0" cellpadding="3" cellspacing="1" bgcolor="A8A8A9">
                                                                    <tr bgcolor="EAECED"> 
                                                                      <td height="35" colspan="3"> 
                                                                        <div align="center"> 
                                                                          <p class="zl2"><font color="3C3E3F">请填写招骋信息详情</font></p>
                                                                        </div></td>
                                                                    </tr>



                                          
                                                                    <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">招骋主题</font></a>:<FONT color=red size=2>*</FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                                                                        <input name="topic" type="text" class="zl" id="topic" size="60"></td>
                                                                    </tr>
                                                              
                        
        
                                                                    <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">招骋人数</font></a>:<FONT color=red size=2>*</FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                                                                        <input name="jobnum" type="text" class="zl" id="jobnum" size="20"></td>
                                                                    </tr>
                                                              
                        
                    
        
                                                                    <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">工作地点</font></a>:<FONT color=red size=2>*</FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                                                                        <input name="jobaddress" type="text" class="zl" id="jobaddress" size="20"></td>
                                                                    </tr>




                                                                    <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">招骋对象</font></a>:<FONT color=red size=2>*</FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                                                                        <select size="1" name="lei" class="f11">
<option value="全职" selected>招聘全职</option>
<option value="兼职">招聘兼职</option>
<option value="应届生">招聘应届毕业生</option>
</select></td>
                                                                    </tr>







                                                                    <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">招骋内容</font></a>:<FONT color=red size=2>*</FONT></div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                                                                      <textarea rows="8" cols="54" name="content" class="f11" style="font-family: 宋体"></textarea></td>
                                                                    </tr>













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
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">联系传真</font></a>:</div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                                                                        <input name="fax" type="text" class="zl" id="fax" size="28"   value="<%=rs.getString("fax")%>" readonly=true></td>
                                                                    </tr>



                                                                    <tr> 
                                                                      <td width="18%" height="35" bgcolor="#FFFFFF"> 
                                                                        <div align="center"><a href="#" class="zllink"><font color="444A4F">电子邮件</font></a>:</div></td>
                                                                      <td colspan="2" bgcolor="#FFFFFF">&nbsp; 
                                                                        <input name="email" type="text" class="zl" id="email" size="28"   value="<%=rs.getString("email")%>" readonly=true></td>
                                                                    </tr>




<input name="fbmem" type="hidden" class="zl" id="company" size="28"   value="<%=rs.getString("username")%>">
<input name="fbmemcompany" type="hidden" class="zl" id="fbmemcompany" size="28"   value="<%=rs.getString("qymc")%>">
<input name="fbmemid" type="hidden" class="zl" id="fbmemid" size="28"   value="<%=(String) session.getAttribute("userid")%>">




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
    
    if (ff.topic.value==""){
      window.alert("请填写信息主题！")
      ff.topic.focus()
      return false
    }
    
   
    if (ff.jobnum.value==""){
      window.alert("请填写招骋人数！")
      ff.jobnum.focus()
      return false
    }
    
    if (ff.jobaddress.value==""){
      window.alert("请填写工作地点！")
      ff.jobaddress.focus()
      return false
    }    
   
   
    if (ff.content.value==""){
      window.alert("请填写信息内容！")
      ff.content.focus()
      return false
    }
    
  }
//-->
</script>
























</TD></TR></TBODY></TABLE><IMG 
height=10 src="images/bottom.gif" width=778><BR>

<%@ include file="end.jsp"%>
</BODY></HTML>
