<%@ Page language="c#" Codebehind="AdminGradeAddNext.aspx.cs" AutoEventWireup="false" Inherits="GradeMis.AdminGradeAddNext" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>AdminGradeAddNext</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="css/style.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" style="Z-INDEX: 101; LEFT: 8px; WIDTH: 288px; POSITION: absolute; TOP: 8px; HEIGHT: 90px"
				cellSpacing="1" cellPadding="1" width="288" border="1">
				<TR>
					<TD><FONT face="宋体">课程号</FONT></TD>
					<TD>
						<asp:TextBox id="txtcid" runat="server"></asp:TextBox>
						<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="必填" ControlToValidate="txtcid"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD><FONT face="宋体">成&nbsp; 绩</FONT></TD>
					<TD>
						<asp:TextBox id="txtgrade" runat="server"></asp:TextBox>
						<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="必填" ControlToValidate="txtgrade"></asp:RequiredFieldValidator>
						<asp:RangeValidator id="RangeValidator1" runat="server" ErrorMessage="输入无效" ControlToValidate="txtgrade"
							Type="Integer" MaximumValue="100" MinimumValue="0"></asp:RangeValidator></TD>
				</TR>
				<TR>
					<TD></TD>
					<TD>
						<asp:Button id="Button1" runat="server" Text="确 定"></asp:Button></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
