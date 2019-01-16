<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>
<%
    String getLoginmessage=(String)session.getValue("loginSign");
    String unit_ID=(String)session.getValue("unitID");      
    if(getLoginmessage!="OK")
    {
        response.sendRedirect("index2.jsp");
    }    
%>
<jsp:useBean id="s_showitem" scope="page" class="firm.firm"/>
<%
    String itemID=request.getParameter("itemID");
    String sql="select * from I_s_item where itemID='"+itemID+"'";
    ResultSet rs=s_showitem.executeQuery(sql);
	
	//定义数据类型并初始化
	String item_name1="";     //项目名称
	String sort1="";          //类    别
	String sort2="";
	String begin_date1="";    //起止年限
	String finish_date1="";   //起止年限
	String applicant1="";     //申 请 者
	String grade1="";         //职    称
	String education="";         //学    历
	String unit_name1="";     //所在单位
	String fill_date1="";     //填报日期
    String purport1="";       //本课题的研究意义
    String status1="";        //国内外研究现状述评
    String future1="";        //预期应用前景
    String point1="";         //主要思想、观点
    String analysis1="";      //主要内容、重点和难点分析
    String way1="";           //研究方法
    String moment1="";        //阶段及最终预期研究成果
    String result1="";        //预期研究成果
    String reference1="";     //本课题前期研究成果，主要的外文参考文献和参考资料
    String market1="";        //应用推广或市场分析
    String commend_mind1="";  //推荐单位意见
    String expert_mind1="";   //专家评审委员会意见
    String leading_mind1="";  //审批意见
    String pass1="";          //是否通过审批
	String sum="";

    if(rs.next())
	{
	    item_name1=rs.getString("item_name");
		sort1=rs.getString("sort1");
		sort2=rs.getString("sort2");
		begin_date1=rs.getString("begin_date");
		finish_date1=rs.getString("finish_date");
		applicant1=rs.getString("applicant");
		grade1=rs.getString("grade");
		education=rs.getString("education");
		unit_name1=rs.getString("unit_name");
		fill_date1=rs.getString("fill_date");
		purport1=rs.getString("purport");
		status1=rs.getString("status");
		future1=rs.getString("future");
		point1=rs.getString("point");
		analysis1=rs.getString("analysis");
		way1=rs.getString("way");
		moment1=rs.getString("moment");
		result1=rs.getString("result");
		reference1=rs.getString("reference");
		market1=rs.getString("market");
		commend_mind1=rs.getString("commend_mind");
		expert_mind1=rs.getString("expert_mind");
		leading_mind1=rs.getString("leading_mind");
		pass1=rs.getString("pass");
		
		rs.close();
        s_showitem.closeStmt();
        s_showitem.closeConn();
	}
	String begin_year=begin_date1.substring(0,4);
	String begin_month=begin_date1.substring(5,7);
	String finish_year=finish_date1.substring(0,4);
	String finish_month=finish_date1.substring(5,7);
	String fill_year=fill_date1.substring(0,4);
	String fill_month=fill_date1.substring(5,7);
	String fill_day=fill_date1.substring(8,10);

	String sql2="select * from I_s_money where itemID='"+itemID+"'";
	ResultSet rs2=s_showitem.executeQuery(sql2);
	String sql3="select sum(sMoney) as ssum from I_s_money where itemID='"+itemID+"'";
	ResultSet rs3=s_showitem.executeQuery(sql3);
	if(rs3.next()){ sum=rs3.getString("ssum");}
	String pSql="select * from I_distribute where itemID='"+itemID+"'";
	ResultSet pRs=s_showitem.executeQuery(pSql);
	String expert[]={"专家一","专家二","专家三","专家四","专家五"};
	
%>

<html>
<head>
<title>项目申报</title>
<SCRIPT language=javascript>
<!--
OptSort = new Array(
    "0100","网络",
	"0101","软件外包",
	"0200","经营管理",
	"0201","公司硬件设施",
	"0202","员工交通",
	"0300","员工住宿",
	"0301","员工工资",
	"0302","节假日补助",
	"0303","公司发展战略",
	"0304","软件系统",
	"0400","招聘新员工",
	"0401","成立新部门",
	"0402","公司管理制度",
	"0403","公司财务管理",
	"0500","公司人事管理",
	"0501","公司销售部门",
	"0502","公司质检部门"	);

function showSort()
{
	var i,len,start,step,s1,a,args=showSort.arguments;
	var name;
	a=args[0];
	s1=args[1];
	start=0;
	step=2;
	len=a.length;
	for(i=0;i<len;i+=step)
	{
		if(a[i]==s1)
		{
		    name=a[i+1];
			break;
		}
		else name="";
	}
	document.writeln(name);
}
function showbank()
{
    document.writeln("");
}
//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<div align="center"> 
  <table border="0" cellspacing="0" cellpadding="0" width="650">
    <tr> 
      <td bgcolor="#000099"> 
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
        <table width="650" border="0" cellspacing="1" cellpadding="0" height="120">
          <tr> 
            <td height="179" bgcolor="#FFFFFF"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td height="5">&nbsp;</td>
                </tr>
              </table>
              <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center" height="151">
                <tr> 
                  <td>                    
                      <table width="95%" border="0" cellspacing="1" cellpadding="1" align="center">
                        
                      <tr> 
                        <td colspan="2" bgcolor="#d9d8dc">&nbsp;</td>
                        </tr>
                        <tr> 
                          <td width="25%" bgcolor="#d9d8dc" align="center"><font color="#000099">项目名称</font></td>
                          <td><font color="#000099"><%=item_name1%></font></td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center"><font color="#000099">类&nbsp;&nbsp;&nbsp;&nbsp;别</font></td>
                          <td bgcolor="#f2f2f2"><font color="#000099"><script language="javascript">showSort(OptSort,"<%=sort1%>");showbank();showSort(OptSort,"<%=sort2%>");</script></font></td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center"><font color="#000099">起止年限</font></td>
                          
                        <td> <font color="#000099"><%=begin_year%>年<%=begin_month%>月——<%=finish_year%>年<%=finish_month%>月</font> </td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center"><font color="#000099">申 
                            请 者</font></td>
                          <td bgcolor="#f2f2f2"> <font color="#000099"><%=applicant1%>（<%=grade1%>）（<%=education%>）</font> 
                          </td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center"><font color="#000099">所在单位</font></td>
                          <td><font color="#000099"><%=unit_name1%></font></td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center"><font color="#000099">填报日期</font></td>
                          <td bgcolor="#f2f2f2"> <font color="#000099"><%=fill_year%>年<%=fill_month%>月<%=fill_day%>日</font></td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" colspan="2">&nbsp;</td>
                        </tr>
                        <tr> 
                          <td colspan="2">&nbsp;</td>
                        </tr>
                      </table>
                      
                    <table width="95%" border="0" cellspacing="1" cellpadding="1" align="center">
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2"><font color="#000099">一、课题设计及可行性论证</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2"> 
                          <p><font color="#000099">&nbsp;&nbsp;&nbsp;&nbsp;1、本课题的研究意义、国内外研究现状述评。论述其应用前景。<br>
                            &nbsp;&nbsp;&nbsp;&nbsp;2、本课题研究的主要思想、主要观点、主要内容、重点和难点分析。<br>
                            &nbsp;&nbsp;&nbsp;&nbsp;3、本课题的研究方法，阶段及最终预期研究成果。<br>
                            &nbsp;&nbsp;&nbsp;&nbsp;4、经费预算（有其他经费来源者请予以说明）。<br>
                            &nbsp;&nbsp;&nbsp;&nbsp;5、本课题前期研究成果，主要的外文参考文献和参考资料。</font></p>
                        </td>
                      </tr>
                      <tr> 
                        <td colspan="2">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2"><font color="#000099">&nbsp;&nbsp;&nbsp;&nbsp;1、本课题的研究意义、国内外研究现状述评。论述其应用前景。</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2"><font color="#000099">&nbsp;&nbsp;&nbsp;&nbsp;本课题的研究意义</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#f2f2f2" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<%=purport1%></td>
                      </tr>
                      <tr bgcolor="#d9d8dc"> 
                        <td bgcolor="#d9d8dc" colspan="2"><font color="#000099">&nbsp;&nbsp;&nbsp;&nbsp;国内外研究现状述评</font> 
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#f2f2f2" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<%=status1%></td>
                      </tr>
                      <tr bgcolor="#d9d8dc"> 
                        <td bgcolor="#d9d8dc" colspan="2"><font color="#000099">&nbsp;&nbsp;&nbsp;&nbsp;预期应用前景</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#f2f2f2" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<%=future1%></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2"><font color="#000099">&nbsp;&nbsp;&nbsp;&nbsp;2、本课题研究的主要思想、主要观点、主要内容、重点和难点分析。</font> 
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2"><font color="#000099">&nbsp;&nbsp;&nbsp;&nbsp;主要思想、观点</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#f2f2f2" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<%=point1%></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2"><font color="#000099">&nbsp;&nbsp;&nbsp;&nbsp;主要内容、重点和难点分析</font> 
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#f2f2f2" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<%=analysis1%></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2"><font color="#000099">&nbsp;&nbsp;&nbsp;&nbsp;3、本课题的研究方法，阶段及最终预期研究成果。</font> 
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2"><font color="#000099">&nbsp;&nbsp;&nbsp;&nbsp;研究方法</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#f2f2f2" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<%=way1%></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2"><font color="#000099">&nbsp;&nbsp;&nbsp;&nbsp;阶段及最终预期研究成果</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#f2f2f2" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<%=moment1%></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2"><font color="#000099">&nbsp;&nbsp;&nbsp;&nbsp;预期研究成果</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#f2f2f2" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<%=result1%></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2"><font color="#000099">&nbsp;&nbsp;&nbsp;&nbsp;4、经费预算</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#f2f2f2" colspan="2"> 
                          <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
                            <tr> 
                              <td align="center" width="60%"><font size="2" color="#000099">支出项目</font></td>
                              <td align="center"><font size="2" color="#000099">支出金额（万元）</font></td>
                            </tr>
                            <%
						     while(rs2.next()){ String outItem=rs2.getString("outItem");
                                               String money=rs2.getString("sMoney");
						    %>
                            <tr> 
                              <td>&nbsp;<%=outItem%></td>
                              <td>&nbsp;<%=money%></td>
                            </tr>
                            <%
						     }
						    %>
                            <tr> 
                              <td width="60%">&nbsp;<font color="#000099">合计：</font></td>
                              <td>&nbsp;<%=sum%></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2"><font color="#000099">&nbsp;&nbsp;&nbsp;&nbsp;5、本课题前期研究成果，主要的外文参考文献和参考资料。</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#f2f2f2" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<%=reference1%></td>
                      </tr>
                      <tr> 
                        <td colspan="2">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2"><font color="#000099">二、应用推广或市场分析</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#f2f2f2" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<%=market1%></td>
                      </tr>
                      <tr> 
                        <td colspan="2">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2"><font color="#000099">三、项目组成员</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#f2f2f2" colspan="2">&nbsp; </td>
                      </tr>
                      <tr> 
                        <td colspan="2">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2"><font color="#000099">四、推荐单位意见</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#f2f2f2" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<%=commend_mind1%></td>
                      </tr>
                      <tr> 
                        <td colspan="2">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2"><font color="#000099">五、专家评审委员会意见</font></td>
                      </tr>
                      <% int i=0;
					  while(pRs.next())
					  { String item_name=pRs.getString("item_name");
					    String identityID=pRs.getString("identityID");
					    String score=pRs.getString("score6");
					    String mind=pRs.getString("mind");
						String expert_mind=pRs.getString("expert_mind");
						String expertMind="：评分"+score+"分，建议"+mind+"此项目，意见："+expert_mind;
						%>
                      <tr> 
                        <td bgcolor="#f2f2f2" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<%=expert[i]%><%=expertMind%></td>
                      </tr>
                      <% i++; } %>
                      <tr> 
                        <td colspan="2">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2"><font color="#000099">六、审批意见</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#f2f2f2" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<%=leading_mind1%></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" width="50%" align="right"><a href="s_changeItem.jsp?itemID=<%=itemID%>"><img src="../images/change.gif" width="62" height="22" border="0"></a>&nbsp; 
                        </td>
                        <td bgcolor="#d9d8dc" colspan="2"> 
                          &nbsp;<input onClick=javascript:window.close(); type=image src="../images/close.gif" width="62" height="22" name="image">
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
</div>
</body>
</html>