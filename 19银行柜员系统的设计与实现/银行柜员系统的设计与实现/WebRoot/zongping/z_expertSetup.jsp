<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>

<%
    String z_Loginmessage=(String)session.getValue("z_loginSign");
    String adminID=(String)session.getValue("adminID");    
    if(z_Loginmessage!="OK")
    {
	response.sendRedirect("index4.jsp");
    }
%>
<jsp:useBean class="firm.firm" id="z_expertSetup" scope="page"></jsp:useBean>
<%
    String itemID=request.getParameter("itemID");
    String identityID=new String(request.getParameter("identityID").getBytes("8859_1"));
	
	String item_name="";
	String expert_name="";
	String score="";
	String sql="select * from I_distribute where itemID='"+itemID+"' and identityID='"+identityID+"'";
	ResultSet rs=z_expertSetup.executeQuery(sql);
	if(rs.next())
	{
		expert_name=rs.getString("expert_name");
		score=rs.getString("score6");
	}
	String sql1="select item_name from I_s_item where itemID='"+itemID+"'";
	ResultSet rs1=z_expertSetup.executeQuery(sql1);
	if(rs1.next()){ item_name=rs1.getString("item_name");}
%>
<HTML>
<HEAD>
<TITLE>专家设置</TITLE>
<script language=JavaScript>
function check(form){
    if (form1.expert_name.value=="")
    { 
       alert("请输入专家姓名！");
       form1.expert_name.focus();
       return false; 
     }
    if (form1.identityID1.value=="")
    {
      alert("请输入身份证号！");
      form1.identityID1.focus();
      return false;
     }
	 if (!(parseInt(form1.score.value)>=0 && parseInt(form1.score.value)<=100))
    {
      alert("总分应在0-100之间！");
      form1.score.focus();
      return false;
     }
}
</Script>
</HEAD>
<BODY>
<form name=form1 method=post action="z_checkEs.jsp?itemID=<%=itemID%>&&identityID=<%=identityID%>" onsubmit="return check(this)">
  <table width="400" border="0" cellspacing="0" cellpadding="1" bgcolor="#000099" align="center">
    <tr> 
      <td>
        <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#FFFFFF" align="center">
          <tr> 
            <td bgcolor="#000099" align="center" colspan="2" height="30"><font color="#FFFFFF">专家设置</font></td>
          </tr>
          <tr> 
            <td bgcolor="#CCCCCC">&nbsp;</td>
            <td bgcolor="#CCCCCC">&nbsp;</td>
          </tr>
          <tr> 
            <td align="center" width="50%" bgcolor="#D8D8D8"><font size="2" color="#000099">项目名称</font></td>
            <td width="50%"> <font size="2" color="#000099">
              <input type="hidden" name="item_name" value="<%=item_name%>"><%=item_name%></font>
              </td>
          </tr>
          <tr> 
            <td align="center" bgcolor="#d8d8d8"><font size="2" color="#000099">专家姓名</font></td>
            <td> 
              <input name=expert_name 
                  size=18 type=text value=<%=expert_name%>>
            </td>
          </tr>
          <tr> 
            <td align="center" bgcolor="#d8d8d8"><font size="2" color="#000099">身份证号</font></td>
            <td> 
              <input name=identityID1
                  size=18 type=text value=<%=identityID%>>
            </td>
          </tr>
          <tr> 
            <td align="center" bgcolor="#d8d8d8"><font size="2" color="#000099">总分</font></td>
            <td> 
              <input name=score 
                  size=4 type=text value=<%=score%>>
            </td>
          </tr>
          <tr> 
            <td height="5" colspan="2"></td>
          </tr>
          <tr> 
            <td colspan="2" align="center">
<input type=image src="../images/change.gif" width="62" height="22"></td>
          </tr>
          <tr> 
            <td height="2" colspan="2"></td>
          </tr>
        </table>
      </td>
  </tr>
</table>
  <table width="270" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
      <td width="270" align="center" height="20"><div align="center"><font color="#ff0000">
                            <%
                                String getmessage=(String)session.getValue("z_changeMessage");
                                if(getmessage==null) getmessage="";
                            %>
                            <%=getmessage%>
                        </font></div></td>
    </tr>
  </table>
</form>
</BODY>
</HTML>