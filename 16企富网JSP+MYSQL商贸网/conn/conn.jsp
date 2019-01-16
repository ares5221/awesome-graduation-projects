<%@ page contentType="text/html;charset=gb2312" %>
<link rel="stylesheet" href="../conn/laba.css" type="text/css">
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%Connection con;
Statement stmt;
ResultSet rs;
Class.forName("com.mysql.jdbc.Driver");
DriverManager.registerDriver(new com.mysql.jdbc.Driver());
String dbUrl="jdbc:mysql://localhost:3306/data?useUnicode=true&characterEncoding=GB2312";
String dbUser="root";
String dbPwd="";
con=java.sql.DriverManager.getConnection(dbUrl,dbUser,dbPwd);
stmt=con.createStatement();
%>