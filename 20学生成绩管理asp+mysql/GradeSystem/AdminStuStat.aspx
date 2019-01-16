<%@ Page language="c#" Codebehind="AdminStuStat.aspx.cs" AutoEventWireup="false" Inherits="GradeMis.AdminStuStat" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>AdminStuStat</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/style.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			课程统计
			<asp:DataGrid id="DataGrid1" runat="server" AllowPaging="True" Width="320px">
				<HeaderStyle BackColor="#CCCC66"></HeaderStyle>
				<PagerStyle NextPageText="下一页" PrevPageText="上一页"></PagerStyle>
			</asp:DataGrid>
		</form>
	</body>
</HTML>
