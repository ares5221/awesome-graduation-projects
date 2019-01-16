<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>

<%
    String z_Loginmessage=(String)session.getValue("z_loginSign");
    String adminID=(String)session.getValue("adminID");    
    if(z_Loginmessage!="OK")
    {
	response.sendRedirect("index4.jsp");
    }
%>
<jsp:useBean id="z_unit" scope="page" class="firm.firm"/>
<%
    String sql="select unit_ID,unit_name,corporation from I_s_info";
    ResultSet rs=z_unit.executeQuery(sql);

    int pageLine=20;
    int totalRec=0;
    int intPage=1;
    int i;
    if (request.getParameter("page")!=null)
    intPage=Integer.parseInt(request.getParameter("page"));
    try{
        String sql1="select count(*)as cnt from I_s_info";
        ResultSet countrs=z_unit.executeQuery(sql1);
        if(countrs.next())
            totalRec=countrs.getInt("cnt");
        countrs.close();
        z_unit.closeStmt();
    }
    catch(Exception e){
        e.printStackTrace();
    }
    int intPageCount=0;
    intPageCount=(totalRec+pageLine-1)/pageLine;
%>

<html>
<head>
<title>项目总评</title>
<script language=JavaScript>
<!--
function disConfirm(){
    return confirm("确认要删除这个单位吗？删除后所有关于该单位的信息将同时删除!");
}
//-->
</script>
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
            <div align="center"><img src="../images/s_unitinfo.gif" width="112" height="22"></div>
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
                      <td><font color="#000099">单位信息</font></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>
                        <table width="100%" border="1" bordercolor="#CCCCCC" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td width="20%" height="17"><font size="2" color="#000099">单位代码</font></td>
                            <td width="60%" height="17"><font size="2" color="#000099">单位名称</font></td>
                            <td height="17" width="13%"><font size="2" color="#000099">法人代表</font></td>
                            <td height="17">&nbsp;</td>
                          </tr>
                          <%
                                                     if (intPageCount>0)
                                                     {
                                                         for(i=1;i<=(intPage-1)*pageLine;i++)
                                                             rs.next();
                                                         for(i=1;i<=pageLine;i++){
                                                             if(rs.next()){
                                               String unit_ID=rs.getString("unit_ID");
                                               String unit_name=rs.getString("unit_name");
						  %>
                          <tr> 
                            <td><font color="#000099"><a href="z_showUnit.jsp?unit_ID=<%=unit_ID%>" target="right"><%=unit_ID%></a>&nbsp;</font></td>
                            <td><font color="#000099"><%=unit_name%>&nbsp;</font></td>
                            <td><font color="#000099"><%=rs.getString("corporation")%>&nbsp;</font></td>
                            <td><font color="#000099"><a href="z_deleteUnit.jsp?unit_ID=<%=unit_ID%>&&intPage=<%=intPage%>" onClick="return disConfirm()"><font color="#FF0000">删除</font></a></font></td>
                          </tr>
                          <%
                                                             }
                                                         }
						     }
						  %>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td colspan="2">&nbsp;</td>
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
                            out.print("<form method='post' name=fPageNum action='z_unit.jsp'>");
                            out.print("<p align='left'><font color='#000099'> 分页</font>&nbsp;");
                            if(intPage<2)
                                out.print("<font color='#000099'>首页 上一页 </font>");
                            else{
                                out.print("<a href='z_unit.jsp?page=1'><font color='#000099'>首页</font></a>&nbsp;");
                                out.print("<a href='z_unit.jsp?page="+(intPage-1)+"'><font color='#000099'>上一页</font></a>&nbsp;");
                            }
                            if(intPage-intPageCount>=0)
                                out.print("<font color='#000099'> 下一页 尾页</font>");
                            else{
                                out.print("<a href='z_unit.jsp?page="+(intPage+1)+"'><font color='#000099'>下一页</font></a>&nbsp;<a href='z_unit.jsp?page="+intPageCount+"'><font color='#000099'>尾页</font></a>");
                            }
                            out.print("&nbsp;<font color='#000099'>页次</font>：<strong><font color='#000099'>"+intPage+"/"+intPageCount+"</font></strong><font color='#000099'>页</font>");
                            out.print("&nbsp;<font color='#000099'>共</font><b><font color='#000099'>"+totalRec+"</font></b><font color='#000099'>个项目</font><b><font color='#000099'>"+pageLine+"</font></b><font color='#000099'>条/页</font>");
                            out.print("<font color='#000099'>转到第</font><input type='text' name='page' size=2 maxlength=10  class=smallInput value="+intPage+">");
                            out.print("<font color='#000099'>页</font><input class=buttonface type='submit' value='GO' name='cndok'></span></p></form>");
                            out.print("</td>");
                            out.print("</tr>");
                         %>jieg.html
                          <tr> 
                            <td align="right" width="50%"><a href="z_addUnit.jsp"><img src="../images/addUnit.gif" width="80" height="22" border="0"></a>&nbsp;</td>
                            <td>&nbsp;<INPUT onclick=javascript:window.close(); type=image src="../images/shutdown.gif" width="80" height="22"></td>
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
