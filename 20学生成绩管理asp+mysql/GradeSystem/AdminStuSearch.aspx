<%@ Page language="c#" Codebehind="AdminStuSearch.aspx.cs" AutoEventWireup="false" Inherits="GradeMis.AdminStuSearch" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>AdminStuSearch</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="css/style.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="592" border="1" style="WIDTH: 592px; HEIGHT: 432px">
				<TR>
					<td style="HEIGHT: 34px">
						学号
						<asp:TextBox id="txtsid" runat="server" Width="56px" BorderStyle="Groove"></asp:TextBox>
						姓名
						<asp:TextBox id="txtname" runat="server" Width="56px" BorderStyle="Groove"></asp:TextBox>&nbsp; 
						年龄
						<asp:TextBox id="txtage" runat="server" Width="64px" BorderStyle="Groove"></asp:TextBox>所在院系
						<asp:TextBox id="txtx" runat="server" Width="64px" BorderStyle="Groove"></asp:TextBox>&nbsp; 
						入学年份
						<asp:TextBox id="txty" runat="server" Width="72px" BorderStyle="Groove"></asp:TextBox>
						<asp:Button id="Button1" runat="server" Text="搜 索"></asp:Button><BR>
						<asp:RangeValidator id="RangeValidator1" runat="server" ErrorMessage="日期格式不对" Type="Date" ControlToValidate="txty"
							MaximumValue="3000-01-01" MinimumValue="1900-01-01"></asp:RangeValidator>
					</td>
				</TR>
				<TR>
					<TD vAlign="top">
						<asp:DataGrid id="DataGrid1" runat="server" AllowPaging="True">
							<HeaderStyle BackColor="#CCCC66"></HeaderStyle>
							<PagerStyle NextPageText="下一页" PrevPageText="上一页"></PagerStyle>
						</asp:DataGrid></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
