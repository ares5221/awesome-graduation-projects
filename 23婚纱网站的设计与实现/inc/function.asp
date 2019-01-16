<%
sub showpage(sfilename,totalnumber,maxperpage,ShowTotal,ShowAllPages,strUnit)
	dim n, i,strTemp,strUrl
	if totalnumber mod maxperpage=0 then
    	n= totalnumber \ maxperpage
  	else
    	n= totalnumber \ maxperpage+1
  	end if
  	strTemp= "<table><form style='margin:0px' name='showpages' method='Post' action='" & sfilename & "'><tr><td>"
		if ShowTotal=true then 
		strTemp=strTemp & "共 <b>" & totalnumber & "</b> " & strUnit & "&nbsp;&nbsp;"
	end if
	strUrl=strUrl&sfilename
  	if CurrentPage<2 then
    		strTemp=strTemp & "首页 上一页&nbsp;"
  	else
    		strTemp=strTemp & "<a href='" & strUrl & "page=1 '>首页</a>&nbsp;"
    		strTemp=strTemp & "<a href='" & strUrl & "page=" & (CurrentPage-1) & "'>上一页</a>&nbsp;"
  	end if

  	if n-currentpage<1 then
    		strTemp=strTemp & "下一页 尾页"
  	else
    		strTemp=strTemp & "<a href='" & strUrl & "page=" & (CurrentPage+1) & " '>下一页</a>&nbsp;"
    		strTemp=strTemp & "<a href='" & strUrl & "page=" & n & "'>尾页</a>"
  	end if
   	'strTemp=strTemp & "&nbsp;页次：<strong><font color=red>" & CurrentPage & "</font>/" & n & "</strong>页 "
	if ShowAllPages2=True then
		strTemp=strTemp & "&nbsp;转到：<select name='page' size='1' onchange='javascript:submit()'>"   
    	for i = 1 to n   
    		strTemp=strTemp & "<option value='" & i & "'"
			if cint(CurrentPage)=cint(i) then strTemp=strTemp & " selected "
			strTemp=strTemp & ">第" & i & "页</option>"   
	    next
		strTemp=strTemp & "</select>"
	end if
	strTemp=strTemp & "</td></tr></form></table>"
	response.write strTemp
	'response.Write(i)
end sub
%>