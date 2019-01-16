<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>

<%
    String z_Loginmessage=(String)session.getValue("z_loginSign");
    String adminID=(String)session.getValue("adminID");    
    if(z_Loginmessage!="OK")
    {
	response.sendRedirect("index4.jsp");
    }
%>
<jsp:useBean id="z_sortItem" scope="page" class="firm.firm"/>
<%
    String sort=request.getParameter("SubSort");
	String subSort1=sort.substring(0,2);
	String subSort2=sort.substring(2,4);
	String str="";
	String sql="";
        String sql1="";
	if(sort.compareTo("0000")==0){
	    sql="select * from I_s_item as x order by (select sum(score6) from I_distribute as y where y.itemID=x.itemID) desc";
	    sql1="select count(*)as cnt from I_s_item";
        str="全部";
	}
	else if(subSort2.compareTo("00")==0){
	    sql="select * from I_s_item as x where sort1 like '"+subSort1+"__"+"' or sort2 like '"+subSort1+"__"+"' order by (select sum(score6) from I_distribute as y where y.itemID=x.itemID) desc";
	    sql1="select count(*)as cnt from I_s_item where sort1 like '"+subSort1+"__"+"' or sort2 like '"+subSort1+"__"+"'";
        str="总类";
	}
	else{
	    sql="select * from I_s_item as x where sort1='"+sort+"' or sort2='"+sort+"' order by (select sum(score6) from I_distribute as y where y.itemID=x.itemID) desc";
	    sql1="select count(*)as cnt from I_s_item where sort1='"+sort+"' or sort2='"+sort+"'";
	    str="分类";
	}
	ResultSet rs=z_sortItem.executeQuery(sql);

    int pageLine=20;
    int totalRec=0;
    int intPage=1;
    int i;
    if (request.getParameter("page")!=null)
    intPage=Integer.parseInt(request.getParameter("page"));
    try{
        ResultSet countrs=z_sortItem.executeQuery(sql1);
        if(countrs.next())
            totalRec=countrs.getInt("cnt");
        countrs.close();
        z_sortItem.closeStmt();
    }
    catch(Exception e){
        e.printStackTrace();
    }
    int intPageCount=0;
    intPageCount=(totalRec+pageLine-1)/pageLine;
%>

<html>
<head>
<title>项目设置</title>
<style>
<!--
:link {color:#000099}
:visited {color:#000099}
:active {color:#000099}
A:link,A:visited,A:active {text-decoration:none}
//-->
</style>
<SCRIPT language=javascript>
<!--
OptSort = new Array(
    "0100","哲学",
	"0101","哲学",
	"0200","经济学",
	"0201","理论经济学",
	"0202","应用经济学",
	"0300","法学",
	"0301","法学",
	"0302","政治学",
	"0303","社会学",
	"0304","民族学",
	"0400","教育学",
	"0401","教育学",
	"0402","心理学",
	"0403","体育学",
	"0500","文学",
	"0501","中国语言文学",
	"0502","外国语言文学",
	"0503","新闻传播学",
	"0504","艺术学",
	"0600","历史学",
	"0601","历史学",
	"0700","理学",
	"0701","数学",
	"0702","物理学",
	"0703","化学",
	"0704","天文学",
	"0705","地理学",
	"0706","大气科学",
	"0707","海洋科学",
	"0708","地球物理学",
	"0709","地质学",
	"0710","生物学",
	"0711","系统科学",
	"0712","科学技术史",
	"0800","工学",
	"0801","力学",
	"0802","机械工程",
	"0803","光学工程",
	"0804","仪器科学与技术",
	"0805","材料科学与工程",
	"0806","冶金工程",
	"0807","动力工程及工程热物理",
	"0808","电气工程",
	"0809","电子科学与技术",
	"0810","信息与通信工程",
	"0811","控制科学与工程",
	"0812","计算机科学与技术",
	"0813","建筑学",
	"0814","土木工程",
	"0815","水利工程",
	"0816","测绘科学与技术",
	"0817","化学工程与技术",
	"0818","地质资源与地质工程",
	"0819","矿业工程",
	"0820","石油与天然气工程",
	"0900","农学",
	"0901","作物学",
	"0902","园艺学",
	"0903","农业资源利用",
	"0904","植物保护",
	"0905","畜牧学",
	"0906","兽医学",
	"0907","林学",
	"0908","水产",
	"1000","医学",
	"1001","基础医学",
	"1002","临床医学",
	"1003","口腔医学",
	"1004","公共卫生与预防医学",
	"1005","中医学",
	"1006","中西医结合",
	"1007","药学",
	"1008","中药学",
	"1100","军事学",
	"1101","军事",
	"1200","管理学",
	"1201","管理科学与工程",
	"1202","工商管理");
	
function showMainOpt()
{
	var i,start,step,len,a,args=showMainOpt.arguments;
	a = args[0];
	len = a.length;
	start = (args.length>=2)?args[1]:0;
	step = 2;

	for(i=start;i<len;i+=step)
	{
		if(a[i].substr(a[i].length-2) == "00")
			document.writeln("<option value="+a[i]+">"+a[i+1]+"</option>");
	}
}

function showSubOpt()
{
	var i,len,start,step,s1,s2,a,args=showSubOpt.arguments;
	var mainVal,val,name;
	a=args[0];
	s1=args[1];
	s2=args[2];
	start=0;
	step=2;
	IsAll = (args.length>=4)?args[3]:false;
	len=a.length;
	mainVal=s1.options[s1.selectedIndex].value;
	mainVal=mainVal.substr(0,2);

	for(i=s2.length-1;i>=0;i--)
	{
		s2.options[i]=null;
	}

	if(Number(mainVal)!=0)
	{
		for(i=start;i<len;i+=step)
		{
			val = a[i];
			name = a[i+1];
			if(val.substr(0,2)==mainVal)
			{
					if(val.substr(val.length-2) == "00")s2.options[s2.length]=new Option("全部",val,false,false);
					else s2.options[s2.length]=new Option(name,val,false,false);
			}
		}
	}
}
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
//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<div align="center">
  <table border="0" cellspacing="0" cellpadding="0" width="600">
    <tr>
      <td bgcolor="#4f71b8"> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
              <div align="center"><img src="../images/z_itemSetup.gif" width="112" height="22"></div>
            </td>
              
            <td width="33%">&nbsp;</td>
            </tr>
          </table>
          
        <table width="100%" border="0" cellspacing="1" cellpadding="0" height="120">
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
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          
                        <td><font color="#000099">专家分配评审情况表</font></td>
                        </tr>
                      </table>
				  <form name=theform method=post action="z_scoreCheck.jsp">
                      <table width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
                        <tr> 
                          <td colspan="2" bgcolor="#d9d8dc"></td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" colspan="2" align="center"> 
                            <p>&nbsp;</p>
                          </td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center" width="25%"><font color="#000099" size="2">选择项目类别</font></td>
                          <td>
                            <select name=Sort onChange="JavaScript:showSubOpt(OptSort,this,theform.SubSort)" style="WIDTH:200px">
                              <option selected value="0000">---请选择---</option>
                              <script language="javascript">showMainOpt(OptSort);</script>
                            </select>
                            <select name=SubSort style="WIDTH:200px">
                              <option selected value="0000">---请选择---</option>
                            </select>
                          </td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center" colspan="2">&nbsp; </td>
                        </tr>
                        <tr bgcolor="#d9d8dc" align="center"> 
                          <td colspan="2"> 
                            <input type=image src="../images/refer.gif" width="62" height="22" name="refer">
                          </td>
                        </tr>
                      </table>
				  </form>
				    <font size="2" color="#000099">按*&nbsp;<script language="javascript">showSort(OptSort,"<%=sort%>");</script>*<%=str%>查询</font><br>
                    <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#CCCCCC">
                      <tr> 
                        <td width="45%" bgcolor="#d9d8dc"><font size="2" color="#000099">项目名称</font></td>
                        <td width="11%" align="center" bgcolor="#d9d8dc"><font size="2" color="#000099">专家一</font></td>
                        <td width="11%" align="center" bgcolor="#d9d8dc"><font size="2" color="#000099">专家二</font></td>
                        <td width="11%" align="center" bgcolor="#d9d8dc"><font size="2" color="#000099">专家三</font></td>
                        <td width="11%" align="center" bgcolor="#d9d8dc"><font size="2" color="#000099">专家四</font></td>
                        <td align="center" bgcolor="#d9d8dc"><font size="2" color="#000099">专家五</font></td>
                      </tr>
                      <% 
                                                     if (intPageCount>0)
                                                     {
                                                         for(i=1;i<=(intPage-1)*pageLine;i++)
                                                             rs.next();
                                                         for(i=1;i<=pageLine;i++){
                                                             if(rs.next()){
								 String itemID=rs.getString("itemID");
                                 String item_name=rs.getString("item_name");
								 String score[]={"&nbsp;","&nbsp;","&nbsp;","&nbsp;","&nbsp;"};
								 String expertID[]={"","","","",""};
								 String name[]={"未分配","未分配","未分配","未分配","未分配"};
								 int k=0;
								 String sql2="select * from I_distribute where itemID='"+itemID+"'";
								 ResultSet rs2=z_sortItem.executeQuery(sql2);
								 while(rs2.next())
								 {												    
								 	  expertID[k]=rs2.getString("identityID");
									  name[k]=rs2.getString("expert_name");
									  score[k]=rs2.getString("score6");
									  k++;
								 }
								 String color0="";
								 String color1="";
								 String color2="";
								 String color3="";
								 String color4="";
								     if(score[0].compareTo("0")==0||name[0].compareTo("未分配")==0)
									 { color0="#ff0000";}
									 else { color0="#000099";}
								     if(score[1].compareTo("0")==0||name[1].compareTo("未分配")==0)
									 { color1="#ff0000";}
									 else { color1="#000099";}
								     if(score[2].compareTo("0")==0||name[2].compareTo("未分配")==0)
									 { color2="#ff0000";}
									 else { color2="#000099";}
								     if(score[3].compareTo("0")==0||name[3].compareTo("未分配")==0)
									 { color3="#ff0000";}
									 else { color3="#000099";}
								     if(score[4].compareTo("0")==0||name[4].compareTo("未分配")==0)
									 { color4="#ff0000";}
									 else { color4="#000099";}
						  %>
                      <tr> 
                        <td><font size="2" color="#000099"><a href="z_showItem.jsp?itemID=<%=itemID%>" target="_blank"><%=item_name%></a>&nbsp;</font></td>
                        <td align="center"><font size="2" color="<%=color0%>"><a href="z_expertSetup.jsp?itemID=<%=itemID%>&&identityID=<%=expertID[0]%>" target="_blank"><%=name[0]%></a>&nbsp;<%=score[0]%></font></td>
                        <td align="center"><font size="2" color="<%=color1%>"><a href="z_expertSetup.jsp?itemID=<%=itemID%>&&identityID=<%=expertID[1]%>" target="_blank"><%=name[1]%></a>&nbsp;<%=score[1]%></font></td>
                        <td align="center"><font size="2" color="<%=color2%>"><a href="z_expertSetup.jsp?itemID=<%=itemID%>&&identityID=<%=expertID[2]%>" target="_blank"><%=name[2]%></a>&nbsp;<%=score[2]%></font></td>
                        <td align="center"><font size="2" color="<%=color3%>"><a href="z_expertSetup.jsp?itemID=<%=itemID%>&&identityID=<%=expertID[3]%>" target="_blank"><%=name[3]%></a>&nbsp;<%=score[3]%></font></td>
                        <td align="center"><font size="2" color="<%=color4%>"><a href="z_expertSetup.jsp?itemID=<%=itemID%>&&identityID=<%=expertID[4]%>" target="_blank"><%=name[4]%></a>&nbsp;<%=score[4]%></font></td>
                      </tr>
                      <%
                                                             }
                                                         }
						     }
					  %>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">                      
                      <tr bgcolor="#d9d8dc"> 
                        <td colspan="3" bgcolor="#d9d8dc">&nbsp;</td>
                      </tr>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                        <%
                            out.print("<tr>");
                            if(intPageCount*pageLine<totalRec)
                                intPageCount++;
                            if(intPage>intPageCount)
                                intPage=intPageCount;
                            if(intPage<1)
                                intPage=1;
                            out.print("<form method='post' name=fPageNum action='z_scoreCheck.jsp?SubSort="+sort+"'>");
                            out.print("<p align='left'><font color='#000099'> 分页</font>&nbsp;");
                            if(intPage<2)
                                out.print("<font color='#000099'>首页 上一页 </font>");
                            else{
                                out.print("<a href='z_scoreCheck.jsp?page=1&&SubSort="+sort+"'><font color='#000099'>首页</font></a>&nbsp;");
                                out.print("<a href='z_scoreCheck.jsp?page="+(intPage-1)+"&&SubSort="+sort+"'><font color='#000099'>上一页</font></a>&nbsp;");
                            }
                            if(intPage-intPageCount>=0)
                                out.print("<font color='#000099'> 下一页 尾页</font>");
                            else{
                                out.print("<a href='z_scoreCheck.jsp?page="+(intPage+1)+"&&SubSort="+sort+"'><font color='#000099'>下一页</font></a>&nbsp;<a href='z_scoreCheck.jsp?page="+intPageCount+"&&SubSort="+sort+"'><font color='#000099'>尾页</font></a>");
                            }
                            out.print("&nbsp;<font color='#000099'>页次</font>：<strong><font color='#000099'>"+intPage+"/"+intPageCount+"</font></strong><font color='#000099'>页</font>");
                            out.print("&nbsp;<font color='#000099'>共</font><b><font color='#000099'>"+totalRec+"</font></b><font color='#000099'>个项目</font><b><font color='#000099'>"+pageLine+"</font></b><font color='#000099'>条/页</font>");
                            out.print("<font color='#000099'>转到第</font><input type='text' name='page' size=2 maxlength=10  class=smallInput value="+intPage+">");
                            out.print("<font color='#000099'>页</font><input class=buttonface type='submit' value='GO' name='cndok'></span></p></form>");
                            out.print("</td>");
                            out.print("</tr>");
                         %>
                      <tr align="center"> 
                        <td bgcolor="#d9d8dc" colspan="3"><INPUT onclick=javascript:window.close(); type=image src="../images/close.gif" width="62" height="22"></td>
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
