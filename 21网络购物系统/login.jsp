<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*,java.util.Date" errorPage="" %>
<jsp:useBean id="mdb" class="ckstudio.db.mysqlconn" scope="page"/>
    <%
	boolean foundeer=false;
	String user_name,user_pass;
	if(!foundeer){

    if (session.getAttribute("user_name")==null){
    user_name=request.getParameter("user_name");
    user_pass=request.getParameter("user_pass");

    if(user_name==null || user_pass==null){
        out.print("<font size=4 color=red>用户名和用户密码不能为空!</font>");
	    foundeer=true;
	}

    String sql="select * from member where user_name='"+user_name+"'";
    ResultSet rs;
    rs=mdb.executeQuery(sql);

	if(!rs.next()){
		out.print("<font size=4 color=red>你输入的用户不存在!</font>");
		foundeer=true;
	}
	else{
		if(user_pass.equals(rs.getString("user_pass"))){
        session.setAttribute("user_name",""+rs.getString("user_name")+"");
  	    session.setAttribute("user_type","yes");
		String sql1="update member set user_lasttime='"+((new java.util.Date()).toLocaleString())+"',user_lastip='"+(String)request.getRemoteHost()+"' where user_name='"+user_name+"'";
        mdb.executeUpdate(sql1);
		response.sendRedirect("index.jsp");
		}
    else{
        out.print("<font size=4 color=red>你输入的密码错误!</font>");
        foundeer=true;
	}
	}


	}else response.sendRedirect("index.jsp");

	}if(foundeer){
          %><br><a href="javascript:history.go(-1)">重新登陆</a><%
	}

%>