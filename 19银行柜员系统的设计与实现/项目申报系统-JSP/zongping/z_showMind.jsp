<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>

<%
    String z_Loginmessage=(String)session.getValue("z_loginSign");
    String adminID=(String)session.getValue("adminID");    
    if(z_Loginmessage!="OK")
    {
	response.sendRedirect("index4.jsp");
    }
%>
<jsp:useBean id="z_showMind" scope="page" class="firm.firm"/>
<%
    String itemID=request.getParameter("itemID");
    String identityID=request.getParameter("identityID");   
    String sql="select * from I_distribute where itemID='"+itemID+"' and identityID='"+identityID+"'";
    ResultSet rs=z_showMind.executeQuery(sql);
    String item_name="";
	String score0="";
	String score1="";
	String score2="";
	String score3="";
	String score4="";
	String score5="";
	String score6="";
	String mind="";
	String expert_mind="";
    if(rs.next()){
        item_name=rs.getString("item_name");
        score0=rs.getString("score0");
        score1=rs.getString("score1");
        score2=rs.getString("score2");
        score3=rs.getString("score3");
        score4=rs.getString("score4");
        score5=rs.getString("score5");
        score6=rs.getString("score6");
        mind=rs.getString("mind");
        expert_mind=rs.getString("expert_mind");
    }
%>

<html>
<head>
<title>专家意见表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<table border="0" cellspacing="0" cellpadding="0" width="650" align="center">
  <tr> 
    <td bgcolor="#000099"> 
      <table width="650" border="0" cellspacing="0" cellpadding="0">
        <tr bgcolor="#FFFFFF"> 
          <td colspan="3" height="20">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="3"></td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td colspan="3">&nbsp;</td>
        </tr>
        <tr> 
          <td width="33%">&nbsp;</td>
          <td bgcolor="#FFFFFF"> 
            <div align="center"><img src="../images/p_item2.gif" width="112" height="22"></div>
          </td>
          <td width="33%">&nbsp;</td>
        </tr>
      </table>
      <table width="650" border="0" cellspacing="1" cellpadding="0">
        <tr> 
          <td height="179" bgcolor="#FFFFFF"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5">&nbsp;</td>
              </tr>
            </table>
            <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr> 
                <td align="center">
                  <table width="100%" border="1" bordercolor="#000099">
                    <tr align="center"> 
                      <td colspan="7"><font color="#0000CC" size="2">专家意见表</font></td>
                    </tr>
                    <tr> 
                      <td colspan="2" align="center"><font color="#0000CC" size="2">项目名称</font></td>
                      <td colspan="5"><font color="#000099" size="2"><%=item_name%></font></td>
                    </tr>
                    <tr> 
                      <td width="8%" rowspan="17" align="center"> 
                        <p><font size="2" color="#0000CC">项<br>
                          目<br>
                          评<br>
                          审<br>
                          内<br>
                          容<br>
                          、<br>
                          分<br>
                          类<br>
                          、<br>
                          标<br>
                          准<br>
                          及<br>
                          主<br>
                          审<br>
                          专<br>
                          家<br>
                          评<br>
                          定<br>
                          分<br>
                          数</font></p>
                      </td>
                      <td width="6%" align="center" height="35"><font color="#0000CC" size="2">评审内容</font></td>
                      <td colspan="3" height="35" align="center"><font size="2" color="#0000CC">内容分类及标准</font></td>
                      <td width="11%" height="35" align="center"><font size="2" color="#0000CC">赋值范围</font></td>
                      <td width="15%" height="35" align="center"> <font size="2" color="#0000CC">评分</font></td>
                    </tr>
                    <tr> 
                      <td rowspan="5" align="center"><font size="2" color="#0000CC">科<br>
                        学<br>
                        水<br>
                        平<br>
                        及<br>
                        意<br>
                        义</font></td>
                      <td colspan="3"><font size="2" color="#0000CC">有否国内外现状、发展趋势对比预测及详尽程度</font></td>
                      <td align="center"><font size="2" color="#0000CC">0-5</font></td>
                      <td align="center"><font size="2" color="#000099"><%=score0%></font></td>
                    </tr>
                    <tr> 
                      <td rowspan="4" align="center" width="18%"><font size="2" color="#0000CC">水<br>
                        平<br>
                        及<br>
                        意<br>
                        义</font></td>
                      <td colspan="2"><font size="2" color="#0000CC">国际领先、意义重大、原始性创新</font></td>
                      <td align="center"><font size="2" color="#0000CC">21-25</font></td>
                      <td align="center" rowspan="4"><font size="2" color="#000099"><%=score1%></font></td>
                    </tr>
                    <tr> 
                      <td colspan="2"><font size="2" color="#0000CC">国际先进（国内领先）、意义重大、有创新</font></td>
                      <td align="center"><font size="2" color="#0000CC">11-20</font></td>
                    </tr>
                    <tr> 
                      <td colspan="2"><font color="#0000CC" size="2">国内领先、意义重大、有一定创新</font></td>
                      <td align="center"><font size="2" color="#0000CC">6-11</font></td>
                    </tr>
                    <tr> 
                      <td colspan="2"><font size="2" color="#0000CC">国内领先、意义较大</font></td>
                      <td align="center"><font size="2" color="#0000CC">0-5</font></td>
                    </tr>
                    <tr> 
                      <td rowspan="3" align="center"><font size="2" color="#0000CC">预期<br>
                        应用<br>
                        前景</font></td>
                      <td rowspan="3" colspan="2"><font size="2" color="#0000CC">可用数值表示的预期年经济效益（社会效益）</font></td>
                      <td width="36%"><font size="2" color="#0000CC">2000万以上（很显著）</font></td>
                      <td align="center"><font size="2" color="#0000CC">16-20</font></td>
                      <td align="center" rowspan="3"><font size="2" color="#000099"><%=score2%></font></td>
                    </tr>
                    <tr> 
                      <td><font size="2" color="#0000CC">501-2000万（显著）</font></td>
                      <td align="center"><font size="2" color="#0000CC">6-15</font></td>
                    </tr>
                    <tr> 
                      <td><font size="2" color="#0000CC">500万以下（较显著）</font></td>
                      <td align="center"><font size="2" color="#0000CC">0-5</font></td>
                    </tr>
                    <tr> 
                      <td rowspan="3" align="center"><font size="2" color="#0000CC">研<br>
                        究<br>
                        内<br>
                        容</font></td>
                      <td colspan="3"><font size="2" color="#0000CC">全面详尽</font></td>
                      <td align="center"><font size="2" color="#0000CC">11-15</font></td>
                      <td align="center" rowspan="3"><font size="2" color="#000099"><%=score3%></font></td>
                    </tr>
                    <tr> 
                      <td colspan="3"><font size="2" color="#0000CC">较全面详尽</font></td>
                      <td align="center"><font size="2" color="#0000CC">6-10</font></td>
                    </tr>
                    <tr> 
                      <td colspan="3"><font size="2" color="#0000CC">较简单</font></td>
                      <td align="center"><font size="2" color="#0000CC">0-5</font></td>
                    </tr>
                    <tr> 
                      <td rowspan="2" align="center"><font size="2" color="#0000CC">技术路线</font></td>
                      <td colspan="3"><font size="2" color="#0000CC">创新先进、合理可行</font></td>
                      <td align="center"><font size="2" color="#0000CC">6-10</font></td>
                      <td align="center" rowspan="2"><font size="2" color="#000099"><%=score4%></font></td>
                    </tr>
                    <tr> 
                      <td colspan="3"><font size="2" color="#0000CC">合理可行</font></td>
                      <td align="center"><font size="2" color="#0000CC">0-5</font></td>
                    </tr>
                    <tr> 
                      <td rowspan="3" align="center"><font size="2" color="#0000CC">研究基础</font></td>
                      <td colspan="3"><font size="2" color="#0000CC">研究基础好，进行较深入的前期研究</font></td>
                      <td align="center"><font color="#0000CC" size="2">16-25</font></td>
                      <td align="center" rowspan="3"><font size="2" color="#000099"><%=score5%></font></td>
                    </tr>
                    <tr> 
                      <td colspan="3"><font size="2" color="#0000CC">研究基础较好，有一定前期成果</font></td>
                      <td align="center"><font size="2" color="#0000CC">6-15</font></td>
                    </tr>
                    <tr> 
                      <td colspan="3"><font size="2" color="#0000CC">研究基础一般，无前期成果</font></td>
                      <td align="center"><font size="2" color="#0000CC">0-5</font></td>
                    </tr>
                    <tr> 
                      <td colspan="3"><font size="2" color="#0000CC">是否建议资助此项目</font></td>
                      <td colspan="2"><font size="2" color="#000099">&nbsp;&nbsp;&nbsp;<%=mind%></font></td>
                      <td align="center"><font size="2" color="#0000CC">评分合计</font></td>
                      <td align="center"><font size="2" color="#000099"><%=score6%></font></td>
                    </tr>
                    <tr> 
                      <td colspan="2" align="center"><font size="2" color="#0000CC">项目评语</font></td>
                      <td colspan="5"> 
                        <p><font size="2" color="#FF9900">请简要说明是否建议资助此项目的理由，不资助写充分理由</font><br>
                          <font size="2" color="#000099">&nbsp;&nbsp;&nbsp;&nbsp;<%=expert_mind%></font> 
                        </p>
                      </td>
                    </tr>
                    <tr align="center"> 
                      <td colspan="7">&nbsp; </td>
                    </tr>
                  </table>				
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="15"></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td align="center"> 
                        <input onClick=javascript:window.close(); type=image src="../images/shutdown.gif" width="80" height="22" name="image">
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="10"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
