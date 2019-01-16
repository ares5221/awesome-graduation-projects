<%
did=request("did")
IF did=Empty Then
%>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="335" valign="top">
		  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <%

			'type_Class=GetSafeStr(Request("type_Class"))
			IF type_Class=Empty Then
			   type_Class=Small_Class_ID
			End IF
			if type_Class="" then
			SQL="select * from News order by N_X Desc"
			else
			SQL="select * from News Where Small_Class="&type_Class&" order by N_X Desc"
			end if
			set Rsn=Server.CreateObject("Adodb.Recordset")
			Rsn.open SQL,Conn,1,1
			dim strFileName,MaxPerPage
			strField=trim(request("Field"))
			if request("page")<>"" then
			currentPage=cint(request("page"))
			else
			currentPage=1
			end if
			ShowSmallClassType=ShowSmallClassType_Default
			MaxPerPage=20
			strFileName="index.asp?type_Class="&type_Class&"&"
			totalput=Rsn.Recordcount
			IF Not Rsn.Eof then
			IF currentPage<>1 then
			Rsn.Move MaxPerPage*(currentPage-1)
			End if
			for T=1 to MaxPerPage
		   %>
			<tr>
              <td width="81%" height="30" align="left" valign="middle" background="../images/news_bg.jpg" class="td" style="padding-left:20px; "><img src="../images/news_1.jpg">&nbsp;&nbsp; <a href="?did=<%=Rsn("id")%>&type_Name=<%=type_Name%>">
              <%Tw(Rsn("N_title"))%></a></td>
              <td width="19%" align="right" valign="middle" background="../images/news_bg1.jpg" class="td"><div align="left">[
                <%Tw(Rsn("N_Time"))%>
              ]</div></td>
			</tr>
			<%
		  	Rsn.MoveNext
			IF Rsn.Eof then exit for 
			Next
			End if
			twclose(Rsn)
		    %>
          </table>
		  </td>
        </tr>
		<% If currentPage>1 Then %>
        <tr>
          <td height="50" align="right" style="padding-right:20px;"><%call showpage(strFileName,totalput,MaxPerPage,true,true,"条")%></td>
        </tr>
		<% End If %>
      </table>
		<% 
		Else
		set rsContent=conn.execute("select ID,N_Content,N_title,N_Time,N_Hits from News where ID="&did&"")
		if rsContent.eof then
			twScript("<br><br><br><Center>对不起，找不到此条新闻</Center>")
		Else
		Conn.execute("update News set N_Hits="&rsContent("N_Hits")+1&" Where ID="&DiD&"")
		%>
      <table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
        <tr>
          <td height="40" align="center" valign="top" ><span class="css" style="font-size:14px;"><strong><%Tw(RsContent("N_title"))%></strong></span></td>
        </tr>
        <tr>
          <td height="30"><%Tw(RsContent("N_Content"))%></td>
        </tr>
        <tr>
          <td height="20" align="right" style="line-height:150%;"><span class="style7">日期：<%=RsContent("N_Time")%></span>&nbsp;点击数：<font style="color:#FF0000"><%=RsContent("N_Hits")%></font></td>
        </tr>
        <tr>
          <td height="25" align="center" valign="bottom"><a href="javascript:history.back()">[←返回]</a></td>
        </tr>
      </table>
	  <%
	  end if
	  End IF
	  %>
