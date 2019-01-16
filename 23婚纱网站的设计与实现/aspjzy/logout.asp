<%
Response.cookies("admin")=""
Session.Abandon()
Response.Write("<script>alert('ÍË³ö³É¹¦');window.location='hello.asp'</script>")

%>