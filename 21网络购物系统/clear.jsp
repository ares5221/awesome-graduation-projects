<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="mdb" class="ckstudio.db.mysqlconn" scope="page"/>
<%!
 int Cint(String cint)
   {
    try {
	  int n;
      n= Integer.parseInt(cint);
	  return n;
        }
       catch (NumberFormatException e) {
                 return 0;
        }
}
%>
<%
if(session.getAttribute("user_name")==null){
    out.print("你尚未登录或不是本站会员<br>请登录后再来订购本站货物！");
}else{

	 String user_name=(String)session.getValue("user_name");
     if(request.getParameter("basket_id")==null){
		   
           String sql="select * from basket where user_name='"+user_name+"' and basket_check='false'";
           ResultSet rs=mdb.executeQuery(sql);

           if(!rs.next()){
                ;
		   }
           else{
			   
		         rs.previous();

                 while(rs.next()){
		         String sql1="delete from basket where user_name='"+user_name+"' and basket_check='false'";
		         mdb.executeDelete(sql1);
				 }
		   }
		   
		   }else{
	       int basket_id=Cint(request.getParameter("basket_id"));
           String sql2="select * from basket where basket_id="+basket_id+"";
	       ResultSet rs1=mdb.executeQuery(sql2);
           if(!rs1.next()){
               ;
		   }else{
                      rs1.previous();
                      while(rs1.next()){
		              String sql1="delete from basket where basket_id="+basket_id+"";
		              mdb.executeDelete(sql1);
		              }                      
                }
		}
		response.sendRedirect("buy.jsp");
mdb.Close();
}



%>