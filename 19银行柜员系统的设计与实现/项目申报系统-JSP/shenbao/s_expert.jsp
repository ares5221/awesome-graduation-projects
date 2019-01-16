<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>
<%
    String getLoginmessage=(String)session.getValue("loginSign");
    String unit_ID=(String)session.getValue("unitID");    
    if(getLoginmessage!="OK")
    {
        response.sendRedirect("index2.jsp");
    }    
%>
<jsp:useBean id="s_expert" scope="page" class="firm.firm"/>
<%
    String sql="select * from I_p_info where unit_ID='"+unit_ID+"'";
    ResultSet rs=s_expert.executeQuery(sql);

    int pageLine=20;
    int totalRec=0;
    int intPage=1;
    int i;
    if (request.getParameter("page")!=null)
    intPage=Integer.parseInt(request.getParameter("page"));
    try{
        String sql1="select count(*)as cnt from I_p_info where unit_ID='"+unit_ID+"'";
        ResultSet countrs=s_expert.executeQuery(sql1);
        if(countrs.next())
            totalRec=countrs.getInt("cnt");
        countrs.close();
        s_expert.closeStmt();
    }
    catch(Exception e){
        e.printStackTrace();
    }
    int intPageCount=0;
    intPageCount=(totalRec+pageLine-1)/pageLine;
%>

<html>
<head>
<title>项目申报</title>
<style>
<!--
:link {color:#000099}
:visited {color:#000099}
:active {color:#000099}
A:link,A:visited,A:active {text-decoration:none}
//-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<table border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td bgcolor="#4f71b8"> 
      <table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr bgcolor="#FFFFFF"> 
          <td colspan="3">&nbsp;</td>
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
            <div align="center"><img src="../images/s_item1.gif" width="112" height="22"></div>
          </td>
          <td width="33%">&nbsp;</td>
        </tr>
      </table>
      <table width="600" border="0" cellspacing="1" cellpadding="0">
        <tr> 
          <td height="77" bgcolor="#FFFFFF"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5">&nbsp;</td>
              </tr>
            </table>
            <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr> 
                <td align="center">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><font color="#000099">已添加专家</font></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>
                        <table width="100%" border="1" bordercolor="#CCCCCC" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="20%" height="17"><font size="2" color="#000099">专家姓名</font></td>
					        <td width="25%" height="17"><font size="2" color="#000099">专家身份证号</font></td>
					        <td height="17"><font size="2" color="#000099">研究领域</font></td>
                          </tr>
						  <%
                     String identityID="";
                     String expert_name="";
                     if (intPageCount>0)
                         {
                          for(i=1;i<=(intPage-1)*pageLine;i++)
                              rs.next();
                              for(i=1;i<=pageLine;i++){
                             if(rs.next()){
						                 identityID=rs.getString("identityID");
                             expert_name=rs.getString("expert_name");
						  %>
						  <tr>
						     <td><font color="#000099"><a href="s_expertInfo.jsp?identityID=<%=identityID%>"><%=expert_name%></a>&nbsp;</font></td>
							 <td><font color="#000099"><%=identityID%>&nbsp;</font></td>
							 <td><font color="#000099"><%=rs.getString("domain")%>&nbsp;</font></td>
						  </tr>
						  <%
                                                             }
                                                         }
						     }
						  %>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                         <td>&nbsp;</td>
                        </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <%
                            out.print("<tr>");
                            if(intPageCount*pageLine<totalRec)
                                intPageCount++;
                            if(intPage>intPageCount)
                                intPage=intPageCount;
                            if(intPage<1)
                                intPage=1;
                            out.print("<form method='post' name=fPageNum action='s_expert.jsp'>");
                            out.print("<p align='left'><font color='#000099'> 分页</font>&nbsp;");
                            if(intPage<2)
                                out.print("<font color='#000099'>首页 上一页 </font>");
                            else{
                                out.print("<a href='s_expert.jsp?page=1'><font color='#000099'>首页</font></a>&nbsp;");
                                out.print("<a href='s_expert.jsp?page="+(intPage-1)+"'><font color='#000099'>上一页</font></a>&nbsp;");
                            }
                            if(intPage-intPageCount>=0)
                                out.print("<font color='#000099'> 下一页 尾页</font>");
                            else{
                                out.print("<a href='s_expert?page="+(intPage+1)+"'><font color='#000099'>下一页</font></a>&nbsp;<a href='s_expert?page="+intPageCount+"'><font color='#000099'>尾页</font></a>");
                            }
                            out.print("&nbsp;<font color='#000099'>页次</font>：<strong><font color='#000099'>"+intPage+"/"+intPageCount+"</font></strong><font color='#000099'>页</font>");
                            out.print("&nbsp;<font color='#000099'>共</font><b><font color='#000099'>"+totalRec+"</font></b><font color='#000099'>个专家</font><b><font color='#000099'>"+pageLine+"</font></b><font color='#000099'>条/页</font>");
                            out.print("<font color='#000099'>转到第</font><input type='text' name='page' size=2 maxlength=10  class=smallInput value="+intPage+">");
                            out.print("<font color='#000099'>页</font><input class=buttonface type='submit' value='GO' name='cndok'></span></p></form>");
                            out.print("</td>");
                            out.print("</tr>");
                         %>
                          <tr>
                            <td align="center"><a href="s_addExpert.jsp"><img src="../images/addExpert.gif" width="80" height="22" border="0"></a></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td>&nbsp;</td>
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
