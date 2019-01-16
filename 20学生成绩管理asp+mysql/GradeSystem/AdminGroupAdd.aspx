<%@ Page language="c#" Codebehind="AdminGroupAdd.aspx.cs" AutoEventWireup="false" Inherits="GradeMis.AdminGroupAdd" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>AdminGroupAdd</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体">
				<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="300" border="1">
					<TR>
						<TD style="WIDTH: 69px">组名称:</TD>
						<TD>
							<asp:TextBox id="txtGname" runat="server"></asp:TextBox>
							<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="必填" ControlToValidate="txtGname"></asp:RequiredFieldValidator></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 69px">组说明:</TD>
						<TD>
							<asp:TextBox id="txtGinfo" runat="server"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 69px"></TD>
						<TD>
							<asp:Button id="Button1" runat="server" Text="确  定"></asp:Button></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 69px"></TD>
						<TD></TD>
					</TR>
				</TABLE>
			</FONT>
		</form>
	</body>
</HTML>
