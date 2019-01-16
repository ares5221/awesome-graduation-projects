<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>

<%
    String z_Loginmessage=(String)session.getValue("z_loginSign");
    String adminID=(String)session.getValue("adminID");    
    if(z_Loginmessage!="OK")
    {
	response.sendRedirect("index4.jsp");
    }
%>
<jsp:useBean id="z_itemSetup" scope="page" class="firm.firm"/>
<%
    String sql="select * from I_itemSetup";
    ResultSet rs=z_itemSetup.executeQuery(sql);
    String s_beginDate="";
    String s_finishDate="";
    String p_beginDate="";
    String p_finishDate="";
    String s_beginYear="";
    String s_beginMonth="";
    String s_beginDay="";
    String s_finishYear="";
    String s_finishMonth="";
    String s_finishDay="";
    String p_beginYear="";
    String p_beginMonth="";
    String p_beginDay="";
    String p_finishYear="";
    String p_finishMonth="";
    String p_finishDay="";
    if(rs.next())
    {
	s_beginDate=rs.getString("s_beginDate");
	s_finishDate=rs.getString("s_finishDate");
	p_beginDate=rs.getString("p_beginDate");
	p_finishDate=rs.getString("p_finishDate");
    }

   if(s_beginDate.length()!=0)
     {
	 s_beginYear=s_beginDate.substring(0,4);
	 s_beginMonth=s_beginDate.substring(5,7);
	 s_beginDay=s_beginDate.substring(8,10);
     }
   if(s_finishDate.length()!=0)
     {
	 s_finishYear=s_finishDate.substring(0,4);
	 s_finishMonth=s_finishDate.substring(5,7);
	 s_finishDay=s_finishDate.substring(8,10);
     }
   if(p_beginDate.length()!=0)
     {
	 p_beginYear=p_beginDate.substring(0,4);
	 p_beginMonth=p_beginDate.substring(5,7);
	 p_beginDay=p_beginDate.substring(8,10);
     }
  if(p_beginDate.length()!=0)
    {
	 p_finishYear=p_finishDate.substring(0,4);
	 p_finishMonth=p_finishDate.substring(5,7);
	 p_finishDay=p_finishDate.substring(8,10);
    }
%>

<html>
<head>
<title>项目设置</title>
<script language=JavaScript>
<!--
function disConfirm(){
    return confirm("确认要现在开始分配专家吗？ 如果之前您已分配过，将重新分配！");
}
function isValidDate( year, month, day )
{
   year  = parseInt(year,10);
   month = parseInt(month,10);
   day   = parseInt(day,10);

   if ( month==4 || month==6 || month==9 || month==11 )
   { if ( day < 1 || day > 30 )
     {// alert( "日期在1 - 30之间" );
       return (false);
     }
   }
   else
   { if ( month!=2 )
     { if ( day < 1 || day > 31 )
       {//  alert( "日期在1 - 31之间" );
          return (false);
       }
     }
     else
     { // month == 2
       if ( ( year % 100 ) != 0 && (year % 4 == 0) || ( year % 100 ) == 0 && ( year % 400) == 0 )
       { if ( day > 29 )
         {//  alert( "日期在1 - 29之间" );
            return (false);
         }
       }
       else
       { if ( day > 28 )
         {// alert( "日期在1 - 28之间" );
           return (false);
         }
       }
     }
   }
 return (true);
}
function checktheform()
{
    var f1=document.form1;
	if ( ! isValidDate(f1.s_beginYear.value, f1.s_beginMonth.value, f1.s_beginDay.value ))
	{
		window.alert("项目申报起始日期不合法。");
		f1.s_beginYear.focus();
		return false;
	}
	if ( ! isValidDate(f1.s_finishYear.value, f1.s_finishMonth.value, f1.s_finishDay.value ))
	{
		window.alert("项目申报终止日期不合法。");
		f1.s_finishYear.focus();
		return false;
	}
	if ( ! isValidDate(f1.p_beginYear.value, f1.p_beginMonth.value, f1.p_beginDay.value ))
	{
		window.alert("项目评审起始日期不合法。");
		f1.p_beginYear.focus();
		return false;
	}
	if ( ! isValidDate(f1.p_finishYear.value, f1.p_finishMonth.value, f1.p_finishDay.value ))
	{
		window.alert("项目评审终止日期不合法。");
		f1.p_finishYear.focus();
		return false;
	}
}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<div align="center">
  <table border="0" cellspacing="0" cellpadding="0" width="600">
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
              <div align="center"><img src="../images/z_itemSetup.gif" width="112" height="22"></div>
            </td>
              
            <td width="33%">&nbsp;</td>
            </tr>
          </table>
          
        <table width="600" border="0" cellspacing="1" cellpadding="0">
          <tr>
              
            <td height="179" bgcolor="#FFFFFF"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="5">&nbsp;</td>
                </tr>
              </table>
              <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
                <tr>
                  <td>
				  <form name=form1 method=post action="z_checkSetup.jsp" onsubmit="return checktheform(this)">
                      <table width="95%" border="0" cellspacing="1" cellpadding="1" align="center">
                        <tr> 
                          <td colspan="3" bgcolor="#d9d8dc">&nbsp;</td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" width="30%" align="center"> <font color="#000099">设定项目申报时间</font></td>
                          <td colspan="2"> 
                            <p> 
                              <input maxlength=4 name=s_beginYear size=4 value=<%=s_beginYear%>>
                              <font color="#000099">年</font> 
                              <select name=s_beginMonth>
                                <option value=<%=s_beginMonth%> selected><%=s_beginMonth%></option>
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
                              <font color="#000099">月</font> 
                              <select name=s_beginDay>
                                <option value=<%=s_beginDay%> selected><%=s_beginDay%></option>
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
                              <font color="#000099">日 </font><font color="#000099">开始</font><br>
                              <input maxlength=4 name=s_finishYear size=4 value=<%=s_finishYear%>>
                              <font color="#000099">年</font> 
                              <select name=s_finishMonth>
                                <option value=<%=s_finishMonth%> selected><%=s_finishMonth%></option>
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
                              <font color="#000099">月</font> 
                              <select name=s_finishDay>
                                <option value=<%=s_finishDay%> selected><%=s_finishDay%></option>
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
                              <font color="#000099">日</font> <font color="#000099">终止</font></p>
                          </td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center"><font color="#000099">设定项目评审时间</font></td>
                          <td colspan="2"> 
                            <input maxlength=4 name=p_beginYear size=4 value=<%=p_beginYear%>>
                            <font color="#000099">年</font> 
                            <select name=p_beginMonth>
                              <option value=<%=p_beginMonth%> selected><%=p_beginMonth%></option>
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
                            <font color="#000099">月</font> 
                            <select name=p_beginDay>
                              <option value=<%=p_beginDay%> selected><%=p_beginDay%></option>
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
                            <font color="#000099">日</font><font color="#000099"> 
                            开始</font><br>
                            <input maxlength=4 name=p_finishYear size=4 value=<%=p_finishYear%>>
                            <font color="#000099">年</font> 
                            <select name=p_finishMonth>
                              <option value=<%=p_finishMonth%> selected><%=p_finishMonth%></option>
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
                            <font color="#000099">月</font> 
                            <select name=p_finishDay>
                              <option value=<%=p_finishDay%> selected><%=p_finishDay%></option>
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
                            <font color="#000099">日 </font><font color="#000099">终止</font></td>
                        </tr>
                        <tr> 
                          <td bgcolor="#d9d8dc" align="center" colspan="3">&nbsp; </td>
                        </tr>
                        <tr bgcolor="#d9d8dc" align="center"> 
                          <td colspan="3"> 
                            <input type=image src="../images/refer.gif" width="62" height="22" name="refer">
                           </td>
                        </tr>
                      </table>
				  </form>
                    <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
                      <tr> 
                        <td colspan="2">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="right" bgcolor="#d9d8dc" width="50%"><a href="z_distribute.jsp" onClick="return disConfirm()"><img src="../images/z_distribute.gif" width="80" height="22" border="0"></a> &nbsp;</td>
                        <td bgcolor="#d9d8dc">
                           &nbsp;<input onClick=javascript:window.close(); type=image src="../images/shutdown.gif" width="80" height="22" name="image">
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" colspan="2">&nbsp;</td>
                      </tr>
                    </table>
              
                  </td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td></td>
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
