<%@ Page language="c#" Codebehind="AdminUrlAdd.aspx.cs" AutoEventWireup="false" Inherits="GradeMis.AdminUrlAdd" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>AdminUrlAdd</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="css/style.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体"></FONT>
			<br>
			<br>
			<br>
			<br>
			<br>
			<TABLE align="center" id="Table1" cellSpacing="1" cellPadding="1" width="300" border="0">
				<TR>
					<TD style="WIDTH: 110px"><FONT face="宋体"></FONT></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 110px"><FONT face="宋体">功能模块名称</FONT></TD>
					<TD>
						<asp:TextBox id="txtname" runat="server"></asp:TextBox>
						<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="必填" ControlToValidate="txtname"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 110px"><FONT face="宋体">功能模块URL</FONT></TD>
					<TD>
						<asp:TextBox id="txturl" runat="server"></asp:TextBox>
						<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="必填" ControlToValidate="txturl"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 110px"><FONT face="宋体">功能模块说明</FONT></TD>
					<TD>
						<asp:TextBox id="TextBox3" runat="server"></asp:TextBox></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 110px"></TD>
					<TD>
						<asp:Button id="Button1" runat="server" Text="确  定"></asp:Button></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
