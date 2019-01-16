<%
	if ((String) session.getAttribute("login")==null){

		String all_curPage = request.getRequestURI();//得到当前页面的路径和名称
		String all_curQueryString = request.getQueryString();//得到当前页面的参数

		String referer = all_curPage;
		if(all_curQueryString!=null){
			referer += "?" + all_curQueryString;
		}
	

		response.sendRedirect("../deng.jsp?referer="+java.net.URLEncoder.encode(referer));//一定要编码,否则特殊字符传不过去
	
	}
	
%>