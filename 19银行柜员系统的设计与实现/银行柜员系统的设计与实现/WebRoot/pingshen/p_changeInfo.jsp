<%@ page language="java" import="java.sql.*"contentType="text/html;charset=GB2312"%>

<%
    String getLoginmessage=(String)session.getValue("p_loginSign");
    String identityID=(String)session.getValue("identityID");    
    if(getLoginmessage!="OK")
    {
        response.sendRedirect("index3.jsp");
    }
%>
<jsp:useBean id="p_showinfo" scope="page" class="firm.firm"/>
<%
    String itemID=request.getParameter("itemID");  
    String sql="select * from I_p_info where identityID='"+identityID+"'";
    ResultSet rs=p_showinfo.executeQuery(sql);
	//定义数据类型并初始化
	String expert_name1="";         //专家姓名
	String identityID1="";          //身份证号
	String sex1="";                 //性别
	String nation1="";              //民族
	String bir_date1="";            //生日
	String unit_ID1="";
	String unit_name1="";           //所在单位
	String grade1="";               //职称
	String domain1="";              //研究领域
    String sort1="";                    //适评专业
    String sort2="";                    //适评专业
    String email1="";                   //E-mail
    String address1="";                 //住址
    String zipcode1="";                 //邮编
    String tel1="";                     //电话
    String introduction1="";            //介绍
	String bir_year="";
	String bir_month="";
	String bir_day="";	
    if(rs.next())
	{
		identityID1=rs.getString("identityID");
	        expert_name1=rs.getString("expert_name");
		sex1=rs.getString("sex");
		//nation1=rs.getString("nation");
		bir_date1=rs.getString("bir_date");
		unit_ID1=rs.getString("unit_ID");
		unit_name1=rs.getString("unit_name");
		grade1=rs.getString("grade");
		domain1=rs.getString("domain");
		sort1=rs.getString("sort1");
		sort2=rs.getString("sort2");
		email1=rs.getString("email");
		address1=rs.getString("address");
		zipcode1=rs.getString("zipcode");
		tel1=rs.getString("tel");
		introduction1=rs.getString("introduction");
		nation1=rs.getString("na");
	rs.close();
        p_showinfo.closeStmt();
        p_showinfo.closeConn();
	}
	if(bir_date1.length()!=0)
	{
	 bir_year=bir_date1.substring(0,4);
	 bir_month=bir_date1.substring(5,7);
	 bir_day=bir_date1.substring(8,10);	
	}
%>

<html>
<head>
<title>修改信息</title>
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
			if(val.substr(0,2)==mainVal && (IsAll || !IsAll && (val.substr(val.length-2) != "00")))
			{
					s2.options[s2.length]=new Option(name,val,false,false);
			}
		}
	}
}

function GetObjID(ObjName)
{
	var args=GetObjID.arguments;
	var f1=(args.length>1)?args[1]:document.theform;
	for ( var ObjID=0; ObjID < f1.elements.length; ObjID++ )
      if (f1.elements[ObjID].name == ObjName )
      {  return(ObjID);
         break;
      }
  return(-1);
}

function GetLocation(ObjID, Value)
{
	var args=GetLocation.arguments;
	var f1=(args.length>2)?args[2]:document.theform;
	total=f1.elements[ObjID].length;
  for (pp=0; pp<total; pp++)
      if (f1.elements[ObjID].options[pp].text == "---"+Value+"---")
      {  return (pp);
         break;
      }
  return (-1);
}

function AddItem(ObjName, DesName, CatName)
{
	var args=AddItem.arguments;
	var f1=(args.length>3)?args[3]:document.theform;

  //GET OBJECT ID AND DESTINATION OBJECT
  ObjID    = GetObjID(ObjName,f1);
  DesObjID = GetObjID(DesName,f1);
  CatObjID = GetObjID(CatName,f1);

  if ( ObjID != -1 && DesObjID != -1 && CatObjID != -1 )
  {   hasNum = overalert(DesObjID,f1);
      if (hasNum == 2)
	  {
		window.alert("最多选两项。");
	  }
       
      else
      {  //GET SELECTED ITEM NUMBER
         SelNum = 0;
         for (var j=0; j<f1.elements[ObjID].length; j++)
         {   if ( f1.elements[ObjID].options[j].selected)
             SelNum ++;
         }
         if ((SelNum + hasNum) > 2)
		 {
			window.alert("最多选两项。");
		 }
         else
         {  jj       = f1.elements[CatObjID].selectedIndex;
            CatValue = f1.elements[CatObjID].options[jj].text;
            CatCode  = f1.elements[CatObjID].options[jj].value;
            i        = f1.elements[ObjID].options.length;
            j        = f1.elements[DesObjID].options.length;
            for (h=0; h<i; h++)
            {   if (f1.elements[ObjID].options[h].selected )
                {  Code = f1.elements[ObjID].options[h].value;
                   Text = f1.elements[ObjID].options[h].text;
                   j    = f1.elements[DesObjID].options.length;

                   HasSelected = false;
                   for (k=0; k<j; k++ )
                   if (f1.elements[DesObjID].options[k].value == Code)
                   {  HasSelected = true;
                      break;
                   }
                   if (HasSelected == false)
                   {  Location = GetLocation(DesObjID, CatValue,f1);
                      if (Location == -1 )
                      {  //f1.elements[DesObjID].options[j] =  new Option("---"+CatValue+"---",CatCode);
                         //f1.elements[DesObjID].options[j+1] = new Option(Text, Code);
                         f1.elements[DesObjID].options[j] = new Option(Text, Code);
                      }
                      else
                      {  InsertItem(DesObjID, Location+1,f1);
                         f1.elements[DesObjID].options[Location+1] = new Option(Text, Code);
                      }
                   }
                   else
				   {
						window.alert("此项已选择。");
					}
                }
            }
         }//else
      }//else
      //CLEAR SELECTION
      for (i=0; i<f1.elements[ObjID].length; i++)
          f1.elements[ObjID].options[i].selected = false;
      for (i=0; i<f1.elements[DesObjID].length; i++)
          f1.elements[DesObjID].options[i].selected = true;

  }//if
}//end of function

function overalert(ID)
{
	var args=overalert.arguments;
	var f1=(args.length>1)?args[1]:document.theform;
	var over  = 0;
	thelength = f1.elements[ID].length;
	for (m=0; m<thelength; m++)
	{   thevalue = f1.elements[DesObjID].options[m].value
      thevalue = thevalue.substring(2)
      if (thevalue!="00")
         over=over+1;
	}
  return(over);
}
//end

//MODIFIED BY DAVID AND CLOUD
function DeleteItem(ObjName)
{
	var args=DeleteItem.arguments;
	var f1=(args.length>1)?args[1]:document.theform;
	ObjID = GetObjID(ObjName,f1);
  if ( ObjID != -1 )
  {  var  check_index = new Array();
     for (i=f1.elements[ObjID].length-1; i>=0; i--)
     {   if (f1.elements[ObjID].options[i].selected)
         {  check_index[i] = true;
            f1.elements[ObjID].options[i].selected = false;
         }
         else
            check_index[i] = false;
     }
     for (i=f1.elements[ObjID].length-1; i>=0; i--)
     {   if (check_index[i])
         {  info = f1.elements[ObjID].options[i].value;
            if (!(info.substring(2)=="00")) f1.elements[ObjID].options[i] = null
         }
     }
     var b=0
     var indexarr = new Array()
     for (i=0;i<f1.elements[ObjID].length;i++)
     {   value1 = f1.elements[ObjID].options[i].value
         if (value1.substring(2)=="00"){
           if (f1.elements[ObjID].length==i+1)
              f1.elements[ObjID].options[i]=null
           else
           {  value2 = f1.elements[ObjID].options[i+1].value
              if (value2.substring(2)=="00"){
              indexarr[b]=i
              b++
           }
     }
        }
    }
    for (var c=0;c<b;c++){
             f1.elements[ObjID].options[indexarr[c]-c]=null
         }
  }
}

//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<div align="center"> 
  <table border="0" cellspacing="0" cellpadding="0">
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
              <div align="center"><img src="../images/p_expertinfo.gif" width="112" height="22"></div>
            </td>
            <td width="33%">&nbsp;</td>
          </tr>
        </table>
        <table width="600" border="0" cellspacing="1" cellpadding="0" height="120">
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
				   <form name=theform method=post action="p_checkInfo.jsp" >
                      <table width="95%" border="0" cellspacing="1" cellpadding="1" align="center">
                        <tr> 
                          <td colspan="4" bgcolor="#d9d8dc">&nbsp;</td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" width="25%" align="center"> <font color="#000099">专家姓名</font></td>
                          <td width="75%" colspan="3"> 
                            <input maxlength=10 name=expert_name size=10 value='<%=expert_name1%>'>
</td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center"><font color="#000099">身份证号</font></td>
                          <td bgcolor="#f2f2f2" colspan="3"> 
                            <font color="#000099"><%=identityID1%></font>
                          </td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center"><font color="#000099">性&nbsp;&nbsp;&nbsp;&nbsp;别</font></td>
                          <td colspan="3"> 
                            <input maxlength=4 name=sex size=4 value='<%=sex1%>'>
                          </td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center"><font color="#000099">民&nbsp;&nbsp;&nbsp;&nbsp;族</font></td>
                          <td bgcolor="#f2f2f2" colspan="3"> 
                            <input maxlength=10 name=nation size=10 value='<%=nation1%>'>
                          </td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center"> <font color="#000099">出生日期</font></td>
                          <td colspan="3"><font color="#000099"> 
                            <input maxlength=4 name=bir_year size=4 value='<%=bir_year%>'>
                            年 
                            <select name=bir_month>
                              <option value=<%=bir_month%> selected><%=bir_month%></option>
                              <option value=01>01</option>
                              <option 
                    value=02>02</option>
                              <option value=03>03</option>
                              <option 
                    value=04>04</option>
                              <option value=05>05</option>
                              <option 
                    value=06>06</option>
                              <option value=07>07</option>
                              <option 
                    value=08>08</option>
                              <option value=09>09</option>
                              <option 
                    value=10>10</option>
                              <option value=11>11</option>
                              <option 
                    value=12>12</option>
                            </select>
                            月 
                            <select name=bir_day>
                              <option 
                    value=<%=bir_day%> selected><%=bir_day%></option>
                              <option 
                    value=01>01</option>
                              <option value=02>02</option>
                              <option 
                    value=03>03</option>
                              <option value=04>04</option>
                              <option 
                    value=05>05</option>
                              <option value=06>06</option>
                              <option 
                    value=07>07</option>
                              <option value=08>08</option>
                              <option 
                    value=09>09</option>
                              <option value=10>10</option>
                              <option 
                    value=11>11</option>
                              <option value=12>12</option>
                              <option 
                    value=13>13</option>
                              <option value=14>14</option>
                              <option 
                    value=15>15</option>
                              <option value=16>16</option>
                              <option 
                    value=17>17</option>
                              <option value=18>18</option>
                              <option 
                    value=19>19</option>
                              <option value=20>20</option>
                              <option 
                    value=21>21</option>
                              <option value=22>22</option>
                              <option 
                    value=23>23</option>
                              <option value=24>24</option>
                              <option 
                    value=25>25</option>
                              <option value=26>26</option>
                              <option 
                    value=27>27</option>
                              <option value=28>28</option>
                              <option 
                    value=29>29</option>
                              <option value=30>30</option>
                              <option 
                    value=31>31</option>
                            </select>
                            日</font></td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center"><font color="#000099">单位代码</font></td>
                          <td colspan="3">
                            <input name=unit_ID size="20" maxlength="20" value="<%=unit_ID1%>">
                          </td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center"><font color="#000099">所在单位</font></td>
                          <td bgcolor="#f2f2f2" colspan="3"> 
                            <input name=unit_name size=60 maxlength="60" value="<%=unit_name1%>">
                          </td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center"><font color="#000099">职&nbsp;&nbsp;&nbsp;&nbsp;称</font></td>
                          <td colspan="3"> 
                            <input name=grade size="20" maxlength="20" value="<%=grade1%>">
                          </td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center"><font color="#000099">研究领域</font></td>
                          <td bgcolor="#f2f2f2" colspan="3"> 
                            <input name=domain size=40 maxlength="40" value="<%=domain1%>">
                          </td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center" rowspan="2"><font color="#000099">适评专业</font></td>
                          <td colspan="3"> 
<select name=Sort 
                  onChange=JavaScript:showSubOpt(OptSort,this,theform.SubSort) 
                  style="WIDTH: 150px">
  <option selected 
                    value="">----请选择----</option>
  <script language=javascript>showMainOpt(OptSort);</script>
</select>                            
<font size="2" color="#000099">（可多选，最多两项） </font> 
                          </td>
                        </tr>
                        <tr> 
                          <td width="25%"> 
                            <select multiple name=SubSort 
                  size=2 style="WIDTH: 150px">
                            </select>
                          </td>
                          <td width="25%" align="center"> 
 
                            <input name=Input onClick="JavaScript:AddItem('SubSort', 'SelectedIndustry[]', 'Sort')" type=button value="添加>>">
                            <br>
                            <input name=Input2 onClick="JavaScript:DeleteItem('SelectedIndustry[]')" type=button value="<<删除">
                          </td>
                          <td width="25%"> 
                            <select multiple 
                  name=SelectedIndustry[] size=2 style="WIDTH: 150px">
                            </select>
                          </td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center"><font color="#000099">E 
                            - mail</font></td>
                          <td bgcolor="#f2f2f2" width="75%" colspan="3"> 
                            <input name=email size="40" maxlength="40" value='<%=email1%>'>
                          </td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center"><font color="#000099">联系地址</font></td>
                          <td colspan="3"> 
                            <input name=address size="50" maxlength="60" value='<%=address1%>'>
                          </td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center"><font color="#000099">邮政编码</font></td>
                          <td bgcolor="#f2f2f2" colspan="3"> 
                            <input name=zipcode size="7" maxlength="6" value='<%=zipcode1%>'>
                          </td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center"><font color="#000099">电&nbsp;&nbsp;&nbsp;&nbsp;话</font></td>
                          <td colspan="3"> 
                            <input name=tel size="40" maxlength="40" value='<%=tel1%>'>
                          </td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center"><font color="#000099">简&nbsp;&nbsp;&nbsp;&nbsp;介</font></td>
                          <td bgcolor="#f2f2f2" colspan="3"> 
                            <textarea name="introduction" cols="60" rows="4"><%=introduction1%></textarea>
                          </td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center" colspan="4">&nbsp;</td>
                        </tr>
                        <tr align="center"> 
                          <td bgcolor="#d9d8dc" colspan="4"> 
                            <input type=image src="../images/refer.gif" width="62" height="22" border="0">
                          </td>
                        </tr>
                      </table>
				   </form>
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
