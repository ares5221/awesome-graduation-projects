<jsp:useBean id="mdb" class="ckstudio.db.mysqlconn" scope="page"/>
<%
ResultSet rs;
String sql;
%>
<%!
boolean IsMail(String user_mail){
	int index=user_mail.indexOf("@");
	int index2=user_mail.indexOf(".");
	if(index==-1 || index2==-1)
		return false;
	else return true;
}

public String getStr(String str)
{
 	try
	{
		String temp_p=str;
		byte[] temp_t=temp_p.getBytes("ISO8859-1");
		String temp=new String(temp_t);
		return temp;
	}
	catch(Exception e)
	{
		e.printStackTrace();
	 }
	return "null";
}
%>
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