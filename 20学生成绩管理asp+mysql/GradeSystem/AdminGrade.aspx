<%@ Page language="c#" Codebehind="AdminGrade.aspx.cs" AutoEventWireup="false" Inherits="GradeMis.AdminGrade" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>AdminGrade</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="css/style.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体">
				<asp:Button id="Button1" runat="server" Text="学生成绩录入"></asp:Button><br>
				<br>
				<asp:DataGrid id="DataGrid1" runat="server" AllowPaging="True" Width="336px">
					<HeaderStyle BackColor="#CCCC66"></HeaderStyle>
					<PagerStyle NextPageText="下一页" PrevPageText="上一页"></PagerStyle>
				</asp:DataGrid>
			</FONT>
		</form>
	</body>
</HTML>
