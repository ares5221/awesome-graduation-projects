<%
filename=Request.ServerVariables("SCRIPT_NAME")
filename=mid(filename,InStrRev(filename,"/")+1,len(filename))
if(allcounts>0) then
%>
<a href="<%=filename%>?act=<%=act%>&pages=1">首页</a>　<a href="<%=filename%>?act=<%=act%>&pages=<%=pages-1%>">上一页</a>　<a href="<%=filename%>?act=<%=act%>&pages=<%=pages+1%>">下一页</a>　<a href="<%=filename%>?act=<%=act%>&pages=<%=maxpages%>">尾页</a><%end if%>