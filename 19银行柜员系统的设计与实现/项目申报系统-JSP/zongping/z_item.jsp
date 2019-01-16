<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>

<%
    String z_Loginmessage=(String)session.getValue("z_loginSign");
    String adminID=(String)session.getValue("adminID");    
    if(z_Loginmessage!="OK")
    {
	response.sendRedirect("index4.jsp");
    }
%>
<jsp:useBean id="z_item" scope="page" class="firm.firm"/>
<%    	
    String sort=request.getParameter("SubSort");
	String subSort1=sort.substring(0,2);
	String subSort2=sort.substring(2,4);
	String str="";
	String sql="";
        String sql1="";
	if(sort.compareTo("0000")==0){
	    sql="select * from I_s_item as x order by (select avg(score6) from I_distribute as y where y.itemID=x.itemID) desc";
            sql1="select count(*)as cnt from I_s_item";
        str="全部";
	}
	else if(subSort2.compareTo("00")==0){
	    sql="select * from I_s_item as x where sort1 like '"+subSort1+"__"+"' or sort2 like '"+subSort1+"__"+"' order by (select avg(score6) from I_distribute as y where y.itemID=x.itemID) desc";
            sql1="select count(*)as cnt from I_s_item where sort1 like '"+subSort1+"__"+"' or sort2 like '"+subSort1+"__"+"'";
        str="总类";
	}
	else{
	    sql="select * from I_s_item as x where sort1='"+sort+"' or sort2='"+sort+"' order by (select avg(score6) from I_distribute as y where y.itemID=x.itemID) desc";
            sql1="select count(*)as cnt from I_s_item where sort1='"+sort+"' or sort2='"+sort+"'";
	    str="分类";
	}
	ResultSet rs=z_item.executeQuery(sql);

    int pageLine=20;
    int totalRec=0;
    int intPage=1;
    int i;
    if (request.getParameter("page")!=null)
    intPage=Integer.parseInt(request.getParameter("page"));
    try{
        ResultSet countrs=z_item.executeQuery(sql1);
        if(countrs.next())
            totalRec=countrs.getInt("cnt");
        countrs.close();
        z_item.closeStmt();
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
<table border="0" cellspacing="0" cellpadding="0" align="center" width="600">
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
            <div align="center"><img src="../images/z_zongping.gif" width="112" height="22"></div>
          </td>
          <td width="33%">&nbsp;</td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="1" cellpadding="0">
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
                      <td><img src="../images/z_list1.gif" width="140" height="23" usemap="#Map" border="0"></td>
                    </tr>
                    <tr> 
                      <td> 
                        <form name=theform method=post action="z_item.jsp">
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
                              <td bgcolor="#d9d8dc" align="center" width="25%"><font color="#000099">选择项目类别</font></td>
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
                              <td bgcolor="#d9d8dc" align="center" colspan="2">&nbsp; 
                              </td>
                            </tr>
                            <tr bgcolor="#d9d8dc" align="center"> 
                              <td colspan="2"> 
                                <input type=image src="../images/refer.gif" width="62" height="22" name="refer">
                              </td>
                            </tr>
                          </table>
                        </form>
                      </td>
                    </tr>
                    <tr> 
                      <td> <font size="2" color="#000099">&nbsp;&nbsp;按*&nbsp;<script language="javascript">showSort(OptSort,"<%=sort%>");</script>*<%=str%>查询</font><br>
                        <table width="100%" border="1" bordercolor="#CCCCCC" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td width="40%" height="17" bgcolor="#d9d8dc"><font size="2" color="#000099">项目名称</font></td>
                            <td width="38%" height="17" bgcolor="#d9d8dc"><font size="2" color="#000099">申报单位</font></td>
                            <td width="12%" height="17" bgcolor="#d9d8dc"><font size="2" color="#000099">申请者</font></td>
                            <td height="17" colspan="2" bgcolor="#d9d8dc"><font size="2" color="#000099">平均分</font></td>
                          </tr>
                          <%
						         String savg="";
                                                     if (intPageCount>0)
                                                     {
                                                         for(i=1;i<=(intPage-1)*pageLine;i++)
                                                             rs.next();
                                                         for(i=1;i<=pageLine;i++){
                                                             if(rs.next()){ String itemID=rs.getString("itemID");
							                                                String unit_ID=rs.getString("unit_ID");
                                                                            String item_name=rs.getString("item_name");
																			
								 String sql3="select avg(score6) as savg from I_distribute where itemID='"+itemID+"' and score6>0";
								 ResultSet rs3=z_item.executeQuery(sql3);
								 if(rs3.next())
								 {
									  savg=rs3.getString("savg");
									  if(savg==null){ savg="&nbsp;";}
									  else { savg=savg.substring(0,4);}
								 }
								       String applicant=rs.getString("applicant");
								       String fill_date=(rs.getString("fill_date")).substring(0,10);
									   String unit_name="";
									   String sql2="select unit_name from I_s_info where unit_ID='"+unit_ID+"'";
									   ResultSet rs2=z_item.executeQuery(sql2);
									   if(rs2.next())
									   {unit_name=rs2.getString("unit_name");}
						  %>
                          <tr> 
                            <td><font size="2" color="#000099"><a href="z_showItem.jsp?itemID=<%=itemID%>"><%=item_name%></a></font></td>
                            <td><font size="2" color="#000099"><%=unit_name%></font></td>
                            <td><font size="2" color="#000099"><%=applicant%></font></td>
                            <td><font size="2" color="#000099"><%=savg%></font></td>
                          </tr>
                          <%
                                                             }
                                                         }
						     }
						  %>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td bgcolor="#d9d8dc">&nbsp;</td>
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
                            out.print("<form method='post' name=fPageNum action='z_item.jsp?SubSort="+sort+"'>");
                            out.print("<p align='left'><font color='#000099'> 分页</font>&nbsp;");
                            if(intPage<2)
                                out.print("<font color='#000099'>首页 上一页 </font>");
                            else{
                                out.print("<a href='z_item.jsp?page=1&&SubSort="+sort+"'><font color='#000099'>首页</font></a>&nbsp;");
                                out.print("<a href='z_item.jsp?page="+(intPage-1)+"&&SubSort="+sort+"'><font color='#000099'>上一页</font></a>&nbsp;");
                            }
                            if(intPage-intPageCount>=0)
                                out.print("<font color='#000099'> 下一页 尾页</font>");
                            else{
                                out.print("<a href='z_item.jsp?page="+(intPage+1)+"&&SubSort="+sort+"'><font color='#000099'>下一页</font></a>&nbsp;<a href='z_item.jsp?page="+intPageCount+"&&SubSort="+sort+"'><font color='#000099'>尾页</font></a>");
                            }
                            out.print("&nbsp;<font color='#000099'>页次</font>：<strong><font color='#000099'>"+intPage+"/"+intPageCount+"</font></strong><font color='#000099'>页</font>");
                            out.print("&nbsp;<font color='#000099'>共</font><b><font color='#000099'>"+totalRec+"</font></b><font color='#000099'>个项目</font><b><font color='#000099'>"+pageLine+"</font></b><font color='#000099'>条/页</font>");
                            out.print("<font color='#000099'>转到第</font><input type='text' name='page' size=2 maxlength=10  class=smallInput value="+intPage+">");
                            out.print("<font color='#000099'>页</font><input class=buttonface type='submit' value='GO' name='cndok'></span></p></form>");
                            out.print("</td>");
                            out.print("</tr>");
                         %>
                          <tr align="center"> 
                            <td bgcolor="#d9d8dc" colspan="3"><input onClick=javascript:window.print(); type=image src="../images/print.gif" width="62" height="22">
<INPUT onclick=javascript:window.close(); type=image src="../images/close.gif" width="62" height="22"></td>
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
<map name="Map">
  <area shape="rect" coords="71,1,139,22" href="z_sortItem.jsp?SubSort=0000">
</map>
</body>
</html>
