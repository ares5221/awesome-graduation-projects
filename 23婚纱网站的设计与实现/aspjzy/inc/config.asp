<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%
Set RsNet=Conn.execute("select * from Netant_Admin ")
'以下值为False时网站此功能不显示***************************************
banben_China=RsNet("banben_China")     '中文版
banben_En=RsNet("banben_En")		  'Englsih版(网站是否有English版)
'**********************************************************************
P_Name_B=RsNet("P_Name_B")				'产品名称
P_Register_B=RsNet("P_Register_B")			'是否会员产品
P_Index_B=RsNet("P_Index_B")				'是否首页产品
P_Content_B=RsNet("P_Content_B")			'备注
P_Other1_Name_B=RsNet("P_Other1_Name_B")		'后备字段1
P_Other2_Name_B=RsNet("P_Other2_Name_B")		'后备字段2
P_Other3_Name_B=RsNet("P_Other3_Name_B")		'后备字段3
'产品后备的三个字段名称*************************************************
P_Other1_Name=RsNet("P_Other1_Name")
P_Other2_Name=RsNet("P_Other2_Name")
P_Other3_Name=RsNet("P_Other3_Name")
'English版字段
P_Other1_Name_En=RsNet("P_Other1_Name_En")
P_Other2_Name_En=RsNet("P_Other2_Name_En")
P_Other3_Name_En=RsNet("P_Other3_Name_En")
'***********************************************************************
About_B=RsNet("About_B")
'***********************************************************************
Products_R_B=RsNet("Products_R_B")
Products_B=RsNet("Products_B")
News_B=RsNet("News_B")
Register_B=RsNet("Register_B")
Job_B=RsNet("Job_B")
GuestBook_B=RsNet("GuestBook_B")
Vote_B=RsNet("Vote_B")
Link_B=RsNet("Link_B")
Netant_admin_B=RsNet("Netant_admin_B")
'***********************************************************************
Netant_G=RsNet("Netant_G")
'***********************************************************************
Big_file=""
Small_file="157*117"
RsNet.Close
Set RsNet=Nothing
%> 
 
 
 
 
 
 
 






