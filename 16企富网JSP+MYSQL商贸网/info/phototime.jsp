<%@ page contentType="text/html;charset=gb2312"  language="java" import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>
<%Date currTime = new Date();
  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-hhmmss",Locale.US);
  String time=new String(formatter.format(currTime).getBytes("iso-8859-1"));%>
<%session.setAttribute("time",time);%>