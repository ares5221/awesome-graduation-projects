<%
if request("action")="ok" then
session("picsession")="ok"
elseif request("action")="no" then
session("picsession")=""
end if
%>